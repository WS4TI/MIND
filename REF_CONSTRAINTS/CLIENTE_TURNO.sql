--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_TURNO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_TURNO" ADD CONSTRAINT "FK_CLIENTE_TURNO_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
