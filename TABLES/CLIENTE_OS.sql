--------------------------------------------------------
--  DDL for Table CLIENTE_OS
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_OS" 
   (	"ID_CLIENTE" NUMBER, 
	"ID_OS" NUMBER, 
	"DT_OS" DATE DEFAULT sysdate, 
	"CD_MAQUINA" VARCHAR2(15 BYTE), 
	"FL_PARADO" CHAR(1 BYTE) DEFAULT 'N', 
	"CD_TIPO" CHAR(3 BYTE) DEFAULT 'IND', 
	"DS_PROBLEMA" VARCHAR2(4000 BYTE), 
	"ST_OS" CHAR(3 BYTE), 
	"FL_BAIXA_PRODUTO" CHAR(1 BYTE), 
	"CD_USUARIO_TMP" VARCHAR2(20 BYTE), 
	"ID_CLASS" NUMBER, 
	"FL_PRIORIDADE" CHAR(1 BYTE) DEFAULT 'N', 
	"FL_AVALIACAO" CHAR(1 BYTE) DEFAULT 'P', 
	"DS_AVALIACAO" VARCHAR2(4000 BYTE), 
	"DS_EMAIL_OPC" VARCHAR2(400 BYTE), 
	"ID_GRUPO" NUMBER DEFAULT 5, 
	"QT_TEMPO_PREVISTO" NUMBER, 
	"QT_TEMPO_EFETIVO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;

   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."FL_PARADO" IS '[S] SIM, [N] NÃO';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."CD_TIPO" IS 'Classificação do problema da OS';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."CD_USUARIO_TMP" IS 'informação temporária de usuário';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."ID_CLASS" IS 'Classificação do problema da OS';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."FL_PRIORIDADE" IS 'Prioridade Alta, Baixa e Normal';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."FL_AVALIACAO" IS 'Positiva ou Negativa';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."DS_AVALIACAO" IS 'Avaliação do atendimento';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."ID_GRUPO" IS 'Grupo de usuário';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."QT_TEMPO_PREVISTO" IS 'Quantidade (Minutos) de tempo previsto para realizar o serviço';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS"."QT_TEMPO_EFETIVO" IS 'Quantidade (Minutos) de tempo efetivo para realizar o serviço';
