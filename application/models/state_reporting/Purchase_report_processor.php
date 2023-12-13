<?php
require_once ("State_report.php");
class Purchase_report_processor extends State_report
{
	function __construct()
	{
        parent::__construct();
		$this->lang->load('state_reporting_lang');
		$this->load->model('Category');	
    }

    public function getInputData()
	{		
		$input_params = array();		
		if ($this->settings['display'] == 'tabular')
		{
			$input_data = State_report::get_common_report_input_data(TRUE);
			
			$input_params = array(
				array('view' => 'date_range', 'with_time' => TRUE),
				array('view' => 'excel_export'),
				array('view' => 'submit'),
			);
		}
		$input_data['input_report_title'] = lang('reports_report_options');
		$input_data['input_params'] = $input_params;
		return $input_data;
    }
    
    public function getOutputData()
	{
		$this->load->model('Receiving');
		$this->load->helper('State_reporting');
		$subtitle = date(get_date_format(), strtotime($this->params['start_date'])) .' - '.date(get_date_format(), strtotime($this->params['end_date']));

        $tabular_data = array();
		$report_data = $this->getData();
		$summary_data = []; //$this->getSummaryData();
		$start_date = $this->params['start_date'];
		$end_date = $this->params['end_date'];

        if ($this->settings['display'] == 'tabular')
		{
            $export_excel = $this->params['export_excel'];  
            $tabular_data = array();
            foreach($report_data as $row)
			{				
                $formattedDate =  date("m/d/Y", strtotime($row['receiving_time']));
				$tab_row = array(
                    array('data'=>$row['supplier_name'], 'align'=>'left'),
                    array('data'=> $formattedDate, 'align'=>'left'),
                    array('data'=>$row['receiving_id'], 'align'=>'left'),
				);
				
				$this->db->select('name,id');
				foreach($this->db->from('categories')->get()->result_array() as $category)
				{				

					$weight_value = '0.00000'; 

					if(((int)$category['id']) === ((int)$row['category_id'])){
						$weight_value =  gramsToPoundsCalculation($row['item_quantity']);
						
					}
					array_push($tab_row, array('data'=>$weight_value.' lbs','align'=>'center'));
				}				
				// if ($this->has_profit_permission)
				// {
				// 	$tab_row[] = array('data'=>to_currency($row['profit']).($do_compare && $row_compare ? ' / <span class="compare '.($row_compare['profit'] >= $row['profit'] ? ($row['profit'] == $row_compare['profit'] ?  '' : 'compare_better') : 'compare_worse').'">'.to_currency($row_compare['profit']) .'</span>':''), 'align'=>'left');
				// }
                $tabular_data[] = $tab_row;
				
			}
			$data = array(
				"view" => 'tabular',
				"title" => lang('state_reporting_purchase_report_processor'),
				"subtitle" => $subtitle,
				"data" => $tabular_data,
				"summary_data" => $summary_data,
				"export_excel" => $export_excel,
				"headers" => $this->getDataColumns(), 
				"footers" => $this->getTablefooter()                   
			);
        }
        return $data;
    }

    public function getDataColumns()
	{
		$return = array(
			array('data'=>lang('supplier'), 'align'=>'left', 'col_type' => ''),
			array('data'=>lang('receiving_time'), 'align'=>'left', 'col_type' => ''), 
			array('data'=>lang('receiving_order'), 'align'=>'left', 'col_type' => '')
		);
		$this->db->select('name');
		foreach($this->db->from('categories')->get()->result_array() as $category)
		{
			array_push($return,array('data'=> $category['name'], 'align'=>'left', 'col_type' => 'weight'));
			// array_push($return,array('data'=> $category['name'], 'align'=>'left', 'col_type' => 'count'));
		}
		return $return;
	}

	public function getTablefooter()
	{		
		$return = array();
		$this->db->select('name');
		foreach($this->db->from('categories')->get()->result_array() as $category)
		{
			array_push($return,array('data'=> $category['name'], 'align'=>'center','col_type' => 'weight'));
			// array_push($return,array('data'=> $category['name'], 'align'=>'center','col_type' => 'count'));
		}
		return $return;
    }
    
    public function getData()
	{				
		$this->db->select('suppliers.company_name as supplier_name, receivings.receiving_time,receivings.receiving_id,receivings_items.quantity_received as item_quantity,categories.id as category_id');
		$this->db->from('receivings_items');
        $this->db->join('receivings', 'receivings.receiving_id = receivings_items.receiving_id', 'inner');
        $this->db->join('items', 'items.item_id = receivings_items.item_id', 'inner');
        $this->db->join('categories', 'categories.id = items.category_id', 'inner');
		$this->db->where('receivings.is_po',0);	
        $this->db->join('suppliers', 'receivings.supplier_id = suppliers.person_id', 'inner');
		$this->db->where('suppliers.supplier_type','processor');	
		$this->db->where('DATE(`receiving_time`) BETWEEN '. $this->db->escape($this->params['start_date']). ' and '. $this->db->escape($this->params['end_date']));
		return $this->db->get()->result_array();
	}
}