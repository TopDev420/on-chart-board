<?php namespace App\Modules\Report\Controllers\Admin;

class Report extends BaseController
{
    public function index(){

        $data['title']  = 'Trade Report';
       
        $data['content'] = $this->BASE_VIEW . '\report\list';
        return $this->template->admin_layout($data);
    }

    private function get_column_names($con, $table) {

        $sql = 'DESCRIBE '.$table;
        $result = $this->db->query($sql, [])->getResult();

        $rows = array();

        foreach ($result as  $v) {

            if($v->Field == $con){
              $rows[] = $v->Field;
            }

        }

        if($rows){
            return 1;
        } else {
            return 0;
        }
     
    }

    public function ajax_list()
    {

        $fromDate   = $this->request->getPost('from_date');
        $toDate     = $this->request->getPost('to_date');
        $tradeType  = $this->request->getPost('trade_type');
        $bidType    = $this->request->getPost('bid_type');

        $column_order   = array(null, 'bid_type', 'bid_price', 'bid_qty', 'bid_qty_available', 'total_amount', 'amount_available', 'market_symbol', 'open_order'); //set column field database for datatable orderable
        $column_search  = array('bid_type', 'bid_price', 'bid_qty', 'bid_qty_available', 'total_amount', 'amount_available', 'market_symbol', 'open_order'); //set column field database for datatable searchable 
        $order          = array('id' => 'desc'); // default order 

        $checkColumn = $this->get_column_names('trade_type', 'dbt_biding');
        if($checkColumn == 1){
        
            if($tradeType != "" && $bidType != ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'status' => $tradeType, 'bid_type' => $bidType, 'trade_type !=' => 'bottrade');

            } else if($tradeType != "" && $bidType == ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'status' => $tradeType, 'trade_type !=' => 'bottrade');

            } else if($bidType != "" && $tradeType == ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'bid_type' => $bidType, 'trade_type !=' => 'bottrade');

            } else {

                $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'trade_type !=' => 'bottrade');
            }

        } else {

            if($tradeType != "" && $bidType != ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'status' => $tradeType, 'bid_type' => $bidType);

            } else if($tradeType != "" && $bidType == ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'status' => $tradeType);

            } else if($bidType != "" && $tradeType == ""){

              $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate, 'bid_type' => $bidType);

            } else {

                $where = array('DATE(open_order) >=' => $fromDate, 'DATE(open_order) <=' => $toDate);
            }

        }

        $post_data = $this->request->getVar();
        $list      = $this->report_model->get_datatables('dbt_biding', $where, $column_order, $column_search, $order);

        $data = array();
        $no   = $this->request->getVar('start');

        foreach($list as $bidinglist ){ 
            
            if($bidinglist->status == 1){

                $statusValue = "<i title=".display('success')." class='fas fa-check mr-2 fs-20 text-success'></i> ".display('success');

            } else if($bidinglist->status == 2){

               $statusValue = "<p class='bg-primary text-white text-center pb-1 pl-1 pr-1 mb-1 mt-1'>".display('running')."</p>";

            } else {

                $statusValue = "<i title=".display('cancel')." class='far fa-times-circle mr-2 fs-20 text-danger'></i> ".display('cancel');
            }


            $no++;
            $data[] = array( 

                'sl'                => $no,
                'bid_type'          => $bidinglist->bid_type,
                'bid_price'         => $bidinglist->bid_price,
                'bid_qty'           => $bidinglist->bid_qty,
                'bid_qty_available' => $bidinglist->bid_qty_available,
                'total_amount'      => $bidinglist->total_amount,
                'amount_available'  => $bidinglist->amount_available,
                'market_symbol'     => $bidinglist->market_symbol,
                'open_order'        => $bidinglist->open_order,
                'status'            => $statusValue,
            ); 
        }

         ## Response
        $response =  array(

            "draw"            => $this->request->getVar('draw'),
            "recordsTotal"    => $this->common_model->countRow('dbt_biding', $where),
            "recordsFiltered" => $this->report_model->count_filtered('dbt_biding', $where, $column_order, $column_search, $order),
            "data"            => $data,
        );

        echo json_encode($response);
    }

    public function deposit(){

        $data['title']  = 'Deposit Report';

        $data['coin_pairs']   = $this->common_model->findAll('dbt_cryptocoin', array('status' => 1),  'id','desc');
       
        $data['content'] = $this->BASE_VIEW . '\report\deposit';
        return $this->template->admin_layout($data);
    }

    public function ajax_list_deposit()
    {

        $column_order   = array(null, 'user_id', 'amount', 'currency_symbol', 'method_id', 'fees_amount', 'deposit_date'); //set column field database for datatable orderable
        $column_search  = array('user_id', 'amount', 'currency_symbol', 'method_id', 'fees_amount', 'deposit_date'); //set column field database for datatable searchable 
        $order          = array('id' => 'desc'); // default order 

        $fromDate   = $this->request->getPost('from_date');
        $toDate     = $this->request->getPost('to_date');
        $coinSymbol = $this->request->getPost('coin_symbol');
        $statusVal  = $this->request->getPost('statusVal');

        if($coinSymbol != "" && $statusVal != ""){

          $where = array('DATE(deposit_date) >=' => $fromDate, 'DATE(deposit_date) <=' => $toDate, 'currency_symbol' => $coinSymbol, 'status' => $statusVal);

        } else if($coinSymbol != "" && $statusVal == ""){

            $where = array('DATE(deposit_date) >=' => $fromDate, 'DATE(deposit_date) <=' => $toDate, 'currency_symbol' => $coinSymbol);

        } else if($statusVal != "" && $coinSymbol == ""){

            $where = array('DATE(deposit_date) >=' => $fromDate, 'DATE(deposit_date) <=' => $toDate, 'status' => $statusVal);

        } else {

            $where = array('DATE(deposit_date) >=' => $fromDate, 'DATE(deposit_date) <=' => $toDate);
        }

        $post_data = $this->request->getVar();
        $list      = $this->report_model->get_datatables('dbt_deposit', $where, $column_order, $column_search, $order);

        $data = array();
        $no   = $this->request->getVar('start');

        $totalDepositAmount = 0;

        foreach($list as $depositList){ 

            if($depositList->status == 1){

                $statusValue = "<i title=".display('success')." class='fas fa-check mr-2 fs-20 text-success'></i> ".display('success');

            } else if($depositList->status == 2){

                $statusValue = "<i title=".display('cancel')." class='far fa-times-circle mr-2 fs-20 text-danger'></i> ".display('cancel');

            } else {
                
                $statusValue = "<i title=".display('pending')." class='fas fa-spinner fa-pulse text-danger'></i> ".display('pending');
            }

            $grossTotal = $totalDepositAmount + $depositList->amount;


            $no++;
            $data[] = array( 

                'sl'                => $no,
                'deposit_date'      => $depositList->deposit_date,
                'user_id'           => $depositList->user_id,
                'method_id'         => $depositList->method_id,
                'currency_symbol'   => $depositList->currency_symbol,
                'amount'            => $depositList->amount,
                'fees_amount'       => $depositList->fees_amount,
                'status'            => $statusValue,
            ); 
        }

         ## Response
        $response =  array(

            "draw"            => $this->request->getVar('draw'),
            "recordsTotal"    => $this->common_model->countRow('dbt_deposit', $where),
            "recordsFiltered" => $this->report_model->count_filtered('dbt_deposit', $where, $column_order, $column_search, $order),
            "data"            => $data,
        );

        echo json_encode($response);
    }

    public function withdraw(){

        $data['title']  = 'Withdraw Report';

        $data['coin_pairs']   = $this->common_model->findAll('dbt_cryptocoin', array('status' => 1),  'id','desc');
       
        $data['content'] = $this->BASE_VIEW . '\report\withdraw';
        return $this->template->admin_layout($data);
    }

    public function ajax_list_withdraw()
    {

        $column_order   = array(null, 'user_id', 'wallet_id', 'currency_symbol', 'amount', 'method', 'fees_amount', 'comment', 'request_date', 'status'); //set column field database for datatable orderable
        $column_search  = array('user_id', 'wallet_id', 'currency_symbol', 'amount', 'method', 'fees_amount', 'comment', 'request_date', 'status'); //set column field database for datatable searchable 
        $order          = array('id' => 'desc'); // default order 

        $fromDate   = $this->request->getPost('from_date');
        $toDate     = $this->request->getPost('to_date');
        $coinSymbol = $this->request->getPost('coin_symbol');
        $statusVal  = $this->request->getPost('statusVal');

        if($coinSymbol != "" && $statusVal != ""){

          $where = array('DATE(request_date) >=' => $fromDate, 'DATE(request_date) <=' => $toDate, 'currency_symbol' => $coinSymbol, 'status' => $statusVal);

        } else if($coinSymbol != "" && $statusVal == ""){

            $where = array('DATE(request_date) >=' => $fromDate, 'DATE(request_date) <=' => $toDate, 'currency_symbol' => $coinSymbol);

        } else if($statusVal != "" && $coinSymbol == ""){

            $where = array('DATE(request_date) >=' => $fromDate, 'DATE(request_date) <=' => $toDate, 'status' => $statusVal);

        } else {

            $where = array('DATE(request_date) >=' => $fromDate, 'DATE(request_date) <=' => $toDate);
        }

        $post_data = $this->request->getVar();
        $list      = $this->report_model->get_datatables('dbt_withdraw', $where, $column_order, $column_search, $order);

        $data = array();
        $no   = $this->request->getVar('start');


        foreach($list as $withdrawList){ 

            if($withdrawList->status == 1){

                $statusValue = "<i title=".display('success')." class='fas fa-check mr-2 fs-20 text-success'></i> ".display('success');

            } else if($withdrawList->status == 2){

                $statusValue = "<i title=".display('pending')." class='fas fa-spinner fa-pulse text-danger'></i> ".display('pending');

            } else {

                $statusValue = "<i title=".display('cancel')." class='far fa-times-circle mr-2 fs-20 text-danger'></i> ".display('cancel');
            }

            $html = "";

            if (is_string($withdrawList->wallet_id) && is_array(json_decode($withdrawList->wallet_id, true)) && ((json_last_error() == JSON_ERROR_NONE) ? true : false) && $withdrawList->method=='phone') {

               $mobiledata = json_decode($withdrawList->wallet_id, true);

               $html .= '<b>OM Name:</b> '.$mobiledata['om_name'].'<br>';
               $html .= '<b>OM Phone No:</b> '.$mobiledata['om_mobile'].'<br>';
               $html .= '<b>Transaction No:</b> '.$mobiledata['transaction_no'].'<br>';
               $html .= '<b>ID Card No:</b> '.$mobiledata['idcard_no'];

            }elseif (is_string($withdrawList->wallet_id) && is_array(json_decode($withdrawList->wallet_id, true)) && ((json_last_error() == JSON_ERROR_NONE) ? true : false) && $withdrawList->method=='bank') {

                $decode_bank = json_decode($withdrawList->wallet_id, true);

                $typeex = pathinfo(@$decode_bank['document']);

                if(!empty($typeex['basename'])){

                    $extension = $typeex['extension'];
                }


                $html .="<b>Account Name: </b>".@$decode_bank['acc_name']."<br>";
                $html .="<b>Account No: </b>".@$decode_bank['acc_no']."<br>";
                $html .="<b>Branch Name: </b>".@$decode_bank['branch_name']."<br>";
                $html .="<b>SWIFT Code: </b>".@$decode_bank['swift_code']."<br>";
                $html .="<b>ABN No: </b>".@$decode_bank['abn_no']."<br>";
                $html .="<b>Country: </b>".@$decode_bank['country']."<br>";
                $html .="<b>Bank Name: </b>".@$decode_bank['bank_name']."<br>";                                        
                if (isset($decode_bank['document'])) {
                    $html .="<b>Document: </b>";

                    if(@$extension != "pdf"){
                        $html .="<img  width='150px' height='150px' src='".IMAGEPATH.$decode_bank['document']."' class='img-responsive' /><a href='".IMAGEPATH.$decode_bank['document']."' class='btn btn-success' download='".@$decode_bank['acc_name']."'>Download File</a>";  
                    } else {                              
                        $html .="<embed src='".IMAGEPATH.$decode_bank['document']."' width='600'/><a href='".IMAGEPATH.$decode_bank['document']."' class='btn btn-success' download='".@$decode_bank['acc_name']."'>Download File</a>";
                    }                                
                }

            } else {
              $html = esc($withdrawList->wallet_id);

            }


            $no++;
            $data[] = array( 

                'sl'                => $no,
                'user_id'           => $withdrawList->user_id,
                'wallet_id'         => $html,
                'amount'            => $withdrawList->amount,
                'currency_symbol'   => $withdrawList->currency_symbol,
                'method'            => $withdrawList->method,
                'fees_amount'       => $withdrawList->fees_amount,
                'comment'           => $withdrawList->comment,
                'success_date'      => $withdrawList->request_date,
                'status'            => $statusValue,
            ); 
        }

         ## Response
        $response =  array(

            "draw"            => $this->request->getVar('draw'),
            "recordsTotal"    => $this->common_model->countRow('dbt_withdraw', $where),
            "recordsFiltered" => $this->report_model->count_filtered('dbt_withdraw', $where, $column_order, $column_search, $order),
            "data"            => $data,
        );

        echo json_encode($response);
    }

    public function get_company_info(){

        $cmInfo = $this->common_model->findById('setting', array());

        echo json_encode($cmInfo);
    }
}
