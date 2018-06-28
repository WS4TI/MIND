--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_NOTIFICA
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_NOTIFICA" ADD CONSTRAINT "FK_CLIENTE_NOTIFICA_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
