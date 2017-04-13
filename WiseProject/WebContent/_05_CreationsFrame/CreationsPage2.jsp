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
                                <div class="BH-lbox MSG-box5">
                                    <div class="HOME-mainbox1">
                                        <!--內容開始-->
                                        <div class="row">
                                            <h2>作品</h2>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6" id="sp_pro_id" >
                                            <a href="#pro_id">
                                            <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/1.jpg" class="img-thumbnail" width=90% height=50% title=""></a> </div>
<!--                                             <p> <a href="CreationsPage3.jsp"><h5>作品1</h5></a> -->
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                        </div>
                                        <div class="row" id = "products">                                            
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                            <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/17.jpg" class="img-thumbnail" width=60% height=50% title=""> 
                                            </div>
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
                            </div>
                            
                            <div class="col-md-3 col-xs-3">
                            <h4>創作者 Blog</h4><input id="art_id" value="<c:out value ="${ab.art_id}"/>" type="hidden"/>
                                <ul class="nav nav-pills nav-stacked">
<!-- 										<li class="active"><a href="Creations.jsp">創作平台</a></li> -->
											 <li><a href="#section2">作者資訊</a>
												<img src = "<c:out value ="${mb.file_name}"/>" class ="img-circle" width="100" height="100"/>
											 <li>
												<a href="pic_address 簡介圖片位址">
													<img src="<c:out value ="${ab.file_name}"/>" class="pic_id 簡介圖片編號" width ="150px"></a>
												<ul class="MSG-mydata1">

													<li>暱稱：<c:out value ="${mb.user_name}"/><span class="user_name "></span></li>
<!-- 														<li>暱稱：<span class="user_name ">會員暱稱</span></li> -->
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
										<c:if test="${(LoginOK != null ) && (LoginOK.check_tag = true) && (account == mb.account)}">                       
<!-- 											<input type="button" value="新增專案" name="新增" style="width:100px;height:30px;"> -->
											<button><a href="${context}/_12_Product_Create/Product_Create NEW.jsp">新增商品</a></button><br>
											<br>
											<button><a href="${context}/_10_Fc_Create/Fc_Create NEW.jsp">新增募資</a></button>								
										</c:if>	
									<li><a href="#section3"><i class="fa fa-fw fa-commenting-o"></i>訪客留言</a></li>
                                </ul><br>
                         </div>
<!--                             <div class="col-md-3 col-xs-3"> -->
<!--                                 <h4>創作者 Blog</h4> -->
<!--                                 <ul class="nav nav-pills nav-stacked"> -->
<!--                                     <li class="active"><a href="Creations.jsp">創作平台</a></li> -->
<!--                                     <li> -->
<!--                                         <a href="pic_address 簡介圖片位址"> -->
<%--                                             <img src="${context}/images/picture.png" class="pic_id 簡介圖片編號"></a> --%>
<!--                                         <ul class="MSG-mydata1"> -->
<!-- <!--                                             <li>帳號：<span class="r_user_id ">創作者編號</span></li> --> 
<!--                                             <li>暱稱：<span class="user_name ">會員名稱</span></li> -->
<!--                                         </ul> -->
<!--                                     </li> -->
<!--                                     </a> -->
<!--                                     </li> -->
<!--                                     <li><a href="#section3"><i class="fa fa-fw fa-commenting-o"></i>訪客留言</a></li> -->
<!--                                     <li><a href="#section3">相關...</a></li> -->
<!--                                 </ul><br> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

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
					  funds_len = responsefunds.length;
					  console.log(funds_len);
					  console.log("V-V-V上方為長度");
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
								funds_content += '<a href = "#"><img src = "' + resFcAdrs[0].fc_adress; 
								//套上img-link跟ip_fc_id
								funds_content += '" class="img-thumbnail img-link" width=90% height=50% title="" id ="ip_fc_id'+ responsefunds[i].fc_id +'"></a>';
							}
						  })
						  //end of ajax-fcAdr
						  funds_content += "</div>"
					  }
					  //end of for-fBA
					  var divp = document.getElementById("funds");
					  divp.innerHTML = funds_content;
					  console.log(funds_content);
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
								products_content += '<a href = "#"><img src = "' + resProAdrs[0].pic_adress; 
								//套上img-link跟ip_pro_id
								products_content += '" class="img-thumbnail img-link" width=90% height=50% title="" id ="ip_pro_id'+ responseProducts[i].pro_id +'"></a>';
							}
						  })
						  //end of ajax-ProAdr
						  products_content += "</div>"
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
			
			
	})
    </script>
<!--                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--                     <script src="asset/js/bootstrap.min.js"></script> -->
    
<!--         </section> -->
    </body>

    </html>