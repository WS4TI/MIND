--------------------------------------------------------
--  Constraints for Table APEX$_WS_ROWS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" MODIFY ("WS_APP_ID" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" MODIFY ("DATA_GRID_ID" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" ADD CONSTRAINT "APEX$_WS_ROWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
  ALTER TABLE "WS4TI"."APEX$_WS_ROWS" ADD CONSTRAINT "APEX$_WS_ROWS_UK1" UNIQUE ("WS_APP_ID", "DATA_GRID_ID", "UNIQUE_VALUE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
