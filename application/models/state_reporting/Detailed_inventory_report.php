<?php
require_once ("State_report.php");
class Detailed_inventory_report extends State_report
{
	function __construct()
	{
        parent::__construct();
		$this->lang->load('state_reporting_lang');
		$this->load->model('Item');		
    }

    public function getInputData()
	{		
		$input_params = array();		
		if ($this->settings['display'] == 'tabular')
		{
			$input_data = State_report::get_common_report_input_data(TRUE);			
			$input_params = array(
				array('view' => 'detailed_inventory_excel_export'),
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
				$stock_weight = ''; $sale_weight = ''; $total_weight = '';	$purchase_weight = '';
				
				$stock_weight =  gramsToPoundsCalculation($row['stock']) .' lbs'; 
				$purchase_weight =  gramsToPoundsCalculation($row['purchase']) .' lbs';
				$sale_weight =  gramsToPoundsCalculation($row['sale']) .' lbs';
				$total_weight =  gramsToPoundsCalculation($row['total']) .' lbs';				

				$tab_row = array(
                    array('data'=>$row['item'], 'align'=>'left'),
                    array('data'=>$stock_weight, 'align'=>'left'),
                    array('data'=>$purchase_weight, 'align'=>'left'),
                    array('data'=>$sale_weight, 'align'=>'left'),
                    array('data'=>$total_weight, 'align'=>'left')                   
				);						
				// if ($this->has_profit_permission)
				// {
				// 	$tab_row[] = array('data'=>to_currency($row['profit']).($do_compare && $row_compare ? ' / <span class="compare '.($row_compare['profit'] >= $row['profit'] ? ($row['profit'] == $row_compare['profit'] ?  '' : 'compare_better') : 'compare_worse').'">'.to_currency($row_compare['profit']) .'</span>':''), 'align'=>'left');
				// }
                $tabular_data[] = $tab_row;
				
			}
			$data = array(
				"view" => 'detailed_inventory_tabular',
				"title" => 'Category '.$this->params['category'].' at Start of Day ',
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
			array('data'=>lang('report_item'), 'align'=>'left'),
            array('data'=>lang('det_rep_stock_weight'), 'align'=>'left'),
            array('data'=>lang('det_rep_purchase_weight'), 'align'=>'left'),
            array('data'=>lang('det_rep_sales_weight'), 'align'=>'left'),
            array('data'=>lang('det_rep_total_weight'), 'align'=>'left')            
		);		
		return $return;
	}	
    
    public function getData()
	{			
		$this->db->select('items.name as item,sale,purchase,safe + floor + purchase - sale as total,safe + floor as stock',FALSE);
		$this->db->from('inventory_snapshot');
		$this->db->join('items', 'items.item_id = inventory_snapshot.item_id', 'left');
		$this->db->join('categories', 'categories.id = inventory_snapshot.category_id', 'left'); 
		$this->db->where('DATE(`date`)', $this->params['date']);	
		$this->db->where('inventory_snapshot.category_id', $this->params['category_id']);	
		return $this->db->get()->result_array();	
	}
}