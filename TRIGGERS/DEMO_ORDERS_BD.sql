--------------------------------------------------------
--  DDL for Trigger DEMO_ORDERS_BD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_ORDERS_BD" 
    before delete on demo_orders
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'ORDER',
        p_content_id    => :old.order_id );
end;

/
ALTER TRIGGER "WS4TI"."DEMO_ORDERS_BD" ENABLE;
