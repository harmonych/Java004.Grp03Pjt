<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<c:set var="context" value="${pageContext.request.contextPath}" />
	<c:set var="account" value="${LoginOK.account}" />
	<head>        
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!--         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
        <link rel="stylesheet" href="${context}/css/Creations_page2.css">
        <title>創作者主頁</title>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
 .img-circle {
    border-radius: 50%;
    margin-left: 50px;
}
.box-header.with-border {
/*     border-bottom: 1px solid #f4f4f4; */
    text-align: center;
}
          
</style>
        
        
    </head>

<body>
        <!-- 標題列 -->
<!--         <section class="container-fluid" id="about"> -->
<!--             <div id="wrapper"> -->
                <!-- Sidebar -->
<!--                 <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation"> -->
<!--                     <ul class="nav sidebar-nav"> -->
<!--                         <li class="sidebar-brand"> -->
<!--                             <a href="#"> </a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="../index.jsp">Home</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="../_07_fundsFrame/funds.jsp">募資大廳</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#">商城系統</a> -->
<!--                         </li> -->
<!--                         <li class="dropdown"> -->
<!--                             <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉 <span class="caret"></span></a> -->
<!--                             <ul class="dropdown-menu" role="menu"> -->
<!--                                 <li class="dropdown-header">下拉標題</li> -->
<!--                                 <li><a href="#">副選單一</a></li> -->
<!--                                 <li><a href="#">副選單二</a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </nav> -->
                <!-- #sidebar-->
<!--                 <div class="row"> -->
                    <!-- Modal -->
                    <div class="container-fluid">
                        <div class="row content">
                           <div class="col-md-9 col-xs-9">
                            <div class="box-header with-border">
<!-- 					        	<h2 class="box-title">創作者主頁</h2> -->
                                <img src="${context}/images/words/CreationsWord1s.png" >

					       	</div>
                                <div class="BH-lbox MSG-box5">
                                    <div class="HOME-mainbox1">
                                        <!--內容開始-->
                                        <div class="row">
                                       
                                            <h2>作品</h2>
                                       									
                                            <div class="box-body">
							                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							                    <ol class="carousel-indicators">
							                      <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
							                      <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
							                      <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
							                    </ol>
							                    <div class="carousel-inner">
							                      <div class="item" align ="center">
							
													<img src="${context}/images/Creations/8.jpg" alt="First slide" width=100%>
							                        <div class="carousel-caption">
							                          	
							                        </div>
							                      </div>
							                      <div class="item active" align ="center" >
							                        <img src="${context}/images/Creations/5.jpg" alt="Second slide" width=100%> 
							                        <div class="carousel-caption">
							                          	
							                        </div>
							                      </div>
							                      <div class="item" align ="center">
														<img src="${context}/images/Creations/7.jpg" alt="Third slide" width=100%>
							                        <div class="carousel-caption">
							                           	 
							                        </div>
							                      </div>
							                  
							                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							                      <span class="fa fa-angle-left"></span>
							                    </a>
							                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							                      <span class="fa fa-angle-right"></span>
							                    </a>
							                  </div>
							                </div>
<!-- 							                /.box-body -->
							              </div>
<!-- 							              /.box -->
							             </div>
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6" id="sp_pro_id" > -->
<!--                                             <a href="#pro_id"> -->
<!--                                             <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/1.jpg" class="img-thumbnail" width=100% height=80% title=""></a> </div> -->
<!-- 												<p> <a href="CreationsPage3.jsp"><h5>作品1</h5></a> --> 
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
                                        </div>
                                        <div class="row" id = "products">                                            
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                        </div>
                                        <div class="row" id ="funds">
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"> -->
<!--                                             <img src="http://saudade.myasustor.com/JPjt/fc_pic_address/2.jpg" width=50% title=""></div> -->
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
<!--                                             <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div> -->
                                         </div>

                                    </div>
                                </div>
                          
                            
                            <div class="col-md-3 col-xs-3">
                        	  <input id="art_id" value="<c:out value ="${ab.art_id}"/>" type="hidden"/>
                                <ul class="nav nav-pills nav-stacked"> 								
										<li><a href="javascript:;">作者資訊</a>
												<img src = "<c:out value ="${mb.file_name}"/>" class ="img-circle" width="100" height="100"/>
											 <li>
												<ul class="MSG-mydata1">
													<li id="artUserName"><c:out value ="${mb.user_name}"/><span class="user_name "></span></li>
													<input id="user_id" value="<c:out value ="${mb.user_id}"/>" type="hidden"/>														
														<a href="pic_address 簡介圖片位址">
													<img src="<c:out value ="${ab.file_name}"/>" class="pic_id 簡介圖片編號" width ="150px"></a>
												</ul>
											 </li>
												<div>
													<font color="red" size="-1">${MsgMap.errorIntroPic}</font>
												</div>										
										</li>
                                                                       
											<li><a href="#section3">${ab.introduction}</a></li>
                                                              
										
										<!--Facebook-->
										<button type="button" class="btn btn-fb">
										<i class="fa fa-facebook left"></i> 
										Facebook</button>
										<!--Google +-->
										<button type="button" class="btn btn-gplus">
										<i class="fa fa-google-plus left"></i> 
										Google +</button>
										<!--Twitter-->
										<button type="button" class="btn btn-tw">
										<i class="fa fa-twitter left"></i> 
										Twitter	</button>
										<br><br>
										<c:if test="${LoginOK != null}">     
										 <c:if test ="${account == mb.account}">                      
<!-- 											<input type="button" value="新增作品" name="新增" style="width:100px;height:30px;"> -->
											<button id="create-product">新增商品</button><br>
											<br>
											<br>
									        <button id="create-funds">新增募資</button>                                
										 </c:if>
										</c:if>	
										<c:choose>
										<c:when test="${LoginOK == null}"> 
									<li><a href="${context}/_02_login/login.jsp"><i class="fa fa-fw fa-commenting-o" id="msgsys"></i>訪客留言</a></li>
                                		</c:when>
                                		<c:otherwise>
                                	<li><a href="javascript:;" id="msgsys"><i class="fa fa-fw fa-commenting-o" id="msgsys"></i>訪客留言</a></li>
                                		</c:otherwise>
                                		</c:choose>
                                </ul><br>
                         </div>


  <script src="${context}/js/default.js"></script>                          
  <script>
	var funds_content = '<h2>募資</h2>';
	var funds_len = 0;
	var products_content = '<h2>商品</h2>';
	var prods_len = 0;
	var ctx_content = '';
	$(document).ready(function(){
			//讀取art_id
			var id = $('#art_id').val();
			$.ajax({
				  //得到所有該artist的募資計畫 01 ArtToFunds Servlet
				  url: "\_07_funds\\allFundsByArtist.json",
				  type: "GET", 
				  async: false,
				  data: { 
				    "art_id":id, 
				  },
				  success: function(responsefunds) {
					  funds_content = '<h2>募資</h2>' ;
					  funds_len = 0;
					  funds_len = responsefunds.length;
					  $("#funds").empty();
					  for(var i=0; i < funds_len ; i++){
						  funds_content += '<div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">';
						  $.ajax({
							url: "\_07_funds\\singleFcPic.json",
							type: "GET",
							async: false,
							data: {
								"fc_id": responsefunds[i].fc_id,
							},
							success: function(resFcAdrs){
								//套上簡介圖片
								funds_content += '<a href = "javascript:;"><img src = "' + resFcAdrs[0].fc_adress; 
								//套上img-link跟ip_fc_id
								funds_content += '" class="img-thumbnail img-link" width=90% height=50%  title="" id ="ip_fc_id'+ responsefunds[i].fc_id +'"></a>';
							}
						  })
						  //end of ajax-fcAdr
						  funds_content += "</div>"; 
					  }
					  //end of for-fBA
					  var divp = document.getElementById("funds");
					  divp.innerHTML = funds_content;
				  },
				  error: function(xhr2) {
				    xhr2.abort();
				  }
			});
			//生成商品
			$.ajax({
				  //得到所有該Artist的商品 01 ArtistToProducts Servlet
				  url: "\_08_product\\allProductsByArtist.json",
				  type: "GET", 
				  async: false,
				  data: { 
				    "art_id":id, 
				  },
				  success: function(responseProducts) {
					  products_content = '<h2>商品</h2>';
					  prods_len = 0;
					  $("#products").empty();
					  prods_len = responseProducts.length;
					  for(var i=0; i < prods_len ; i++){
						  products_content += '<div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">';
						  $.ajax({
							url: "\_08_product\\singlepropic.json",
							type: "GET",
							async: false,
							data: {
								"pro_id": responseProducts[i].pro_id,
							},
							success: function(resProAdrs){
								//套上簡介圖片
								products_content += '<a href = "javascript:;"><img src = "' + resProAdrs[0].pic_adress; 
								//套上img-link跟ip_pro_id
								products_content += '" class="img-thumbnail img-link" width=90% height=50% title="" id ="ip_pro_id'+ responseProducts[i].pro_id +'"></a>';
							}
						  })
						  //end of ajax-ProAdr
						  products_content += "</div>"; 
					  }
					  //end of for-pBA
					  console.log("這是長度");
					  console.log(responseProducts.length);
					  var divpr = document.getElementById("products");
					  divpr.innerHTML = products_content;
					  console.log(products_content);
				  },
				  error: function(responseProductsErr) {
					  responseProductsErr.abort();
				  }
			});
            $("#create-product").click(function(){
                $.ajax({
                    url:"\_12_Product_Create\\Product_Create_NEW.jsp",
                    context: document.body,
                    success: function(responseProAll){
                        $("#mainframe").empty();
                        $('#mainframe').html(responseProAll);
                        $(".mainfooter").empty();
                  }
                });
              });
         $("#create-funds").click(function(){
                $.ajax({
                    url:"\_10_Fc_Create\\Fc_Create_NEW.jsp",
                    context: document.body,
                    success: function(responseProAll){
                        $("#mainframe").empty();
                        $('#mainframe').html(responseProAll);
                        $(".mainfooter").empty();
                  }
                });
              });
			//讀取作者暱稱
			var user_id = $('#user_id').val();
			$("#msgsys").click(function(){
				$.ajax({
					  url: "\_06_mailbox\\messageReply.do",
					  type: "GET", 
					  async: false,
					  data: { 
					    "r_user_id":user_id,
					  },
					  success: function(responseMsg) {
						$("#mainframe").empty();
		  				$('#mainframe').html(responseMsg);
					  },
					  error: function(responseMsgErr) {
						  responseMsgErr.abort();
					  }
				});
			})
	
	})
    </script>
<!--                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--                     <script src="asset/js/bootstrap.min.js"></script> -->
    
<!--         </section> -->
    </body>

    </html>