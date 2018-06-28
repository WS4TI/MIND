--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_OS_EVENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_OS_EVENTO" 
   BEFORE INSERT ON cliente_os
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id    NUMBER;
   v_next_id_os NUMBER;
BEGIN
   BEGIN
      SELECT nvl(MAX(x.id_os), 0) + 1 INTO v_next_id_os FROM cliente_os x WHERE x.id_cliente = :new.id_cliente;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id_os := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID da OS! | ' || SQLERRM);
   END;
   --ID OS
   :new.id_os := v_next_id_os;
   --  
   BEGIN
      SELECT nvl(MAX(x.sq_evento), 0) + 1
        INTO v_next_id
        FROM cliente_os_evento x
       WHERE x.id_cliente = :new.id_cliente
         AND x.id_os = :new.id_os;
   EXCEPTION
      WHEN no_data_found THEN
         v_next_id := 1;
      WHEN OTHERS THEN
         raise_application_error(-20000, 'Erro selecionando próximo ID! | ' || SQLERRM);
   END;
   --
   BEGIN
      INSERT INTO cliente_os_evento
         (id_cliente
         ,id_os
         ,sq_evento
         ,dt_abre
         ,dt_fecha
         ,ls_usuario
         ,tp_evento
         ,ds_evento)
      VALUES
         (:new.id_cliente
         ,:new.id_os
         ,v_next_id
         ,SYSDATE
         ,NULL
         ,:new.cd_usuario_tmp
         ,'AOS'
         ,'Abertura de Ordem de Serviço');
   EXCEPTION
      WHEN OTHERS THEN
         raise_application_error(-20099, 'Erro inserindo evento de abertura de OS! | ' || SQLERRM);
   END;
   --
END tr_cliente_os_evento;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_OS_EVENTO" ENABLE;
