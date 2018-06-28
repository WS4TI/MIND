--------------------------------------------------------
--  DDL for Trigger TR_MENU_ADM_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_MENU_ADM_ID" 
   BEFORE INSERT ON menu_adm
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.mnu_id), 0) + 1 INTO v_next_id FROM menu_adm x;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   :new.mnu_id := v_next_id;
END tr_menu_adm_id;

/
ALTER TRIGGER "WS4TI"."TR_MENU_ADM_ID" ENABLE;
