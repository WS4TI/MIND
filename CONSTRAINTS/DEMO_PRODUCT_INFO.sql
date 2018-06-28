--------------------------------------------------------
--  Constraints for Table DEMO_PRODUCT_INFO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."DEMO_PRODUCT_INFO" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."DEMO_PRODUCT_INFO" ADD CONSTRAINT "DEMO_PRODUCT_INFO_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
  ALTER TABLE "WS4TI"."DEMO_PRODUCT_INFO" ADD CONSTRAINT "DEMO_PRODUCT_INFO_UK" UNIQUE ("PRODUCT_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
