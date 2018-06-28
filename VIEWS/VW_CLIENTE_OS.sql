--------------------------------------------------------
--  DDL for View VW_CLIENTE_OS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "WS4TI"."VW_CLIENTE_OS" ("DT_PERIODO", "DT_AOS", "DT_FIA", "ID_CLIENTE", "ID_OS", "DT_OS", "CD_MAQUINA", "FL_PARADO", "CD_TIPO", "DS_PROBLEMA", "ST_OS", "FL_BAIXA_PRODUTO", "CD_USUARIO_TMP", "ID_CLASS", "FL_PRIORIDADE", "FL_AVALIACAO", "DS_AVALIACAO", "DS_EMAIL_OPC", "ID_GRUPO", "QT_TEMPO_PREVISTO", "QT_TEMPO_EFETIVO") AS 
  SELECT nvl((SELECT to_number(to_char(xe.dt_abre, 'yyyymm'))
             FROM cliente_os_evento xe
            WHERE xe.id_cliente = x.id_cliente
              AND xe.id_os = x.id_os
              AND xe.tp_evento = 'AOS')
          ,to_number(to_char(x.dt_os, 'yyyymm'))) dt_periodo
      ,(SELECT xe.dt_abre
          FROM cliente_os_evento xe
         WHERE xe.id_cliente = x.id_cliente
           AND xe.id_os = x.id_os
           AND xe.tp_evento = 'AOS') dt_aos
      ,(SELECT MAX(xe.dt_abre)
          FROM cliente_os_evento xe
         WHERE xe.id_cliente = x.id_cliente
           AND xe.id_os = x.id_os
           AND xe.tp_evento = 'FIA') dt_fia
      ,x."ID_CLIENTE"
       ,x."ID_OS"
       ,x."DT_OS"
       ,x."CD_MAQUINA"
       ,x."FL_PARADO"
       ,x."CD_TIPO"
       ,x."DS_PROBLEMA"
       ,x."ST_OS"
       ,x."FL_BAIXA_PRODUTO"
       ,x."CD_USUARIO_TMP"
       ,x."ID_CLASS"
       ,x."FL_PRIORIDADE"
       ,x."FL_AVALIACAO"
       ,x."DS_AVALIACAO"
       ,x."DS_EMAIL_OPC"
       ,x."ID_GRUPO"
       ,x."QT_TEMPO_PREVISTO"
       ,x."QT_TEMPO_EFETIVO"
  FROM cliente_os x
;
