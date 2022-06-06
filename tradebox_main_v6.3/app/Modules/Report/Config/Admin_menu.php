<?php
$ADMINMENU['report'] = array(
    'order'         => 9,
    'parent'        => 'Report',
    'status'        => 1,
    'link'          => 'trade',
    'icon'          => '<i class="fa fa-info-circle"></i>',
    'submenu'       => array(
                '0' => array(
                    'name'          => display('trade'),
                    'icon'          => null,
                    'link'          => 'report/trade',
                    'segment'       => 3,
                    'segment_text'  => 'trade',
                ),
                '1' => array(
                    'name'          => display('deposit'),
                    'icon'          => null,
                    'link'          => 'report/deposit-report',
                    'segment'       => 3,
                    'segment_text'  => 'deposit-report',
                ),
                '2' => array(
                    'name'          => display('withdraw'),
                    'icon'          => null,
                    'link'          => 'report/withdraw-report',
                    'segment'       => 3,
                    'segment_text'  => 'withdraw-report',
                )
    ),
    'segment'       => 2,
    'segment_text'  => 'report'
);