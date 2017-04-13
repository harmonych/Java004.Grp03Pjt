<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="context" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${context}/css/Creations_page.css">
<title>創作者大廳</title>
</head>

<body>

        <section class="container-fluid" id="about">
            <div id="wrapper">

	  <div class="row content">
		<div class="col-sm-8 text-left"> 
			<div class="box-header with-border">
	        	<h3 class="box-title">創作者一覽</h3>
	       	</div>
		  <div class="container" id ="main">
			<div class="row">
			
			<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal" id ="sp_artist_id">
				<a href="#artist_id">
				<img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> 
				</a>
			</div>
			<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal">
				<a href="#">
				<img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </a>
			</div>
			<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
				
			</div>
			<div class="row">
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
			</div>
			<div class="row">
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
				<div class="card col-md-4 col-xs-12" ><img src="${context}/images/ajaxloader1.gif" class="img-thumbnail" width="130" height="130"> </div>
			</div>
		  </div>
		  
		</div>
	
	  </div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		var k = 0;
		var an = '';
		xhr.open("GET", '\_01_register\\allartist.json', true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var artist = JSON.parse(xhr.responseText);
				var content = '';
				console.log("this is artist");
				console.log(artist);	
				for(var j =0  ; j <4 ; j++){
					content += '<div class="row">';
					for(var i=0; i < 3; i++){
						content += '<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal" class="img-link" >';
// 						content += '<a href="${context}/_05_CreationsFrame/DisplayArtist?art_id=' + artist[k].art_id +'" >';
						content += '<a href="#" >';
						content += '<img src="'+ artist[k].file_name +'" class="img-circle img-link" width="180" height="180" id="' + artist[k].art_id + '">';
						$.ajax({
							  url: "\_01_register\\singleartusername.json",
							  type: "get", //send it through get method
							  async: false,
							  data: { 
							    "art_id":k+1, 
							  },
							  success: function(response1) {
								 an = response1;
								 console.log(response1);
								 console.log(k);
							  },
							  error: function(xhr2) {
							    xhr2.abort();
							  }
						});	
// 						content += '<span>' + an + '</span></a></div>';
						content += '<p>' + an + '</p>' + '</a></div>';    
						k++;
						if (k === artist.length) break;
					}
				
					content += '</div>';
				}
				
				var divs = document.getElementById("main");
				divs.innerHTML = content;
			}		
		};
		  $(document).on('click', ".img-link" , function(){
			  var art_id = $(this).attr('id');
		  		  $.ajax({
		  			  url:"\_05_CreationsFrame\\DisplayArtist?art_id=" + art_id,
		  			  context: document.body,
		  			  success: function(response){
		  				  $('#mainframe').html(response);
		  			  }
		  		  });
	  	 });
	})

		
	</script>
	<script src="${context}/js/default.js"></script>
	</section>
	</body>
</html>