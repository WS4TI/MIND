--------------------------------------------------------
--  DDL for Package PKG_SECURITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WS4TI"."PKG_SECURITY" IS

   FUNCTION authenticate_user(p_email    VARCHAR2
                             ,p_password VARCHAR2
                             ,p_tp_usuario VARCHAR2) RETURN BOOLEAN;

   -----
   PROCEDURE process_login(p_email    VARCHAR2
                          ,p_password VARCHAR2
                          ,p_app_id   NUMBER
                          ,p_tp_usuario VARCHAR2);
                          
   -----
   PROCEDURE process_trocasenha(p_email     VARCHAR2
                               ,p_password  VARCHAR2
                               ,p_npassword VARCHAR2
                               ,p_app_id    NUMBER
                               ,p_tp_usuario VARCHAR2);
                          

END pkg_security;

/
