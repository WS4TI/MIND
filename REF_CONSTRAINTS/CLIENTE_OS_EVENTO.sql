--------------------------------------------------------
--  Ref Constraints for Table CLIENTE_OS_EVENTO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."CLIENTE_OS_EVENTO" ADD CONSTRAINT "FK_CLIENTE_OS_EVENTO_TIPO" FOREIGN KEY ("TP_EVENTO")
	  REFERENCES "WS4TI"."PARAM_OS_EVENTO_TIPO" ("TP_EVENTO") ENABLE;
