--------------------------------------------------------
--  DDL for Table DEMO_TAGS
--------------------------------------------------------

  CREATE TABLE "WS4TI"."DEMO_TAGS" 
   (	"ID" NUMBER, 
	"TAG" VARCHAR2(255 BYTE), 
	"CONTENT_ID" NUMBER, 
	"CONTENT_TYPE" VARCHAR2(30 BYTE), 
	"CREATED" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"UPDATED" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_273992410125036321" ;
