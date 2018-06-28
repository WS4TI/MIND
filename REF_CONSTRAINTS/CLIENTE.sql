--------------------------------------------------------
--  Ref Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE" ADD CONSTRAINT "FK_CLIENTE_CIDADE" FOREIGN KEY ("ID_CIDADE")
	  REFERENCES "WS4TI"."ALL_CIDADE" ("ID_CIDADE") ENABLE;
  ALTER TABLE "WS4TI"."CLIENTE" ADD CONSTRAINT "FK_CLIENTE_ESTADO" FOREIGN KEY ("CD_UF")
	  REFERENCES "WS4TI"."ALL_ESTADOS" ("CD_UF") ENABLE;
