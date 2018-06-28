--------------------------------------------------------
--  DDL for Trigger DEMO_CUSTOMERS_BD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_CUSTOMERS_BD" 
    before delete on demo_customers
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'CUSTOMER',
        p_content_id    => :old.customer_id );
end;

/
ALTER TRIGGER "WS4TI"."DEMO_CUSTOMERS_BD" ENABLE;
