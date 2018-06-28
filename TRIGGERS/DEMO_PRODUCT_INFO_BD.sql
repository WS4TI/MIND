--------------------------------------------------------
--  DDL for Trigger DEMO_PRODUCT_INFO_BD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "WS4TI"."DEMO_PRODUCT_INFO_BD" 
    before delete on demo_product_info
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'PRODUCT',
        p_content_id    => :old.product_id );
end;

/
ALTER TRIGGER "WS4TI"."DEMO_PRODUCT_INFO_BD" ENABLE;
