--------------------------------------------------------
--  DDL for View VW_CLIENTE_PROGRAMACAO_DIA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_PROGRAMACAO_DIA" ("ID_CLIENTE", "CD_MAQUINA", "SQ_CHECKITEM", "DT_INICIO", "DT_TMP", "DS_MAQUINA", "ID_MAQUINA_GRUPO", "DS_MAQUINA_GRUPO", "NR_ORDEM", "DS_INSPECAO", "DS_OBS", "TP_RECORRENCIA", "FL_PARADO", "CD_TIPO", "ID_CKOS", "QT_TEMPO_PREVISTO") AS 
  SELECT DISTINCT a.id_cliente
               ,a.cd_maquina
               ,b.sq_checkitem
               ,to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'dd/mm/rrrr') dt_inicio
               ,to_date(dt.tmp_date, 'dd/mm/rrrr') dt_tmp
               ,c.ds_maquina
               ,g.id_maquina_grupo
               ,g.ds_maquina_grupo
               ,b.nr_ordem
               ,b.ds_inspecao
               ,b.ds_obs
               ,decode(b.tp_recorrencia
                      ,'RDI'
                      ,'Diária'
                      ,'RSE'
                      ,'Semanal'
                      ,'RQZ'
                      ,'Quinzenal'
                      ,'RME'
                      ,'Mensal'
                      ,'RBM'
                      ,'Bimestral'
                      ,'RTM'
                      ,'Trimestral'
                      ,'RSM'
                      ,'Semestral'
                      ,'RAN'
                      ,'Anual'
                      ,'RBE'
                      ,'Biênio'
                      ,'RTE'
                      ,'Triênio'
                      ,'RQE'
                      ,'Quinquênio'
                      ,'NID') AS tp_recorrencia
               ,b.fl_parado
               ,b.cd_tipo
               ,b.id_ckos
               ,b.qt_tempo_previsto
  FROM cliente_maquina_cklist a
      ,cliente_maquina_cklist_item b
      ,cliente_maquina c
      ,cliente_maquina_grupo g
      ,(SELECT nvl(MAX(tmp_date), SYSDATE) tmp_date FROM cliente_os_date_tmp) dt
 WHERE a.id_cliente = b.id_cliente
   AND a.cd_maquina = b.cd_maquina
   AND a.id_cliente = c.id_cliente
   AND a.cd_maquina = c.cd_maquina
   AND c.id_cliente = g.id_cliente
   AND c.id_maquina_grupo = g.id_maquina_grupo
      --
   AND a.st_checklist = 'A'
   AND b.st_checkitem = 'A'
   AND b.fl_programar = 'S'
      --
   AND ((b.tp_recorrencia = 'RDI') OR (b.tp_recorrencia = 'RSE' AND to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'DY') = to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'DY')) OR
       (b.tp_recorrencia = 'RQZ' AND MOD(nvl(b.dt_inicio, b.dt_ckeckitem) - to_date(dt.tmp_date, 'dd/mm/rrrr'), 15) = 0) OR
       (b.tp_recorrencia = 'RME' AND MOD(nvl(b.dt_inicio, b.dt_ckeckitem) - to_date(dt.tmp_date, 'dd/mm/rrrr'), 30) = 0) OR
       (b.tp_recorrencia = 'RBM' AND MOD(nvl(b.dt_inicio, b.dt_ckeckitem) - to_date(dt.tmp_date, 'dd/mm/rrrr'), 60) = 0) OR
       (b.tp_recorrencia = 'RTM' AND MOD(nvl(b.dt_inicio, b.dt_ckeckitem) - to_date(dt.tmp_date, 'dd/mm/rrrr'), 90) = 0) OR
       (b.tp_recorrencia = 'RSM' AND MOD(nvl(b.dt_inicio, b.dt_ckeckitem) - to_date(dt.tmp_date, 'dd/mm/rrrr'), 180) = 0) OR
       (b.tp_recorrencia = 'RAN' AND MOD(to_number(to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'rrrrmmdd')) - to_number(to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'rrrrmmdd')), 10000) = 0) OR
       (b.tp_recorrencia = 'RBE' AND MOD(to_number(to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'rrrrmmdd')) - to_number(to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'rrrrmmdd')), 20000) = 0) OR
       (b.tp_recorrencia = 'RTE' AND MOD(to_number(to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'rrrrmmdd')) - to_number(to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'rrrrmmdd')), 30000) = 0) OR
       (b.tp_recorrencia = 'RQE' AND MOD(to_number(to_char(nvl(b.dt_inicio, b.dt_ckeckitem), 'rrrrmmdd')) - to_number(to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'rrrrmmdd')), 50000) = 0))
   AND to_char(nvl(b.dt_termino, to_date(dt.tmp_date, 'dd/mm/rrrr')), 'YYYYMMDD') >= to_char(to_date(dt.tmp_date, 'dd/mm/rrrr'), 'YYYYMMDD')
 ORDER BY a.cd_maquina
         ,b.nr_ordem
;
