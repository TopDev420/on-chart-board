<?php

if(!array_key_exists('payment_gateway',$ADMINMENU)){
    $ADMINMENU['payment_gateway'] = array(
        'order'         => 7,
        'parent'        => display('payment_gateway'),
        'status'        => 1,
        'icon'          => '<i class="fas fa-cogs"></i>',
        'submenu'       => array(
                    '0' => array(
                        'name'          => display('paystack'),
                        'icon'          => null,
                        'link'          => 'payment_gateway/paystack_setting',
                        'segment'       => 3,
                        'segment_text'  => 'paystack_setting'
                    )
                    
        ),
        'segment'       => 2,
        'segment_text'  => 'payment_gateway'
    );
} else {
    $arraydata =  array(
                'name'          => display('paystack'),
                'icon'          => null,
                'link'          => 'payment_gateway/paystack_setting',
                'segment'       => 3,
                'segment_text'  => 'paystack_setting'
        );
    array_push($ADMINMENU['payment_gateway']['submenu'], $arraydata);
}