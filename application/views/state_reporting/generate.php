<?php 
ob_start();
$this->load->view("partial/header");
if (isset($input_data) && !empty($input_data))
{
	$this->load->view('state_reporting/input',$input_data);
}
if (isset($output_data) && !empty($output_data))
{
	$this->load->view('state_reporting/output',$output_data);
}
?>
<?php $this->load->view("partial/footer");
//Flush all buffers
while (@ob_end_flush());
?>