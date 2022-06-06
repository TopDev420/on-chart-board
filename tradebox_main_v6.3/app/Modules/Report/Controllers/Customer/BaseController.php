<?php

namespace App\Modules\Report\Controllers\Customer;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 *
 * @package CodeIgniter
 */

use CodeIgniter\Controller;
use App\Libraries\Home_layout;
use App\Models\Common_model;
use App\Modules\Report\Models\Customer\Report_model;

class BaseController extends Controller
{

	/**
	 * An array of helpers to be loaded automatically upon
	 * class instantiation. These helpers will be available
	 * to all other controllers that extend BaseController.
	 *
	 * @var array
	 */
	protected $helpers = ['form', 'url', 'lang_helper'];

	/**
	 * Constructor.
	 */
	

	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:

		//Calling Libraries
		$this->session 		 	= \Config\Services::session();
		$this->validation    	=  \Config\Services::validation();
		$this->request 		 	= \Config\Services::request();
		$this->pager            = \Config\Services::pager();
		$this->uri 				= service('uri');
		$this->db 	   		 	= db_connect();
		$this->BASE_VIEW 	 	= "App\Modules\Report\Views\Customer";

		//calling Model
		$this->master 			= new Home_layout();
		$this->common_model 	= new Common_model();
		$this->report_model 	= new Report_model();

		
	}
}