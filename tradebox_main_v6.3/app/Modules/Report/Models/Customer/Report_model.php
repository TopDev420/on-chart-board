<?php namespace App\Modules\Report\Models\Customer;

/*
  |----------------------------------------------
  |   Datatable Ajax data Pagination+Search
  |----------------------------------------------     
*/
class Report_model
{

	public function __construct()
  {
    $this->db = db_connect();
    $this->request = \Config\Services::request();
  }

  function get_datatables($table, $where = array(), $columnOrder = array(), $columnSearch = array(), $order = array())
  { 

    $column_order = $columnOrder; //set column field database for datatable orderable
    $column_search = $columnSearch; //set column field database for datatable searchable 
    $order = $order; // default order 
    $builder = $this->db->table($table)->where($where);
    
    $i = 0;
    foreach ($column_search as $item) // loop column 
    {

      if($_POST['search']['value']) // if datatable send POST for search
      {


        if($i===0) // first loop
        {
          $builder->groupStart(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
          $builder->like($item, $_POST['search']['value']);
        }
        else
        {
          $builder->orLike($item, $_POST['search']['value']);
        }

        if(count($column_search) - 1 == $i) //last loop
          $builder->groupEnd(); //close bracket
        }
        $i++;
      }
 
    if(isset($_POST['order'])) // here order processing
    {
      $builder->orderBy($column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } 
    else if(isset($order))
    {
      $order = $order;
      $builder->orderBy(key($order), $order[key($order)]);
    }
    if($this->request->getvar('length') != -1)
    $builder->limit($this->request->getvar('length'), $this->request->getvar('start'));
    $query = $builder->get();
    return $query->getResult();
  }
  function count_filtered($table, $where = array(), $columnOrder = array(), $columnSearch = array(), $order = array())
  {

    $query = $this->db->table($table)->where($where);

    $this->get_datatables($table, $where, $columnOrder, $columnSearch, $order);

    return $query->countAllResults();
  }
}