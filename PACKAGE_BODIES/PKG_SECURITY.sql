--------------------------------------------------------
--  DDL for Package Body PKG_SECURITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "WS4TI"."PKG_SECURITY" IS

   FUNCTION authenticate_user(p_email      VARCHAR2
                             ,p_password   VARCHAR2
                             ,p_tp_usuario VARCHAR2) RETURN BOOLEAN AS
      v_password   cliente_usuario.ds_senha%TYPE;
      v_active     cliente_usuario.st_usuario%TYPE;
      v_id_cliente cliente_usuario.id_cliente%TYPE;
      v_tp_usuario cliente_usuario.tp_usuario%TYPE;
      v_cd_usuario cliente_usuario.cd_usuario%TYPE;
      v_ds_titulo  cliente.ds_titulo%TYPE;
      v_ds_rodape  cliente.ds_rodape%TYPE;
      v_result     BOOLEAN;
   BEGIN
      --           
      IF p_email IS NULL OR p_password IS NULL THEN
         -- Write to Session, Notification must enter a username and password
         apex_util.set_session_state('LOGIN_MESSAGE', 'Favor informar e-mail e senha.');
         RETURN FALSE;
      END IF;
      -- 
      IF p_tp_usuario IN ('A', 'T','U') THEN
         --
         BEGIN
            SELECT x.st_usuario
                  ,x.ds_senha
                  ,x.id_cliente
                  ,x.tp_usuario
                  ,x.cd_usuario
              INTO v_active
                  ,v_password
                  ,v_id_cliente
                  ,v_tp_usuario
                  ,v_cd_usuario
              FROM cliente_usuario x
             WHERE upper(x.ds_email) = upper(p_email);
         EXCEPTION
            WHEN no_data_found THEN
               -- Write to Session, User not found.
               apex_util.set_session_state('LOGIN_MESSAGE', 'E-mail não cadastrado!');
               RETURN FALSE;
         END;
         IF v_password IS NULL THEN
            -- Write to Session, Password null.
            apex_util.set_session_state('LOGIN_MESSAGE', 'Senha não cadastrada!');
            RETURN FALSE;
         END IF;
         IF v_password <> p_password THEN
            -- Write to Session, Password incorrect.
            apex_util.set_session_state('LOGIN_MESSAGE', 'Senha incorreta!');
            RETURN FALSE;
         END IF;
         IF v_active <> 'A' THEN
            apex_util.set_session_state('LOGIN_MESSAGE', 'Usuário Inativo, favor consultar o administrador!');
            RETURN FALSE;
         END IF;
         ----
         /*
         BEGIN
            SELECT x.ds_titulo
                  ,x.ds_rodape
              INTO v_ds_titulo
                  ,v_ds_rodape
              FROM cliente x
             WHERE x.id_cliente = v_id_cliente;
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;*/
         -- definir texto padrão do cabeçalho
         BEGIN
            SELECT decode(v_tp_usuario, 'A', '[ADM]', 'T', '[TEC]', '[USER]') || ' WS4MIND  | Manutenção Inteligente' INTO v_ds_titulo FROM dual;
         EXCEPTION
            WHEN OTHERS THEN
               v_ds_titulo := 'WS4MIND | Manutenção Inteligente';
         END;
         -- definir texto padrão do rodape
         BEGIN
            SELECT v_ds_titulo||' - Copyright © 2020 | Todos os direitos reservados <br/>...' INTO v_ds_rodape FROM dual;
         EXCEPTION
            WHEN OTHERS THEN
               v_ds_rodape := v_ds_titulo||' - Copyright © 2020 | WS4TI Todos os direitos reservados <br/>...';
         END;         
      ELSE
        apex_util.set_session_state('LOGIN_MESSAGE', 'Tipo de usuário Inválido, favor consultar o administrador!');
        RETURN FALSE;
      END IF;
      ---
      -- Write user information to Session.
      --
      apex_util.set_session_state('ID_CLIENTE', v_id_cliente);
      apex_util.set_session_state('SESSION_EMAIL', p_email);
      apex_util.set_session_state('CD_USUARIO', v_cd_usuario);
      apex_util.set_session_state('TITULO', v_ds_titulo);
      apex_util.set_session_state('RODAPE', '<div style="text-align: center; font-size: 12px; height: 24px;"><a> ' || v_ds_rodape || ' </a></div>');
      ---
      ---
      RETURN TRUE;
   END;

   --------------------------------------
   PROCEDURE process_login(p_email      VARCHAR2
                          ,p_password   VARCHAR2
                          ,p_app_id     NUMBER
                          ,p_tp_usuario VARCHAR2) AS
      v_result BOOLEAN := FALSE;
   BEGIN
      v_result := authenticate_user(p_email, p_password, p_tp_usuario);
      IF v_result = TRUE THEN
         -- Redirect to Page 1 (Home Page).
         wwv_flow_custom_auth_std.post_login(p_email -- p_email
                                            ,p_password -- p_Password
                                            ,v('APP_SESSION') -- p_Session_Id
                                            ,p_app_id || ':1' -- p_Flow_page
                                             );
      ELSE
         -- Login Failure, redirect to page 101 (Login Page).
         owa_util.redirect_url('f?p=.:101:.');
      END IF;
   END;
   
   /* processo de troca de senha
      Criado por: JoséLuís 
      Data: 21/05/2018
   */
   PROCEDURE process_trocasenha(p_email      VARCHAR2
                               ,p_password   VARCHAR2
                               ,p_npassword  varchar2
                               ,p_app_id     NUMBER
                               ,p_tp_usuario VARCHAR2) AS
      v_result BOOLEAN := FALSE;
   BEGIN
      v_result := authenticate_user(p_email, p_password, p_tp_usuario);
      IF v_result = TRUE THEN
         --
         BEGIN
            update cliente_usuario x
               set x.ds_senha = p_npassword
             WHERE upper(x.ds_email) = upper(p_email)
               and x.ds_senha = p_password;
         EXCEPTION
            WHEN no_data_found THEN
               -- Write to Session, User not found.
               apex_util.set_session_state('LOGIN_MESSAGE', 'E-mail não encontrado');
         END;
         apex_util.set_session_state('LOGIN_MESSAGE', 'Senha alterada com sucesso!');
         APEX_CUSTOM_AUTH.LOGOUT (p_this_app=>p_app_id, p_next_app_page_sess=>p_app_id || ':101');
      END IF;  
   END;     
   

END pkg_security;

/
