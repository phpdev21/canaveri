<?php
require_once ("State_report.php");
class Items_sold_report extends State_report
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
		$this->load->model('Sale');
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

			$category_wise_array = array();
				
			foreach($report_data as $row)
			{
				// Update count if category already added
				if($category_wise_array[$row['category_id']]){

					$old_record = $category_wise_array[$row['category_id']];					
					
					$category_wise_array[$row['category_id']]['sold_quantity'] =  $old_record['sold_quantity'] + $row['quantity_purchased'];
					$category_wise_array[$row['category_id']]['total_sales_amount'] = $old_record['total_sales_amount'] + $row['total_sales_amount'];
					$category_wise_array[$row['category_id']]['subtotal_sales_amount'] = $old_record['subtotal_sales_amount'] + $row['subtotal_sales_amount'];
					$category_wise_array[$row['category_id']]['tax'] = $old_record['tax'] + $row['tax'];

					$category_wise_array[$row['category_id']]['total_price'] = $old_record['total_price'] + $row['total_price'];

					
						
					
					//Allow to update customer count only if different customer
					if (!in_array($row['person_id'], $category_customer[$row['category_id']]))
					{
						//Update Customer_type_count
						switch ($row['pur_cus_type']) {
							case 'MED':
								$conditional_customer_count_column['total_patients'] = $old_record['total_patients'] + 1;
								break;
							case 'CAR':
								$conditional_customer_count_column['total_caregivers'] = $old_record['total_caregivers'] + 1;
								break;
							case 'MIN':
								$conditional_customer_count_column['total_minor_patients'] = $old_record['total_minor_patients'] + 1;
								break;
							case 'REC':
								$conditional_customer_count_column['total_recreational'] = $old_record['total_recreational'] + 1;
								break;				
							default:
								break;
						}
						$category_wise_array[$row['category_id']] = array_merge((array) $category_wise_array[$row['category_id']], (array) $conditional_customer_count_column);
						//Join current customer
						$category_customer[$row['category_id']][] = $row['person_id'];	
					}

					
				}else{					
					$category_wise_array[$row['category_id']] = array(
						'category_name' => $row['category_name'],
						'sold_quantity' => $row['quantity_purchased'],
						'total_sales_amount' => $row['total_sales_amount'],
						'subtotal_sales_amount' => $row['subtotal_sales_amount'],
						'total_patients' => ($row['pur_cus_type'] == 'MED') ? 1 : 0,
						'total_caregivers' => ($row['pur_cus_type'] == 'CAR') ? 1 : 0,
						'total_minor_patients' => ($row['pur_cus_type'] == 'MIN') ? 1 : 0,
						'total_recreational' => ($row['sales_variation'] == 'REC') ? 1 : 0,
						'tax' => $row['tax'],

						'sale_time' => $row['sale_time'],
						'customer_type' => 'consumer',
						'rx_number' => $row['rx_number'],
						'total_price' => $row['total_price'],
						'sale_id' => $row['sale_id'],
						'discount' => $row['discount_percent'],
						'variation_product' => ($row['sales_variation']) ? $row['sales_variation'] : 0,

						


					);	

					$category_customer[$row['category_id']][] = $row['person_id'];	

				}
			}
			

            // foreach($category_wise_array as $row)// category wise
			foreach($report_data as $row)// per person
			{	
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
					// Product meta fields such as THC etc...
					$item_info = $this->Item->get_info($row['item_id']);
					$thc = $item_info->custom_field_1_value;
					$cbd = $item_info->custom_field_2_value;
					$terp = $item_info->custom_field_3_value;
					$uom = $item_info->custom_field_5_value;

				$tab_row = array(
					array('data'=>$row['sale_time'], 'align'=>'center'),
					array('data'=>'consumer', 'align'=>'center'),
					array('data'=>$row['rx_number'], 'align'=>'center'),
					array('data'=>$this->getCustomerTypeName($row['pur_cus_type']), 'align'=>'center'),
					array('data'=>'', 'align'=>'center'),
					array('data'=>$p_id, 'align'=>'center'),
					array('data'=>number_format($row['quantity_purchased'], 2, '.', ','), 'align'=>'center'),
					array('data'=>$uom, 'align'=>'center'),
					array('data'=>$thc, 'align'=>'center'),
					array('data'=>$cbd, 'align'=>'center'),
					array('data'=>$terp, 'align'=>'center'),
					array('data'=>$row['sales_variation'], 'align'=>'center'),
					array('data'=>$uom, 'align'=>'center'),
					array('data'=>number_format($row['total_sales_amount'], 2, '.', ','), 'align'=>'center'),
					array('data'=>$row['sale_id'], 'align'=>'center'),//sale_id
					array('data'=>number_format($row['total_price'], 2, '.', ','), 'align'=>'center'),
					array('data'=>'', 'align'=>'center'),
					array('data'=>'', 'align'=>'center'),
					array('data'=>'', 'align'=>'center'),
					array('data'=>'', 'align'=>'center'),
					array('data'=>$row['discount_percent'], 'align'=>'center'),
					array('data'=>number_format($row['subtotal_sales_amount'], 2, '.', ','), 'align'=>'center'),
					array('data'=>number_format($row['tax'], 2, '.', ','), 'align'=>'center'),
					
				);
				
                $tabular_data[] = $tab_row;				
			}
			// return $tabular_data;
			$data = array(
				"view" => 'items_sold_tabular',
				"title" => lang('state_reporting_items_sold_report'),
				"subtitle" => $subtitle,
				"data" => $tabular_data,
				"start_date" => $start_date,
				"end_date" => $end_date,
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
			array('data'=>lang('sales_date_time'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('customer_type'), 'align'=>'left', 'col_type' => ''),		
			array('data'=>lang('patient_license'), 'align'=>'left', 'col_type' => ''),	
			array('data'=>lang('caregiver'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('ID_method'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('common_package_number'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('sale_quantity'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('umo'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('unit_thc_percent'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('unit_thc_content'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('unit_thc_content_of_measure'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('unit_weight'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('unit_weigh_of_measure'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('total_amount'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('sale_invoice'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('sale_price'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('excise_tax'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('city_tax'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('county_tax'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('municipal_tax'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('discount_amount'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('sub_total'), 'align'=>'left', 'col_type' => ''),			
			array('data'=>lang('sales_tax'), 'align'=>'left', 'col_type' => ''),			
		);		
		return $return;
	}

	private function getCustomerTypeName($customer_type) {
	    if ($customer_type == "MED") {
	        return lang('customers_customer_type_medicinal');
        } else if ($customer_type == "CAR") {
	        return lang('customers_customer_type_caregiver');
        } else if ($customer_type == "MIN") {
	        return lang('customers_customer_type_minor_party');
        } else if ($customer_type == "REC") {
	        return lang('customers_customer_type_recreational');
        } else {
	        return "unknown customer type";
        }
    }

	public function getTablefooter()
	{		
		$return = array();
		$this->db->group_by('customers.customer_type');
		$this->db->select('customer_type');
		foreach($this->db->from('customers')->get()->result_array() as $category)
		{
            $customer_type_name = $this->getCustomerTypeName($category['customer_type']);
			array_push($return,array('data'=> $customer_type_name, 'align'=>'center','col_type' => 'weight'));
		}
		return $return;
    }
    
    public function getData()
	{		
		$this->db->select('sales.sale_id,sales.sale_time,quantity_purchased,items.category_id,categories.name as category_name,customers.person_id,customers.rx_number,customers.customer_type as pur_cus_type,sales_items.total as total_sales_amount,sales_items.subtotal as subtotal_sales_amount,sales_items.item_cost_price as total_price, sales_items.tax as tax,sales_items.discount_percent,item_variations.name as sales_variation,items.product_id,items.item_id');
		$this->db->from('sales_items');		
		$this->db->join('sales', 'sales.sale_id = sales_items.sale_id', 'inner');
		$this->db->join('items', 'items.item_id = sales_items.item_id', 'inner');
        $this->db->join('categories', 'categories.id = items.category_id', 'inner');
        $this->db->join('customers', 'customers.person_id = sales.customer_id', 'inner');	
		$this->db->join('item_variations', 'item_variations.id = sales_items.item_variation_id', 'left');	
		$this->db->where('DATE(`sale_time`) BETWEEN '. $this->db->escape($this->params['start_date']). ' and '. $this->db->escape($this->params['end_date']));
		return $this->db->get()->result_array();
	}
}