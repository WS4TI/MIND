set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
begin
select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';
execute immediate 'alter session set nls_numeric_characters=''.,''';
end;
/
prompt  WORKSPACE 12881423952305335
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   10:21 Quarta-Feira Fevereiro 21, 2018
--   Exported By:     ADMIN
--   Export Type:     Workspace Export
--   Version:         4.2.6.00.03
--   Instance ID:     69417208489923
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_040200
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>12881423952305335);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace JOSELUIS...
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
end;
/
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 12881508064305371
 ,p_provisioning_company_id => 12881423952305335
 ,p_short_name => 'JOSELUIS'
 ,p_display_name => 'JOSELUIS'
 ,p_first_schema_provisioned => 'JOSELUIS'
 ,p_company_schemas => 'JOSELUIS'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'JOSELUIS'
 ,p_path_prefix => 'JOSELUIS'
 ,p_workspace_image => wwv_flow_api.g_varchar2_table
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '12881322868305335',
  p_user_name    => 'ADMIN',
  p_first_name   => 'jose luis',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> 'jose.costa@microservice.com.br',
  p_web_password => '61413886F0FDDDD524E73BFC3FC39C6D',
  p_web_password_format => 'HEX_ENCODED_DIGEST_V2',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'JOSELUIS',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201701230806','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--Application Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 12881614965305387,
    p_user_id => 12881322868305335,
    p_password => 'A4A7136D3D1D9A1C2FB798913507B59A');
end;
/
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14706911190702884,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R14705216581543540_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15050405214553579,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P3_R13151103828933035_SORT',
    p_attribute_value => 'fsp_sort_7_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15062120399991229,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P25_W14356229019269235',
    p_attribute_value => '14357519908269568____14357519908269568');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15062216728991231,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R14705216581543540_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063429168025217,
    p_user_id => 'GILMAR.VAZ@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P25_W29391350261014825',
    p_attribute_value => '29392641150015158_Y___29392641150015158');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063505758025218,
    p_user_id => 'GILMAR.VAZ@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP130_P25_R29740337823289130_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063700194041059,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P18_R13230208761291617_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17004504809995531,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15905226632365336_SORT',
    p_attribute_value => 'fsp_sort_2');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 18413901865417115,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P1_R13633002314132081_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12882012947310014,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13108713042739079,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P300_R274135113431934049_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13109001876754817,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P675_R172118613741486068_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13415029216500403,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P24_W13412619023500057',
    p_attribute_value => '13414706279500401____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13437209308389925,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R13433025538016162_SORT',
    p_attribute_value => 'fsp_sort_3');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13450903448965450,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P102_R170975515323537885_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13561629583864246,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P29_R13557525266864040_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15043329876747237,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP130_P1_R28668123555877671_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15045132190801184,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P11_W28240424764218888',
    p_attribute_value => '28241223833219283____28241223833219283');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15045625720804170,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P16_W28627546515614654',
    p_attribute_value => '28628326751615326____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15050904160699428,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P25_W29391350261014825',
    p_attribute_value => '29392641150015158_Y___29392641150015158');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15051020193699429,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP130_P25_R29740337823289130_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15061224510953500,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P6_R13161411887260146_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15061330051955079,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P3_R13151103828933035_SORT',
    p_attribute_value => 'fsp_sort_8_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063611706025459,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P29_R13557525266864040_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064504134051692,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P13_R13197915621252379_SORT',
    p_attribute_value => 'fsp_sort_9');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15369103053462809,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P26_W44043159542486139',
    p_attribute_value => '44044957511486798____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15468922926454167,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P25_W44751772077469026',
    p_attribute_value => '44753062966469359_Y___44753062966469359');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15469016440454168,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP131_P25_R45100759639743331_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15809005838722801,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P18_R13230208761291617_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15920526364614995,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15547922233841237_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15920620420614995,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15905226632365336_SORT',
    p_attribute_value => 'fsp_sort_2');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17063722628324661,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P15_W43613153993542917',
    p_attribute_value => '43615650431545505____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17579208052995708,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P7_W17578102987995394',
    p_attribute_value => '17578931910995706____17578931910995706');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 18414928401421353,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P19_W17860831276659631',
    p_attribute_value => '17861628148660075____17861628148660075');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12882301949315078,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P763_W480600211834691519',
    p_attribute_value => '480602703192699428____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12895929097332850,
    p_user_id => 'ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12896026329332862,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____3328003692130542');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12896107575332879,
    p_user_id => 'ADMIN',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '130');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12907230292453846,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P260_W40585608941890825',
    p_attribute_value => '40587517034894377____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13007200330021296,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P546_W30205316146531602',
    p_attribute_value => '30206031208532453____30206031208532453');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13052829588994462,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13108814905749103,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P423_R172114705298474212_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13108924255751804,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P653_R172116901966482713_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13119020350094276,
    p_user_id => 'ANONYMOUS',
    p_preference_name => 'FSP200_P8_R13115009706092835_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13141509783986257,
    p_user_id => 'ADMIN',
    p_preference_name => 'USE_TREE_ON_P4150',
    p_attribute_value => 'Y');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13235924425382078,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP200_P2_R12983730585011109_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13236016198382079,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP200_P2_R12991425929165651_SORT',
    p_attribute_value => 'fsp_sort_7_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13236212276382082,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_200_P2_W13000125168252509',
    p_attribute_value => '13001623667252862____13001623667252862');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13404021086173478,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P23_R13400009280173198_SORT',
    p_attribute_value => 'fsp_sort_9_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13540731599166275,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P20_R13537520049154700_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13593521914869737,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P16_W13592425273869064',
    p_attribute_value => '13593205509869736____13593205509869736');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14357810854269568,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P25_W14356229019269235',
    p_attribute_value => '14357519908269568_Y___14357519908269568');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14463309062099371,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14966823876786406,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P2_R14963022838786071_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15045328739802837,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P15_W28252732177088716',
    p_attribute_value => '28255228615091304____28255228615091304');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15061721249990042,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P24_W13412619023500057',
    p_attribute_value => '13414706279500401_N___REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15062428297001798,
    p_user_id => 'GILMAR.VAZ@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P26_W28682737726031938',
    p_attribute_value => '28684535695032597____28684535695032597');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15095805975430198,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P194_R115839224419800245_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15552508271023089,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15547922233841237_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16987612593751017,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P15_W13217610935343126',
    p_attribute_value => '13220107373345714____13220107373345714');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16987811946751328,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P16_W13592425273869064',
    p_attribute_value => '13593205509869736____13593205509869736');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17063225647323301,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P26_W44043159542486139',
    p_attribute_value => '44044957511486798____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17063531220324025,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P24_W43808162081699848',
    p_attribute_value => '43810249337700192____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17194815674380417,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P516_W478906809191866600',
    p_attribute_value => '478908119205874812____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17195013949381189,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P527_W478911116494917969',
    p_attribute_value => '478911808086918993____478911808086918993');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17292531277790628,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P24_W43808162081699848',
    p_attribute_value => '43810249337700192____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17293505338966090,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P25_W44751772077469026',
    p_attribute_value => '44753062966469359____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17293613303966092,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP131_P25_R45100759639743331_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17293803777975325,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P15_W43613153993542917',
    p_attribute_value => '43615650431545505____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17294030722977962,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P26_W44043159542486139',
    p_attribute_value => '44044957511486798____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17294903047020242,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P32_W30477236138988691',
    p_attribute_value => '30478853787989019____30478853787989019');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13201028798273170,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P13_R13197915621252379_SORT',
    p_attribute_value => 'fsp_sort_9_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13206429610473696,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P11_W13205303522473298',
    p_attribute_value => '13206102591473693____13206102591473693');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13221917837604226,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P4111_R63176833274_SORT',
    p_attribute_value => 'fsp_sort_2_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13234113203293609,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P18_R13230208761291617_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13235817492381431,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_200_P6_W12929019225970014',
    p_attribute_value => '12931902453970367____12931902453970367');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13236502870394731,
    p_user_id => 'LUCIO.CALICCIO@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P6_R13161411887260146_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13238114691426525,
    p_user_id => 'LUCIO.CALICCIO@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P13_R13197915621252379_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14361207716706406,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P742_W197494211374063858',
    p_attribute_value => '197495101690063870____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14385528407041381,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P273_W48571614952501952',
    p_attribute_value => '48572307979502610____48572307979502610');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15287520466304496,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P36_W15122702234026231',
    p_attribute_value => '15482101808558193_N___15124230531026232');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15287928991330989,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P4_W13322921103168481',
    p_attribute_value => '13324603102168820____13324603102168820');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15368912973458257,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P11_W43600846580673089',
    p_attribute_value => '43601645649673484____43601645649673484');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15370424441743123,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP131_P6_R43556954945459937_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15467801854128976,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P24_W43808162081699848',
    p_attribute_value => '43810249337700192____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15474111223933615,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P24_W28447740265245647',
    p_attribute_value => '28449827521245991____28449827521245991');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15474420376936189,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P25_W29391350261014825',
    p_attribute_value => '29392641150015158_Y___29392641150015158');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15474525503936192,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP130_P25_R29740337823289130_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15481621608516671,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P16_W13592425273869064',
    p_attribute_value => '13593205509869736____13593205509869736');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15839104490645620,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P21_W13367727378186959',
    p_attribute_value => '13369318479190253____13369318479190253');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15839220503646584,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P6_R13161411887260146_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17146924149521239,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4207_W47814307723191364',
    p_attribute_value => '47815210532192150____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17195312870381769,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P514_W478900029710775865',
    p_attribute_value => '478900807852776971____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17294322718012106,
    p_user_id => 'MARIOSS',
    p_preference_name => 'FSP_IR_131_P11_W43600846580673089',
    p_attribute_value => '43601645649673484____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17296717439331409,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP131_P1_R44028545372331872_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17515515441292517,
    p_user_id => 'DONIZETE',
    p_preference_name => 'FSP_IR_131_P15_W43613153993542917',
    p_attribute_value => '43615650431545505____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17684404787178155,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P39_W17682824092177180',
    p_attribute_value => '17684130493178155_Y___REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12951813366361479,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P194_R224505023496694888_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12951929989366221,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P195_R225787614827384691_SORT',
    p_attribute_value => 'fsp_sort_2_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12957221374612770,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P287_W47869516939800889',
    p_attribute_value => '47870618297805517____47870618297805517');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12958832665660379,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P102_R170976026405541124_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12994017040222509,
    p_user_id => 'ANONYMOUS',
    p_preference_name => 'FSP200_P2_R12991425929165651_SORT',
    p_attribute_value => 'fsp_sort_7_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12994200202227175,
    p_user_id => 'ANONYMOUS',
    p_preference_name => 'FSP200_P2_R12983730585011109_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13060701217949635,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4005_W48422219241609962',
    p_attribute_value => '48424005315623443____48424005315623443');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13124304569600904,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P123_R155207503157382410_SORT',
    p_attribute_value => 'fsp_sort_3_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13205111464466817,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P11_R13181729824821303_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13324903563168821,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P4_W13322921103168481',
    p_attribute_value => '13324603102168820_Y___13324603102168820');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13369613325190254,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P21_W13367727378186959',
    p_attribute_value => '13369318479190253____13369318479190253');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13495915565156987,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P28_W13494407308156018',
    p_attribute_value => '13495624548156987____13495624548156987');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14463810389100156,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____451353909559603360');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14795004912639687,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P130_W5051906577678195',
    p_attribute_value => '5053430969682717____5053430969682717');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14795204050640056,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P533_W192554218968400540',
    p_attribute_value => '192555416825400554____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14944922168716726,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P8_R13172207646474207_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15050118417540426,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P24_W13412619023500057',
    p_attribute_value => '13414706279500401____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15062827852020709,
    p_user_id => 'GILMAR.VAZ@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP130_P1_R28668123555877671_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064218548046409,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P8_R13172207646474207_SORT',
    p_attribute_value => 'fsp_sort_4');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064600110060012,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P2_R14963022838786071_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15114907331970887,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P26_W28682737726031938',
    p_attribute_value => '28684535695032597____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15436104284438871,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P32_W30477236138988691',
    p_attribute_value => '30478853787989019_Y___30478853787989019');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15528406568102543,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P25_W44751772077469026',
    p_attribute_value => '44753062966469359____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15528503380102546,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP131_P25_R45100759639743331_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15530407189428625,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P15_W43613153993542917',
    p_attribute_value => '43615650431545505____43615650431545505');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15913817568776504,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15905226632365336_SORT',
    p_attribute_value => 'fsp_sort_2');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12915422914503226,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P582_R108017116347018440_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12933113698978168,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____1550029190194632');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13021012622261217,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____ICON');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13162808902272914,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P6_R13161411887260146_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13220413109345715,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P15_W13217610935343126',
    p_attribute_value => '13220107373345714____13220107373345714');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13236607025395951,
    p_user_id => 'LUCIO.CALICCIO@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P18_R13230208761291617_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13342315570703820,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P19_R13337113146703118_SORT',
    p_attribute_value => 'fsp_sort_18');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14801507623018339,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P40_W48117227188266087',
    p_attribute_value => '48118623144274016____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14817929568933240,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P623_R201008603702857054_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15044900673796167,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P24_W28447740265245647',
    p_attribute_value => '28449827521245991____28449827521245991');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15049718458538459,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P8_R13172207646474207_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15049822613539640,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P29_R13557525266864040_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063107889024335,
    p_user_id => 'GILMAR.VAZ@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P24_W28447740265245647',
    p_attribute_value => '28449827521245991____28449827521245991');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15063906275042357,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P11_W13205303522473298',
    p_attribute_value => '13206102591473693____13206102591473693');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064104766043059,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P15_W13217610935343126',
    p_attribute_value => '13220107373345714____13220107373345714');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064427613047714,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P26_W13647616484286348',
    p_attribute_value => '13649414453287007____13649414453287007');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15064824366064390,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P21_W13367727378186959',
    p_attribute_value => '13369318479190253____13369318479190253');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15118718618534818,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_130_P32_W15116814322534490',
    p_attribute_value => '15118431971534818_Y___15118431971534818');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15124625013026437,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P36_W15122702234026231',
    p_attribute_value => '15124230531026232_N___REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15528107843100778,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_131_P24_W43808162081699848',
    p_attribute_value => '43810249337700192____43810249337700192');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15530009561427520,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P26_W44043159542486139',
    p_attribute_value => '44044957511486798____44044957511486798');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15530208267428129,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P11_W43600846580673089',
    p_attribute_value => '43601645649673484____43601645649673484');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15808627380717657,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P36_W15122702234026231',
    p_attribute_value => '15124230531026232____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15808818968720904,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P4_W13322921103168481',
    p_attribute_value => '13324603102168820____13324603102168820');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15808902721721951,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P19_R13337113146703118_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15809108955723720,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R15547922233841237_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15809413807723721,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P25_W14356229019269235',
    p_attribute_value => '14357519908269568____14357519908269568');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15809529363723725,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P25_R14705216581543540_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13228713503915179,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P16_R13225012118914804_SORT',
    p_attribute_value => 'fsp_sort_5');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13237821337425235,
    p_user_id => 'LUCIO.CALICCIO@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P11_W13205303522473298',
    p_attribute_value => '13206102591473693____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13238020043425810,
    p_user_id => 'LUCIO.CALICCIO@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P15_W13217610935343126',
    p_attribute_value => '13220107373345714____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13585130734422823,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P30_R13578528267170384_SORT',
    p_attribute_value => 'fsp_sort_3_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13636103353132421,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P1_R13633002314132081_SORT',
    p_attribute_value => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13649714489287007,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P26_W13647616484286348',
    p_attribute_value => '13649414453287007____13649414453287007');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13667919600678201,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P591_R168263311862841256_SORT',
    p_attribute_value => 'fsp_sort_3');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 14838430045942843,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP200_P9_R14814807464929146_SORT',
    p_attribute_value => 'fsp_sort_8_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 15809919602735850,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P11_W13205303522473298',
    p_attribute_value => '13206102591473693____13206102591473693');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16987423714749701,
    p_user_id => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P13_R13197915621252379_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17068309432147154,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P19_R13337113146703118_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17143124459622792,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P16_R17136111963599967_SORT',
    p_attribute_value => 'fsp_sort_1');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17195512008382170,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P431_W478896025956673213',
    p_attribute_value => '478896612991674411____478896612991674411');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17195817414383829,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17196007695384083,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P959_W483659607062898467',
    p_attribute_value => '483660631524898748____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17272116701553870,
    p_user_id => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP300_P16_R17136111963599967_SORT',
    p_attribute_value => 'fsp_sort_1');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17305411757300906,
    p_user_id => 'LCOSTA',
    p_preference_name => 'FSP_IR_131_P16_W43987968332068855',
    p_attribute_value => '43988748568069527____43988748568069527');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17514919323290712,
    p_user_id => 'DONIZETE',
    p_preference_name => 'FSP_IR_131_P26_W44043159542486139',
    p_attribute_value => '44044957511486798____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17515308922291539,
    p_user_id => 'DONIZETE',
    p_preference_name => 'FSP_IR_131_P32_W30477236138988691',
    p_attribute_value => '30478853787989019____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17861903378660078,
    p_user_id => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_preference_name => 'FSP_IR_300_P19_W17860831276659631',
    p_attribute_value => '17861628148660075____17861628148660075');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 18453020906062782,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P73_R78240013758270704_SORT',
    p_attribute_value => 'fsp_sort_2_desc');
end;
/
----------------
--service mods
--
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802191452','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.83',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802201520','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802201554','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.83',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'GERDSON.SOARES@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802210714','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.83',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802210852','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.98',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802210921','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201802210917','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201802211004','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'LCOSTA',
    p_auth_method => 'Application Express Authentication',
    p_app => 131,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201801261014','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'LCOSTA',
    p_auth_method => 'Application Express Authentication',
    p_app => 131,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802011607','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802080934','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.98',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201802081057','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.98',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'JOSE.COSTA@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201801261008','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.92',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201801291421','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.98',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'SIGRID.MAQUINE@MICROSERVICE.COM.BR',
    p_auth_method => 'MindAuthentication',
    p_app => 300,
    p_owner => 'JOSELUIS',
    p_access_date => to_date('201801291455','YYYYMMDDHH24MI'),
    p_ip_address => '10.1.16.98',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...news
--
begin
null;
end;
/
--
prompt ...links
--
begin
null;
end;
/
--
prompt ...bugs
--
begin
null;
end;
/
--
prompt ...events
--
begin
null;
end;
/
--
prompt ...features
--
begin
null;
end;
/
--
prompt ...tasks
--
begin
null;
end;
/
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...task defaults
--
begin
null;
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'JOSELUIS';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA JOSELUIS - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_040200
-- Exported 10:21 Quarta-Feira Fevereiro 21, 2018 by: ADMIN
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 10:21 Quarta-Feira Fevereiro 21, 2018 by: ADMIN
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'JOSELUIS';
 
end;
/

commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
