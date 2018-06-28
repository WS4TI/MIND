--------------------------------------------------------
--  DDL for Package Body SAMPLE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "WS4TI"."SAMPLE_PKG" as
    --
    -- Error Handling function
    --
    function demo_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result
    is
        l_result          apex_error.t_error_result;
        l_reference_id    number;
        l_constraint_name varchar2(255);
    begin
        l_result := apex_error.init_error_result (
                        p_error => p_error );
        -- If it's an internal error raised by APEX, like an invalid statement or
        -- code which can't be executed, the error text might contain security sensitive
        -- information. To avoid this security problem we can rewrite the error to
        -- a generic error message and log the original error message for further
        -- investigation by the help desk.
        if p_error.is_internal_error then
            -- mask all errors that are not common runtime errors (Access Denied
            -- errors raised by application / page authorization and all errors
            -- regarding session and session state)
            if not p_error.is_common_runtime_error then
                -- log error for example with an autonomous transaction and return
                -- l_reference_id as reference#
                -- l_reference_id := log_error (
                --                       p_error => p_error );
                --
    
                -- Change the message to the generic error message which doesn't expose
                -- any sensitive information.
                l_result.message         := 'An unexpected internal application error has occurred. '||
                                            'Please get in contact with your system administrator and provide '||
                                            'reference# '||to_char(l_reference_id, '999G999G999G990')||
                                            ' for further investigation.';
                l_result.additional_info := null;
            end if;
        else
            -- Always show the error as inline error
            -- Note: If you have created manual tabular forms (using the package
            --       apex_item/htmldb_item in the SQL statement) you should still
            --       use "On error page" on that pages to avoid loosing entered data
            l_result.display_location := case
                                           when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                           else l_result.display_location
                                         end;
    
            -- If it's a constraint violation like
            --
            --   -) ORA-00001: unique constraint violated
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
            --   -) ORA-02290: check constraint violated
            --   -) ORA-02291: integrity constraint violated - parent key not found
            --   -) ORA-02292: integrity constraint violated - child record found
            --
            -- we try to get a friendly error message from our constraint lookup configuration.
            -- If we don't find the constraint in our lookup table we fallback to
            -- the original ORA error message.
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
                l_constraint_name := apex_error.extract_constraint_name (
                                         p_error => p_error );
                begin
                    select message
                      into l_result.message
                      from demo_constraint_lookup
                     where constraint_name = l_constraint_name;
                exception when no_data_found then null; -- not every constraint has to be in our lookup table
                end;
            end if;
            -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
                -- in a table trigger or in a PL/SQL package called by a process and we
            -- haven't found the error in our lookup table, then we just want to see
            -- the actual error text and not the full error stack with all the ORA error numbers.
            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
                l_result.message := apex_error.get_first_ora_error_text (
                                        p_error => p_error );
            end if;
            -- If no associated page item/tabular form column has been set, we can use
            -- apex_error.auto_set_associated_item to automatically guess the affected
            -- error field by examine the ORA error for constraint names or column names.
            if l_result.page_item_name is null and l_result.column_alias is null then
                apex_error.auto_set_associated_item (
                    p_error        => p_error,
                    p_error_result => l_result );
            end if;
        end if;
        return l_result;
    end demo_error_handling;
        
    
    ---
    --- Tag Cleaner function
    ---
    function demo_tags_cleaner (
        p_tags  in varchar2,
        p_case  in varchar2 default 'U' ) return varchar2
    is
        type tags is table of varchar2(255) index by varchar2(255);
        l_tags_a        tags;
        l_tag           varchar2(255);
        l_tags          apex_application_global.vc_arr2;
        l_tags_string   varchar2(32767);
        i               integer;
    begin
        l_tags := apex_util.string_to_table(p_tags,',');
        for i in 1..l_tags.count loop
            --remove all whitespace, including tabs, spaces, line feeds and carraige returns with a single space
            l_tag := substr(trim(regexp_replace(l_tags(i),'[[:space:]]{1,}',' ')),1,255);
  
            if l_tag is not null and l_tag != ' ' then
                if p_case = 'U' then
                    l_tag := upper(l_tag);
                elsif p_case = 'L' then
                    l_tag := lower(l_tag);
                end if;
                --add it to the associative array, if it is a duplicate, it will just be replaced
                l_tags_a(l_tag) := l_tag;
            end if;
        end loop;
        l_tag := null;
        l_tag := l_tags_a.first;
        while l_tag is not null loop
            l_tags_string := l_tags_string||l_tag;
            if l_tag != l_tags_a.last then
                l_tags_string := l_tags_string||', ';
            end if;
            l_tag := l_tags_a.next(l_tag);
        end loop;
        return substr(l_tags_string,1,4000);
    end demo_tags_cleaner;
    ---
    --- Tag Synchronisation Procedure
    ---
    procedure demo_tag_sync (
        p_new_tags          in varchar2,
        p_old_tags          in varchar2,
        p_content_type      in varchar2,
        p_content_id        in number )
    as
        type tags is table of varchar2(255) index by varchar2(255);
        l_new_tags_a    tags;
        l_old_tags_a    tags;
        l_new_tags      apex_application_global.vc_arr2;
        l_old_tags      apex_application_global.vc_arr2;
        l_merge_tags    apex_application_global.vc_arr2;
        l_dummy_tag     varchar2(255);
        i               integer;
    begin
        l_old_tags := apex_util.string_to_table(p_old_tags,', ');
        l_new_tags := apex_util.string_to_table(p_new_tags,', ');
        if l_old_tags.count > 0 then --do inserts and deletes
            --build the associative arrays
            for i in 1..l_old_tags.count loop
                l_old_tags_a(l_old_tags(i)) := l_old_tags(i);
            end loop;
            for i in 1..l_new_tags.count loop
                l_new_tags_a(l_new_tags(i)) := l_new_tags(i);
            end loop;
            --do the inserts
            for i in 1..l_new_tags.count loop
                begin
                    l_dummy_tag := l_old_tags_a(l_new_tags(i));
                exception when no_data_found then
                    insert into demo_tags (tag, content_id, content_type )
                        values (l_new_tags(i), p_content_id, p_content_type );
                    l_merge_tags(l_merge_tags.count + 1) := l_new_tags(i);
                end;
            end loop;
            --do the deletes
            for i in 1..l_old_tags.count loop
                begin
                    l_dummy_tag := l_new_tags_a(l_old_tags(i));
                exception when no_data_found then
                    delete from demo_tags where content_id = p_content_id and tag = l_old_tags(i);
                    l_merge_tags(l_merge_tags.count + 1) := l_old_tags(i);
                end;
            end loop;
        else --just do inserts
            for i in 1..l_new_tags.count loop
                insert into demo_tags (tag, content_id, content_type )
                    values (l_new_tags(i), p_content_id, p_content_type );
                l_merge_tags(l_merge_tags.count + 1) := l_new_tags(i);
            end loop;
        end if;
        for i in 1..l_merge_tags.count loop
            merge into demo_tags_type_sum s
            using (select count(*) tag_count
                     from demo_tags
                    where tag = l_merge_tags(i) and content_type = p_content_type ) t
               on (s.tag = l_merge_tags(i) and s.content_type = p_content_type )
             when not matched then insert (tag, content_type, tag_count)
                                   values (l_merge_tags(i), p_content_type, t.tag_count)
             when matched then update set s.tag_count = t.tag_count;
            merge into demo_tags_sum s
            using (select sum(tag_count) tag_count
                     from demo_tags_type_sum
                    where tag = l_merge_tags(i) ) t
               on (s.tag = l_merge_tags(i) )
             when not matched then insert (tag, tag_count)
                                   values (l_merge_tags(i), t.tag_count)
             when matched then update set s.tag_count = t.tag_count;
        end loop;
    end demo_tag_sync;
end sample_pkg;

/
