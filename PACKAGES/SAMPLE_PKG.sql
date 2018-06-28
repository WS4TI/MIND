--------------------------------------------------------
--  DDL for Package SAMPLE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WS4TI"."SAMPLE_PKG" is
    --
    -- Error Handling function
    --
    function demo_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result;
    
    --
    -- Tag Cleaner function
    --
    function demo_tags_cleaner (
        p_tags  in varchar2,
        p_case  in varchar2 default 'U') 
        return varchar2;
    
    --
    -- Tag Synchronisation Procedure
    --
    procedure demo_tag_sync (
        p_new_tags          in varchar2,
        p_old_tags          in varchar2,
        p_content_type      in varchar2,
        p_content_id        in number );
end sample_pkg;

/
