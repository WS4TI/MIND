--------------------------------------------------------
--  DDL for View VW_CLIENTE_OS_INDICES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_OS_INDICES" ("CHAVE_MAQUINA", "CHAVE_MAQUINA_GRUPO", "ID_CLIENTE", "ID_MAQUINA_GRUPO", "DT_PERIODO", "DS_MAQUINA_GRUPO", "CD_MAQUINA", "DS_MAQUINA", "QOS", "NOC", "NOP", "OPP", "THMC", "THMPE", "THMPP", "HC", "TRO", "MP", "MC", "MTTR", "MTBF", "DISP", "FL_HORAS_CAL", "FL_HORIMETRO") AS 
  SELECT chave_maquina
      ,chave_maquina_grupo
      ,id_cliente
      ,id_maquina_grupo
      ,dt_periodo
      ,ds_maquina_grupo
      ,cd_maquina
      ,ds_maquina
      ,qos
      ,noc
      ,nop
      ,opp
      ,thmc
      ,thmpe
      ,thmpp
      ,hc
      ,tro
      ,mp
      ,mc
      ,mttr
      ,mtbf
      ,CASE
       /*Caso tenha horímetro DISP1 =  100 * (tro / (tro + thmc + thmpe) ) – Se a o TRO for “0” disponibilidade 100%.*/
          WHEN fl_horimetro = 'S' AND ((tro + thmc + thmpe) > 0) THEN
           round(100 * (tro / (tro + thmc + thmpe)), 2)
          WHEN fl_horimetro = 'S' AND tro = 0 THEN
           100
       /*Caso não tenha horímetro DISP2 =  100 * ( (hc - thmc - thmpe) / hc ) – Se a o HC for “0” disponibilidade 100%.*/
          WHEN fl_horimetro != 'S' AND hc > 0 THEN
           round(100 * ((hc - thmc - thmpe) / hc), 2)
          WHEN fl_horimetro != 'S' AND hc = 0 THEN
           100
          ELSE
           0
       END disp
      ,fl_horas_cal
      ,fl_horimetro
  FROM (SELECT chave_maquina
              ,chave_maquina_grupo
              ,dt_periodo
              ,ds_maquina_grupo
              ,cd_maquina
              ,ds_maquina
              ,qos
              ,noc
              ,nop
              ,opp
              ,thmc
              ,thmpe
              ,thmpp
              ,hc
              ,tro
              ,CASE
                  WHEN opp != 0 THEN
                   round((nop / opp) * 100, 4)
                  ELSE
                   100
               END "MP"
               ,CASE
                  WHEN (thmc + thmpe) > 0 THEN
                   round((thmc / (thmc + thmpe)) * 100, 4)
                  ELSE
                   0
               END "MC"
               ,CASE
                  WHEN noc != 0 THEN
                   round((thmc / noc), 4)
                  ELSE
                   0
               END "MTTR"
               ,CASE
               /* Caso tenha horímetro MTBF1 = (TRO / NOC) – Se o NOC for igual a “0” favor considerar o mesmo valor da “TRO”. */
                  WHEN fl_horimetro = 'S' AND noc > 0 THEN
                   round((tro / noc), 4)
                  WHEN fl_horimetro = 'S' AND noc = 0 THEN
                   tro
               /* Caso não tenha horímetro MTBF2 = ((hc - thmc) / noc) - Se o NOC for igual a “0” favor considerar o mesmo valor da “HC”. */
                  WHEN fl_horimetro != 'S' AND noc > 0 THEN
                   round(((hc - thmc) / noc), 4)
                  WHEN fl_horimetro != 'S' AND noc > 0 THEN
                   hc
                  ELSE
                   0
               END "MTBF"
               ,fl_horas_cal
               ,fl_horimetro
               ,id_cliente
               ,id_maquina_grupo
          FROM (SELECT m.rowid AS "CHAVE_MAQUINA"
                       ,x.rowid AS "CHAVE_MAQUINA_GRUPO"
                       ,x.id_cliente
                       ,x.id_maquina_grupo
                       ,x.fl_horas_cal
                       ,p.dt_periodo
                       ,x.ds_maquina_grupo
                       ,m.cd_maquina
                       ,m.ds_maquina
                       ,x.fl_horimetro
                       ,(SELECT COUNT(1)
                          FROM vw_cliente_os_qos a
                         WHERE a.id_cliente = x.id_cliente
                           AND a.cd_maquina = m.cd_maquina
                           AND a.dt_periodo = nvl(p.dt_periodo, a.dt_periodo)) AS qos                       
                       ,(SELECT COUNT(1)
                          FROM vw_cliente_os_noc a
                         WHERE a.id_cliente = x.id_cliente
                           AND a.cd_maquina = m.cd_maquina
                           AND a.dt_periodo = nvl(p.dt_periodo, a.dt_periodo)) AS noc
                       ,(SELECT COUNT(1)
                          FROM vw_cliente_os_nop a
                         WHERE a.id_cliente = x.id_cliente
                           AND a.cd_maquina = m.cd_maquina
                           AND a.dt_periodo = nvl(p.dt_periodo, a.dt_periodo)) AS nop
                       ,(SELECT COUNT(1)
                          FROM vw_cliente_os_opp a
                         WHERE a.id_cliente = x.id_cliente
                           AND a.cd_maquina = m.cd_maquina
                           AND a.dt_periodo = nvl(p.dt_periodo, a.dt_periodo)) AS opp
                       ,(SELECT nvl(round(SUM(pck_ordem_servico.fu_tempo_atend_maquina(x.id_cliente, noc.id_os)), 2), 0)
                          FROM vw_cliente_os_noc noc
                         WHERE noc.id_cliente = x.id_cliente
                           AND noc.cd_maquina = m.cd_maquina
                           AND noc.dt_periodo = nvl(p.dt_periodo, noc.dt_periodo)) AS "THMC"
                       ,(SELECT nvl(round(SUM(pck_ordem_servico.fu_tempo_atend_maquina(x.id_cliente, nop.id_os)), 2), 0)
                          FROM vw_cliente_os_nop nop
                         WHERE nop.id_cliente = x.id_cliente
                           AND nop.cd_maquina = m.cd_maquina
                           AND nop.dt_periodo = nvl(p.dt_periodo, nop.dt_periodo)) AS "THMPE"
                       ,(SELECT nvl(round(SUM(a.qt_tempo_previsto), 4), 0)
                          FROM vw_cliente_os a
                         WHERE a.id_cliente = x.id_cliente
                           AND a.cd_maquina = m.cd_maquina
                           AND a.dt_periodo = nvl(p.dt_periodo, a.dt_periodo)) AS "THMPP"
                       ,(SELECT (extract(DAY FROM last_day(to_date(nvl(p.dt_periodo, to_char(SYSDATE, 'yyyymm') - 1), 'yyyymm'))) - COUNT(1)) * 24
                          FROM cliente_calendario x
                         WHERE to_number(to_char(x.dt_calendario, 'yyyymm')) = nvl(p.dt_periodo, to_char(SYSDATE, 'yyyymm') - 1)) AS "HC"
                       ,nvl((SELECT a.qt_tro
                             FROM cliente_maquina_tro a
                            WHERE a.id_cliente = x.id_cliente
                              AND a.cd_maquina = m.cd_maquina
                              AND a.dt_base = nvl(p.dt_periodo, a.dt_base)
                              AND rownum = 1)
                          ,0) AS "TRO"
                  FROM cliente_maquina_grupo x
                      ,cliente_maquina m
                      ,(SELECT to_number(to_char(add_months(SYSDATE, -(rownum-1)), 'rrrrmm')) AS dt_periodo FROM all_tables WHERE rownum <= (12 * 5)/*5 anos*/) p
                 WHERE x.id_cliente = m.id_cliente
                   AND x.id_maquina_grupo = m.id_maquina_grupo))
 ORDER BY id_cliente
         ,id_maquina_grupo
         ,ds_maquina_grupo
         ,cd_maquina
;
