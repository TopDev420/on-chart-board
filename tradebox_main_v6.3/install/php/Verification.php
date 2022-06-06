<?php
namespace Php;
require_once __DIR__.'/Helper.php'; //Include helper
class Verification
{
    private $domain;
    private $full_domain;
    private $expire_date;
    private $update_day;
    private $message;
    private $user_id;
    private $purchase_key;
    private $product_key = '22673650';
    private $licence     = 'standard';
    private $log_path    = null;
    private $check_days  = array(9, 10, 11);
    private $api_domain  = 'secure.bdtask.com';
    private $api_url     = 'https://secure.bdtask.com/alpha/class.purchase.php';
    private $whitelist   = array();

    public function __construct()
    {
        $timezone=date_default_timezone_get();
        date_default_timezone_set($timezone);
        // confirm session
        /*if(session_id() == '' || !isset($_SESSION)) {
            session_start();
        }
*/
        // set log_path
        $this->log_path = '../system/Security/index.html'; 

        //set initial values
        $this->domain = $this->domain();
        $this->full_domain = $this->full_domain();

        //expire date
        $this->expire_date = @date('Y-m-d', @strtotime("+10 year"));
        // check day
        $this->update_day  = @date('d');
    }

    private function domain() 
    {

        $url = (is_https() ? "https://" : "http://").$_SERVER["HTTP_HOST"];
        $url.= str_replace(basename($_SERVER["SCRIPT_NAME"]), "", $_SERVER["SCRIPT_NAME"]);        

        // regex can be replaced with parse_url
        preg_match("/^(https|http|ftp):\/\/(.*?)\//", "$url/" , $matches);

        if ((bool)ip2long($matches[2])) {
            return $matches[2];
        } else {
            $parts = explode(".", $matches[2]);
            $tld  = array_pop($parts);
            $host = array_pop($parts);

            if ( strlen($tld) == 2 && strlen($host) <= 3 ) {
                $tld = "$host.$tld";
                $host = array_pop($parts);
            }

            return "$host.$tld";      
   
        }
    }

    private function full_domain() 
    {
        $url = (is_https() ? "https://" : "http://").$_SERVER["HTTP_HOST"];
        $url.= str_replace(basename($_SERVER["SCRIPT_NAME"]), "", $_SERVER["SCRIPT_NAME"]);
        
        $details = parse_url($url);
        $sub_folders = explode('/',$details['path']);
        
        $full_url = "";
        
        // if install in subfolder then take full_domian with that sub-folder
        if(sizeof($sub_folders) >= 2){
            if($sub_folders[1] == "install"){
                $full_url = (is_https() ? "https://" : "http://").$_SERVER["HTTP_HOST"].'/';
            }else{
                $full_url = (is_https() ? "https://" : "http://").$_SERVER["HTTP_HOST"].$details['path'];
                $full_url = str_replace("install/","",$full_url);
            }
        }else{
            $full_url = (is_https() ? "https://" : "http://").$_SERVER["HTTP_HOST"].'/';
        }

        return $full_url;
    }

    private function response() {

        if ($this->purchase_key == null) {
            return false;
        }
        $url = "$this->api_url?product_key=$this->product_key&purchase_key=$this->purchase_key&domain=$this->domain&full_domain=$this->full_domain&user_id=$this->user_id"; 
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_USERAGENT, @$_SERVER['USER_AGENT']); 
        $result = curl_exec($ch);
 
        return json_decode($result , true );
    }

    private function response_success() {

        if (empty($_SESSION['purchase_key'])) {
            return false;
        } 
        
        $url = "$this->api_url?product_key=".$_SESSION['product_key']."&purchase_key=".$_SESSION['purchase_key']."&domain=".$_SESSION['domain']."&full_domain=".$_SESSION['full_domain']."&user_id=".$_SESSION['user_id']."&launch=1";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_USERAGENT, @$_SERVER['USER_AGENT']); 
        $result = curl_exec($ch);
 
        return json_decode($result , true );
    }

    //filter all input data
    public function filterPurchaseKey($purchase_key)
    { 
		return TRUE;
    }
    // Verify Product Purchase 
    public function verify_purchase($data)
    { 
        $this->user_id = filterInput($data['userid']);
        $this->purchase_key = filterInput($data['purchase_key']);

        $_SESSION['product_key'] = $this->product_key;
        $_SESSION['purchase_key'] = $this->purchase_key;
        $_SESSION['domain'] = $this->domain;
        $_SESSION['full_domain'] = $this->full_domain;
        $_SESSION['user_id'] = $this->user_id;
        $_SESSION['whitelist'] = $this->whitelist;
        $return = 'yes';
        return $return;
    }


    private function writeFile()
    {

        $data = (object)array(
            'product_key'  => $this->product_key,
            'purchase_key' => $_SESSION['purchase_key'],
            'licence'      => $this->licence,
            'expire_date'  => $this->expire_date,
            'update_day'   => $this->update_day,
        );

        @file_put_contents($this->log_path, json_encode($data));

    }


    private function serverAliveOrNot()
    {
        $_SESSION['serverAliveOrNot'] = true;
        return true;
    }

    public function get_product_key(){
        return $this->product_key;
    }

    public function launch_application($data = [])
    {
		return true;
    }
}


