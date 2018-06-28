--------------------------------------------------------
--  Ref Constraints for Table MENU_ADM
--------------------------------------------------------

  ALTER TABLE "WS4TI"."MENU_ADM" ADD CONSTRAINT "FK_MENU_ADM_AUTO" FOREIGN KEY ("MNU_PAI_ID")
	  REFERENCES "WS4TI"."MENU_ADM" ("MNU_ID") ENABLE;
