--------------------------------------------------------
--  DDL for Table CLIENTE_AGENDA
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_AGENDA" 
   (	"ID_CLIENTE" NUMBER, 
	"SQ_AGENDA" NUMBER, 
	"CD_USUARIO" VARCHAR2(20 BYTE), 
	"DS_TITULO" VARCHAR2(200 BYTE), 
	"DS_DESCRICAO" VARCHAR2(1000 BYTE), 
	"NR_OS" NUMBER, 
	"DT_INI" DATE, 
	"DT_FIM" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;
