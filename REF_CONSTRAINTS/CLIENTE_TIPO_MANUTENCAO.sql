--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_TIPO_MANUTENCAO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_TIPO_MANUTENCAO" ADD CONSTRAINT "FK_CLIENTE_TIPO_MANUT_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "WS4TI"."CLIENTE" ("ID_CLIENTE") ENABLE;
