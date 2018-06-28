--------------------------------------------------------
--  DDL for Table CLIENTE_FABRICANTE
--------------------------------------------------------

  CREATE TABLE "WS4TI"."CLIENTE_FABRICANTE" 
   (	"ID_CLIENTE" NUMBER, 
	"ID_FABRICANTE" NUMBER(8,0), 
	"NM_FABRICANTE" VARCHAR2(200 BYTE), 
	"CD_PAIS" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;

   COMMENT ON COLUMN "WS4TI"."CLIENTE_FABRICANTE"."ID_FABRICANTE" IS 'ID do Fabricante';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_FABRICANTE"."NM_FABRICANTE" IS 'Descrição do Fabricante';
   COMMENT ON COLUMN "WS4TI"."CLIENTE_FABRICANTE"."CD_PAIS" IS 'Código do País';