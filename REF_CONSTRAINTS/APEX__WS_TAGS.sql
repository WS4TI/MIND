--------------------------------------------------------
--  Ref Constraints for Table APEX$_WS_TAGS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."APEX$_WS_TAGS" ADD CONSTRAINT "APEX$_WS_TAGS_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "WS4TI"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;
