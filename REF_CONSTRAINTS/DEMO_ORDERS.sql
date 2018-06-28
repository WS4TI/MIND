--------------------------------------------------------
--  Ref Constraints for Table DEMO_ORDERS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."DEMO_ORDERS" ADD CONSTRAINT "DEMO_ORDERS_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "WS4TI"."DEMO_CUSTOMERS" ("CUSTOMER_ID") ON DELETE CASCADE ENABLE;
