--------------------------------------------------------
--  DDL for View VW_CLIENTE_OS_QOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_OS_QOS" ("DT_AOS", "DT_FIA", "ID_CLIENTE", "ID_OS", "DT_OS", "CD_MAQUINA", "FL_PARADO", "CD_TIPO", "DS_PROBLEMA", "ST_OS", "FL_BAIXA_PRODUTO", "CD_USUARIO_TMP", "ID_CLASS", "FL_PRIORIDADE", "FL_AVALIACAO", "DS_AVALIACAO", "DS_EMAIL_OPC", "ID_GRUPO", "DT_PERIODO") AS 
  SELECT "DT_AOS"
       ,"DT_FIA"
       ,"ID_CLIENTE"
       ,"ID_OS"
       ,"DT_OS"
       ,"CD_MAQUINA"
       ,"FL_PARADO"
       ,"CD_TIPO"
       ,"DS_PROBLEMA"
       ,"ST_OS"
       ,"FL_BAIXA_PRODUTO"
       ,"CD_USUARIO_TMP"
       ,"ID_CLASS"
       ,"FL_PRIORIDADE"
       ,"FL_AVALIACAO"
       ,"DS_AVALIACAO"
       ,"DS_EMAIL_OPC"
       ,"ID_GRUPO"
       ,"DT_PERIODO"
  FROM vw_cliente_os x
 WHERE x.st_os != 'CAN'
;
