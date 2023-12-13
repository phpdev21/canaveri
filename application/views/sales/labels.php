<?php $this->load->view("partial/header"); ?>
<style>
    
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

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-piluku">
				<div class="panel-heading"><?php echo lang("common_labels"); ?></div>
				<div class="panel-body">
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
?>
<div class='barcode-label' style='page-break-after: auto'>
    <?php echo ($this->config->item('show_barcode_company_name') ? $company."<br />" : ''); ?>
    <div class="register" style="margin-top:1rem"> 
        <div id='div_content_print' class='barcode-label' style='page-break-after: auto'>
            <?php
            $start_index = $cart->offset + 1;
            $end_index = $cart->offset + $cart->limit;       
            $the_cart_row_counter = 1;
            
            $cart_count = 0;
            foreach(array_reverse($cart_items, true) as $line=>$item) { 

                // echo "<pre>";
                // print_r($item);
                // echo "</pre>";
                // exit;
                
                if ($item->quantity > 0 && $item->name != lang('common_store_account_payment') && $item->name != lang('common_discount'))
                {
                    $cart_count = $cart_count + $item->quantity;
                }
                
                if(!( ($start_index <= $the_cart_row_counter) && ($the_cart_row_counter <= $end_index)))
                {
                    $the_cart_row_counter++;
                    continue;
                }
                $the_cart_row_counter++;

                if (!$this->config->item('hide_description_on_sales_and_recv')) { ?>
                    <?php 
                    if(isset($item->allow_alt_description) && $item->allow_alt_description==1) { ?>
                        <a href="#" id="description_<?php echo $line;?>" class="xeditable" data-type="text" data-pk="1" data-name="description" data-value="<?php echo H($item->description); ?>" data-url="<?php echo site_url('sales/edit_item/'.$line); ?>" data-title="<?php echo H(lang('sales_description_abbrv')); ?>"><?php echo character_limiter(H($item->description), 50); ?></a>
                    <?php	
                    }
                    else
                    {
                        if ($item->description!='')
                        {
                            echo H($item->description);
                        }
                        else
                        {
                            echo lang('common_none');
                        }
                    }
                }                    
            }
            ?>
        </div>        
    </div>        
</div>


<script src="https://unpkg.com/html2canvas@1.3.2/dist/html2canvas.js"></script>
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

</script>

<?php $this->load->view('partial/footer'); ?>