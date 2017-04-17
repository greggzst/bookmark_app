$(document).on('turbolinks:load', function(){
	if ($('#infinite-scroll').size() > 0){
		$(window).on('scroll', function() {
        	var websites_url = $('.pagination a.next_page').attr('href');
        	if (websites_url && $(window).scrollTop() > $(document).height() - $(window).height() - 15) {
          		$('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
          		$.getScript(websites_url);
        	}
		});
	}
});