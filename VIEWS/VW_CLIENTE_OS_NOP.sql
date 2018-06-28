--------------------------------------------------------
--  DDL for View VW_CLIENTE_OS_NOP
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_OS_NOP" ("DT_AOS", "DT_FIA", "ID_CLIENTE", "ID_OS", "DT_OS", "CD_MAQUINA", "FL_PARADO", "CD_TIPO", "DS_PROBLEMA", "ST_OS", "FL_BAIXA_PRODUTO", "CD_USUARIO_TMP", "ID_CLASS", "FL_PRIORIDADE", "FL_AVALIACAO", "DS_AVALIACAO", "DS_EMAIL_OPC", "ID_GRUPO", "DT_PERIODO") AS 
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
  FROM VW_CLIENTE_OS X
 WHERE X.CD_TIPO = 'PRE'
   AND X.ST_OS IN ('FEC', 'ATE')
;
