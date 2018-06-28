--------------------------------------------------------
--  Ref Constraints for Table APEX$_WS_NOTES
--------------------------------------------------------

  ALTER TABLE "WS4TI"."APEX$_WS_NOTES" ADD CONSTRAINT "APEX$_WS_NOTES_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "WS4TI"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;
