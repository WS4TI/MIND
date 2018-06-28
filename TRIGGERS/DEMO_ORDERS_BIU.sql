--------------------------------------------------------
--  DDL for Trigger DEMO_ORDERS_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_ORDERS_BIU" 
  before insert or update ON demo_orders FOR EACH ROW
DECLARE
  order_id number;
BEGIN
  if inserting then  
    if :new.order_id is null then
      select demo_ord_seq.nextval
        INTO order_id
        FROM dual;
      :new.order_id := order_id;
    end if;
    if :new.tags is not null then
       :new.tags := sample_pkg.demo_tags_cleaner(:new.tags);
    end if;
  end if;
  
  sample_pkg.demo_tag_sync(
    p_new_tags      => :new.tags,
    p_old_tags      => :old.tags,
    p_content_type  => 'ORDER',
    p_content_id    => :new.order_id );
END;

/
ALTER TRIGGER "WS4TI"."DEMO_ORDERS_BIU" ENABLE;
