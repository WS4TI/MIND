--------------------------------------------------------
--  Constraints for Table MENU_ADM
--------------------------------------------------------

  ALTER TABLE "WS4TI"."MENU_ADM" MODIFY ("MNU_ID" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."MENU_ADM" MODIFY ("MNU_NOME" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."MENU_ADM" MODIFY ("MNU_TIPO" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."MENU_ADM" MODIFY ("MNU_TECNICO" NOT NULL ENABLE);
  ALTER TABLE "WS4TI"."MENU_ADM" ADD CONSTRAINT "PK_MENU_ADM" PRIMARY KEY ("MNU_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321"  ENABLE;
