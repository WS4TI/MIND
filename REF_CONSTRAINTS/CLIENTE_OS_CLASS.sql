--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_OS_CLASS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_OS_CLASS" ADD CONSTRAINT "FK_CLIENTE_OS_CLASS_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
