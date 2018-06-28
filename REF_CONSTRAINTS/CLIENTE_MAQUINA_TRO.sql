--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_MAQUINA_TRO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_MAQUINA_TRO" ADD CONSTRAINT "FK_CLIENTE_MAQ_MAQUINA" FOREIGN KEY ("ID_CLIENTE", "CD_MAQUINA")
	  REFERENCES "WS4TI"."CLIENTE_MAQUINA" ("ID_CLIENTE", "CD_MAQUINA") ON DELETE CASCADE ENABLE;
