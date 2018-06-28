--------------------------------------------------------
--  DDL for Table CLIENTE_GRUPO
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_GRUPO" 
   (	"ID_CLIENTE" NUMBER, 
	"ID_GRUPO" NUMBER, 
	"NM_GRUPO" VARCHAR2(100 BYTE), 
	"DS_EMAIL" VARCHAR2(400 BYTE), 
	"FL_ENVIA_EMAIL" CHAR(1 BYTE) DEFAULT 'S', 
	"ST_GRUPO" CHAR(1 BYTE) DEFAULT 'A', 
	"FL_ATENDE_OS" CHAR(1 BYTE) DEFAULT 'N', 
	"FL_ATENDE_FSSC" CHAR(1 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;

   COMMENT ON COLUMN "WS4TI"."CLIENTE_GRUPO"."ST_GRUPO" IS 'Ativo ou Inativo';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_GRUPO"."FL_ATENDE_OS" IS 'Atende Ordem de Serviço';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_GRUPO"."FL_ATENDE_FSSC" IS 'FSSC 22000 Sistema de Gestão da Segurança de Alimentos';
