<?php
require_once ("Report.php");
class Inventory_low extends Report
{
	function __construct()
	{
		parent::__construct();
	}
	
	public function getInputData()
	{
		$input_data = Report::get_common_report_input_data(TRUE);
				
		$this->load->model('Category');
		$this->load->model('Supplier');
		
		$supplier_entity_data = array();
		$supplier_entity_data['specific_input_name'] = 'supplier';
		$supplier_entity_data['specific_input_label'] = lang('reports_supplier');
		$supplier_entity_data['view'] = 'specific_entity';

		$suppliers = array();
		
		$suppliers[] = lang('common_all');
		foreach($this->Supplier->get_all()->result() as $supplier)
		{
			$suppliers[$supplier->person_id] = $supplier->company_name. ' ('.$supplier->first_name .' '.$supplier->last_name.')';
		}
		
		$supplier_entity_data['specific_input_data'] = $suppliers;
		
		$category_entity_data = array();
		$category_entity_data['specific_input_name'] = 'category_id';
		$category_entity_data['specific_input_label'] = lang('reports_category');
		$category_entity_data['view'] = 'specific_entity';
		
		$categories = array();
		$categories[] =lang('common_all');
		
		$categories_phppos= $this->Category->sort_categories_and_sub_categories($this->Category->get_all_categories_and_sub_categories());
		
		foreach($categories_phppos as $key=>$value)
		{
			$name = $this->config->item('show_full_category_path') ? str_repeat('&nbsp;&nbsp;', $value['depth']).$this->Category->get_full_path($key) : str_repeat('&nbsp;&nbsp;', $value['depth']).$value['name'];
			$categories[$key] = $name;
		}
		
		$category_entity_data['specific_input_data'] = $categories;
		
		$specific_entity_data['specific_input_name'] = 'customer_id';
		$specific_entity_data['specific_input_label'] = lang('reports_customer');
		$specific_entity_data['search_suggestion_url'] = site_url('reports/customer_search/1');
		$specific_entity_data['view'] = 'specific_entity';
		
		
		if ($this->settings['display'] == 'tabular')
		{
			$input_params = array();
			$input_params[] = array('view' => 'date_range', 'with_time' => TRUE);
			$input_params[] = $supplier_entity_data;
			$input_params[] = $category_entity_data;
			
			
			$input_params[] = array('view' => 'dropdown','dropdown_label' =>lang('common_inventory'),'dropdown_name' => 'inventory','dropdown_options' =>array('all' => lang('common_all'), 'in_stock' => lang('reports_in_stock'), 'out_of_stock' => lang('reports_out_of_stock'),'below_reorder_level' => lang('common_below_reorder_level'),'below_reorder_level_and_out_of_stock' => lang('common_below_reorder_level_and_out_of_stock'),),'dropdown_selected_value' => '');
			$input_params[] = array('view' => 'checkbox','checkbox_label' =>lang('reports_show_only_reorder') ,'checkbox_name' => 'reorder_only');
			$input_params[] = array('view' => 'locations', 'can_view_inventory_at_all_locations' => $this->Employee->has_module_action_permission('reports','view_inventory_at_all_locations', $this->Employee->get_logged_in_employee_info()->person_id));
			$input_params[] = array('view' => 'excel_export');
			$input_params[] = array('view' => 'submit');
		}
		
		$input_data['input_report_title'] = lang('reports_report_options');
		$input_data['input_params'] = $input_params;
		return $input_data;
	}
	
	public function getOutputData()
	{
				
		$this->lang->load('error');
		$this->load->model('Category');
		$this->load->model('Additional_item_numbers');
		$this->setupDefaultPagination();
		
		$summary_data = array();
		$variation_quantity_summary_data = array();
		$report_data = $this->getData();
		//echo '<pre>';print_r($report_data);exit;
		$details_data = array();
		$details_quantity_data = array();
		foreach ($report_data['details'] as $drow)
		{
			$details_data_row = array();

			$details_data_row[] = array('data'=>$drow['variation_id'], 'align' => 'left');			
			$details_data_row[] = array('data'=>$drow['name'], 'align' => 'left');
			$details_data_row[] = array('data'=>$drow['item_number'], 'align'=> 'left');
			$details_data_row[] = array('data'=>to_quantity($drow['safe']), 'align'=> 'left');
			$details_data_row[] = array('data'=>to_quantity($drow['floor']), 'align'=> 'left');
			$details_data_row[] = array('data'=>to_quantity($drow['pending_inventory']), 'align'=> 'left');
			$details_data_row[] = array('data'=>to_quantity($drow['reorder_level']), 'align'=> 'left');
			$details_data_row[] = array('data'=>to_quantity($drow['replenish_level']), 'align'=> 'left');
			
			if ($drow['replenish_level'])
			{
				$details_data_row[] = array('data'=>to_quantity($drow['replenish_level'] - ($drow['safe'] + $drow['floor'])), 'align'=> 'left');
			}
			else
			{
				$details_data_row[] = array('data'=>lang('error_unknown'), 'align'=> 'left');
			}
			$details_data[$drow['item_id']][] = $details_data_row;
			
			$details_quantity_data[$drow['item_id']][] = array(
				'safe' => $drow['safe'],
				'floor' => $drow['floor'],
				'pending_inventory' => $drow['pending_inventory'],
				'reorder_level' => $drow['reorder_level'],
				'replenish_level' => $drow['replenish_level'],
			);
		}
		
		foreach(array_keys($details_data) as $item_id)
		{
			$item_safe = 0;
			$item_floor = 0;
			$item_pending_inventory = 0;
			$item_reorder_level = 0;
			$item_replenish_level = 0;
			
			for($k=0;$k<count($details_data[$item_id]);$k++)
			{
				$item_safe+=$details_quantity_data[$item_id][$k]['safe'];
				$item_floor+=$details_quantity_data[$item_id][$k]['floor'];
				$item_pending_inventory+=$details_quantity_data[$item_id][$k]['pending_inventory'];
				$item_reorder_level+=$details_quantity_data[$item_id][$k]['reorder_level'];
				$item_replenish_level+=$details_quantity_data[$item_id][$k]['replenish_level'];
			}
			
			$variation_quantity_summary_data[$item_id] = array(
				'safe' => $item_safe,
				'floor' => $item_floor,
				'pending_inventory' => $item_pending_inventory,
				'reorder_level' => $item_reorder_level,
				'replenish_level' => $item_replenish_level,
			);
			
		}
		foreach($report_data['summary'] as $row)
		{
			$data_row = array();
			$data_row[] = array('data'=>$row['item_id'], 'align' => 'left');			
			$data_row[] = array('data'=>$row['name'], 'align' => 'left');
			$data_row[] = array('data'=>$this->Category->get_full_path($row['category_id']), 'align'=> 'left');
			$data_row[] = array('data'=>$row['company_name'], 'align'=> 'left');
			$additional_item_numbers = $this->Additional_item_numbers->get_all(false);
			$source_package_number = '';
				if (isset($additional_item_numbers[$row['item_id']]) && count($additional_item_numbers[$row['item_id']]) > 0) {
                foreach ($additional_item_numbers[$row['item_id']] as $item_num) {
                    if ($item_num) {
						$source_package_number .= "|";
					}
					$source_package_number .= $item_num;
                }
            }
			$data_row[] = array('data'=>$source_package_number, 'align'=> 'left');
			$package_id = '';
			if($row['product_id']){
				$product_ids = json_decode($row['product_id']);
				if(!empty($product_ids)){
					foreach ($product_ids as $key => $product_id) {
						if ($product_id) {

							if($key !=""){

								$package_id .= "|";
							}
						}
						$package_id .= $product_id;
					} 
				}
			}
			$data_row[] = array('data'=>$package_id, 'align'=> 'left');
			$items_brand = "SELECT brand FROM phppos_items INNER JOIN phppos_supplier_brands
			  ON phppos_items.brand_id=phppos_supplier_brands.supplier_brand_id  WHERE phppos_items.item_id =".$row['item_id'];
    		$item_brand = $this->db->query($items_brand)->result();
			$brand_name = '';
			if(!empty($item_brand)){
				$brand_name = $item_brand[0]->brand;
			}
			$data_row[] = array('data'=>$brand_name, 'align'=> 'left');
			$tags = $this->Tag->get_tags_for_item($row['item_id']);
			$tag_all ="";
			if(!empty($tags)){
				foreach ($tags as $key => $tag) {
					if ($tag) {
						if($key != ""){
							$tag_all .= "|";
						}
					}
					$tag_all .= $tag;
				} 
			}
			$data_row[] = array('data'=>$tag_all, 'align'=> 'left');
			$manufacturer = $this->Manufacturer->get_all()[$this->Item->get_info($row['item_id'])->manufacturer_id];
			$data_row[] = array('data'=>$manufacturer[name], 'align'=> 'left');

			$this->db->select('*');
			$this->db->from('items');
			$this->db->where('item_id',$row['item_id']);
			$items_data = $this->db->get()->result_array();
			foreach($items_data as $item_data){
				$is_series_package =($item_data['is_series_package'] == 1) ? 'Yes' : 'No';
				$tax_included = ($item_data['tax_included'] == 1) ? 'Yes' : 'No';
				$is_serialized = ($item_data['is_serialized'] == 1) ? 'Yes' : 'No';
				$is_ecommerce = ($item_data['is_ecommerce'] == 1) ? 'Yes' : 'No';
				$is_barcoded = ($item_data['is_barcoded']== 1) ? 'Yes' : 'No';
				$data_row[] = array('data'=>number_format($item_data['default_quantity']), 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['custom_field_1_value'], 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['custom_field_2_value'], 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['custom_field_3_value'], 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['custom_field_5_value'], 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['long_description'], 'align'=> 'left');
				$data_row[] = array('data'=>$item_data['info_popup'], 'align'=> 'left');
				$data_row[] = array('data'=>tax_included, 'align'=> 'left');
				$data_row[] = array('data'=>is_series_package, 'align'=> 'left');
				$data_row[] = array('data'=>is_serialized, 'align'=> 'left');
				$data_row[] = array('data'=>is_ecommerce, 'align'=> 'left');
				$data_row[] = array('data'=>is_barcoded, 'align'=> 'left');

			}
			if (!$this->config->item('hide_item_descriptions_in_reports') || (isset($this->params['export_excel']) && $this->params['export_excel']))
			{
				$data_row[] = array('data'=>$row['description'], 'align'=> 'left');
			}
			
			$data_row[] = array('data'=>$row['size'], 'align'=> 'left');
			$data_row[] = array('data'=>$row['location'], 'align'=> 'left');
			if($this->has_cost_price_permission)
			{
				$data_row[] = array('data'=>to_currency($row['cost_price']), 'align'=> 'right');
			}
			$data_row[] = array('data'=>to_currency($row['unit_price']), 'align'=> 'right');
			$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['safe']) ? $variation_quantity_summary_data[$row['item_id']]['safe'] : $row['safe']), 'align'=> 'left');
			$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['floor']) ? $variation_quantity_summary_data[$row['item_id']]['floor'] : $row['floor']), 'align'=> 'left');
			
			$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['pending_inventory']) ? $variation_quantity_summary_data[$row['item_id']]['pending_inventory'] : $row['pending_inventory']), 'align'=> 'left');
			//$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['reorder_level']) ? $variation_quantity_summary_data[$row['item_id']]['reorder_level'] : $row['reorder_level']), 'align'=> 'left');
			$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['reorder_level']) ? $row['reorder_level'] : $row['reorder_level']), 'align'=> 'left');

			$data_row[] = array('data'=>to_quantity(isset($variation_quantity_summary_data[$row['item_id']]['replenish_level']) ? $variation_quantity_summary_data[$row['item_id']]['replenish_level'] : $row['replenish_level']), 'align'=> 'left');
			
			$safe = isset($variation_quantity_summary_data[$row['item_id']]['safe']) ? $variation_quantity_summary_data[$row['item_id']]['safe'] : $row['safe'];
			$floor = isset($variation_quantity_summary_data[$row['item_id']]['floor']) ? $variation_quantity_summary_data[$row['item_id']]['floor'] : $row['floor'];
			$replenish_level = isset($variation_quantity_summary_data[$row['item_id']]['replenish_level']) ? $variation_quantity_summary_data[$row['item_id']]['replenish_level'] : $row['replenish_level'];

			if ($replenish_level && ($replenish_level - ($safe+ $floor)) > 0)
			{
				$data_row[] = array('data'=>to_quantity($replenish_level - ($safe + $floor)), 'align'=> 'right');				
			}
			else
			{
				$data_row[] = array('data'=>lang('error_unknown'), 'align'=> 'right');				
			}
			$summary_data[$row['item_id']] = $data_row;
			
			
		}
				

		$data = array(
			"view" =>'tabular_details',
			"title" => lang('reports_low_inventory_report'),
			"subtitle" => '',
			"headers" => $this->getDataColumns(),
			"summary_data" => $summary_data,
			"overall_summary_data" => $this->getSummaryData(),
			"export_excel" => $this->params['export_excel'],
			"pagination" => $this->pagination->create_links(),
		);
		isset($details_data) && !empty($details_data) ? $data["details_data"]=$details_data: '' ;

		return $data;
	}
	
	
	public function getDataColumns()
	{
		
		$columns = array();
		
		$columns['summary'][] = array('data'=>lang('common_item_id'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('reports_item_name'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('common_category'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_supplier'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_source_package_number'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_package_number'), 'align'=> 'right');

		$columns['summary'][] = array('data'=>lang('common_brand'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_tags'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_manufacturer'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_default_quantity'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_thc'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_cbd'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_terp'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_unit_of_measure'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_long_description'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_info_popup'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_is_tax_included'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_is_series_package'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_is_serialized'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_is_ecommerce'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_is_barcoded'), 'align'=> 'right');	

		if (!$this->config->item('hide_item_descriptions_in_reports') || (isset($this->params['export_excel']) && $this->params['export_excel']))
		{
			$columns['summary'][] = array('data'=>lang('reports_description'), 'align'=> 'right');
		}
		
		$columns['summary'][] = array('data'=>lang('common_size'), 'align'=> 'right');
		$columns['summary'][] = array('data'=>lang('common_location'), 'align'=> 'right');

		if($this->has_cost_price_permission)
		{
			$columns['summary'][] = array('data'=>lang('common_cost_price'), 'align'=> 'right');
		}

		$columns['summary'][] = array('data'=>lang('common_unit_price'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('common_safe'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('common_floor'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('reports_pending_inventory'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('reports_reorder_level'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('common_replenish_level'), 'align'=> 'left');
		$columns['summary'][] = array('data'=>lang('reports_order_amount'), 'align'=> 'left');

		$columns['details'][] = array('data'=>lang('common_item_id').'/'.lang('common_variation_id'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('reports_item_name').'/'.lang('common_variation'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('common_item_number'), 'align'=> 'right');
		$columns['details'][] = array('data'=>lang('common_safe'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('common_floor'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('reports_pending_inventory'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('reports_reorder_level'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('common_replenish_level'), 'align'=> 'left');
		$columns['details'][] = array('data'=>lang('reports_order_amount'), 'align'=> 'left');
		
		return $columns;
	}
	
	public function getData()
	{
		
		$this->dataQuery();
		
		//If we are exporting NOT exporting to excel make sure to use offset and limit
		if (isset($this->params['export_excel']) && !$this->params['export_excel'])
		{
			$this->db->limit($this->report_limit);
			if (isset($this->params['offset']))
			{
				$this->db->offset($this->params['offset']);
			}
		}
		
		$location_ids = self::get_selected_location_ids();
		$location_ids_string = implode(',',$location_ids);
		
		
		$inventory_result = $this->db->get()->result_array();
		$item_ids = array();
		
		$this->db->select('item_id, quantity_purchased - quantity_received as pending_inventory', false);
		$this->db->from('receivings_items');
		$this->db->join('receivings', 'receivings.receiving_id = receivings_items.receiving_id');
		$this->db->where('receivings.deleted', 0);
		$this->db->where('receivings.suspended', 1);
		$this->db->where_in('location_id', $location_ids);

		$pending_inventory_result = $this->db->get()->result_array();
        
		for($k=0;$k<count($inventory_result);$k++)
		{
			$inventory_result[$k]['pending_inventory'] = 0;
			$item_ids[] = $inventory_result[$k]['item_id'];
		}

		for($k=0;$k<count($pending_inventory_result);$k++)
		{
			$item_id = $pending_inventory_result[$k]['item_id'];
			$pending_inventory = $pending_inventory_result[$k]['pending_inventory'];

			for($i=0;$i<count($inventory_result);$i++)
			{
				if ($inventory_result[$i]['item_id'] == $item_id)
				{
					$inventory_result[$i]['pending_inventory'] += $pending_inventory;
					break;
				}
			}
		}

		if (isset($this->params['show_only_pending']))
		{
			foreach($inventory_result as $key=>$value)
			{
				if($value['pending_inventory'] <= 0)
				{
					unset($inventory_result[$key]);
				}
			}

			//Fix any missing holes...not really needed but looks better
			$inventory_result = array_values($inventory_result);
		}


		if ($this->params['category_id'])
		{
			if ($this->config->item('include_child_categories_when_searching_or_reporting'))
			{
				$category_ids = $this->Category->get_category_id_and_children_category_ids_for_category_id($this->params['category_id']);
			}
			else
			{
				$category_ids = array($this->params['category_id']);
			}
		}
	    
	        $item_ids_string = implode(',',$item_ids);
	        $items_in = (!empty($item_ids))?'AND ( `phppos_items`.`item_id` IN('.$item_ids_string.') ) ':'';
		    $query = 'SELECT X.*,Z.name
                    FROM
                    
                    (
                        SELECT 
                     phppos_item_variations.id as variation_id, phppos_location_item_variations.location_id as location_id, phppos_items.item_id, 
                    phppos_categories.id as category_id, phppos_categories.name as category, location, company_name, 
                    phppos_item_variations.item_number, size, product_id, 
                    IFNULL(phppos_location_items.cost_price, phppos_items.cost_price) as cost_price, 
                    IFNULL(phppos_location_items.unit_price, phppos_items.unit_price) as unit_price, 
                    SUM( DISTINCT(phppos_location_item_variations.safe)) as safe,
					SUM( DISTINCT(phppos_location_item_variations.floor)) as floor, 
                    COALESCE(phppos_location_item_variations.reorder_level, phppos_item_variations.reorder_level, phppos_location_items.reorder_level, phppos_items.reorder_level) as reorder_level, 
                    COALESCE(phppos_location_item_variations.replenish_level, phppos_item_variations.replenish_level, phppos_location_items.replenish_level, phppos_items.replenish_level) as replenish_level, description 
                    
                    FROM `phppos_item_variations` 
                    JOIN `phppos_items` ON `phppos_items`.`item_id`=`phppos_item_variations`.`item_id` LEFT OUTER JOIN `phppos_suppliers` ON `phppos_items`.`supplier_id` = `phppos_suppliers`.`person_id` LEFT OUTER JOIN `phppos_categories` ON `phppos_items`.`category_id` = `phppos_categories`.`id` LEFT JOIN `phppos_location_items` ON `phppos_location_items`.`item_id` = `phppos_items`.`item_id` and `phppos_location_items`.`location_id` IN('.$location_ids_string.') LEFT JOIN `phppos_location_item_variations` ON `phppos_location_item_variations`.`item_variation_id` = `phppos_item_variations`.`id` and 
                    `phppos_location_item_variations`.`location_id` IN('.$location_ids_string.') 
                    WHERE `phppos_item_variations`.`deleted` = 0  '.$items_in.' 
                    GROUP BY `phppos_item_variations`.`id` 
                        ) X
                    
                    LEFT JOIN (
                    SELECT `phppos_item_variations`.`id` ,
                    GROUP_CONCAT(DISTINCT phppos_attributes.name, ": ", phppos_attribute_values.name SEPARATOR ", ") as name
                    
                    FROM `phppos_item_variations` JOIN `phppos_item_variation_attribute_values` ON `phppos_item_variations`.`id` = `phppos_item_variation_attribute_values`.`item_variation_id` JOIN `phppos_attribute_values` ON `phppos_attribute_values`.`id` = `phppos_item_variation_attribute_values`.`attribute_value_id` JOIN `phppos_attributes` ON `phppos_attributes`.`id` = `phppos_attribute_values`.`attribute_id` 
                    WHERE `phppos_item_variations`.`deleted` = 0 
                    GROUP BY `phppos_item_variations`.`id` 
                            ) Z 
                            ON X.variation_id=Z.ID';
                    $inventory_result_variations = $this->db->query($query)->result_array();

	    
		
		$this->db->select('item_id, item_variation_id, quantity_purchased - quantity_received as pending_inventory', false);
		$this->db->from('receivings_items');
		$this->db->join('receivings', 'receivings.receiving_id = receivings_items.receiving_id');
		$this->db->where('receivings.deleted', 0);
		$this->db->where('receivings.suspended', 1);
		$this->db->where_in('location_id', $location_ids);

		$pending_inventory_result = $this->db->get()->result_array();

		for($k=0;$k<count($inventory_result_variations);$k++)
		{
			$inventory_result_variations[$k]['pending_inventory'] = 0;
		}

		for($k=0;$k<count($pending_inventory_result);$k++)
		{
			$item_id = $pending_inventory_result[$k]['item_id'];
			$variation_id = $pending_inventory_result[$k]['item_variation_id'];
			$pending_inventory = $pending_inventory_result[$k]['pending_inventory'];

			for($i=0;$i<count($inventory_result_variations);$i++)
			{
				if ($inventory_result_variations[$i]['item_id'] == $item_id && $inventory_result_variations[$i]['variation_id'])
				{
					$inventory_result_variations[$i]['pending_inventory'] += $pending_inventory;
					break;
				}
			}
		}

		if (isset($this->params['show_only_pending']))
		{
			foreach($inventory_result_variations as $key=>$value)
			{
				if($value['pending_inventory'] <= 0)
				{
					unset($inventory_result_variations[$key]);
				}
			}

			//Fix any missing holes...not really needed but looks better
			$inventory_result_variations = array_values($inventory_result_variations);
		}
		
		
		
		return array('summary' => $inventory_result, 'details' => $inventory_result_variations);
		
	}
	
	function getTotalRows()
	{
		$this->dataQuery();
		return $this->db->count_all_results();
	}
	
	private function dataQuery()
	{	
		$location_ids = self::get_selected_location_ids();
		$location_ids_string = implode(',',$location_ids);
		if ($this->params['category_id'])
		{
			if ($this->config->item('include_child_categories_when_searching_or_reporting'))
			{
				$category_ids = $this->Category->get_category_id_and_children_category_ids_for_category_id($this->params['category_id']);
			}
			else
			{
				$category_ids = array($this->params['category_id']);
			}
		}
		
		$location_item_variations_safe_quantity_col = $this->db->dbprefix('location_item_variations').'.safe';
		$location_items_safe_quantity_col = $this->db->dbprefix('location_items').'.safe';
		$location_item_variations_floor_quantity_col = $this->db->dbprefix('location_item_variations').'.floor';
		$location_items_floor_quantity_col = $this->db->dbprefix('location_items').'.floor';
		
		
		$safe_quantity_query = 'COALESCE('.$location_item_variations_safe_quantity_col.','.$location_items_safe_quantity_col.',0)';
		$floor_quantity_query = 'COALESCE('.$location_item_variations_floor_quantity_col.','.$location_items_floor_quantity_col.',0)';
		$safe_sum_query = 'SUM('.$safe_quantity_query.')';
		$floor_sum_query = 'SUM('.$floor_quantity_query.')';
		$item_number_query = $this->db->dbprefix('items').'.item_number as item_number';
		
		$this->db->select('location_items.location_id as location_id, items.item_id, items.name, categories.id as category_id,categories.name as category,location, company_name, '.$item_number_query.',size, product_id,
		IFNULL('.$this->db->dbprefix('location_items').'.cost_price, '.$this->db->dbprefix('items').'.cost_price) as cost_price,
		IFNULL('.$this->db->dbprefix('location_items').'.unit_price, '.$this->db->dbprefix('items').'.unit_price) as unit_price,
		'.$safe_sum_query.' as safe, '.$floor_sum_query.' as floor,
		COALESCE('.$this->db->dbprefix('location_items').'.reorder_level,'.$this->db->dbprefix('location_items').'.reorder_level, '.$this->db->dbprefix('items').'.reorder_level) as reorder_level,
		COALESCE('.$this->db->dbprefix('location_items').'.replenish_level,'.$this->db->dbprefix('location_items').'.replenish_level, '.$this->db->dbprefix('items').'.replenish_level) as replenish_level,
		description', FALSE);
		$this->db->from('items');
		$this->db->join('item_variations', 'items.item_id=item_variations.item_id and item_variations.deleted=0', 'left');
		$this->db->join('location_item_variations', 'location_item_variations.item_variation_id = item_variations.id and location_item_variations.location_id IN('.$location_ids_string.')', 'left');
		$this->db->join('suppliers', 'items.supplier_id = suppliers.person_id', 'left outer');
		$this->db->join('categories', 'items.category_id = categories.id', 'left outer');
		$this->db->join('location_items', 'location_items.item_id = items.item_id and location_items.location_id IN('.$location_ids_string.')', 'left');
		$this->db->join('inventory', 'items.item_id = inventory.trans_items', 'left');
		$this->db->where('trans_date BETWEEN "'.$this->params['start_date'].'" and "'.$this->params['end_date'].'"');
		$this->db->where('items.deleted', 0);
		$this->db->where('items.system_item',0);
		$this->db->group_by('items.item_id');

		if ($this->params['supplier'])
		{
			$this->db->where('suppliers.person_id', $this->params['supplier']);
		}

		if ($this->params['category_id'])
		{
			$this->db->where_in('categories.id', $category_ids);
		}
		
		if (isset($this->params['reorder_only']))
		{
			$this->db->where('((COALESCE('.$this->db->dbprefix('location_item_variations').'.safe + '.$this->db->dbprefix('location_item_variations').'.floor,'.$this->db->dbprefix('location_items').'.safe + '.$this->db->dbprefix('location_items').'.floor) <= COALESCE('.$this->db->dbprefix('location_item_variations').'.reorder_level,'.$this->db->dbprefix('item_variations').'.reorder_level,'.$this->db->dbprefix('location_items').'.reorder_level, '.$this->db->dbprefix('items').'.reorder_level))) and '.$this->db->dbprefix('items').'.deleted=0');
		}
		else
		{
			$this->db->where('(COALESCE('.$this->db->dbprefix('location_item_variations').'.safe + '.$this->db->dbprefix('location_item_variations').'.floor,'.$this->db->dbprefix('location_items').'.safe + '.$this->db->dbprefix('location_items').'.floor) <= 0 or (COALESCE('.$this->db->dbprefix('location_item_variations').'.safe + '.$this->db->dbprefix('location_item_variations').'.floor,'.$this->db->dbprefix('location_items').'.safe + '.$this->db->dbprefix('location_items').'.floor) <= COALESCE('.$this->db->dbprefix('location_item_variations').'.reorder_level,'.$this->db->dbprefix('item_variations').'.reorder_level,'.$this->db->dbprefix('location_items').'.reorder_level, '.$this->db->dbprefix('items').'.reorder_level))) and '.$this->db->dbprefix('items').'.deleted=0');
		}
		
		if ($this->params['inventory'] == 'in_stock')
		{
			$this->db->having('safe > 0 or floor > 0');
		}
		
		if ($this->params['inventory'] == 'below_reorder_level')
		{
			$this->db->having('safe <= reorder_level or floor <= reorder_level');
		}
		
		if($this->params['inventory'] == 'below_reorder_level_and_out_of_stock')
		{
			$this->db->having('safe <= 0 or floor <= 0 and safe <= reorder_level or floor <= reorder_level');
		}

		if ($this->params['inventory'] == 'out_of_stock')
		{
			$this->db->having('safe <= 0 and floor <= 0');
		}		

		$this->db->where('is_service !=', 1);
		
	}
	
	public function getSummaryData()
	{
		return array();
	}
}
?>