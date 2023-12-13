<?php $this->load->view("partial/header"); ?>
<div class="row state-reporting-listing">
	<div class="col-md-6  ">
		<div class="panel">
			<div class="panel-body">
				<div class="list-group parent-list">
					<a href="<?php echo site_url('state_reporting/generate/inventory_report');?>" class="list-group-item" id="saved"><i class="icon ti-harddrives" style="color: #fb5d5d"></i>	<?php echo lang('state_reporting_inventory_report'); ?></a>		
					<a href="<?php echo site_url('state_reporting/generate/inventory_additions_and_subtractions');?>" class="list-group-item" id="saved">
						<i class="icon ti-direction-alt" style="color: #fb5d5d"></i>	
						<?php echo lang('state_reporting_detailed_inventory_additions_subtractions'); ?>
					</a>					
					<a href="<?php echo site_url('state_reporting/generate/purchase_report_grower');?>" class="list-group-item" id="saved">
						<i class="icon ti-clipboard" style="color: #fb5d5d"></i>	
						<?php echo lang('state_reporting_purchase_report_grower'); ?>
					</a>					
					<a href="<?php echo site_url('state_reporting/generate/purchase_report_processor');?>" class="list-group-item" id="saved">
						<i class="icon ti-clipboard" style="color: #fb5d5d"></i>	
						<?php echo lang('state_reporting_purchase_report_processor'); ?>
					</a>					
					<a href="<?php echo site_url('state_reporting/generate/items_sold_report');?>" class="list-group-item" id="saved">
						<i class="icon ti-credit-card" style="color: #fb5d5d"></i>	
						<?php echo lang('state_reporting_items_sold_report'); ?>
					</a>
				</div>
			</div>
		</div> <!-- /panel -->
	</div>	
</div>
<?php $this->load->view("partial/footer"); ?>