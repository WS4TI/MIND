--------------------------------------------------------
--  DDL for Trigger TR_CLIENTE_OS_EVENTO_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."TR_CLIENTE_OS_EVENTO_ID" 
   BEFORE INSERT ON cliente_os_evento
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   -- local variables here
   v_next_id NUMBER;
BEGIN
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
   :new.sq_evento := v_next_id;
   --
   FOR reg IN (SELECT t.st_os
                 FROM param_os_evento_tipo t
                WHERE t.tp_evento = :new.tp_evento)
   LOOP
      IF reg.st_os IS NOT NULL THEN
         BEGIN
            UPDATE cliente_os x
               SET x.st_os = reg.st_os
             WHERE x.id_cliente = :new.id_cliente
               AND x.id_os = :new.id_os;
         EXCEPTION
            WHEN OTHERS THEN
               raise_application_error(-20097, 'Erro atualizando status da OS! ' || SQLERRM);
         END;
      END IF;
   END LOOP;
   --
END tr_cliente_os_class_id;

/
ALTER TRIGGER "WS4TI"."TR_CLIENTE_OS_EVENTO_ID" ENABLE;
