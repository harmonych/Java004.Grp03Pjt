$(document).ready(function () {
	/*置換內頁 */
	/*至指定創作者頁面*/
	$("#sp_artist_id").click(function(){
		$.ajax({
			url:"\_05_CreationsFrame\\CreationsPage2.jsp",
			context: document.body,
			success: function(responseSpArtId){
				$("#mainframe").empty();
				$('#mainframe').html(responseSpArtId);
				}
  	    });
  	  })
  	  
	/*至指定商品頁面*/
  	  $("#sp_pro_id").click(function(){
  		  $.ajax({
  			  url:"\_05_CreationsFrame\\CreationsPage3.jsp",
  			  context: document.body,
  			  success: function(responseSpProId){
  				  $("#mainframe").empty();
  				  $('#mainframe').html(responseSpProId);
  			  }
  		  });
  	  });

	/*至指定募資作品頁面*/
	  $("#sp_fc_details").click(function(){
  		  $.ajax({
  			  url:"\_11_Fc_info\\Fc_Info.jsp",
  			  context: document.body,
  			  success: function(responseSpFcId){
  				  $("#mainframe").empty();
  				  $('#mainframe').html(responseSpFcId);
  			  }
  		  });
  	  });

	  $("#sp_fc_info").click(function(){
  		  $.ajax({
  			  url:"\_11_Fc_info\\Fc_Info2.jsp",
  			  context: document.body,
  			  success: function(response){
  				$("#mainframe").empty();
  				$('#mainframe').html(response);
  			  }
  		  });
  	  });
	/*動態置換內頁，若不懂為何要特意獨立這寫法出來請問我@Harmony*/
	  $(document).on('click', ".img-link" , function(){
		  //抓出內頁ID
		  var uni_ip_id = $(this).attr('id');
		  //命名邏輯為ip_xxx_id_y, xxx { fc, pro, art}, y為整數
		  //start of first if-else
		  if (uni_ip_id.substring(0,2)==="ip"){
			  //先判斷是否為fc_id
			  //start of second if-else
			  if(uni_ip_id.substring(3,5)==="fc"){
				  var fc_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
				  console.log("this is fc_id" + uni_ip_id);
		  		  $.ajax({
		  			  //執行Servlet 07 DisplaySingleFundPage.java
		  			  url:"\_11_Fc_info\\DisplayFund?fc_id=" + fc_id,
		  			  context: document.body,
		  			  type: "get",
		  			  success: function(responseIpFcId){
		  				  $("#mainframe").empty();
		  				  $('#mainframe').html(responseIpFcId);
		  			  },
		  			  error: function(responseIpFcIdErr){
		  				  console.log(fc_id);
		  			  }
		  		  });
			  }else{
				  //再判斷是否為pro_id
				  //start of third if-else
				  if(uni_ip_id.substring(3,5)==="pr"){
					  var pro_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
					  console.log("this is pro_id : " + uni_ip_id);
			  		  $.ajax({
			  			  //執行Servlet 08 DisplaySingleProductPage.java
			  			  url:"\_13_Product_info\\DisplayProduct?pro_id=" + pro_id,
			  			  context: document.body,
			  			  type: "get",
			  			  success: function(responseIpProId){
			  				  $("#mainframe").empty();
			  				  $('#mainframe').html(responseIpProId);
			  			  },
			  			  error: function(responseIpProIdErr){
			  				  console.log(pro_id);
			  			  }
			  		  });
				  }else{
					  //最後判斷是否為art_id
					  //start of fourth if-else
					  if(uni_ip_id.substring(3,5)==="ar"){
						  var art_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
						  console.log("this is art_id : " + uni_ip_id);
				  		  $.ajax({
				  			  //執行Servlet 01 DisplaySingleProductPage.java
				  			  url:"\_05_CreationsFrame\\DisplayArtist?art_id=" + art_id,
				  			  context: document.body,
				  			  type: "get",
				  			  success: function(responseIpArtId){
				  				  $("#mainframe").empty();
				  				  $('#mainframe').html(responseIpArtId);
				  			  },
				  			  error: function(responseIpArtIdErr){
				  				  console.log(art_id);
				  			  }
				  		  });
					  }else{
						  //三者皆非的狀況
						  console.log("!!!!!!!!!!!!!!!!!!!!")
						  console.log("無法辦別該uni_ip_id字串。")  
						  console.log(uni_ip_id)
					  }//end of fourth if-else
				  }//end of third if-else
				}//end of second if-else 
			  }//end of first if-else
		  
  	  });
	  /*動態置換內頁結束*/
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
//$(document).on('click', "#sp_artist_id" , function(){
//	  $.ajax({
//		  url:"\_05_CreationsFrame\\CreationsPage2.jsp",
//		  context: document.body,
//		  success: function(response){
//			  $('#mainframe').html(response);
//		  }
//	  });
//  });

$(window).scroll(function() {
    $(".slideanim").each(function(){
        var pos = $(this).offset().top;

        var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
            $(this).addClass("slide");
        }
    });
});









