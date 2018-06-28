--------------------------------------------------------
--  DDL for Index APEX$_WS_ROWS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "WS4TI"."APEX$_WS_ROWS_UK1" ON "WS4TI"."APEX$_WS_ROWS" ("WS_APP_ID", "DATA_GRID_ID", "UNIQUE_VALUE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;