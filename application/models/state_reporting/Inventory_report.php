<?php
require_once ("State_report.php");
class Inventory_report extends State_report
{
	function __construct()
	{
        parent::__construct();
		$this->lang->load('state_reporting_lang');
		$this->load->model('Category');		
		$this->load->model('Item');		
    }

    public function getInputData()
	{		
		$input_params = array();		
		if ($this->settings['display'] == 'tabular')
		{
			$input_data = State_report::get_common_report_input_data(TRUE);
			
			$input_params = array(
				array('view' => 'date', 'with_time' => TRUE),
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
		$subtitle = date(get_date_format(), strtotime($this->params['date']));

        $tabular_data = array();
		$report_data = $this->getData();
		$summary_data = []; 
		$date = $this->params['date'];

        if ($this->settings['display'] == 'tabular')
		{
            $export_excel = $this->params['export_excel'];  
            $tabular_data = array();
            foreach($report_data as $row)
			{		
				$safe_weight = ''; $floor_weight = '';
				
				$safe_weight =  gramsToPoundsCalculation($row['safe']) .' lbs'; 
				$floor_weight =  gramsToPoundsCalculation($row['floor']) .' lbs';			

				$mmj_weight = '';
				if($row['mmj_weight'] != 0){
					$mmj_weight  =  gramsToPoundsCalculation($row['mmj_weight']).' lbs ('.toFixedFloat($row['mmj_weight'],5).' g)';
				}
				$tab_row = array(
                    array('data'=>$row['category'], 'align'=>'left' ),
                    array('data'=>$safe_weight,'align'=>'center' ,'category_id' => $row['category_id'],'category' => $row['category']),
                    array('data'=>$floor_weight,'align'=>'center' ,'category_id' => $row['category_id'],'category' => $row['category']),
					array('data'=>$mmj_weight,'align'=>'center' )
				);						
				// if ($this->has_profit_permission)
				// {
				// 	$tab_row[] = array('data'=>to_currency($row['profit']).($do_compare && $row_compare ? ' / <span class="compare '.($row_compare['profit'] >= $row['profit'] ? ($row['profit'] == $row_compare['profit'] ?  '' : 'compare_better') : 'compare_worse').'">'.to_currency($row_compare['profit']) .'</span>':''), 'align'=>'left');
				// }
                $tabular_data[] = $tab_row;
				
			}
			$data = array(
				"view" => 'inventory_tabular',
				"title" => lang('state_reporting_inventory_report'),
				"subtitle" => $subtitle,
				"selected_date" => $this->params['date'], 
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
			array('data'=>lang('category'), 'align'=>'left'),
			array('data'=>lang('report_safe_weight'), 'align'=>'center'), 
			array('data'=>lang('report_floor_weight'), 'align'=>'center'),
			array('data'=>lang('report_mmj_weight'), 'align'=>'center')
		);		
		return $return;
	}	
    
    public function getData()
	{				
		$this->db->select('categories.id  as category_id, categories.name as category, safe,floor, mmj_weight');
		$this->db->from('inventory_snapshot');
		$this->db->join('categories', 'categories.id = inventory_snapshot.category_id', 'inner'); 		
		$this->db->where('DATE(`date`)', $this->params['date']);
		$this->db->order_by('categories.name', 'asc');
		return $this->db->get()->result_array();
	}
}