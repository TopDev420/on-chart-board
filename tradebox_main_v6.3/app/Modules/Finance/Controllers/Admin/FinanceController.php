<?php namespace App\Modules\Finance\Controllers\Admin;
class FinanceController extends BaseController
{
    
    public function index()
    {

        $data['total_user']       = $this->common_model->countRow('dbt_user', array('status'=>1));
        $data['total_market']     = $this->common_model->countRow('dbt_coinpair');
        $data['total_trade']      = $this->common_model->countRow('dbt_biding_log');
        $data['withdraw']         = $this->common_model->get_all('dbt_withdraw', array('status'=>2), '','',5,0);
        $data['coins']            = $this->common_model->get_all('dbt_cryptocoin', array('status'=>1), 'rank','asc',10000,0, 'symbol');

        $data['monthly_deposit']  = $this->dashboard_model->monthlyDeposit();
        $data['trade_history']    = $this->dashboard_model->marketTradeHistory();
        $data['monthly_withdraw'] = $this->dashboard_model->monthlyWithdraw();
        $data['monthly_transfer'] = $this->dashboard_model->monthlyTransfer();
        $data['monthly_fees']     = $this->dashboard_model->monthlyFees();
        $data['coin_market']      = $this->dashboard_model->coinTradeMarket();

        
        $data['title']  = 'Dashboard';
       
        $data['content'] = $this->BASE_VIEW . '\dashboard\home';
        return $this->template->admin_layout($data);
    }

    public function deposit_list(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        $data['deposit']  = $this->common_model->get_all('dbt_deposit', array(), 'id','desc',20,($page_number-1)*20);
        $total            = $this->common_model->countRow('dbt_deposit');
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total);

        $data['title']  = 'Deposit List';
        $data['content'] = $this->BASE_VIEW . '\deposit\list';
        return $this->template->admin_layout($data);
    }
    public function pending_deposit(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);

        $condition        = "method_id !='erc20' AND method_id !='bep20' AND status = '0'";
        $data['deposit']  = $this->common_model->get_all('dbt_deposit', $condition, 'id','asc',20,($page_number-1)*20);
        $total            = $this->common_model->countRow('dbt_deposit', $condition);
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total);


        $data['title']  = 'Deposit List';
        $data['content'] = $this->BASE_VIEW . '\deposit\list';
        return $this->template->admin_layout($data);
    }

    public function confirm_deposit()
    {

        $user_id      = $this->request->getGet('user_id');
        $id           = $this->request->getGet('id');
        $csym         = $this->request->getGet('csym');

        $checkConfirmation = $this->common_model->findById('dbt_deposit', array('id' => $id, 'user_id' => $user_id, 'status' => 0, 'currency_symbol' => $csym));
        if(!$checkConfirmation){
            $this->session->setFlashdata('exception', 'This transaction can not change now!');
            return redirect()->route('backend/finance/pending-deposit');
        }


        $deposit_data = array(
            'status' => 1,
            'approved_cancel_by' => "admin",
        );
        $this->common_model->update('dbt_deposit', $deposit_data, array('id' => $id, 'user_id' => $user_id));

        $data = $this->common_model->findById('dbt_deposit', array('id' => $id));
        //User Balance Update
        $check_user_balance = $this->common_model->findById('dbt_balance', array('user_id' => $user_id, 'currency_symbol' => $csym));

        $this->refferalbonus($data->amount,$data->currency_symbol,$data->user_id);

        if ($check_user_balance) {
            $new_balance = $check_user_balance->balance+$data->amount;

            $newBalance = array(
                'balance' => $new_balance,
            );
            $this->common_model->update('dbt_balance', $newBalance, array('user_id' => $user_id, 'currency_symbol' => $csym));
            //Log Data 
            $depositdata = array(
                'user_id'            => $data->user_id,
                'balance_id'         => $check_user_balance->id,
                'currency_symbol'    => $data->currency_symbol,
                'transaction_type'   => 'DEPOSIT',
                'transaction_amount' => $data->amount,
                'transaction_fees'   => $data->fees_amount,
                'ip'                 => $data->ip,
                'date'               => $data->deposit_date
            );
            //Save balance log
            $this->common_model->save('dbt_balance_log', $depositdata);

        } else {

            $new_balance = $data->amount;

            $balance = array(
                'user_id'         => $data->user_id,
                'currency_symbol' => $csym,
                'balance'         => $data->amount,
                'last_update'     => date('Y-m-d h:i:s'),
            );

            //Save new balance
            $balance_id = $this->common_model->save_return_id('dbt_balance', $balance);

            //Log Data 
            $depositdata = array(
                'user_id'            => $data->user_id,
                'balance_id'         => $balance_id,
                'currency_symbol'    => $data->currency_symbol,
                'transaction_type'   => 'DEPOSIT',
                'transaction_amount' => $data->amount,
                'transaction_fees'   => $data->fees_amount,
                'ip'                 => $data->ip,
                'date'               => $data->deposit_date
            );
             $this->common_model->save('dbt_balance_log', $depositdata);
        }

        $userdata   = $this->common_model->findById('dbt_user', array('user_id' => $user_id));
        $set        = $this->common_model->findById('sms_email_send_setup',array('method' => 'email'));
        $appSetting = $this->template->setting_data();     

        #-----------------------------------------------------
        if($set->deposit != NULL){
            #----------------------------
            #      email verify smtp
            #----------------------------

            $getPost = array(

                'amount'     => $data->amount,
                'name'       => $userdata->first_name." ". $userdata->last_name,
                'new_balance'=> $new_balance,
                'date'       => date('d F Y')
            );
            
            $config_var = array( 
                'template_name' => 'deposit_success',
                'template_lang' => $appSetting->language == 'english'?'en':'fr',
            );
            $message    = $this->common_model->email_msg_generate($config_var, $getPost);

            $send_email = array(
                'title'   => $appSetting->title,
                'to'      => $this->session->get('email'),
                'subject' => $message['subject'],
                'message' => $message['message'],
            );

           

            $send_email = $this->common_model->send_email($send_email);

            if($send_email){

                    $n = array(

                        'user_id'           => $userdata->user_id,
                        'subject'           => $message['subject'],
                        'notification_type' => 'deposit',
                        'details'           => $message['message'],
                        'date'              => date('Y-m-d h:i:s'),
                        'status'            => '0'
                    );
                //notification save
                $this->common_model->save('notifications',  $n);   
            }

           
            #------------------------------
            #   SMS Sending
            #------------------------------

            $template = array( 
                'name'       => $userdata->first_name." ". $userdata->last_name,
                'amount'     => $data->amount,
                'new_balance'=> $new_balance,
                'date'       => date('d F Y')
            );

            $config_var = array( 
                'template_name' => 'deposit_success',
                'template_lang' => $appSetting->language == 'english'?'en':'fr',
            );
            $message    = $this->common_model->sms_msg_generate($config_var, $template);
            $send_sms = array(
                'to'       => $userdata->phone,
                'message' => $message['message'],
            );

            if (@$userdata->phone) {
                $send_sms = $this->sms_lib->send($send_sms);

            } else {
                $this->session->setFlashdata('exception', display('there_is_no_phone_number'));
            }

            if($send_sms){
                $message_data = array(
                    'sender_id'    => 1,
                    'receiver_id'  => $userdata->user_id,
                    'subject'      => $message['subject'],
                    'message'      => $message['message'],
                    'datetime'     => date('Y-m-d h:i:s'),
                );

                //message save;
                $this->common_model->save('message', $message_data);  
            }
        }
        $this->session->setFlashdata('message', 'Deposit successfully confirmed!');
        return redirect()->route('backend/finance/pending-deposit');
    }

    private function refferalbonus($amount="",$currency_symbol="",$user_id="")
    {
        $reffereldata = $this->common_model->findById('dbt_user', array('user_id' => $user_id));

        if($reffereldata->referral_id){
            $refferId = $reffereldata->referral_id;
            $rcommission = $this->common_model->findById('earnings', array('user_id' => $refferId, 'Purchaser_id' => $user_id, 'earning_type' => 'REFERRAL'));
            if(empty($rcommission)){
                $commissioninfo = $this->db->table('dbt_affiliation')->select('*')->where('status',1)->get();
                //here now problem may be
                if(!empty($commissioninfo)){
                    $commission = $commissioninfo->getRow();
                    $camount    = 0;
                    if($commission->type=="PERCENT"){
                        $camount = number_format(($amount*$commission->commission)/100,8);
                    }
                    else{
                        $camount = number_format($commission->commission,8);
                    }
                    $commissiondata = array(
                        'user_id'       => $refferId,
                        'Purchaser_id'  => $user_id,
                        'earning_type'  => 'REFERRAL',
                        'amount'        => $camount,
                        'date'          => date('Y-m-d'),
                    );
                    $this->common_model->save('earnings',$commissiondata);

                    $balanceId      = "";
                    $checkbalance   = $this->common_model->findById('dbt_balance', array('user_id' => $refferId, 'currency_symbol' => $currency_symbol));
                    if($checkbalance){

                        $totalbalance= $checkbalance->balance+$camount;
                        $balanceId   = $checkbalance->id;
                        $balancedata = array(
                            'balance'       =>$totalbalance,
                            'last_update'   =>date('Y-m-d H:i:s'),
                        );
                        
                        $this->common_model->update('dbt_balance', $balancedata, array('user_id' => $refferId, 'currency_symbol' => $currency_symbol));

                    } else {

                        $balancedata = array(
                            'user_id'           =>$refferId,
                            'currency_symbol'   =>$currency_symbol,
                            'balance'           =>$camount,
                            'last_update'       =>date('Y-m-d H:i:s')
                        );
                        $balanceId = $this->common_model->save_return_id("dbt_balance",$balancedata);
                    }

                    $depositdata = array(
                        'user_id'            => $refferId,
                        'balance_id'         => $balanceId,
                        'currency_symbol'    => $currency_symbol,
                        'transaction_type'   => 'REFERRAL',
                        'transaction_amount' => $camount,
                        'transaction_fees'   => 0,
                        'ip'                 => $this->request->getipAddress(),
                        'date'               => date('Y-m-d H:i:s')
                    );

                    $this->common_model->save('dbt_balance_log', $depositdata);
                }
            }
        }
    }

    public function cancel_deposit()
    {
        $user_id = $this->request->getGet('user_id');
        $id      = $this->request->getGet('id');
        $csym    = $this->request->getGet('csym');

        $checkConfirmation = $this->common_model->findById('dbt_deposit', array('id' => $id, 'user_id' => $user_id, 'status' => 0, 'currency_symbol' => $csym));
        if(!$checkConfirmation){
            $this->session->setFlashdata('exception', 'This transaction can not change now!');
            return redirect()->route('backend/finance/pending-deposit');
        }
        
        $data = array(
            'status'             => 2,
            'approved_cancel_by' => "admin",
        );

        $this->common_model->update('dbt_deposit', $data, array('id' => $id, 'user_id' => $user_id, 'currency_symbol' => $csym));
        $this->session->setFlashdata('message', 'Deposit Cancel successfully!');
        return redirect()->route('backend/finance/deposit-list');
    }

    public function withdraw_list(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        $data['withdraw'] = $this->common_model->get_all('dbt_withdraw', array(), 'id','desc',20,($page_number-1)*20);
        $total            = $this->common_model->countRow('dbt_withdraw');
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total);


        $data['title']  = 'Withdraw List';

        $data['content'] = $this->BASE_VIEW . '\withdraw\withdraw_list';
        return $this->template->admin_layout($data);
    }

    public function pending_withdraw(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        $condition        = "method !='erc20' AND method !='bep20' AND status = '2'";
        $data['withdraw'] = $this->common_model->get_all('dbt_withdraw', $condition, 'id','desc',20,($page_number-1)*20);
        $total            = $this->common_model->countRow('dbt_withdraw', $condition);
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total);

        $data['title']   = 'Pending Withdraw List';
        $data['content'] = $this->BASE_VIEW . '\withdraw\pending_withdraw_list';
        return $this->template->admin_layout($data);
    }
   

    public function confirm_withdraw()
    {
        $set_status   = 1;
        $user_id      = $this->request->getGet('user_id');
        $id           = $this->request->getGet('id');

        $checkConfirmation = $this->common_model->findById('dbt_withdraw', array('id' => $id, 'user_id' => $user_id, 'status' => 2));
        if(!$checkConfirmation){
            $this->session->setFlashdata('exception', 'This transaction already confirmed!');
            return redirect()->route('backend/finance/pending-withdraw');
        }


        $data = array(

            'success_date'          =>date('Y-m-d h:i:s'),
            'status'                => $set_status,
            'approved_cancel_by'    => "admin",
        );

        $this->common_model->update('dbt_withdraw', $data, array('user_id'=>$user_id, 'id' => $id));

        $t_data             = $this->common_model->findById('dbt_withdraw', array('id' => $id, 'user_id' => $user_id));

        $userinfo           = $this->common_model->findById('dbt_user', array('user_id' => $user_id));
        $set                = $this->common_model->findById('sms_email_send_setup', array('method' => 'email'));
        $appSetting         = $this->template->setting_data();
        $check_user_balance = $this->common_model->findById('dbt_balance', array('user_id' => $user_id, 'currency_symbol' =>$t_data->currency_symbol));

        $new_balance = $check_user_balance->balance-(@$t_data->amount+$t_data->fees_amount);
        $newbalance['balance'] = $check_user_balance->balance-($t_data->amount+$t_data->fees_amount);
        $this->common_model->update('dbt_balance', $newbalance, array('user_id'=>$user_id, 'currency_symbol' => $t_data->currency_symbol));

        //User Financial Log
        if ($check_user_balance) {

            $depositdata = array(
                'user_id'            => $user_id,
                'balance_id'         => $check_user_balance->id,
                'currency_symbol'    => $t_data->currency_symbol,
                'transaction_type'   => 'WITHDRAW',
                'transaction_amount' => $t_data->amount,
                'transaction_fees'   => $t_data->fees_amount,
                'ip'                 => $t_data->ip,
                'date'               => $t_data->request_date
            );

            //balance log save
            $this->common_model->save('dbt_balance_log', $depositdata);
        }

        
        #----------------------------
        #      email verify smtp
        #----------------------------
        $getPost = array(
            'amount'        => $t_data->amount,
            'new_balance'   => $new_balance,
        );
        
        $config_var = array( 
            'template_name' => 'withdraw_success',
            'template_lang' => $appSetting->language == 'english'?'en':'fr',
        );
        $message    = $this->common_model->email_msg_generate($config_var, $getPost);
        $send_email = array(
            'title'         => $appSetting->title,
            'to'            => $this->session->get('email'),
            'subject'       => $message['subject'],
            'message'       => $message['message'],
        );
        $send = $this->common_model->send_email($send_email);
       
        if($send){
                $n = array(
                'user_id'                => $user_id,
                'subject'                => $message['subject'],
                'notification_type'      => 'withdraw',
                'details'                => $message['message'],
                'date'                   => date('Y-m-d h:i:s'),
                'status'                 => '0'
            );
            //notification save
            $this->common_model->save('notifications',$n);    
        }

        #----------------------------
        #      Sms verify
        #----------------------------
   
        $template = array( 
            'name'      => $userinfo->first_name." ".$userinfo->last_name,
            'amount'    => $t_data->amount,
            'new_balance' => $new_balance,
            'date'      => date('d F Y')
        );

        $config_var = array( 
            'template_name' => 'withdraw_success',
            'template_lang' => $appSetting->language == 'english'?'en':'fr',
        );
        $message  = $this->common_model->sms_msg_generate($config_var, $template);
        $send_sms = array(
            'to'        => $userinfo->phone,
            'subject'   => $message['subject'],
            'message'  => $message['message'],
        );

        if (@$userinfo->phone) {
            $send_sms = $this->sms_lib->send($send_sms);

        } else {

            $this->session->setFlashdata('exception', display('there_is_no_phone_number'));
        }

        if(@$send_sms){
            
            $message_data = array(
                'sender_id'   => 1,
                'receiver_id' => $userinfo->user_id,
                'subject'     => 'Withdraw',
                'message'     => $message['message'],
                'datetime'    => date('Y-m-d h:i:s'),
            );

            //message save;
            $this->common_model->save('message', $message_data);
        }

        $this->session->setFlashdata('message', 'Withdraw successfully confirmed!');

        return redirect()->route('backend/finance/withdraw-list');
    }

    public function cancel_withdraw()
    {
        $set_status = 0;
        $user_id    = $this->request->getGet('user_id');
        $id         = $this->request->getGet('id');

        $checkConfirmation = $this->common_model->findById('dbt_withdraw', array('id' => $id, 'user_id' => $user_id, 'status' => 2));
        if(!$checkConfirmation){
            $this->session->setFlashdata('exception', 'This transaction can not cancel!');
            return redirect()->route('backend/finance/pending-withdraw');
        }

        $data = array(
            'cancel_date' =>date('Y-m-d h:i:s'),
            'status'      => $set_status,
        );

        $this->common_model->update('dbt_withdraw', $data, array('id' => $id, 'user_id' => $user_id));
        $this->session->setFlashdata('message', 'Withdraw Cancel successfully!');

        return redirect()->route('backend/finance/pending-withdraw');
    }


    public function credit_list(){


        $page_number          = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        $data['credit_info']  = $this->common_model->get_all('dbt_deposit', array('status' => 1, 'method_id' => 'admin'), 'id','desc',20,($page_number-1)*20);
        $total                = $this->common_model->countRow('dbt_deposit');
        $data['pager']        = $this->pager->makeLinks($page_number, 20, $total);


        $data['title']  = 'Credit List';

        $data['content'] = $this->BASE_VIEW . '\credit\credit_list';
        return $this->template->admin_layout($data);
    }


    public function add_credit()
    {  

        $data['title']     = display('add_credit');
        $data['coin_list'] =$this->common_model->get_all('dbt_cryptocoin', array('status' => 1), 'rank','desc',2000,0,'symbol');

        $this->validation->setRule('user_id', display('user_id'), 'required');
        $this->validation->setRule('amount', display('amount'), 'required');
        $this->validation->setRule('crypto_coin', display('crypto_coin'), 'required');
        $this->validation->setRule('note', display('note'), 'required|trim');

        /*-------------STORE DATA------------*/
        if ($this->request->getMethod() == 'post') {
           
              if ($this->validation->withRequest($this->request)->run()) {

                $checkUser = $this->common_model->findById('dbt_user', array('user_id' => $this->request->getPost('user_id')));
                if(!empty($checkUser)){

                    $deposit_data = array(
                        'user_id'           => $this->request->getPost('user_id'),
                        'currency_symbol'   => $this->request->getPost('crypto_coin'),
                        'amount'            => $this->request->getPost('amount'),
                        'method_id'         => 'admin',
                        'fees_amount'       => 0.0,
                        'comment'           => $this->request->getPost('note'),
                        'deposit_date'      => date('Y-m-d H:i:s'),
                        'approved_date'     => date('Y-m-d H:i:s'),
                        'status'            => 1,
                        'ip'                => $this->request->getIPAddress(),
                        'approved_cancel_by'=> 'admin'
                    );
                    $this->common_model->save('dbt_deposit', $deposit_data);

                    $checkbalance = $this->common_model->findById('dbt_balance', array('currency_symbol' => $this->request->getPost('crypto_coin'), 'user_id' => $this->request->getPost('user_id')));
                    
                    if (!$checkbalance) {

                        $balance = array(
                            'user_id'         => $this->request->getPost('user_id'),
                            'currency_symbol' => $this->request->getPost('crypto_coin'),
                            'balance'         => $this->request->getPost('amount'),
                            'last_update'     => date('Y-m-d H:i:s'),
                        );
                        $insert_id = $this->common_model->save_return_id('dbt_balance', $balance);
                    } else {

                        $new_balance = @$checkbalance->balance + $this->request->getPost('amount');
                        $insert_id   = $checkbalance->id;

                        $newBalanceU['balance'] = $new_balance;
                        $this->common_model->update('dbt_balance', $newBalanceU, array('currency_symbol' => $this->request->getPost('crypto_coin'), 'user_id' => $this->request->getPost('user_id')));
                    }
                    $balance_log = array(

                        'balance_id'           => $insert_id,
                        'user_id'              => $this->request->getPost('user_id'),
                        'currency_symbol'      => $this->request->getPost('crypto_coin'),
                        'transaction_type'     => 'CREDITED',
                        'transaction_amount'   => $this->request->getPost('amount'),
                        'transaction_fees'     => 0,
                        'ip'                   => $this->request->getIPAddress(),
                        'date'                 => date('Y-m-d H:i:s'),
                    );

                    $this->common_model->save('dbt_balance_log', $balance_log);
                    $this->session->setFlashdata('message','Send the amount successfully');
                    return redirect()->route('backend/finance/credit-list');
                } else {

                    $this->session->setFlashdata('exception','Your user invalid, please try again.');
                    return redirect()->route('backend/finance/add-credit');
                }
            } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors());
                return redirect()->route('backend/finance/add-credit');
            }

        } 

        $data['title']  = 'Add Credit';

        $data['content'] = $this->BASE_VIEW . '\credit\add_credit';
        return $this->template->admin_layout($data);
    }

    public function credit_details($id = null)
    {

        $data['title'] = display('credit_info');
        $data['credit_info'] = $this->finance_model->credit_info($id);


        $data['content'] = $this->BASE_VIEW . '\credit\credit_details';
        return $this->template->admin_layout($data);
    }

    public function user_info_load(){

        $user_id = $this->request->getPost('id');
        $userInfo = $this->common_model->findById('dbt_user', array('user_id' => $user_id));
        echo json_encode($userInfo);
    }
}
