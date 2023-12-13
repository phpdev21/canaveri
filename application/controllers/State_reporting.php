<?php
require_once ("Secure_area.php");
class State_reporting extends Secure_area 
{	
	function __construct()
	{
		parent::__construct('state_reporting');
		require_once (APPPATH.'models/state_reporting/State_report.php');
		$this->load->helper('state_reporting');
		$this->lang->load('state_reporting_lang');
	}

	function index()
	{
		$this->load->view("state_reporting/report_list");	
	}
	
	function generate($report)
	{		
		$report_model = State_report::get_state_report_model($report);	
		// $this->check_action_permission($report_model->settings['permission_action']);
		$output_data = array();
		$get = $this->input->get();

		if (!empty($get))
		{
			if ($this->input->get('report_type') == 'simple')
			{
				$dates = simple_date_range_to_date($this->input->get('report_date_range_simple'), (boolean)$this->input->get('with_time'),(boolean)$this->input->get('end_date_end_of_day'));
				$_GET['start_date'] = $dates['start_date'];
				$_GET['end_date'] = $dates['end_date'];			
			}
			$report_model->setParams($this->input->get());
						// print_r($report_model);die;

			$output_data = $report_model->getOutputData();
			// print_r($output_data);die;
			$output_data['headersshow'] = '';
			if(isset($output_data['headers'])) {
				foreach($output_data['headers'] as $keys => $col_key) {
					$output_data['headers'][$keys]['column_id'] = 'id_'.md5($col_key['data']);
					$output_data['headers'][$keys]['view'] = 1;
				}
				$headersnew = array();
				$cols = unserialize($output_data['preferences']);
				if(!empty($cols)) {
					foreach($output_data['headers'] as $head) {
						if(!in_array($head['column_id'],$cols)) {
							$head['view'] = 0;
							$headersnew[] = $head;
						}else {
							$head['view'] = 1;
							$headersnew[] = $head;
						}
					}
					$output_data['headersshow'] = $headersnew;
				}else {
					$output_data['headersshow'] = $output_data['headers'];
				}
			}

		}	
		$data = array_merge(array('input_data' => $report_model->getInputData()),array('output_data' => $output_data),array('key' => $this->input->get('key'),'report' => $report));
		// echo '<pre>';print_r($data);die;
		$this->load->view('state_reporting/generate',$data);
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
}
?>