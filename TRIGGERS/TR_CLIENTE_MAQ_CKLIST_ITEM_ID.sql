--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_MAQ_CKLIST_ITEM_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_MAQ_CKLIST_ITEM_ID" 
   BEFORE INSERT ON cliente_maquina_cklist_item
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.sq_checkitem), 0) + 1 INTO v_next_id FROM cliente_maquina_cklist_item x WHERE x.id_cliente = :new.id_cliente;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   :new.sq_checkitem := v_next_id;
END tr_cliente_maq_cklist_item_id;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_MAQ_CKLIST_ITEM_ID" ENABLE;
