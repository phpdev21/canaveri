<?php
// print_r($data);
if($export_excel == 1)
{
	//Clean all buffers
	while (ob_get_level())
	{
		ob_end_clean();
	}
	$rows = array();
	$row = array();
	foreach ($headers as $header) 
	{
		$row[] = strip_tags($header['data']);
	}	
	$rows[] = $row;	
	foreach($data as $datarow)
	{
		$row = array();
		foreach($datarow as $cell)
		{
			$row[] = str_replace('<span style="white-space:nowrap;">-</span>', '-', strip_tags($cell['data']));
		}
		$rows[] = $row;
	}	
	$this->load->helper('spreadsheet');
	array_to_spreadsheet($rows, strip_tags($title) . '.'.($this->config->item('spreadsheet_format') == 'XLSX' ? 'xlsx' : 'csv'), true);
	exit;
}
?>

<?php if(isset($pagination) && $pagination) {  ?>
	<div class="pagination hidden-print alternate text-center" id="pagination_top" >
		<?php echo $pagination;?>
	</div>
<?php }  ?>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-piluku reports-printable">
			<input type="hidden" name="url_segment" id="url_segment" value="<?php echo $this->uri->segment(3); ?>">
			<div class="panel-heading">
				<?php echo lang('reports_state_reporting'); ?> - <?php echo $title ?>
				<small class="reports-range"><?php echo $subtitle ?></small>
				<span class="pull-right">
					<?php
					if ($this->uri->segment(3) == 'detailed_timeclock')
					{
					?>
					&nbsp;&nbsp;&nbsp;
						<?php echo lang('common_current_ip_address').': '.$this->input->ip_address();?>
						&nbsp;&nbsp;&nbsp;
						<?php echo anchor('timeclocks/view/-1?'.$_SERVER['QUERY_STRING'], lang('reports_new_timeclock'), 'class="btn btn-primary btn-radius"');?>
					<?php } ?>
					
					<?php
					if ($this->uri->segment(3) == 'summary_customers')
					{
					?>
					&nbsp;&nbsp;&nbsp;
						<?php echo anchor('customers/mailing_label_from_summary_customers_report/'.$this->input->get('start_date').'/'.$this->input->get('end_date').'/'.$this->input->get('sale_type').'/'.$this->input->get('total_spent_condition').'/'.$this->input->get('total_spent_amount'), lang('common_mailing_labels'), 'class="btn btn-primary btn-radius" target="_blank"');?>
					<?php } ?>
					
				</span>
				
				<?php /* Html code for hide show and sort columns */ ?>
				<form id="config_columns" class="report-config hidden-print">
				<div class="piluku-dropdown btn-group table_buttons pull-right m-left-20">
					<button type="button" class="btn btn-more dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<i class="ion-gear-a"></i>
					</button>
						<ul id="" class="dropdown-menu dropdown-menu-left col-config-dropdown" role="menu">
							<li class="dropdown-header"><a id="reset_to_default" class="pull-right"><span class="ion-refresh"></span> Reset</a><?php echo lang('common_column_configuration'); ?></li>
																
							<?php $i = 0; foreach($headersshow as $col_key) {
								$checked = '';
								if($col_key['view'] == 1) {
									$checked = 'checked ="checked" ';
								}
								?>
								<li class="col<?php echo $i; ?>"><a><input <?php echo $checked; ?> name="selected_columns[]" type="checkbox" class="columns" id="<?php echo $col_key['column_id']; ?>" value="<?php echo $col_key['column_id']; ?>"><label class="sortable_column_name" for="<?php echo $col_key['column_id']; ?>"><span></span><?php echo H($col_key['data']); ?></label><span class=""></span></a></li>									
							<?php } ?>
						</ul>
				</div>
				</form>
				<?php /* End html code for hide show and sort columns */ ?>
				
				<button class="btn btn-primary text-white hidden-print print_button pull-right"> <?php echo lang('common_print'); ?> </button>
				
								
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-reports tablesorter" id="sortable_table">
						<thead>
							<tr>
								<?php foreach ($headersshow as $header) { ?>
								<th align="<?php echo $header['align'];?>" class="colsho <?php echo $header['column_id']; ?>" style="<?php if($header['view'] == 0) { ?>display:none;<?php } ?>">
									<?php echo $header['data']; ?>								
								</th>
								<?php } ?>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($data as $row) {?>
							<tr>
								<?php $i = 0; foreach ($row as $cell) { ?>
								<td align="<?php echo $cell['align'];?>" class="colsho <?php echo $i; ?>"><?php echo $cell['data']; ?>
								</td>
								<?php $i++; } ?>
							</tr>							
							<?php } ?>													
						</tbody>						
						
					</table>
				</div>
				<div class="text-center">
					<button class="btn btn-primary text-white hidden-print print_button"> <?php echo lang('common_print'); ?> </button>	
				</div>
			</div>
		</div>
	</div>
	<?php if(isset($pagination) && $pagination) {  ?>
		<div class="pagination hidden-print alternate text-center" id="pagination_top" >
			<?php echo $pagination;?>
		</div>
	<?php }  ?>
</div>

<?php 
foreach ($headersshow as $header) { 
	if($header['view'] == 0) {
?>
<script>
	var $th = $(".<?php echo $header['column_id']; ?>");
	var $td = $th.closest('table').find('td:nth-child('+($th.index()+1)+')');
	$th.hide();
	$td.hide();
</script>
<?php 
	}
}
?>

<script type="text/javascript" language="javascript">
function init_table_sorting()
{
	//Only init if there is more than one row
	if($('.tablesorter tbody tr').length >1)
	{
		$("#sortable_table").tablesorter(); 
	}
}
function print_report()
{
	window.print();
}
$(document).ready(function()
{
	
	<?php if ($this->uri->segment(3) != 'closeout')  { ?>
	init_table_sorting();
	
	var headIndex = 0;
	<?php if($this->uri->segment(3)== 'detailed_register_log' || $this->uri->segment(3) == 'detailed_inventory' || $this->uri->segment(3) =='detailed_timeclock' || $this->uri->segment(3) == 'detailed_expenses') { ?>
		headIndex = 2;	
	<?php } ?>

		<?php if($this->uri->segment(3)== 'summary_customers' || $this->uri->segment(3)== 'store_account_activity' || $this->uri->segment(3) =='specific_customer_store_account' ||
		$this->uri->segment(3)== 'inventory_low' || $this->uri->segment(3) =='inventory_summary' 
		) { ?>
			headIndex = 1;	
		<?php } ?>
		
	$("#sortable_table").stacktable({headIndex: headIndex});
	<?php } ?>

	$('.print_button').click(function(e){
		e.preventDefault();
		print_report();
	});
});

</script>