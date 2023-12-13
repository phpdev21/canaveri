<?php $this->load->view("partial/header"); ?>

<div class="panel panel-piluku">

	<div class="panel-heading">
		<h3 class="panel-title">
			<?php echo lang('items_inventory_print_list'); ?>
		</h3>
		<div class="text-right"><?php echo anchor('items/inventory_print_list/1',lang('common_excel_export'));?></div>
		
			<form class="form-horizontal form-horizontal-mobiles" id="report_input_form" method="post" action="<?php echo site_url('items/inventory_print_list'); ?>">

				<div class="row">
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
								<a href="http://localhost/canaveri_grower/index.php/packages" class="none add-new-item" title="New Item" id="new-item" tabindex="-1">Start Date</a>						
							</span>
							<input type="text" class="form-control datepicker" size="20" name="inventory_print_start_date" value="<?php echo ($inventory_print_start_date !== NULL && $inventory_print_start_date !== "") ? date('m/d/Y',strtotime($inventory_print_start_date)) : ''; ?>"/>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">To Date</span>
							<input type="text" class="form-control datepicker" size="20" name="inventory_print_to_date" value="<?php echo ($inventory_print_to_date !== NULL  && $inventory_print_to_date !== "") ? date('m/d/Y',strtotime($inventory_print_to_date)) : ''; ?>"/>
						</div>
					</div>
					<div class="col-sm-3">
						<button type="submit" name="submit_filter" class="btn btn-primary btn-lg"><span class="ion-ios-search-strong"></span><span class="hidden-xs hidden-sm"> Search</span></button>
						<button type="submit" name="clear_filter" class="btn btn-primary btn-lg"><span class="ion-ios-search-strong"></span><span class="hidden-xs hidden-sm"> Clear</span></button>
					</div>
				</div>

			</form>
		<!-- </div> -->
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-reports tablesorter" id="sortable_table">
				<thead>
					<tr>
						<th><?php echo lang('common_name')?></th>
						<th><?php echo lang('common_category')?></th>
						<th><?php echo lang('common_product_id')?></th>
						<th><?php echo lang('common_item_number')?></th>
						<th><?php echo lang('common_safe')?></th>
						<th><?php echo lang('common_floor')?></th>
					</tr>
				</thead>
					<tbody>
						<?php foreach($items as $row) { ?>
							<tr <?php echo $row['is_variation'] ? 'style="background-color: #eee;"' : '';?>>
								<td><?php echo $row['name'];?></td>
								<td><?php echo $this->Category->get_full_path($row['category_id']);?></td>
								<td><?php echo $row['product_id'];?></td>
								<td><?php echo $row['item_number'];?></td>
								<td><?php echo to_quantity($row['safe']);?></td>
								<td><?php echo to_quantity($row['floor']);?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
		</div>
	</div>
</div>
<script type='text/javascript'>
	date_time_picker_field($('.datepicker'), JS_DATE_FORMAT);
	var $date = $("body .datepicker");
	var picker = $date.data("DateTimePicker");
</script>
<?php $this->load->view("partial/footer"); ?>