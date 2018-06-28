--------------------------------------------------------
--  Ref Constraints for Table APEX$_WS_FILES
--------------------------------------------------------

  ALTER TABLE "WS4TI"."APEX$_WS_FILES" ADD CONSTRAINT "APEX$_WS_FILES_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "WS4TI"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;
