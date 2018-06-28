--------------------------------------------------------
--  DDL for View VW_CLIENTE_TRO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_TRO" ("CD_MAQUINA", "DT_BASE", "QT_TRO") AS 
  SELECT x.cd_maquina
      ,a.dt_base
      ,nvl(a.qt_tro, 0) qt_tro
  FROM cliente_maquina     x
      ,cliente_maquina_tro a
 WHERE x.cd_maquina = a.cd_maquina(+)
 ORDER BY 1
;
