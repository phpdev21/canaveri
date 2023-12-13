<?php
$transfer_modes = array("" => "Select Transfer Mode","safe_to_floor"=>"Safe To Floor","floor_to_safe"=>"Floor To Safe");
?>
<div class="modal fade category-input-data" id="transfer_inventory_modal" tabindex="-1" role="dialog" aria-labelledby="categoryData" aria-hidden="true">
    <div class="modal-dialog customer-recent-sales">
      	<div class="modal-content">
	        <div class="modal-header">
	          	<button type="button" class="close" data-dismiss="modal" aria-label=<?php echo json_encode(lang('common_close')); ?>><span aria-hidden="true">&times;</span></button>
	          	<h4 class="modal-title" id="transfer_inventory_modal_title">&nbsp;</h4>
	        </div>
	        <div class="modal-body">
                <!-- Form -->
				<?php echo form_open_multipart('items/transfer_items/'.$item_id,array('id'=>'transfer_items_form','class'=>'form-horizontal')); ?>
				
                <table class="table table-striped table-hover custom-table">
                    <thead>
                        <tr>                                                    											
                            <th><?php echo lang('items_safe_weight'); ?></th>
                            <th><?php echo lang('items_floor_weight'); ?></th>
                            <th><?php echo lang('transfer_mode'); ?></th>
                            <th><?php echo lang('transfer_weight'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><?php echo isset($item_location_info->safe) ? to_quantity($item_location_info->safe) : ''; ?></td>
                            <td><?php echo isset($item_location_info->floor) ? to_quantity($item_location_info->floor) : ''; ?></td>
                            <td>
                                <?php echo form_dropdown('transfer_mode', $transfer_modes, 'transfer_mode', 'class="form-control form-inps" id="transfer_mode"');?>
                            </td>
                            <td><input type="text" class="form-control" name="transfer_value" value=""></td>
                        </tr>  
                    </tbody>
                </table>
                <div class="form-actions">
					<?php
						echo form_submit(array(
							'name'=>'submitf',
							'id'=>'submitf',
							'value'=>lang('transfer_button'),
							'class'=>'submit_button pull-right btn btn-primary')
						);
					?>
					<div class="clearfix">&nbsp;</div>
				</div>
			
				<?php echo form_close(); ?>
	        </div>
    	</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

