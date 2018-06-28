--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_MAQUINA_CKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_MAQUINA_CKLIST_ITEM" ADD CONSTRAINT "FK_CLIENTE_MAQ_CKLIST" FOREIGN KEY ("ID_CLIENTE", "CD_MAQUINA")
	  REFERENCES "WS4TI"."CLIENTE_MAQUINA_CKLIST" ("ID_CLIENTE", "CD_MAQUINA") ENABLE;
