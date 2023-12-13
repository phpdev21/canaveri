<?php
require_once ("State_report.php");
class Detailed_items_sold_report extends State_report
{
	function __construct()
	{
        parent::__construct();
		$this->lang->load('state_reporting_lang');
        $this->load->model('Item');
		$this->load->model('Category');	        		
    }

    public function getInputData()
	{		
		$input_params = array();		
		if ($this->settings['display'] == 'tabular')
		{
			$input_data = State_report::get_common_report_input_data(TRUE);			
			$input_params = array(
				array('view' => 'detailed_sold_excel_export'),
				array('view' => 'submit'),
			);
		}
		$input_data['input_report_title'] = lang('reports_report_options');
		$input_data['input_params'] = $input_params;
		return $input_data;
    }
    
    public function getOutputData()
	{
		$this->load->helper('State_reporting');
        $subtitle = date(get_date_format(), strtotime($this->params['start_date'])) .' - '.date(get_date_format(), strtotime($this->params['end_date']));
        $tabular_data = array();
		$report_data = $this->getData();
		// echo json_encode($report_data);
		$summary_data = []; //$this->getSummaryData();
		$start_date = $this->params['start_date'];
		$end_date = $this->params['end_date'];

        if ($this->settings['display'] == 'tabular')
		{
            $export_excel = $this->params['export_excel'];  
            $tabular_data = array();
            foreach($report_data as $row)
			{		
				$formattedDate =  date("m/d/Y", strtotime($row['sale_time']));
                
				$mmj_weight	 = '-'; 
				$sales_quantity = (float)$row['quantity_purchased'];				
				
				if($row['enable_mmj_weight'] == 1){
					$mmj_weight_grams_pounds = ($sales_quantity * $row['mmj_weight']);
					$mmj_weight = gramsToPoundsCalculation($mmj_weight_grams_pounds).' lbs';
				}
                
				$tab_row = array(
                    array('data'=>$formattedDate, 'align'=>'left'),
                    array('data'=>$row['invoice'], 'align'=>'center'),
                    array('data'=>$row['item'], 'align'=>'left'),
                    array('data'=>number_format($sales_quantity, 2, '.', ','), 'align'=>'center'),
                    array('data'=>$mmj_weight, 'align'=>'center'),
				);						
				// if ($this->has_profit_permission)
				// {
				// 	$tab_row[] = array('data'=>to_currency($row['profit']).($do_compare && $row_compare ? ' / <span class="compare '.($row_compare['profit'] >= $row['profit'] ? ($row['profit'] == $row_compare['profit'] ?  '' : 'compare_better') : 'compare_worse').'">'.to_currency($row_compare['profit']) .'</span>':''), 'align'=>'left');
				// }
                $tabular_data[] = $tab_row;
				
			}
			$data = array(
				"view" => 'detailed_item_sold_tabular',
				"title" => 'Category '.$this->params['category'].', ',
				"subtitle" => $subtitle,
				"data" => $tabular_data,
				"summary_data" => $summary_data,
				"export_excel" => $export_excel,
				"headers" => $this->getDataColumns(), 
			);
        }
        return $data;
    }

    public function getDataColumns()
	{
		$return = array(
			array('data'=>lang('det_sold_date'), 'align'=>'left'),
			array('data'=>lang('det_sold_invoice'), 'align'=>'left'),
			array('data'=>lang('det_sold_item'), 'align'=>'left'),
            array('data'=>lang('state_reporting_item_sold_quantity'), 'align'=>'left'),
            array('data'=>lang('det_sold_mmj_weight'), 'align'=>'left')            
		);		
		return $return;
	}	
    
    public function getData()
	{	
		$this->db->select('categories.enable_mmj_weight,items.mmj_weight,sales.sale_time,sales.sale_id as invoice,items.name as item,quantity_purchased');
		$this->db->from('sales_items');		
		$this->db->join('sales', 'sales.sale_id = sales_items.sale_id', 'inner');
		$this->db->join('items', 'items.item_id = sales_items.item_id', 'inner');
        $this->db->join('categories', 'categories.id = items.category_id', 'inner');
		$this->db->where('DATE(`sale_time`) BETWEEN '. $this->db->escape($this->params['start_date']). ' and '. $this->db->escape($this->params['end_date']));
		$this->db->where('categories.id', $this->params['category_id']);
        return $this->db->get()->result_array(); 
	}
}