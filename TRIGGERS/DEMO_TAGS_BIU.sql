--------------------------------------------------------
--  DDL for Trigger DEMO_TAGS_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_TAGS_BIU" 
   before insert or update on demo_tags
   for each row
   begin
      if inserting then
         if :NEW.ID is null then
           select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
           into :new.id
           from dual;
         end if;
         :NEW.CREATED := localtimestamp;
         :NEW.CREATED_BY := nvl(v('APP_USER'),USER);
      end if;
      if updating then
         :NEW.UPDATED := localtimestamp;
         :NEW.UPDATED_BY := nvl(v('APP_USER'),USER);
      end if;
end;

/
ALTER TRIGGER "WS4TI"."DEMO_TAGS_BIU" ENABLE;
