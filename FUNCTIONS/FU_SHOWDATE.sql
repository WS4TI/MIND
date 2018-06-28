--------------------------------------------------------
--  DDL for Function FU_SHOWDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "WS4TI"."FU_SHOWDATE" (p_qt_seg IN NUMBER) RETURN VARCHAR2 AS
      l_result VARCHAR2(100);
   BEGIN
      IF p_qt_seg > 0 THEN
         --
         BEGIN
            SELECT to_char(floor((p_qt_seg / 86399) * 24)) || 'h ' || to_char(to_date(round(MOD(p_qt_seg, 86399), 0), 'sssss'), 'mi"m" ss"s"') INTO l_result FROM dual;
         EXCEPTION
            WHEN OTHERS THEN
               raise_application_error(-20099, 'Erro ao converter tempo ! seg.: ' || p_qt_seg || ' | ' || SQLERRM);
         END;
         --
         IF TRIM(l_result) = 'd' THEN
            l_result := NULL;
         END IF;
      END IF;
      --
      RETURN l_result;
   END fu_showdate;

/
