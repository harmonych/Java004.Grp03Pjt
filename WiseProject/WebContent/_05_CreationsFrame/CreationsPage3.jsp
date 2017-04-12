<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
	<c:set var="context" value="${pageContext.request.contextPath}" />
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	    <link rel="stylesheet" href="${context}/asset/css/bootstrap.min.css">
	    <link rel="stylesheet" href="${context}/css/Creations_page3.css">
	    <!--換圖片-->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script>
	        $(function() {
	
	            $("#selections").find('img').bind("click", function() {
	                var src = $(this).attr("src");
	                // 把src抓到的當前url值帶入
	                $(this).attr("src", src);
	                //把當前的元素砍掉
	                $(".showbox").children('img').remove();
	                //增加新url在showbox這class下面
	                $(".showbox").append('<img src="' + $(this).attr('src') + '">');
	            });
	
	        });
	    </script>
	    <!--換圖片結束-->
	    
	    
	    <title>創作作品</title>

	</head>


<body>
    <!-- 標題列 -->
<!--     <header class="container-fluid"> -->

<!--         <nav class="navbar navbar-default navbar-fixed-top"> -->
<!--             <div id="page-content-wrapper"> -->
<!--                 <button type="button" class="hamburger is-closed" data-toggle="offcanvas"> -->
<!-- 				<span class="hamb-top"></span> -->
<!-- 				<span class="hamb-middle"></span> -->
<!-- 				<span class="hamb-bottom"></span> -->
<!-- 			</button> -->
<!--             </div> -->

<!--             <div class="btn-toolbar"> -->

<!--                 <div class="navbar-header"> -->
<!--                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> -->
					
<!-- 					<span class="icon-bar"></span> -->
<!-- 					<span class="icon-bar"></span> -->
<!-- 					<span class="icon-bar"></span> -->
<!-- 				</button> -->
<!--                     <a class="navbar-brand textup" href="#"></a> -->
<!--                 </div> -->

<!--                 <div class="collapse navbar-collapse" id="myNavbar"> -->

<!--                     <ul class="nav navbar-nav navbar-right"> -->

<%--                        <li class="username"><span>${userName}</span></li> --%>
<!--                         <li><a href="#">登入</a></li> -->
<!--                         <li><a href="#">註冊</a></li> -->
<!--                     </ul> -->


<!--                 </div> -->
<!--             </div> -->
<!--         </nav> -->
<!--     </header> -->
    <section class="container-fluid" id="about">
<!--         <div id="wrapper"> -->
            <!-- Sidebar -->

<!--             <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation"> -->
<!--                 <ul class="nav sidebar-nav"> -->
<!--                     <li class="sidebar-brand"> -->
<!--                         <a href="#"> </a> -->
<!--                     </li> -->

<!--                     <li> -->
<!--                         <a href="CreationsPage2.jsp">創作者</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                       <a href="../_07_fundsFrame/funds.jsp">募資平台</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">作品商城</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">購物車</a> -->
<!--                     </li> -->
<!--                     <li class="dropdown"> -->
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉 <span class="caret"></span></a> -->
<!--                         <ul class="dropdown-menu" role="menu"> -->
<!--                             <li class="dropdown-header">下拉標題</li> -->
<!--                             <li><a href="#">副選單一</a></li> -->
<!--                             <li><a href="#">副選單二</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->

<!--                 </ul> -->
<!--             </nav> -->
            <!-- #sidebar-->
<!--             <div class="row"> -->
                <!-- Modal -->
                <div class="container-fluid">
                    <div class="row content">
                        <div class="col-md-9 col-xs-9">
                            <div class="BH-lbox MSG-box5">
                                <div class="HOME-mainbox1">
                                    <!--內容開始-->

                                    <!--Card Light-->
                                    <div class="card">

                                        <div class="showbox" style="width:500px height:200px"><img id="show-image" src="http://saudade.myasustor.com/JPjt/pro_pic_address/1.jpg" style="opacity: 1;"></div>
										<a>
											<div class="pic_address" id ="selections">
												<img src="http://saudade.myasustor.com/JPjt/pro_pic_address/2.jpg" title="">
												<img src="http://saudade.myasustor.com/JPjt/pro_pic_address/5.jpg" title="">
												<img src="http://saudade.myasustor.com/JPjt/pro_pic_address/9.jpg" title="">
												<br clear="all">
											</div>
										</a>

                                        <p>
                                            <h4 class="card-title">作品標題</h4>
                                        </p>
                                        <!--Card image-->
                                        <!--  <div class="view overlay hm-white-slight">
													<img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%2851%29.jpg" class="img-fluid" alt="">
													
												</div> -->
                                        <!--/.Card image-->
                                        <!--Card content-->
                                        <div class="card-block">
                                            <!--Social shares button-->
                                            <a class="activator"><i class="fa fa-share-alt"></i></a>
                                            <!--Title-->

                                            <hr>
                                            <!--Text-->
                                            <p class="card-text">作品介紹</p>
                                            <input type="text" name="pro_introduction" value=" ">
                                            <a href="#" class="black-text d-flex flex-row-reverse">
                                                <h5 class="waves-effect p-2">Read more <i class="fa fa-chevron-right"></i></h5>
                                            </a>
                                        </div>
                                        <!--/.Card content-->
                                    </div>
                                    <!--/.Card Light-->


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

<%-- 													<li>暱稱：<span class="user_name ">會員暱稱${LoginOK.user_name}</span></li> --%>
														<li>暱稱：<span class="user_name ">會員暱稱</span></li>
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
											<button><a href="${context}">新增作品</a></button><br>
											<br>
											<button><a href="${context}/_12_Product_Create/Product_Create.jsp">新增商品</a></button>	<br>
											<br>
											<button><a href="${context}/_10_Fc_Create/Fc_Create.jsp">新增募資</a></button>	
										 </c:when>
	              				        </c:choose>
	              				        
									<li><a href="#section3"><i class="fa fa-fw fa-commenting-o"></i>訪客留言</a></li>
                                </ul><br>
                         </div>
                      	
                      
<!--                         <div class="col-md-3 col-xs-3"> -->
<!--                             <h4>創作者 Blog</h4> -->
<!--                             <ul class="nav nav-pills nav-stacked"> -->
<!-- <!--                                 <li class="active"><a href="Creations.jsp">Home</a></li> --> 
<!--                                 <li><a href="#section2">作者資訊</a> -->
<!--                                 <div id ="main"> -->
<!-- <!--                                 <ul class="MSG-mydata1"> --> 
<!-- <!-- 			                                <label class="fontSize" >大頭貼照：</label>  -->
<!-- <!-- 			      							<Input Type="file" size="40" class="fieldWidth" style="width: 400px;"  name="portrait"><BR> 
<!-- <!--                                             <li>帳號：<span class="r_user_id ">創作者編號</span></li>  -->
<%-- <%--                                             <input type="text" name="account" value="${param.account}" class="fieldWidth" maxlength="20" style="width: 200px" >  --%>
<!-- <!--                                             <li>暱稱：<span class="user_name ">會員名稱</span></li>  -->
<%-- <%--                                             <input type="text" name="user_name" value="${param.user_name}"  class="fieldWidth" maxlength="20" style="width: 200px;">  --%>
                                        
<!-- <!--                                           <a href="pic_address 簡介圖片位址"> --> 
<%-- <%--                                             <img src="${context}/images/picture.png" class="pic_id 簡介圖片編號"></a> --%> 
<!-- <!--                                         <ul class="MSG-mydata1"> --> 
<!-- <!--                                             <li>帳號：<span class="r_user_id ">創作者編號</span></li> -->
<%--                                             <li>暱稱：<span class="user_name ">${LoginOK.user_name}</span></li> --%>
<!-- <!--                                         </ul> --> 
<!-- <!--                                         </ul> --> 
                                    
<!--                                     <div> -->
<!-- <!--                                     	  <label class="fontSize" >作者簡介：</label><br> --> 
<!-- <!-- 									      <textarea name="Introduction" rows="5" cols="20" class="fieldWidth" maxlength="500"></textarea> --> 
<!-- <!-- 									      <br/> --> 
									 
<!-- <!-- 									      <label class="fontSize" >*簡介圖片：</label> --> 
<!-- <!-- 									      <Input Type="file" size="40" class="fieldWidth" style="width: 400px;"  name="intro_pic"> --> 
<%-- 									      <font color="red" size="-1">${MsgMap.errorIntroPic}</font> --%>
<!--                                     </div> -->
<!--                                 </li> -->
<!-- <!--                                 <li><a href="#section3"><i class="fa fa-fw fa-commenting-o"></i>訪客留言</a></li> --> 
<!-- <!--                                 <input type="text" name="intro_pic" value=" "> --> 
                                
<%--                                 <li><a href="#section3">創作者相關資訊${IsArtist.introduction}</a></li> --%>
<!--                                 Facebook -->
<!--                                 <button type="button" class="btn btn-fb"><i class="fa fa-facebook left"></i> Facebook</button> -->
<!--                                 Twitter -->
<!--                                 <button type="button" class="btn btn-tw"><i class="fa fa-twitter left"></i> Twitter</button> -->
<!--                                 Google + -->
<!--                                 <button type="button" class="btn btn-gplus"><i class="fa fa-google-plus left"></i> Google +</button> -->


<!--                             </ul><br> -->

<!--                         </div> -->

                    </div>
                </div>
<script>
				var xhr = new XMLHttpRequest();
				xhr.open("GET",  '.json', true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var funds = JSON.parse(xhr.responseText);
						var content = '<div>' + Artist[0].user_name+'</div>';
// 						content +='<li>'暱稱：'<span class="user_name ">${LoginOK.user_name}</span></li>
 	 					content +=  '<div>'+ Artist[0].introduction   +'</div>';
	 					content +=  "<img src='"+ Artist[0].fc_address +"'/>";
					    console.log(funds);
						
					}
					var divs = document.getElementById("main");
					divs.innerHTML = content;
				}	
			
			
			
			

</script>
<!-- 	<script src="../asset/js/bootstrap.min.js"></script> -->
	<script src="${context}/js/default.js"></script>
    </section>
</body>

</html>