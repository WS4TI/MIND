--------------------------------------------------------
--  DDL for Index DEMO_PRODUCT_INFO_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "WS4TI"."DEMO_PRODUCT_INFO_UK" ON "WS4TI"."DEMO_PRODUCT_INFO" ("PRODUCT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;
