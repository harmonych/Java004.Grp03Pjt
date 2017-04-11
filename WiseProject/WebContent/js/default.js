$(document).ready(function () {
	 /*置換內頁 */
	$("#sp_artist_id").click(function(){
		$.ajax({
			url:"\_05_CreationsFrame\\CreationsPage2.jsp",
			context: document.body,
			success: function(response){
				$('#mainframe').html(response);
				}
  	    });
  	  })
  	  
  	  $("#sp_pro_id").click(function(){
  		  $.ajax({
  			  url:"\_05_CreationsFrame\\CreationsPage3.jsp",
  			  context: document.body,
  			  success: function(response){
  				  $('#mainframe').html(response);
  			  }
  		  });
  	  });
	  $("#sp_fc_details").click(function(){
  		  $.ajax({
  			  url:"\_11_Fc_info\\Fc_Info.jsp",
  			  context: document.body,
  			  success: function(response){
  				  $('#mainframe').html(response);
  			  }
  		  });
  	  });

	  $("#sp_fc_info").click(function(){
  		  $.ajax({
  			  url:"\_11_Fc_info\\Fc_Info2.jsp",
  			  context: document.body,
  			  success: function(response){
  				  $('#mainframe').html(response);
  			  }
  		  });
  	  });
    /* 置換內頁結束 */
   

//   $(".navbar a").on('click', function (event) {
//        console.log(this.hash)
//        if(this.hash !== '') {
//            event.preventDefault();
//            var hash = this.hash;
//            $('html, body').animate({
//                scrollTop: $(hash).offset().top - 40
//            }, 900, function () {
//                window.location.hash = hash;
//            })
//        }
//
//    })
});
$(document).on('click', "#sp_artist_id" , function(){
	  $.ajax({
		  url:"\_05_CreationsFrame\\CreationsPage2.jsp",
		  context: document.body,
		  success: function(response){
			  $('#mainframe').html(response);
		  }
	  });
  });

$(window).scroll(function() {
    $(".slideanim").each(function(){
        var pos = $(this).offset().top;

        var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
            $(this).addClass("slide");
        }
    });
});









