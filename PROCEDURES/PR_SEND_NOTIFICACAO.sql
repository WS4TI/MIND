--------------------------------------------------------
--  DDL for Procedure PR_SEND_NOTIFICACAO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "WS4TI"."PR_SEND_NOTIFICACAO" (p_id_cliente      IN NUMBER
                                               ,p_ls_usuario_de   IN VARCHAR2
                                               ,p_ls_usuario_para IN VARCHAR2
                                               ,p_ds_titulo       IN VARCHAR2
                                               ,p_ds_notificacao  IN VARCHAR2
                                               ,p_enviar_email    IN VARCHAR2) IS
   l_vc_arr2      apex_application_global.vc_arr2;
   v_usuario_de   VARCHAR2(20);
   v_usuario_para VARCHAR2(20);
   v_email_de     VARCHAR2(50);   
   v_email_para   VARCHAR2(50);
   v_email_para2  VARCHAR2(400);
   --v_servidor_email cdmcon.wms_parceira.nm_servidor_email%TYPE;
   v_erro VARCHAR2(32767);
   l_body   CLOB;
BEGIN
   BEGIN
      IF p_ls_usuario_para IS NOT NULL THEN
         l_vc_arr2 := apex_util.string_to_table(p_ls_usuario_para, ':');
         -- selecionar dados do usuário que enviou a notificação
         BEGIN
            SELECT lower(x.ds_email)
                  ,x.cd_usuario
              INTO v_email_de
                  ,v_usuario_de
              FROM cliente_usuario x
             WHERE x.id_cliente = p_id_cliente
               AND upper(x.cd_usuario) = upper(p_ls_usuario_de);
         EXCEPTION
            WHEN no_data_found THEN
               NULL;
            WHEN OTHERS THEN
               raise_application_error(-20000, 'Erro consultando dados do usuário ''' || upper(p_ls_usuario_de) || ''' ! ' || SQLERRM);
         END;
         --
         FOR z IN 1 .. l_vc_arr2.count
         LOOP
            BEGIN
               SELECT lower(x.ds_email)
                     ,x.cd_usuario
                 INTO v_email_para
                     ,v_usuario_para
                 FROM cliente_usuario x
                WHERE x.id_cliente = p_id_cliente
                  AND instr(upper(x.cd_usuario), upper(l_vc_arr2(z)), 1) != 0;
            EXCEPTION
               WHEN no_data_found THEN
                  NULL;
               WHEN OTHERS THEN
                  raise_application_error(-20000, 'Erro consultando dados do usuário ''' || l_vc_arr2(z) || ''' ! ' || SQLERRM);
            END;
            --
            IF v_usuario_para IS NOT NULL THEN
               v_email_para2 := v_email_para2||','||v_email_para;
               --
               BEGIN
                  INSERT INTO cliente_notifica
                     (id_cliente
                     ,id_notifica
                     ,ds_titulo
                     ,ds_notificacao
                     ,ls_usuario_de
                     ,ls_usuario_para
                     ,dt_envio
                     ,dt_leitura
                     ,fl_lido)
                  VALUES
                     (p_id_cliente
                     ,NULL
                     ,p_ds_titulo
                     ,p_ds_notificacao
                     ,v_usuario_de
                     ,v_usuario_para
                     ,SYSDATE
                     ,NULL
                     ,'N');
               EXCEPTION
                  WHEN OTHERS THEN
                     raise_application_error(-20000, 'Erro inserindo dados da Notificação ''''PR_SEND_NOTIFICACAO'''' | ' || SQLERRM);
               END;
               --
               COMMIT;
            END IF;
         END LOOP;
         -- Enviar e-mail            
         IF (p_enviar_email='S' AND v_email_para2 IS NOT NULL) THEN
           PR_SEND_MAIL( P_TITULO => p_ds_titulo,
                         P_MENSAGEM => p_ds_notificacao,
                         P_DE => v_email_de,
                         P_PARA => v_email_para2
                        );         
         END IF;         
         --
      END IF;
   END;
END pr_send_notificacao;


/
