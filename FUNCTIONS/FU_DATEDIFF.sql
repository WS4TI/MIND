--------------------------------------------------------
--  DDL for Function FU_DATEDIFF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "WS4TI"."FU_DATEDIFF" (p_what IN VARCHAR2
                       ,p_d1   IN DATE
                       ,p_d2   IN DATE) RETURN NUMBER AS
      l_result NUMBER;
   BEGIN
      SELECT (p_d2 - p_d1) * decode(upper(p_what), 'SS', 24 * 60 * 60, 'MI', 24 * 60, 'HH', 24, NULL) INTO l_result FROM dual;
      --
      IF l_result < 0 THEN
         l_result := 0;
      END IF;
      --
      RETURN l_result;
   END fu_datediff;

/
