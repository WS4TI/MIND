--------------------------------------------------------
--  DDL for Function LDAP_SECURITY_APEX_SPO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "WS4TI"."LDAP_SECURITY_APEX_SPO" (p_username IN VARCHAR2
                                   ,p_password IN VARCHAR2) RETURN BOOLEAN IS
   l_ldap_host VARCHAR2(256) := 'mnsad01.spo.microservice';
   l_ldap_port VARCHAR2(256) := '389';
   l_dn_prefix VARCHAR2(100) := 'SPO\'; -- Amend as desired'.
   l_retval  PLS_INTEGER;
   l_session dbms_ldap.session;
BEGIN
   -- Choose to raise exceptions.
   dbms_ldap.use_exception := TRUE;
   -- Connect to the LDAP server.
   l_session := dbms_ldap.init(hostname => l_ldap_host, portnum => l_ldap_port);
   l_retval := dbms_ldap.simple_bind_s(ld => l_session, dn => l_dn_prefix || p_username, passwd => p_password);
   -- No exceptions mean you are authenticated.
   RETURN TRUE;
EXCEPTION
   WHEN OTHERS THEN
      -- Exception means authentication failed.
      l_retval := dbms_ldap.unbind_s(ld => l_session);
      apex_util.set_custom_auth_status(p_status => 'Usuário e/ou Senha Incorretos');
      RETURN FALSE;
END ldap_security_apex_spo;

/
