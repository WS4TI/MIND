--------------------------------------------------------
--  DDL for Index APEX$_WS_TAGS_IDX2
--------------------------------------------------------

  CREATE INDEX "WS4TI"."APEX$_WS_TAGS_IDX2" ON "WS4TI"."APEX$_WS_TAGS" ("WS_APP_ID", "WEBPAGE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;