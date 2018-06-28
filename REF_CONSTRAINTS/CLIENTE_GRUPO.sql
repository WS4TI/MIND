--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_GRUPO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_GRUPO" ADD CONSTRAINT "FK_CLIENTE_GRUPO_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
