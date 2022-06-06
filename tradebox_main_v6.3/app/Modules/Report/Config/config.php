<?php
// module directory name
$HmvcConfig['Report']["_title"] = "Report";
$HmvcConfig['Report']["_description"] = "All Report";
// register your module tables
// only register tables are imported while installing the module
$HmvcConfig['Report']['_database'] = true;
$HmvcConfig['Report']["_tables"] = array(
);
//Table sql Data insert into existing tables to run module
$HmvcConfig['Report']["_extra_query"] = true;