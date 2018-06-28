--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_FABRICANTE
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_FABRICANTE" ADD CONSTRAINT "FK_CLIENTE_FABRICANTE_PAIS" FOREIGN KEY ("CD_PAIS")
	  REFERENCES "WS4TI"."ALL_PAIS" ("CD_PAIS") ENABLE;
