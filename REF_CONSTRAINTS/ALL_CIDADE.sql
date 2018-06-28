--------------------------------------------------------
--  Ref Constraints for Table ALL_CIDADE
--------------------------------------------------------

  ALTER TABLE "WS4TI"."ALL_CIDADE" ADD CONSTRAINT "FK_ALL_CIDADE_ESTADOS" FOREIGN KEY ("CD_UF")
	  REFERENCES "WS4TI"."ALL_ESTADOS" ("CD_UF") ENABLE;
