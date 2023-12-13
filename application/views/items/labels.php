<?php $this->load->view("partial/header"); ?>
<style>
	
@page {
	margin: 0 !important;
	padding: 0 !important;
}
	
@media print
{
	.wrapper {
  	 overflow: visible;
	 font-family: serif !important;
	}
}

.barcode-label
{
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	/* width: <?php //echo ($barcode_width); ?>in;
	height:<?php //echo $barcode_height; ?>in; */
	width:2.25in;
	height:1.25in;
	letter-spacing: normal;
	word-wrap: break-word;
	/* overflow: hidden; */
	margin:0 auto;
	text-align:center;
	padding: 10px;
	font-size: <?php echo $overall_font_size;?>pt;
	line-height: .9em;
	 font-family: serif !important;
}

.item-price-barcode
{
	font-size: 115%;
}
</style>


<div class="hidden-print" style="margin-top: 20px;">

<?php 
echo form_open('',array('id'=>'label_form','class'=>'form-horizontal'));
 ?>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-piluku">
				<div class="panel-heading"><?php echo lang("common_basic_information"); ?></div>
				<div class="panel-body">
					
					<div class="form-group">
						<?php echo form_label(lang('common_item_number_expanded').':', null,array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label')); ?>
						<div class="col-sm-9 col-md-9 col-lg-10 form-text">
							<?php echo $item_info->item_number; ?>
						</div>
					</div>

					<div class="form-group">
						<?php echo form_label(lang('common_item_name').':', null,array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label')); ?>
						<div class="col-sm-9 col-md-9 col-lg-10 form-text">
							<?php echo $item_info->name ?>
						</div>
					</div>

					<div class="form-group">
						<?php echo form_label(lang('common_category').':', null,array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label')); ?>
						<div class="col-sm-9 col-md-9 col-lg-10 form-text">
							<?php echo $this->Item->get_category($item_info->category_id); ?>
						</div>
					</div>

                    <div class="form-group">
						<?php echo form_label(lang('common_description').':', null,array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label')); ?>
						<div class="col-sm-9 col-md-9 col-lg-10 form-text">
							<?php echo $item_info->description; ?>
						</div>
					</div>					
					<?php  echo form_close(); ?>

                    <div class="row">
						<div class="col-sm-3 col-md-3 col-lg-2">
                        </div>
                        <div class="col-sm-9 col-md-9 col-lg-10 form-text">
	                        <button class="btn btn-primary text-white hidden-print" id="print_button" ><?php echo lang('common_print'); ?></button>	
						</div>
					</div>
				</div>
					
			</div>
			
		</div>
	</div>
</div>

<?php
$company = ($company = $this->Location->get_info_for_key('company')) ? $company : $this->config->item('company');

echo "<div id='div_content_print' class='barcode-label' style='page-break-after: auto'>".($this->config->item('show_barcode_company_name') ? $company."<br />" : '').$item_info->description."</div>";
?>

<script type='text/javascript'>

	$(document).ready(function () {

		function ImagetoPrint(myImage)
		{
			return "<html><head><scri"+"pt>function step1(){\n" +
					"setTimeout('step2()', 10);}\n" +
					"function step2(){window.print();window.close()}\n" +
					"</scri" + "pt></head><body onload='step1()'>\n" +
					"<img src='" + myImage + "' style='width:2.25in; height:1.25in'/></body></html>";
		}     

		async function printFunc(){
			var element = $("#div_content_print")[0];
			await html2canvas(element).then(function async (canvas) {
				var myImage = canvas.toDataURL("image/png");
				var Pagelink = "about:blank";
				var pwa = window.open(Pagelink, "_new");
				pwa.document.open();
				pwa.document.write(ImagetoPrint(myImage));
				pwa.document.close();                
			});
		}

		$("#print_button").click(function async (event) {
			event.preventDefault();
			printFunc();            
		});
	});

    $("#label_form").submit(function(event)
    {
        event.preventDefault();
    });

</script>

<?php $this->load->view('partial/footer'); ?>