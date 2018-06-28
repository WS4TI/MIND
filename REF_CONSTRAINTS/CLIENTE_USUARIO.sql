--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_USUARIO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_USUARIO" ADD CONSTRAINT "FK_CLIENTE_USUARIO_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
