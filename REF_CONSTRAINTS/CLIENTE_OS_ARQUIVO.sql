--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_OS_ARQUIVO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_OS_ARQUIVO" ADD CONSTRAINT "FK_CLIENTE_OS" FOREIGN KEY ("ID_CLIENTE", "ID_OS")
	  REFERENCES "WS4TI"."CLIENTE_OS" ("ID_CLIENTE", "ID_OS") ENABLE;
