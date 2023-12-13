<?php
require_once ("Report.php");
class Detailed_damaged_items extends Report
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Tier');
	}
	
	public function getInputData()
	{
		$input_data = Report::get_common_report_input_data(TRUE);
		
		$input_params = array();

		if ($this->settings['display'] == 'tabular')
		{
			
			$input_params = array(
				array('view' => 'date_range', 'with_time' => TRUE),
				array('view' => 'checkbox','checkbox_label' => lang('reports_show_summary_only'), 'checkbox_name' => 'show_summary_only'),
				array('view' => 'excel_export'),
				array('view' => 'locations'),
				array('view' => 'submit'),
			);
			
		}
		
		$input_data['input_report_title'] = lang('reports_report_options');
		$input_data['input_params'] = $input_params;
		return $input_data;
	}
	
	function getOutputData()
	{
		$this->load->model('Sale');
		$this->setupDefaultPagination();
		$report_data = $this->getData();
		//echo '<pre>';print_r($report_data);exit;
		$start_date = $this->params['start_date'];
		$end_date = $this->params['end_date'];
		$tabular_data = array();
		
		$location_count = count(self::get_selected_location_ids());
	
		
		foreach($report_data as $row)
		{
			$data_row = array();
			
			if (!isset($this->params['show_summary_only']))
			{
				if ($location_count > 1)
				{
					$data_row[] = array('data'=>$row['location_name'], 'align'=>'left');
				}
				$data_row[] = array('data'=>date(get_date_format().' '.get_time_format(),strtotime($row['damaged_date'])), 'align'=>'left');
			}
			$item_number = '';
			$additional_item_numbers = $this->Additional_item_numbers->get_all(false);
			if (isset($additional_item_numbers[$row['item_id']]) && count($additional_item_numbers[$row['item_id']]) > 0) {
                foreach ($additional_item_numbers[$row['item_id']] as $item_num) {
                    if ($item_number) {
						$item_number .= "|";
                    }
					$item_number .= $item_num;
                }
            }
			$p_id = '';
            $product_ids = json_decode($row['product_id']);
            if(!empty($product_ids)){
                foreach ($product_ids as $key => $product_id) {
                    if ($product_id) {
                        if ($key !="") {
                            $p_id .= "|";
                        }
                    }
                    $p_id .= $product_id;
                } 
            }	
			$data_row[] = array('data'=>$row['name'], 'align'=>'left');
			$data_row[] = array('data'=>$this->Item_variations->get_variation_name($row['item_variation_id']), 'align'=>'left');
			
			$data_row[] = array('data'=>$item_number, 'align'=>'left');
			$data_row[] = array('data'=>$p_id, 'align'=>'left');
			$data_row[] = array('data'=>$this->Category->get_full_path($row['category_id']), 'align'=>'left');
			$data_row[] = array('data'=>(to_quantity($row['damaged_safe'])+to_quantity($row['damaged_floor'])), 'align'=>'left');
			
			$tabular_data[] = $data_row;
		}
		$data = array(
			"view" => 'tabular',
			"title" => lang('reports_damaged_items_report'),
			"subtitle" => date(get_date_format(), strtotime($start_date)) .'-'.date(get_date_format(), strtotime($end_date)),
			"headers" => $this->getDataColumns(),
			"data" => $tabular_data,
			"summary_data" => $this->getSummaryData(),
			"export_excel" => $this->params['export_excel'],
			"pagination" => $this->pagination->create_links()
		);

		return $data;
		
	}
	
	
	public function getDataColumns()
	{
		$columns = array();
		
		$location_count = count(self::get_selected_location_ids());
	
		if (!isset($this->params['show_summary_only']))
		{
			if ($location_count > 1)
			{
				$columns[] = array('data'=>lang('common_location'), 'align'=> 'left');
			}
			
			$columns[] = array('data'=>lang('common_date'), 'align'=> 'left');
		}
		
		$columns[] = array('data'=>lang('common_item'), 'align'=> 'left');
		$columns[] = array('data'=>lang('common_variation'), 'align'=> 'left');
		$columns[] = array('data'=>lang('common_source_package_number'), 'align'=> 'left');
		$columns[] = array('data'=>lang('common_package_number'), 'align'=> 'left');
		$columns[] = array('data'=>lang('reports_category'), 'align'=> 'left');
		$columns[] = array('data'=>lang('reports_damaged_qty'), 'align'=> 'left');
				
		return $columns;		
		
	}
	
	public function getData()
	{
		$location_ids = self::get_selected_location_ids();
		$location_ids_string = implode(',',$location_ids);
		
		if (isset($this->params['show_summary_only']))
		{
			$this->db->select('SUM(phppos_damaged_items_log.damaged_qty) as damaged_qty,SUM(phppos_damaged_items_log.damaged_safe) as damaged_safe,SUM(phppos_damaged_items_log.damaged_floor) as damaged_floor,phppos_damaged_items_log.item_variation_id,items.*,locations.name as location_name',false);
			$this->db->from('damaged_items_log');
			$this->db->join('items', 'items.item_id = damaged_items_log.item_id');
			$this->db->join('locations', 'locations.location_id = damaged_items_log.location_id');
			$this->db->where('items.deleted', 0);
			$this->db->where('damaged_date BETWEEN '.$this->db->escape($this->params['start_date']).' and '.$this->db->escape($this->params['end_date']));
			$this->db->where_in('damaged_items_log.location_id',$location_ids);
			$this->db->group_by('phppos_damaged_items_log.item_id,phppos_damaged_items_log.item_variation_id');
			
		}
		else
		{
			$this->db->select('damaged_items_log.*,items.*,locations.name as location_name');
			$this->db->from('damaged_items_log');
			$this->db->join('items', 'items.item_id = damaged_items_log.item_id');
			$this->db->join('locations', 'locations.location_id = damaged_items_log.location_id');
			$this->db->where('items.deleted', 0);
			$this->db->where('damaged_date BETWEEN '.$this->db->escape($this->params['start_date']).' and '.$this->db->escape($this->params['end_date']));
			$this->db->where_in('damaged_items_log.location_id',$location_ids);
			
		}
		
		//If we are exporting NOT exporting to excel make sure to use offset and limit
		if (isset($this->params['export_excel']) && !$this->params['export_excel'])
		{
			$this->db->limit($this->report_limit);
			
			if(isset($this->params['offset']))
			{
				$this->db->offset($this->params['offset']);
			}
		}

		return $this->db->get()->result_array();		
				
	}

	public function getTotalRows()
	{
		$location_ids = self::get_selected_location_ids();
		$location_ids_string = implode(',',$location_ids);
		if (isset($this->params['show_summary_only']))
		{
			$this->db->select('items.name');
			$this->db->from('damaged_items_log');
			$this->db->join('items', 'items.item_id = damaged_items_log.item_id');
			$this->db->join('locations', 'locations.location_id = damaged_items_log.location_id');
			$this->db->where('items.deleted', 0);
			$this->db->where('damaged_date BETWEEN '.$this->db->escape($this->params['start_date']).' and '.$this->db->escape($this->params['end_date']));
			$this->db->where_in('damaged_items_log.location_id',$location_ids);
			$this->db->group_by('phppos_damaged_items_log.item_id,phppos_damaged_items_log.item_variation_id');
			return $this->db->count_all_results();
			
		}
		else
		{
			$this->db->from('damaged_items_log');
			$this->db->join('items', 'items.item_id = damaged_items_log.item_id');
			$this->db->where('items.deleted', 0);
			$this->db->where('damaged_date BETWEEN '.$this->db->escape($this->params['start_date']).' and '.$this->db->escape($this->params['end_date']));
			$this->db->where_in('location_id',$location_ids);
			return $this->db->count_all_results();
		}
	}	
	
	public function getSummaryData()
	{
		return array();
	}
}

?>