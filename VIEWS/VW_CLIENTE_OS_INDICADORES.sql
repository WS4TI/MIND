--------------------------------------------------------
--  DDL for View VW_CLIENTE_OS_INDICADORES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_OS_INDICADORES" ("ID_CLIENTE", "CHAVE_MAQUINA_GRUPO", "DT_PERIODO", "DS_MAQUINA_GRUPO", "MTTR", "MTBF", "DISP", "MC", "MP", "NOC", "OPP", "NOP", "TRO", "HC", "THMC", "THMPE", "THMPP", "QOS") AS 
  SELECT x.id_cliente
      ,x.chave_maquina_grupo
      ,x.dt_periodo
       ,x.ds_maquina_grupo
       ,round(AVG(x.mttr), 2) AS "MTTR"
       ,round(AVG(x.mtbf), 2) AS "MTBF"
       ,round(AVG(x.disp), 2) AS "DISP"
       ,round(AVG(x.mc), 2) AS "MC"
       ,round(AVG(x.mp), 2) AS "MP"
       --
       ,round(SUM(x.noc), 2) AS "NOC"
       ,round(SUM(x.opp), 2) AS "OPP"
       ,round(SUM(x.nop), 2) AS "NOP"
       --
       ,round(AVG(x.tro), 2) AS "TRO"
       ,round(AVG(x.hc), 2) AS "HC"
       ,round(SUM(x.thmc), 2) AS "THMC"
       ,round(SUM(x.thmpe), 2) AS "THMPE"
       ,round(SUM(x.thmpp), 2) AS "THMPP"
       --
       ,round(SUM(x.qos), 2) AS "QOS"
--
  FROM vw_cliente_os_indices x
 WHERE x.fl_horas_cal = 'S'
 GROUP BY x.id_cliente
         ,x.chave_maquina_grupo
         ,x.dt_periodo
         ,x.ds_maquina_grupo
 ORDER BY x.id_cliente
         ,x.dt_periodo DESC
         ,x.ds_maquina_grupo
;
