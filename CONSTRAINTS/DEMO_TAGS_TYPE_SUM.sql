--------------------------------------------------------
--  Constraints for Table DEMO_TAGS_TYPE_SUM
--------------------------------------------------------

  ALTER TABLE "WS4TI"."DEMO_TAGS_TYPE_SUM" ADD CONSTRAINT "DEMO_TAGS_TYPE_SUM_PK" PRIMARY KEY ("TAG", "CONTENT_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
