--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_CONTRATO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_CONTRATO" ADD CONSTRAINT "CLIENTE_CONTRATO_FK1" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
