--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_OS_CLASS_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_OS_CLASS_ID" 
   BEFORE INSERT ON cliente_os_class
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.id_class), 0) + 1 INTO v_next_id FROM cliente_os_class x WHERE x.id_cliente = :new.id_cliente;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   :new.id_class := v_next_id;
END tr_cliente_os_class_id;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_OS_CLASS_ID" ENABLE;
