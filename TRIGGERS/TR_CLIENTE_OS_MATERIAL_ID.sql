--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_OS_MATERIAL_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_OS_MATERIAL_ID" 
   BEFORE INSERT ON cliente_os_material
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.sq_item), 0) + 1
        INTO v_next_id
        FROM cliente_os_material x
       WHERE x.id_cliente = :new.id_cliente
         AND x.id_os = :new.id_os;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   :new.sq_item := v_next_id;
   --
END tr_cliente_os_material_id;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_OS_MATERIAL_ID" ENABLE;
