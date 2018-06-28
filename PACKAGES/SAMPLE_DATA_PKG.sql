--------------------------------------------------------
--  DDL for Package SAMPLE_DATA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WS4TI"."SAMPLE_DATA_PKG" as
  function varchar2_to_blob(p_varchar2_tab in dbms_sql.varchar2_table) return blob;
  procedure delete_data;
  procedure insert_data;
end sample_data_pkg;

/
