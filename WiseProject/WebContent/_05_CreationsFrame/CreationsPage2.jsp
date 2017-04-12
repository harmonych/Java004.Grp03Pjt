<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<c:set var="context" value="${pageContext.request.contextPath}" />
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
        <section class="container-fluid" id="about">
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
                                        <div class="row">
                                            <h2>商品</h2>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                            <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/17.jpg" class="img-thumbnail" width=60% height=50% title=""> 
                                            </div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                        </div>
<!--                                         <div class="row"> -->
                                        <div id ="funds">
                                         	<h2>募資</h2>
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
                            <h4>創作者 Blog</h4>
                                <ul class="nav nav-pills nav-stacked">
<!-- 										<li class="active"><a href="Creations.jsp">創作平台</a></li> -->
											 <li><a href="#section2">作者資訊</a>

											 <li>
												<a href="pic_address 簡介圖片位址">
													<img src="${context}/images/picture.png" class="pic_id 簡介圖片編號"></a>
												<ul class="MSG-mydata1">

													<li>暱稱：<span class="user_name ">會員暱稱${LoginOK.user_name}</span></li>
<!-- 														<li>暱稱：<span class="user_name ">會員暱稱</span></li> -->
												</ul>
											</li>
											
												<div>
													<font color="red" size="-1">${MsgMap.errorIntroPic}</font>
												</div>										
										</li>
                                                                       
											<li><a href="#section3">創作者相關資訊${IsArtist.introduction}</a></li>
										
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
										<c:choose>
										  <c:when test="${!empty LoginOK}">
<!-- 											<input type="button" value="新增專案" name="新增" style="width:100px;height:30px;"> -->
<%-- 											<a href="${context}/_12_Product_Create/Product_Create.jsp">新增作品</a> --%>
											<button><a href="${context}/_12_Product_Create/Product_Create.jsp">新增商品</a></button>	<br>
											<br>
											<button><a href="${context}/_10_Fc_Create/Fc_Create.jsp">新增募資</a></button>								
										 </c:when>
	              				        </c:choose>
              					 	 
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

                    <footer class="container-fluid">
                        <p></p>
                    </footer>
                    
<script>
			var xhr = new XMLHttpRequest();
			xhr.open("GET", '../_07_funds/allfunds.json', true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					var funds = JSON.parse(xhr.responseText);
					for(var i=0; i <4; i++){
						content += '<div class="container-fluid bg-3 text-center"> <div class="row">';
						for(var k=0; k < 4; k++){
							content += '<div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">';
							content += '<div>' + funds[k].fc_name +'</div>';
							content += '<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">';
							content +=  "<img src='"+ funds[k].pic_address +"'/>";
							content += '<div class="info"><div class="owner">by <a href="../_05_CreationsFrame/Creations.jsp" target="_blank">' + funds[i].art_id + ' </a></div><span class="crowd-total"> </span></div></div>';    
							k++;
						}
					
						content += '</div></div>'; 
					}
					
					content +='</table>';
					console.log(k);
					var divs = document.getElementById("funds");
					divs.innerHTML = content;
 					console.log(content);
				}
			}
 </script>
<!--                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--                     <script src="asset/js/bootstrap.min.js"></script> -->
                    <script src="${context}/js/default.js"></script>
        </section>
    </body>

    </html>