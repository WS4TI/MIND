--------------------------------------------------------
--  Ref Constraints for Table EMP
--------------------------------------------------------

  ALTER TABLE "WS4TI"."EMP" ADD FOREIGN KEY ("MGR")
	  REFERENCES "WS4TI"."EMP" ("EMPNO") ENABLE;
  ALTER TABLE "WS4TI"."EMP" ADD FOREIGN KEY ("DEPTNO")
	  REFERENCES "WS4TI"."DEPT" ("DEPTNO") ENABLE;
