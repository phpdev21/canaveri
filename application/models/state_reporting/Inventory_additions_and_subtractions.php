<?php
require_once ("State_report.php");
class Inventory_additions_and_subtractions extends State_report
{
    function __construct()
	{
        parent::__construct();
		$this->lang->load('state_reporting_lang');
        $this->load->model('Item');	
		$this->load->model('Category');
        $this->load->model('Inventory');        	
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
		$this->load->helper('State_reporting');
		$subtitle = date(get_date_format(), strtotime($this->params['start_date'])) .' - '.date(get_date_format(), strtotime($this->params['end_date']));

        $tabular_data = array();
		$report_data = $this->getData();
		$summary_data = []; 
		$start_date = $this->params['start_date'];
		$end_date = $this->params['end_date'];
        
        if ($this->settings['display'] == 'tabular')
		{
            $export_excel = $this->params['export_excel'];  
            $tabular_data = array();
            foreach($report_data as $row)
			{		
				$formattedDate =  date("m/d/Y", strtotime($row['date']));
				$safe_grams = '';  $floor_grams = '';
				$safe_lbs = '';  $floor_lbs = '';				
				
				$safe_grams = number_format($row['safe'], 5, '.', ',')  .' g';  
				$floor_grams = number_format($row['floor'], 5, '.', ',') .' g';

				$safe_lbs = gramsToPoundsCalculation($row['safe']) .' lbs';  
				$floor_lbs = gramsToPoundsCalculation($row['floor']) .' lbs';

			
				$tab_row = array(
                    array('data'=>$row['product'], 'align'=>'left'),
                    array('data'=> $formattedDate, 'align'=>'left'),
                    array('data'=> $safe_grams,'align'=>'left'),
					array('data'=> $floor_grams,'align'=>'left'),					
                    array('data'=> $safe_lbs,'align'=>'left'),
                    array('data'=> $floor_lbs,'align'=>'left'),
					array('data'=> $row['type'],'align'=>'left'),
                    array('data'=> gramsToPoundsCalculation($row['mmj_weight']).' lbs','align'=>'left'),					
                );					
				// if ($this->has_profit_permission)
				// {
                // 	$tab_row[] = array('data'=>to_currency($row['profit']).($do_compare && $row_compare ? ' / <span class="compare '.($row_compare['profit'] >= $row['profit'] ? ($row['profit'] == $row_compare['profit'] ?  '' : 'compare_better') : 'compare_worse').'">'.to_currency($row_compare['profit']) .'</span>':''), 'align'=>'left');
                // }
                $tabular_data[] = $tab_row;				
            }
            $data = array(
                "view" => 'inventory_addition_subtraction_tabular',
                "title" => lang('state_reporting_inventory_addition_subtraction'),
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
			array('data'=>lang('inv_add_sub_product'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_date'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_safe_grams'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_floor_grams'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_safe_weight_lbs'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_floor_weight_lbs'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_trans_type'), 'align'=>'left'),
			array('data'=>lang('inv_add_sub_mmj_weight'), 'align'=>'left'),
		);		
		return $return;
	}	
    
    public function getData()
	{			
		$this->db->select('items.name as product, trans_date as date,trans_inventory_safe as safe,trans_inventory_floor as floor,trans_type as type,items.mmj_weight');
		$this->db->from('inventory');
        $this->db->join('items', 'items.item_id = inventory.trans_items', 'inner');
        $this->db->join('categories', 'categories.id = items.category_id', 'inner');        
		$this->db->where('DATE(`trans_date`) BETWEEN '. $this->db->escape($this->params['start_date']). ' and '. $this->db->escape($this->params['end_date']));
		$this->db->order_by("trans_id", "desc");		
		return $this->db->get()->result_array();
	}
}