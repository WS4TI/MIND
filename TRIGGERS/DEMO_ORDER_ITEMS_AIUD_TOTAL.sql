--------------------------------------------------------
--  DDL for Trigger DEMO_ORDER_ITEMS_AIUD_TOTAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_ORDER_ITEMS_AIUD_TOTAL" 
  after insert or update or delete on demo_order_items
begin
  -- Update the Order Total when any order item is changed
  update demo_orders set order_total =
  (select sum(unit_price*quantity) from demo_order_items
    where demo_order_items.order_id = demo_orders.order_id);
end;

/
ALTER TRIGGER "WS4TI"."DEMO_ORDER_ITEMS_AIUD_TOTAL" ENABLE;
