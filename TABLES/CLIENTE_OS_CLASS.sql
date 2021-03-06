--------------------------------------------------------
--  DDL for Table CLIENTE_OS_CLASS
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_OS_CLASS" 
   (	"ID_CLIENTE" NUMBER, 
	"ID_CLASS" NUMBER, 
	"DS_CLASS" VARCHAR2(50 BYTE), 
	"ST_CLASS" CHAR(1 BYTE) DEFAULT 'A'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;

   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS_CLASS"."DS_CLASS" IS 'Descrição da Classificação da OS';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_OS_CLASS"."ST_CLASS" IS 'Ativo ou Inativo';
