<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<c:set var="context" value="${pageContext.request.contextPath}" />
    <head>
    	<title>募資平台</title>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    	<link rel="stylesheet" href="${context}/css/funds_page.css">
	</head>
    

    <body>
        <!-- 標題列 -->
<!--         <header class="container-fluid"> -->
<!--             <nav class="navbar navbar-default navbar-fixed-top"> -->
<!--                 <div id="page-content-wrapper"> -->
<!--                     <button type="button" class="hamburger is-closed" data-toggle="offcanvas"> -->
<!-- 							<span class="hamb-top"></span> -->
<!-- 							<span class="hamb-middle"></span> -->
<!-- 							<span class="hamb-bottom"></span> -->
<!-- 							</button> -->
<!--                 </div> -->
<!--                 <div class="btn-toolbar"> -->
<!--                     <div class="navbar-header"> -->
<!--                         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> -->
<!-- 										<span class="icon-bar"></span> -->
<!-- 										<span class="icon-bar"></span> -->
<!-- 										<span class="icon-bar"></span> -->
<!-- 									</button> -->
<!--                         <a class="navbar-brand textup" href="#"></a> -->
<!--                     </div> -->
<!--                     <div class="collapse navbar-collapse" id="myNavbar"> -->
<!--                         <ul class="nav navbar-nav navbar-right"> -->
<!--                       		<li class="active"><a href="../index.jsp">Home</a></li> -->
<%--                             <li class="username"><span>${userName}</span></li> --%>
<!--                             <li><a href="#"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li> -->
<!-- 							<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </nav> -->
<!--         </header> -->
        <section class="container-fluid" id="about">
<!--             <div id="wrapper"> -->
<!--                 Sidebar -->
<!--                 <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation"> -->
<!--                     <ul class="nav sidebar-nav"> -->
<!--                         <li class="sidebar-brand"> -->
<!--                             <a href="#"> </a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="CreationsPage2.jsp">創作者</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="../_07_fundsFrame/funds.jsp">募資平台</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#">作品商城</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#">購物車</a> -->
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
                <div class="jumbotron">
                    <div class="container text-center">
                        <h1>募資平台</h1>
                        <p> </p>
                    </div>
                </div>
 <!-- Content Wrapper. Contains page content -->
        <div id ="main2">
<!--                 <div class="container-fluid bg-3 text-center"> -->
<!--                     <h3></h3><br> -->
<!--                     <p id="demo"></p> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div>fc_name</div> -->
<!-- 							<a href="#sp_fc_details" id="sp_fc_details"> -->
<!-- 							<img src="http://saudade.myasustor.com/JPjt/fc_pic_address/2.jpg" width=50% title=""></a> -->
<!-- 							<div class="info"> -->
<!--                                 <div class="owner">by<a href="#" target="_blank">MuMu</a></div> -->
<!--                                 <div class="crowd-mask-money money"><span class="label">總金額</span>
<!-- 														<span class="crowd-total"> </span></div> --> 
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div>fc_name</div> -->
<!--                             <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--                             <div class="info"> -->
<%--                                 <div class="owner">by<a href="${context}/_05_CreationsFrame/Creations.jsp" target="_blank">MuMu</a></div> --%>
<!--                                  <div class="crowd-mask-money money"><span class="label">總金額</span>
<!-- 														<span class="crowd-total"> </span></div> --> 
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div>fc_name</div> -->
<!--                             <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--                             <p>Some text..</p> -->
<%--                             <div class="owner">by<a href="${context}/_05_CreationsFrame/Creations.jsp" target="_blank">MuMu</a></div> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div><br> -->
<!--                 <div class="container-fluid bg-3 text-center"> -->
<!--                     <div class="row"> -->
<!--                     <script>  -->
<!-- //                             var xhr = new XMLHttpRequest(); -->
<!-- //                             xhr.open("GET", '\_07_funds\\allfunds.json', true); -->
<!-- //                             xhr.send(); -->
<!-- //                             xhr.onreadystatechange = function() { -->
<!-- //                                 if (xhr.readyState == 4 && xhr.status == 200) { -->
<!-- //                                     var content = "<table border='1'>"; -->
<!-- //                                     var funds = JSON.parse(xhr.responseText); -->
<!-- //                                     for (var i = 0; i < funds.length; i++) { -->
<!-- //                                         content += "<tr><td>" + funds[i].fc_id + "</td>"; -->
<!-- // //                                         	           "<td>" + funds[i].art_id + "</td>" + -->
<!-- // //                                     	               "<td>" + funds[i].fc_name + "</td>" + -->
<!-- // //                                         	           "<td>" + funds[i].fc_money + "</td>";  -->
<!-- //                                         "</tr>"; -->
<!-- //                                     } -->
<!-- //                                     content += "</table>"; -->
<!-- //                                     var divs = document.getElementById("somedivS"); -->
<!-- //                                     divs.innerHTML = content; -->
<!-- //                                 } -->
<!-- //                             } -->
<!--                          </script>  -->
<!--                         <div class="col-sm-4"> -->
<!--                             <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--                             <p>Some text..</p> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--                             <p>Some text..</p> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"> -->
<!--                             <p>Some text..</p> -->
<!--                         </div> -->
<!--                         <div id='somedivS'></div> -->

						
<!--                     </div> -->
                </div><br><br>
                       <div class="w3-bar">
                            <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
                            <a href="#" class="w3-bar-item w3-black w3-button">1</a>
                            <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
                            <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
                           
                            <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
                        </div>
<!--                 <div id="paging"> -->
<!-- 							以下為控制第一頁、前一頁、下一頁、最末頁 等超連結 -->
<!-- 							<table border="1"> -->
<!-- 							  <tr> -->
<!-- 							    <td width='76'> -->
<%-- 							        <c:if test="${pageNo > 1}"> --%>
<!-- 							           <div id="pfirst"> -->
<%-- 							              <a href="<c:url value='DisplayPageProducts?pageNo=1' />">第一頁</a> --%>
<%-- 							        </c:if> --%>
<!-- 							     </td> -->
<!-- 							     <td width='76'> -->
<%-- 							        <c:if test="${pageNo > 1}"> --%>
<!-- 							           <div id="pprev"> -->
<%-- 							              <a href="<c:url value='DisplayPageProducts?pageNo=${pageNo-1}' />">上一頁</a>&nbsp;&nbsp;&nbsp; --%>
<!-- 							           </div> -->
<%-- 							        </c:if>   --%>
<!-- 							     </td> -->
<!-- 							     <td width='76'> -->
<%-- 							            <c:if test="${pageNo != totalPages}"> --%>
<!-- 							                <div id="pnext"> -->
<%-- 							                   <a href="<c:url value='DisplayPageProducts?pageNo=${pageNo+1}' />">下一頁</a> --%>
<%-- 							            </c:if> --%>
<!-- 							     </td>   -->
<!-- 							     <td width='76'> -->
<%-- 							            <c:if test="${pageNo != totalPages}"> --%>
<!-- 							                <div id="plast"> -->
<%-- 							                    <a href="<c:url value='DisplayPageProducts?pageNo=${totalPages}' />">最末頁</a> --%>
<!-- 							                </div> -->
<%-- 							            </c:if> --%>
<!-- 							     </td> -->
<!-- 							     <td width='176' align="center"> -->
<%-- 							           第${pageNo}頁 / 共${totalPages}頁 --%>
<!-- 							     </td>   -->
<!-- 							</tr> -->
<!-- 							</table> -->
<!-- 							</div> -->
                </section>
                	
                <footer class="container-fluid text-center">
                    
                    <p> </p>
                </footer>
		
		<script	>
		
		var xhr = new XMLHttpRequest();
			xhr.open("GET", '\_07_funds\\allfunds.json', true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var funds = JSON.parse(xhr.responseText);
					var content = "<table border='1'>";
					var k = 6;
					for(var j =0  ; j <2 ; j++){
						content += '<div class="container-fluid bg-3 text-center"> <div class="row">';
						for(var i=0; i < 3; i++){
							content += '<div class="col-sm-4">';
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
					var divs = document.getElementById("main2");
					divs.innerHTML = content;
					console.log(content);
				}
			}
			  $("#sp_fc_info").click(function(){
		  		  $.ajax({
		  			  url:"\_11_Fc_info\\Fc_Info2.jsp",
		  			  context: document.body,
		  			  success: function(response){
		  				  $('#mainframe').html(response);
		  			  }
		  		  });
		  	  });
// 				var xhr = new XMLHttpRequest();
// 				xhr.open("GET", '\_07_funds\\singlefcpic.json', true);
// 				xhr.send();
// 				xhr.onreadystatechange = function() {
// 					if (xhr.readyState == 4 && xhr.status == 200) {
// 						var funds = JSON.parse(xhr.responseText);
// 						var content = '<div>' + funds[0].fc_id +'</div>';
// //  	 					content +=  '<div>'+ funds[i].pic_address +'</div>';
// 	 					content +=  "<img src='"+ funds[0].fc_adress +"'/>";
// 					    console.log(funds);
						
// 					}
// 					var divs = document.getElementById("main");
// 					divs.innerHTML = content;
// 				}	
			
			
			
			

</script>
    <script src="${context}/js/default.js"></script>

    </body>

    </html>