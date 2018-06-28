--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_NOTIFICA_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_NOTIFICA_ID" 
   BEFORE INSERT ON cliente_notifica
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.id_notifica), 0) + 1 INTO v_next_id FROM cliente_notifica x;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   :new.id_notifica := v_next_id;
END tr_cliente_notifica_id;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_NOTIFICA_ID" ENABLE;
