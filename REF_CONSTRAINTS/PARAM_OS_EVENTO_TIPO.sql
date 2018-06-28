--------------------------------------------------------
--  Ref Constraints for Table PARAM_OS_EVENTO_TIPO
--------------------------------------------------------

  ALTER TABLE "WS4TI"."PARAM_OS_EVENTO_TIPO" ADD CONSTRAINT "FK_PARAM_OS_EVENTO_TIPO_STATUS" FOREIGN KEY ("ST_OS")
	  REFERENCES "WS4TI"."PARAM_OS_STATUS" ("ST_OS") ENABLE;
