--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_CALENDARIO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_CALENDARIO" ADD CONSTRAINT "FK_CLIENTE_CALENDARIO_MAQUINA" FOREIGN KEY ("ID_CLIENTE", "ID_MAQUINA_GRUPO")
	  REFERENCES "WS4TI"."CLIENTE_MAQUINA_GRUPO" ("ID_CLIENTE", "ID_MAQUINA_GRUPO") ENABLE;
  ALTER TABLE "WS4TI"."CLIENTE_CALENDARIO" ADD CONSTRAINT "FK_CLIENTE_CALENDARIO_TURNO" FOREIGN KEY ("ID_CLIENTE", "ID_TURNO")
	  REFERENCES "WS4TI"."CLIENTE_TURNO" ("ID_CLIENTE", "ID_TURNO") ENABLE;
