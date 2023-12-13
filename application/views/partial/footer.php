</body>
<?php
if (($this->uri->segment(1) == 'sales' || $this->uri->segment(1) == 'receivings'))
{	
?>
	<script>
		
	function getBodyScrollTop () 
	{ 
		var el = document.scrollingElement || document.documentElement;
		
		return el.scrollTop; 
	}

	$(window).on("beforeunload", function() {
		
			var scroll_top = 
	    $.ajax(<?php echo json_encode(site_url('home/save_scroll')); ?>, {
	        async: false,
	        data: {scroll_to: getBodyScrollTop()}
	    });
	});
	</script>
	<?php
	if ($this->session->userdata('scroll_to'))
	{
		?>
		<script>
		$([document.documentElement, document.body]).animate({
			scrollTop: <?php echo json_encode($this->session->userdata('scroll_to')); ?>
		    }, 100);
				</script>
		<?php
		$this->session->unset_userdata('scroll_to');
	}
}
?>
</html>
