--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_OS_POSM
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_OS_POSM" ADD CONSTRAINT "FK_CLIENTE_OS_POSM" FOREIGN KEY ("ID_CLIENTE", "ID_OS")
	  REFERENCES "WS4TI"."CLIENTE_OS" ("ID_CLIENTE", "ID_OS") ON DELETE CASCADE ENABLE;
