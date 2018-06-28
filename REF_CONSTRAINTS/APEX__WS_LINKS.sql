--------------------------------------------------------
--  Ref Constraints for Table APEX$_WS_LINKS
--------------------------------------------------------

  ALTER TABLE "WS4TI"."APEX$_WS_LINKS" ADD CONSTRAINT "APEX$_WS_LINKS_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "WS4TI"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;
