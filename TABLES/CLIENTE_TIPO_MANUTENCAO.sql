--------------------------------------------------------
--  DDL for Table CLIENTE_TIPO_MANUTENCAO
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_TIPO_MANUTENCAO" 
   (	"ID_CLIENTE" NUMBER, 
	"CD_TIPO" VARCHAR2(3 BYTE), 
	"DS_TIPO" VARCHAR2(50 BYTE), 
	"ST_TIPO" CHAR(1 BYTE) DEFAULT 'A'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;

   COMMENT ON COLUMN "WS4TI"."CLIENTE_TIPO_MANUTENCAO"."ST_TIPO" IS 'Ativo ou Inativo';