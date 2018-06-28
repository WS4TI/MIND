--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_MAQUINA_CKLIST_ITEM_OS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_MAQUINA_CKLIST_ITEM_OS" ADD CONSTRAINT "FK_CLIENTE_MCI" FOREIGN KEY ("ID_CLIENTE", "CD_MAQUINA", "SQ_CHECKITEM")
	  REFERENCES "WS4TI"."CLIENTE_MAQUINA_CKLIST_ITEM" ("ID_CLIENTE", "CD_MAQUINA", "SQ_CHECKITEM") ENABLE;
  ALTER TABLE "WS4TI"."CLIENTE_MAQUINA_CKLIST_ITEM_OS" ADD CONSTRAINT "FK_CLIENTE_MCI_OS" FOREIGN KEY ("ID_CLIENTE", "ID_OS")
	  REFERENCES "WS4TI"."CLIENTE_OS" ("ID_CLIENTE", "ID_OS") DISABLE;
