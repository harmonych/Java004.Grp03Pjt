<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<c:set var="context" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--       <link rel="stylesheet" href="../css/Fc_Create2.css"> -->
	<title>商品主頁</title>
<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
      <!-- <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"> -->
      <style>
        .logo img {
          width: 50px;
          height: 35px;
        }
     
        .carousel-inner .item img {
          max-height: 600px;
        }
        .navbar-form{
          	 display: inline-flex;
        }

        @media screen and (max-width: 766px) {
			.container .jumbotron, .container-fluid .jumbotron {
		     padding-top: 60px;
		    
			}
		}
			
		div.col-sm-4 {
			margin-bottom: 20px;
		}
		
		p {
		    margin: 0 0 10px;
		    text-align: center;
		}

      </style>
  </head>

<body>
<!--     <body class="hold-transition skin-yellow-light sidebar-mini "> -->
<%--       <c:set var="userName" value="${LoginOK.user_name}" /> --%>
<%--       <c:set var="file_name" value="${LoginOK.file_name}" /> --%>
<!--       <div class="wrapper"> -->

<!--         Main Header -->
<!--         <header class="main-header"> -->

<!--           Logo -->
<!--           <a href="../index.jsp" class="logo"> -->
<!--             mini logo for sidebar mini 50x50 pixels -->
<!--             <span class="logo-mini"><img src="../image/logo-tw-1.png" alt="minilogo"></span> -->
<!--             logo for regular state and mobile devices -->
<!--             <span class="logo-lg"><img src="../image/logo-tw.png" alt="normallogo"></span> -->
<!--           </a> -->

<!--           Header Navbar -->
<!--           <nav class="navbar navbar-static-top" role="navigation"> -->
<!--             search form (Optional) -->
<!--             <form action="#" method="get" class="navbar-form"> -->
<!--               <div class="input-group"> -->
<!--                 <input type="text" name="q" class="form-control" placeholder="Search..."> -->
<!--                 <span class="input-group-btn"> -->
<!--                 <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> -->
<!--                 </button> -->
<!--               </span> -->
<!--               </div> -->
<!--             </form> -->
<!--             /.search form -->
<!--             Sidebar toggle button -->
<!--             <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> -->
<!--               <span class="sr-only">Toggle navigation</span> -->
<!--             </a> -->
<!--             Navbar Right Menu -->
<!--             <div class="navbar-custom-menu"> -->
<!--               <ul class="nav navbar-nav"> -->
<!--                 Messages: style can be found in dropdown.less -->
<!--                 <li class="dropdown messages-menu"> -->
<!--                   Menu toggle button -->
<!--                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                     <i class="fa fa-envelope-o"></i> -->
<!--                     <span class="label label-success">4</span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="header">You have 4 messages</li> -->
<!--                     <li> -->
<!--                       inner menu: contains the messages -->
<!--                       <ul class="menu"> -->
<!--                         <li> -->
<!--                           start message -->
<!--                           <a href="#"> -->
<!--                             <div class="pull-left"> -->
<!--                               User Image -->
<!--                               留言系統代入留言者頭像及資料                       -->
<!--                               <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
<!--                             </div> -->
<!--                             Message title and timestamp -->
<!--                             <h4> -->
<!--                               Support Team -->
<!--                               <small><i class="fa fa-clock-o"></i> 5 mins</small> -->
<!--                             </h4> -->
<!--                             The message -->
<!--                             <p>Why not buy a new awesome theme?</p> -->
<!--                           </a> -->
<!--                         </li> -->
<!--                         end message -->
<!--                       </ul> -->
<!--                       /.menu -->
<!--                     </li> -->
<!--                     <li class="footer"><a href="#">See All Messages</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 /.messages-menu -->

<!--                 Notifications Menu -->
<!--                 <li class="dropdown notifications-menu"> -->
<!--                   Menu toggle button -->
<!--                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                     <i class="fa fa-bell-o"></i> -->
<!--                     <span class="label label-warning">10</span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="header">You have 10 notifications</li> -->
<!--                     <li> -->
<!--                       Inner Menu: contains the notifications -->
<!--                       <ul class="menu"> -->
<!--                         <li> -->
<!--                           start notification -->
<!--                           <a href="#"> -->
<!--                             <i class="fa fa-users text-aqua"></i> 5 new members joined today -->
<!--                           </a> -->
<!--                         </li> -->
<!--                         end notification -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="footer"><a href="#">View all</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 Tasks Menu -->
<!--                 <li class="dropdown tasks-menu"> -->
<!--                   Menu Toggle Button -->
<!--                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                     <i class="fa fa-flag-o"></i> -->
<!--                     <span class="label label-danger">9</span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="header">You have 9 tasks</li> -->
<!--                     <li> -->
<!--                       Inner menu: contains the tasks -->
<!--                       <ul class="menu"> -->
<!--                         <li> -->
<!--                           Task item -->
<!--                           <a href="#"> -->
<!--                             Task title and progress text -->
<!--                             <h3> -->
<!--                               Design some buttons -->
<!--                               <small class="pull-right">20%</small> -->
<!--                             </h3> -->
<!--                             The progress bar -->
<!--                             <div class="progress xs"> -->
<!--                               Change the css width attribute to simulate progress -->
<!--                               <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
<!--                                 <span class="sr-only">20% Complete</span> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                           </a> -->
<!--                         </li> -->
<!--                         end task item -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="footer"> -->
<!--                       <a href="#">View all tasks</a> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 User Account Menu -->


<%--                 <c:choose> --%>
<%--                   <c:when test="${empty LoginOK}"> --%>
<!--                     <li><a href="../_02_login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li> -->
<%--                   </c:when> --%>
<%--                   <c:when test="${!empty LoginOK}"> --%>
<!--                     <li class="dropdown user user-menu"> -->
<!--                       Menu Toggle Button -->
<!--                       <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                         The user image in the navbar -->
<%--                         <img src="${file_name}" class="user-image" alt="User Image"> --%>
<!--                         hidden-xs hides the username on small devices so only the image appears. -->
<%--                         <span class="hidden-xs">${userName}</span> --%>
<!--                       </a> -->
<!--                       <ul class="dropdown-menu"> -->
<!--                         The user image in the menu -->
<!--                         <li class="user-header"> -->
<%--                           <img src="${file_name}" class="img-circle" alt="User Image"> --%>

<!--                           <p> -->
<%--                             ${userName}  --%>
<!--                           </p> -->
<!--                         </li> -->
<!--                         Menu Body -->
<!--                         <li class="user-body"> -->
<!--                           <div class="row"> -->
<!--                             <div class="col-xs-4 text-center"> -->
<!--                               <a href="#">追蹤名單</a> -->
<!--                             </div> -->
<!--                             <div class="col-xs-4 text-center"> -->
<!--                               <a href="#">投資計畫</a> -->
<!--                             </div> -->
<!--                             <div class="col-xs-4 text-center"> -->
<!--                               <a href="#">訂購清單</a> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                           /.row -->
<!--                         </li> -->
<!--                         Menu Footer -->
<!--                         <li class="user-footer"> -->
<!--                           <div class="pull-left"> -->
<!--                             <a href="../_14_UserData/ModifyUserInfo.jsp" class="btn btn-default btn-flat">個人資料</a> -->
<!--                           </div> -->
<!--                           <div class="pull-right"> -->
<!--                             <a href="../_02_login/logout.jsp" class="btn btn-default btn-flat">登出</a> -->
<!--                           </div> -->
<!--                         </li> -->
<!--                       </ul> -->
<!--                     </li> -->
<%--                   </c:when> --%>
<%--                 </c:choose> --%>
<%--                 <c:choose> --%>
<%--                   <c:when test="${empty LoginOK}"> --%>
<!--                     <li><a href="../_01_register/register.jsp"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li> -->
<%--                   </c:when> --%>
<%--                 </c:choose> --%>
<!--                 User Account Menu -->

<!--                 Control Sidebar Toggle Button -->
<!--                 <li> -->
<!--                   <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </nav> -->
<!--         </header> -->
<!--         Left side column. contains the logo and sidebar -->
<!--         <aside class="main-sidebar"> -->

<!--           sidebar: style can be found in sidebar.less -->
<!--           <section class="sidebar"> -->

<!--             Sidebar user panel (optional) -->
<%--             <c:choose> --%>
<%--             	<c:when test="${empty LoginOK}"> --%>
<%--                 </c:when> --%>
<%--                 <c:when test="${!empty LoginOK}"> --%>
<!-- 		            <div class="user-panel"> -->
<!-- 		              <div class="pull-left image"> -->
<%-- 		                <img src="${file_name}" class="img-circle" alt="User Image"> --%>
<!-- 		              </div> -->
<!-- 		              <div class="pull-left info"> -->
<%-- 		                <p>${userName}</p> --%>
<!-- 		                Status -->
<!-- 		                <a href="#"><i class="fa fa-circle text-success"></i> 在線</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>


<!--             Sidebar Menu -->
<!--             <ul class="sidebar-menu"> -->
<!--               <li class="header">HEADER</li> -->
<!--               Optionally, you can add icons to the links -->
<!--               <li class="treeview"> -->
<!--                 <a href="#"><i class="fa fa-link"></i> <span>搜尋系統</span> -->
<!-- 		            <span class="pull-right-container"> -->
<!-- 		              <i class="fa fa-angle-left pull-right"></i> -->
<!-- 		            </span> -->
<!--          		 </a> -->
<!--                 <ul class="treeview-menu"> -->
<!--                   <li><a href="../_08_ImgSearch\img-search-page.html">創作者</a></li> -->
<!--                   <li><a href="../_08_ImgSearch\img-search-page.html">商城作品</a></li> -->
<!--                   <li><a href="../_08_ImgSearch\img-search-page.html">募集作品</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li id = "sp-artist"><a href="#sp-artist"><i class="fa fa-fw fa-paint-brush"></i><span>創作平台</span></a></li> -->
<!--               <li id = "sp-funds"><a href="#sp-funds"><i class="fa fa-fw fa-group"></i><span>作品募資</span></a></li> -->
<!--               <li id = "sp-product"><a href="#sp-product"><i class="fa fa-fw fa-gift"></i><span>文創商城</span></a></li> -->
				

<!--             </ul> -->
<!--             /.sidebar-menu -->
<!--           </section> -->
<!--           /.sidebar -->
<!--         </aside> -->
 		 <section class="container-fluid" id="about">	
 			<div class="jumbotron">
                    <div class="container text-center">
                        <h1>文創商城</h1>
                        <p> </p>
                    </div>
                </div>
        <!-- Content Wrapper. Contains page content -->
<!--         <div class="content-wrapper"> -->
          <!-- Content Header (Page header) -->
          <section class="content-header">
          </section>

          <!-- Main content -->
          <section class="content" id = "main">
          <!-- Your Page Content Here -->
				<div class="row">
                    	<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品1</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品2</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品3</p>
                        </div>
                     </div>
				<div class="row">
 						<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品4</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品5</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品6</p>
                        </div>
                 </div>
				<div class="row">
 						<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品7</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品8</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品9</p>
                        </div>
                 </div>


          </section>
          <!-- /.content -->
<!--         </div> -->
        <!-- /.content-wrapper -->

          <!-- To the right -->
<!--           <div class="pull-right hidden-xs"> -->
<!--             Anything you want -->
<!--           </div> -->
<!--           Default to the left -->
<!--           <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved. -->
<!--         </footer> -->

<!--         Control Sidebar -->
<!--         <aside class="control-sidebar control-sidebar-dark"> -->
<!--           Create the tabs -->
<!--           <ul class="nav nav-tabs nav-justified control-sidebar-tabs"> -->
<!--             <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li> -->
<!--             <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li> -->
<!--           </ul> -->
<!--           Tab panes -->
<!--           <div class="tab-content"> -->
<!--             Home tab content -->
<!--             <div class="tab-pane active" id="control-sidebar-home-tab"> -->
<!--               <h3 class="control-sidebar-heading">Recent Activity</h3> -->
<!--               <ul class="control-sidebar-menu"> -->
<!--                 <li> -->
<!--                   <a href="javascript:;"> -->
<!--                     <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->

<!--                     <div class="menu-info"> -->
<!--                       <h4 class="control-sidebar-subheading">Langdon's Birthday</h4> -->

<!--                       <p>Will be 23 on April 24th</p> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
              <!-- /.control-sidebar-menu -->

<!--               <h3 class="control-sidebar-heading">Tasks Progress</h3> -->
<!--               <ul class="control-sidebar-menu"> -->
<!--                 <li> -->
<!--                   <a href="javascript:;"> -->
<!--                     <h4 class="control-sidebar-subheading"> -->
<!--                       Custom Template Design -->
<!--                       <span class="pull-right-container"> -->
<!--                  		<span class="label label-danger pull-right">70%</span> -->
<!--                       </span> -->
<!--                     </h4> -->

<!-- 	                    <div class="progress progress-xxs"> -->
<!-- 	                      <div class="progress-bar progress-bar-danger" style="width: 70%"></div> -->
<!-- 	                    </div> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
              <!-- /.control-sidebar-menu -->

<!--             </div> -->
<!--             /.tab-pane -->
<!--             Stats tab content -->
<!--             <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div> -->
<!--             /.tab-pane -->
<!--             Settings tab content -->
<!--             <div class="tab-pane" id="control-sidebar-settings-tab"> -->
<!--               <form method="post"> -->
<!--                 <h3 class="control-sidebar-heading">General Settings</h3> -->

<!--                 <div class="form-group"> -->
<!--                   <label class="control-sidebar-subheading"> -->
<!--               Report panel usage -->
<!--               <input type="checkbox" class="pull-right" checked> -->
<!--             </label> -->

<!--                   <p> -->
<!--                     Some information about this general settings option -->
<!--                   </p> -->
<!--                 </div> -->
<!--                 /.form-group -->
<!--               </form> -->
<!--             </div> -->
<!--             /.tab-pane -->
<!--           </div> -->
<!--         </aside> -->
<!--         /.control-sidebar -->
<!--         Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
<!--         <div class="control-sidebar-bg"></div> -->
    
      <!-- ./wrapper -->
  </body>
  	<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		var k = 0;
		var pn = '';
		xhr.open("GET", '\_08_product\\allproduct.json', true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var products = JSON.parse(xhr.responseText);
				var content = '';
				console.log("this is products:");
				console.log(products);	
				for(var j =0  ; j <(products.length / 3) ; j++){
					content += '<div class="row">';
					for(var i=0; i < 3; i++){
						content += '<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal" >';
						content += '<a href="#" >';
						$.ajax({
							  url: "\_08_product\\singlepropic.json",
							  type: "GET", 
							  async: false,
							  data: { 
							    "pro_id": k+1, 
							  },
							  success: function(resProPica) {
								 //丟回針對pro_id的所有pic_address
								 pn = resProPica;
							  },
							  error: function(proPicErr) {
								 console.log(proPicErr);
								 console.log(pn);
							     proPicErr.abort();
							  }
						});	
						content += '<img src="'+ pn[0].pic_adress +'" class="img-thumbnail img-link" style="width:100%" id="ip_pro_id' + products[k].pro_id + '">';
// 						content += '<span>' + an + '</span></a></div>';
						content += '<p text-align = "center">' + products[k].pro_name + '</p>' + '</a></div>';   
						
						k++;
						if (k === products.length) break;
					}//end of inner-for-ajax
				
					content += '</div>';
				}//end of for-ajax
				console.log(content);
				var divs = document.getElementById("main");
				divs.innerHTML = content;
			}		
		};
	})

		
	</script>
	<script src="${context}/js/default.js"></script>

</html>