<?php

if (!isset($routes)) {
    $routes = \Config\Services::routes(true);
}

$routes->group('backend', ['filter' => 'admin_filter', 'namespace' => 'App\Modules\Report\Controllers\Admin'], function ($subroutes) {
    /*** Route for admin finance***/
    $subroutes->add('report/trade', 'Report::index');
	$subroutes->add('report/getreport-data', 'Report::ajax_list');

	$subroutes->add('report/deposit-report', 'Report::deposit');
	$subroutes->add('report/getdeposit-data', 'Report::ajax_list_deposit');

	$subroutes->add('report/withdraw-report', 'Report::withdraw');
	$subroutes->add('report/getwithdraw-data', 'Report::ajax_list_withdraw');
});

$routes->group('backend', ['namespace' => 'App\Modules\Report\Controllers\Admin'], function ($subroutes) {

	$subroutes->add('get-company-info', 'Report::get_company_info');
	$subroutes->add('get-customer-info', 'Report::get_customer_info');
});

$routes->group('', ['namespace' => 'App\Modules\Report\Controllers\Customer'], function ($subroutes) {

	$subroutes->add('get-customer-info', 'Report::get_customer_info');
});

$routes->group('', ['filter' => 'customer_filter', 'namespace' => 'App\Modules\Report\Controllers\Customer'], function ($subroutes) {
    /*** Route for admin finance***/
    $subroutes->add('report/trade', 'Report::index');
	$subroutes->add('report/getreport-data', 'Report::ajax_list');

	$subroutes->add('report/deposit-report', 'Report::deposit');
	$subroutes->add('report/getdeposit-data', 'Report::ajax_list_deposit');

	$subroutes->add('report/withdraw-report', 'Report::withdraw');
	$subroutes->add('report/getwithdraw-data', 'Report::ajax_list_withdraw');

	$subroutes->add('report/transfer-report', 'Report::transfer');
	$subroutes->add('report/gettransfer-data', 'Report::ajax_list_transfer');
});