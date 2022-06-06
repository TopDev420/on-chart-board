<?php namespace App\Modules\Paystack\Controllers\Admin;


class Payment_gateway extends BaseController
{

	
	public function form()
	{ 
		$pagewhere=array('identity'=>'paystack');
		$data['payment_gateway']= $this->common_model->read('payment_gateway', $pagewhere);
		
		$data['title']  = display('edit_payment_gateway');

        $this->validation->setRule('public_key', display('public_key'),'required|max_length[1000]');
        $this->validation->setRule('private_key', display('public_key'),'required|max_length[1000]');
        $this->validation->setRule('secret_key', display('secret_key'),'required|max_length[1000]');
        
		if ($this->request->getMethod() == 'post') {
			if ($this->validation->withRequest($this->request)->run()) 
			{	
				$id = $data['payment_gateway']->id;
	            $where = array(
	                'id' => $id
	            );
	            $data['payment_gateway']   = (object)$userdata = array(
					'id'      		=> $this->request->getVar('id',FILTER_SANITIZE_STRING),
					'agent'   		=> $this->request->getVar('agent',FILTER_SANITIZE_STRING),
					'public_key'    => $this->request->getVar('public_key',FILTER_SANITIZE_STRING),
					'private_key'   => $this->request->getVar('private_key',FILTER_SANITIZE_STRING),
					'secret_key'   	=> $this->request->getVar('secret_key',FILTER_SANITIZE_STRING),
					'shop_id'   	=> $this->request->getVar('shop_id',FILTER_SANITIZE_STRING),
					'status' 		=> $this->request->getVar('status',FILTER_SANITIZE_STRING)
				);
				if ($this->common_model->update('payment_gateway',$userdata,$where)) {
					$this->session->setFlashdata('message', display('update_successfully'));
				} else {
					$this->session->setFlashdata('exception', display('please_try_again'));
				}
	            return redirect()->to(base_url('backend/payment_gateway/paystack_setting'));

			} else {

				$this->session->setFlashdata("exception", $this->validation->listErrors());
			    return redirect()->route('backend/payment_gateway/paystack_setting');
			}
		}
		
		$data['content'] = $this->BASE_VIEW . '\Payment_gateway\form';
        return $this->template->admin_layout($data);
	}
}