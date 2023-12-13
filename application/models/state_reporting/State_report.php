<?php
abstract class State_report extends CI_Model 
{
	var $CI;
	var $params	= array();
	var $settings = array();
	static $reports;
	function __construct()
	{
        parent::__construct();
    }

    public abstract function getInputData();
	public abstract function getOutputData();
	public abstract function getData();
    // public abstract function getSummaryData();
    
    public function setParams(array $params)
	{
		$this->params = $params;
	}
	
	public function setSettings(array $settings)
	{
		$this->settings = $settings;
	}
	
	public static function get_common_report_input_data($time=false)
	{
		$CI =& get_instance();
		
		$data = array();
		$data['report_date_range_simple'] = get_simple_date_ranges();
		$data['report_date_range_simple_compare'] = get_simple_data_ranges_compare();
		$data['months'] = get_months();
		$data['days'] = get_days();
		$data['years'] = get_years();
		$data['hours'] = get_hours($CI->config->item('time_format'));
		$data['minutes'] = get_minutes();
		$data['selected_month']=date('m');
		$data['selected_day']=date('d');
		$data['selected_year']=date('Y');
		$data['intervals'] = get_time_intervals();	
	
		return $data;
	}

	public static function get_state_report_model($report_key)
	{
		if (isset(State_report::$reports[$report_key]))
		{
			$CI =& get_instance();
			$report = State_report::$reports[$report_key];
			$CI->load->model('state_reporting/'.$report['model']);
			$model = $CI->{$report['model']};
			$model->report_key = $report_key;
			$model->setSettings($report['settings']);
			return $model;
		}		
		return NULL;
	}
}

State_report::$reports = array(
	'inventory_report' => array(
		'model' => 'Inventory_report',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'detailed_inventory_report' => array(
		'model' => 'Detailed_inventory_report',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'inventory_additions_and_subtractions' => array(
		'model' => 'Inventory_additions_and_subtractions',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'purchase_report_grower' => array(
		'model' => 'Purchase_report_grower',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'purchase_report_processor' => array(
		'model' => 'Purchase_report_processor',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'items_sold_report' => array(
		'model' => 'Items_sold_report',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
	),
	'detailed_item_sold_report' => array(
		'model' => 'Detailed_items_sold_report',
		'settings' => array(
			'permission_action' => 'view_sales',
			'display' => 'tabular'
        ),
    ),
);