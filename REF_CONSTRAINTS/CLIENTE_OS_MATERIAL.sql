--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_OS_MATERIAL
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_OS_MATERIAL" ADD CONSTRAINT "FK_CLIENTE_OS_MATERIAL_OS" FOREIGN KEY ("ID_CLIENTE", "ID_OS")
	  REFERENCES "WS4TI"."CLIENTE_OS" ("ID_CLIENTE", "ID_OS") ENABLE;
