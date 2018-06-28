--------------------------------------------------------
--  DDL for Package PCK_ORDEM_SERVICO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WS4TI"."PCK_ORDEM_SERVICO" AS

   PROCEDURE pr_evento(p_id_cliente IN cliente_os_evento.id_cliente%TYPE
                      ,p_id_os      IN cliente_os_evento.id_os%TYPE
                      ,p_tp_evento  IN cliente_os_evento.tp_evento%TYPE
                      ,p_ds_evento  IN cliente_os_evento.ds_evento%TYPE
                      ,p_dt_abre    IN cliente_os_evento.dt_abre%TYPE
                      ,p_dt_fecha   IN cliente_os_evento.dt_fecha%TYPE
                      ,p_ls_usuario IN cliente_os_evento.ls_usuario%TYPE);

   PROCEDURE pr_valida_entrega(p_id_cliente IN cliente_os_posm.id_cliente%TYPE
                              ,p_id_os      IN cliente_os_posm.id_os%TYPE
                              ,p_id_posm    IN cliente_os_posm.id_posm%TYPE
                              ,p_username   IN VARCHAR2
                              ,p_password   IN VARCHAR2);

   PROCEDURE pr_valida_recebto(p_id_cliente IN cliente_os_posm.id_cliente%TYPE
                              ,p_id_os      IN cliente_os_posm.id_os%TYPE
                              ,p_id_posm    IN cliente_os_posm.id_posm%TYPE
                              ,p_username   IN VARCHAR2
                              ,p_password   IN VARCHAR2);

   PROCEDURE pr_programacao(p_id_cliente IN cliente_os.id_cliente%TYPE DEFAULT NULL
                           ,p_cd_usuario IN cliente_os.cd_usuario_tmp%TYPE DEFAULT NULL
                           ,p_date       IN DATE DEFAULT NULL);

   PROCEDURE pr_email_fechar_os;

   FUNCTION fu_tempo_atend_maquina(p_id_cliente     cliente_os.id_cliente%TYPE
                                  ,p_id_os          cliente_os.id_os%TYPE
                                  ,p_dt_fim_periodo DATE DEFAULT SYSDATE) RETURN NUMBER;

   FUNCTION fu_showdate(p_qt_seg IN NUMBER) RETURN VARCHAR2;

   FUNCTION fu_create_cklist(p_id_cliente IN NUMBER
                            ,p_cd_maquina VARCHAR2) RETURN BOOLEAN;

END pck_ordem_servico;

/
