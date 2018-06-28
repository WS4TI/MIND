--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_MAQUINA_CKLIST
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_MAQUINA_CKLIST" ADD CONSTRAINT "FK_CLIENTE_MAQ_CKLIST_MAQUINA" FOREIGN KEY ("ID_CLIENTE", "CD_MAQUINA")
	  REFERENCES "WS4TI"."CLIENTE_MAQUINA" ("ID_CLIENTE", "CD_MAQUINA") ENABLE;
