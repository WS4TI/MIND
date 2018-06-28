--------------------------------------------------------
--  DDL for Trigger DEMO_CUSTOMERS_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_CUSTOMERS_BIU" 
  before insert or update ON demo_customers FOR EACH ROW
DECLARE
  cust_id number;
BEGIN
  if inserting then  
    if :new.customer_id is null then
      select demo_cust_seq.nextval
        into cust_id
        from dual;
      :new.customer_id := cust_id;
    end if;
    if :new.tags is not null then
          :new.tags := sample_pkg.demo_tags_cleaner(:new.tags);
    end if;
  end if;
  sample_pkg.demo_tag_sync(
     p_new_tags      => :new.tags,
     p_old_tags      => :old.tags,
     p_content_type  => 'CUSTOMER',
     p_content_id    => :new.customer_id );
END;

/
ALTER TRIGGER "WS4TI"."DEMO_CUSTOMERS_BIU" ENABLE;
