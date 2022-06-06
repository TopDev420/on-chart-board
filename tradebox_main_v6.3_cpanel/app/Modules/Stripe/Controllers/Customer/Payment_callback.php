<?php 
namespace App\Modules\Stripe\Controllers\Customer;


class Payment_callback extends BaseController
{

	public function stripe_confirm($session_id = null){
		
		
		$deposit = $this->session->get('deposit');
		$gateway = $this->common_model->findById('payment_gateway', array('identity' => 'stripe', 'status' => 1));

		if ($gateway) {

			if (empty($session_id)) {
		        $this->session->setFlashdata('exception', display("Invalid_payment"));
		        return redirect()->to(base_url("customer/deposit/add_deposit"));
		  	}


	      	require_once APPPATH . 'Modules/Stripe/Libraries/stripe/vendor/autoload.php';

	      	$stripe = array(
		        "secret_key"      => @$gateway->private_key,
		        "publishable_key" => @$gateway->public_key
	      	);

	      	\Stripe\Stripe::setApiKey($stripe['secret_key']);

	      	$retrivedata = \Stripe\Checkout\Session::retrieve($session_id);
	      
		    if (!$retrivedata) {
		        $this->session->setFlashdata('exception', display("Server_problem"));
		        return redirect()->to(base_url("customer/deposit/add_deposit"));
		    }

	      	if ($retrivedata->payment_status == "paid") {
		      	$checkstripdata = $this->db->table('dbt_deposit')->where('stripe_session_id', $session_id)->where('status',1)->countAllResults();

		      	if ($checkstripdata>0) {
			        $this->session->setFlashdata('exception', display("Wrong_payment"));
			        return redirect()->to(base_url("customer/deposit/add_deposit"));
		      	}

			

				$payment_type = $this->session->get('payment_type');

		    	// Paypal Tranction log

				if ($payment_type == 'deposit') {	    		
		                                
		            $this->deposit_confirm($session_id);
		            return redirect()->to(base_url('balances'));
		                                    
				}elseif ($payment_type == 'buy') {
		                    
					if ($this->payment_model->create((array)$this->session->get('buy_save'))) {
						$this->session->remove('buy');
						$this->session->remove('buy_save');
						$this->session->remove('deposit');
						$this->session->remove('payment_type');
						$this->session->setFlashdata('message', display('payment_successfully'));
						return redirect()->to(base_url('customer/buy/buy_list'));
					}else{
						$this->session->remove('buy');
						$this->session->remove('deposit');
						$this->session->remove('payment_type');
						$this->session->setFlashdata('exception', display('please_try_again'));
						return redirect()->to(base_url('customer/buy/buy_form'));
		                                                //redirect("customer/buy");
					}

				}elseif ($payment_type == 'sell') {
						# code...

				}else {
						# code...

				}

			}

		}

	}

	private function deposit_confirm($session_id = null){

			$payment_type = $this->session->get('payment_type');
			$deposit      = $this->session->get('deposit');


	        //Update session
			$deposit->status = 1;
			$deposit->stripe_session_id = $session_id;

			$this->session->remove('deposit');

			$sql = "SELECT * FROM `dbt_deposit` WHERE user_id='".$deposit->user_id."' AND currency_symbol='".$deposit->currency_symbol."' AND amount	='".$deposit->deposit_amount."' AND fees_amount='".$deposit->fees."' AND deposit_date='".$deposit->deposit_date."'";
        	$same_payment = $this->db->query($sql, [])->getRow();
	    	//Find same payment
			
	    	//Store Data On Deposit
			if (!$same_payment) {
				
				$userinfo = $this->common_model->findById('dbt_user', array('user_id' => $this->session->get('user_id')));

				$datadeposit = array(
						'user_id'        	=> $deposit->user_id,
						'currency_symbol'	=> $deposit->currency_symbol,
						'method_id'   		=> $deposit->deposit_method,
						'amount' 			=> $deposit->deposit_amount,
						'fees_amount'   	=> $deposit->fees,
						'status'            => $deposit->status,
						'deposit_date'      => $deposit->deposit_date,
						'stripe_session_id' => $session_id,
						'ip'               	=> $deposit->deposit_ip
					);
				$this->common_model->save('dbt_deposit', $datadeposit);

	    		//User Balance Add
				$deposit_balance = $this->payment_model->balanceAdd($deposit);

	    		//User Financial Log
				if ($deposit_balance) {
					
					$depositdata = array(
						'user_id'            => $deposit->user_id,
						'balance_id'         => $deposit_balance,
						'currency_symbol'    => $deposit->currency_symbol,
						'transaction_type'   => 'DEPOSIT',
						'transaction_amount' => $deposit->deposit_amount,
						'transaction_fees'   => $deposit->fees,
						'ip'                 => $deposit->deposit_ip,
						'date'               => $deposit->deposit_date
					);

					$this->common_model->save('dbt_balance_log', $depositdata);
				}

				// Affilition Bonus
				$this->refferalbonus($deposit->deposit_amount,$deposit->currency_symbol,$userinfo->user_id);
				$set 		= $this->common_model->findById('sms_email_send_setup', array('method' => 'email'));
				$setsms 	= $this->common_model->findById('sms_email_send_setup', array('method' => 'sms'));
				$appSetting = $this->common_model->findById('setting', array());
				$user_lang  = $this->db->table('dbt_user')->select('language')->where('user_id', $this->session->get('user_id'))->get()->getRow();

				if($set->deposit != NULL){
				    #----------------------------
				    #      email verify smtp
				    #----------------------------
					$getPost = array(
						'amount' => $deposit->currency_symbol." ".$deposit->deposit_amount,
					);
					
					$config_var = array( 
                        'template_name' => 'deposit_success',
                        'template_lang' => $user_lang->language == 'english'?'en':'fr',
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
							'user_id'           => $this->session->get('user_id'),
							'subject'           => $message['subject'],
							'notification_type' => 'deposit',
							'details'           => $message['message'],
							'date'              => date('Y-m-d h:i:s'),
							'status'            => '0'
						);
						$this->common_model->save('notifications',$n);    
					}
				}

				if($setsms->deposit != NULL){

					$template = array( 

						'name'   => $this->session->get('fullname'),
						'amount' => $deposit->currency_symbol." ".$deposit->deposit_amount,
						'date'   => date('d F Y')
					);

					$config_var = array( 
                        'template_name' => 'deposit_success',
                        'template_lang' => $user_lang->language == 'english'?'en':'fr',
                    );
                    $message    = $this->common_model->sms_msg_generate($config_var, $template);
                    $send_sms = array(

                        'to'       => $userinfo->phone,
                        'message'  => $message['message'],
                        
                    );
				    #------------------------------
				    #   SMS Sending
				    #------------------------------
					if (@$userinfo->phone) {
						$send_sms = $this->sms_lib->send($send_sms);

					} else {
						$this->session->setFlashdata('exception', display('there_is_no_phone_number'));
					}

					if(@$send_sms){
						$message_data = array(
							'sender_id'   => 1,
							'receiver_id' => $this->session->get('user_id'),
							'subject' 	  => 'Deposit',
							'message' 	  => $message['message'],
							'datetime' 	  => date('Y-m-d h:i:s'),
						);
						$this->common_model->save('message',$message_data);    
					}
				}
				unset($_SESSION['payment_type']);
				$this->session->setFlashdata('message', display('payment_successfully'));
				
				return 1; 

			} else {

				unset($_SESSION['payment_type']);
				$this->session->setFlashdata('exception', display('please_try_again'));
			
				return 2; 
			}
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

					$balanceId 		= "";
					$checkbalance 	= $this->common_model->findById('dbt_balance', array('user_id' => $refferId, 'currency_symbol' => $currency_symbol));
					if($checkbalance){

						$totalbalance= $checkbalance->balance+$camount;
						$balanceId 	 = $checkbalance->id;
						$balancedata = array(
							'balance'       =>$totalbalance,
							'last_update'   =>date('Y-m-d H:i:s'),
						);
						
						$this->common_model->update('dbt_balance', $balancedata, array('user_id' => $refferId, 'currency_symbol' => $currency_symbol));

					} else {

						$balancedata = array(
							'user_id'    		=>$refferId,
							'currency_symbol' 	=>$currency_symbol,
							'balance'    		=>$camount,
							'last_update'		=>date('Y-m-d H:i:s')
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

	


	public function stripe_cancel(){

		$this->session->setFlashdata('exception', "Payment Canceled/Failed");
		return redirect()->to(base_url("deposit"));
	}
}