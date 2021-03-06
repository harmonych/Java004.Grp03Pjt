﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>

    <head>
	  <c:set var="context" value="${pageContext.request.contextPath}" />
	  <c:set var="userName" value="${LoginOK.user_name}" />
	  <c:set var="userId" value="${LoginOK.user_id}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />
      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Wise彙思創作募資</title>
      <link rel="stylesheet" href="css/index.css">
      <!-- Tell the browser to be responsive to screen width -->     
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

      <!-- <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"> -->
      <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
      
	<link rel="stylesheet" href="${context}/plugins/iCheck/flat/blue.css">

      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
      <style>
        .logo img {
          width: 50px;
          height: 35px;
        }
        
        .carousel-inner {
			height: 100%; 
 		}
 		.img {
 			max-width: 100%;
            height: auto;
        }
        .navbar-form{
          display: inline-flex;
        }
/*      側邊欄判斷螢幕視窗,變動選項欄位 */
		@media screen and (max-width: 766px) {
	  		.skin-yellow-light .sidebar-menu>li.header {
		   		 padding: 40px;
			    }
			.user-panel{
				 padding-top: 80px;
			
				}
		}
		.fa{
			color:gray;
		}
		.box-title{
			font-family:Microsoft JhengHei;
			font-weight:bloder;
		}
		skin-yellow-light .sidebar-menu>li:hover>a, 
			.skin-yellow-light .sidebar-menu>li.active>a {
		    color: #000;
		    background: rgba(102, 102, 102, 0.2);
		}

		.skin-yellow-light .wrapper, .skin-yellow-light .main-sidebar, 
			.skin-yellow-light .left-side {
		    background-color: rgba(243, 156, 18, 0.4);
		}

		.skin-yellow-light .sidebar-menu>li.header {
		    color: #848484;
		    background: rgba(243, 156, 18, 0);
		
		} 
      </style>
    </head>
    <!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

  <body class="hold-transition skin-yellow-light sidebar-mini ">
    <div class="wrapper">

        <!-- Main Header -->
        <header class="main-header">

          <!-- Logo -->
          <a href="index.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><img src="image/logo-tw-1.png" alt="minilogo"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img src="image/logo-tw.png" alt="normallogo"></span>
          </a>

          <!-- Header Navbar -->
          <nav class="navbar navbar-static-top" role="navigation">
           <!-- search form (Optional) -->
<!--             <form action="#" method="get" class="navbar-form"> -->
<!--               <div class="input-group"> -->
<!--                 <input type="text" name="q" class="form-control" placeholder="Search..."> -->
<!--                 <span class="input-group-btn"> -->
<!--                 <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> -->
<!--                 </button> -->
<!--               </span> -->
<!--               </div> -->
<!--             </form> -->
			  <form class="navbar-form" role="search">
			    <div class="input-group">
                    <input type="text" class="form-control icon-search" id="search" name="search" placeholder="Search">
                    <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	                </button>
	               </span>
	              </div>
                </form>
            <!-- /.search form -->
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
              <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
              <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
               <c:choose>
              	<c:when test="${!empty LoginOK}">
                <li class="dropdown messages-menu">
                  <!-- Menu toggle button -->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-envelope-o"></i>
                    <span class="label label-success">1</span>
                  </a>
                  <ul class="dropdown-menu">
                    <li class="header">You have 1 messages</li>
                    <li>
                      <!-- inner menu: contains the messages -->
                      <ul class="menu">
                        <li>
                          <!-- start message -->
                          <a href="#">
                            <div class="pull-left">
                              <!-- User Image -->
                              <!-- 留言系統代入留言者頭像及資料 -->                      
                              <img src="image/logo-tw.png" class="img-circle" alt="User Image">
                            </div>
                            <!-- Message title and timestamp -->
                            <h4>
                              彙思
<!--                               <small><i class="fa fa-clock-o"></i> 5 mins</small> -->
                            </h4>
                            <!-- The message -->
                            <p>彙思團隊歡迎您加入！</p>
                          </a>
                        </li>
                        <!-- end message -->
                      </ul>
                      <!-- /.menu -->
                    </li>
                    <li class="footer"><a href="javascript:;" id = "msg-sys-tog">觀看全部留言訊息</a></li>
                  </ul>
                </li>
                <input id="msg_user_id" value="<c:out value ="${LoginOK.user_id}"/>" type="hidden"/>
                  
                <!-- /.messages-menu -->
                </c:when>
               </c:choose>

                <!-- Notifications Menu -->
<%--              <c:choose> --%>
<%--               	<c:when test="${!empty LoginOK}"> --%>
<!--                 <li class="dropdown notifications-menu"> -->
                  <!-- Menu toggle button -->
<!--                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                     <i class="fa fa-bell-o"></i> -->
<!--                     <span class="label label-warning">10</span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="header">You have 10 notifications</li> -->
<!--                     <li> -->
                      <!-- Inner Menu: contains the notifications -->
<!--                       <ul class="menu"> -->
<!--                         <li> -->
                          <!-- start notification -->
<!--                           <a href="#"> -->
<!--                             <i class="fa fa-users text-aqua"></i> 5 new members joined today -->
<!--                           </a> -->
<!--                         </li> -->
                        <!-- end notification -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="footer"><a href="#">View all</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<%--               </c:when> --%>
<%--             </c:choose> --%>
                <!-- Tasks Menu -->
<%--                 <c:choose> --%>
<%--               	<c:when test="${!empty LoginOK}"> --%>
<!--                 <li class="dropdown tasks-menu"> -->
                  <!-- Menu Toggle Button -->
<!--                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                     <i class="fa fa-flag-o"></i> -->
<!--                     <span class="label label-danger">9</span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="header">You have 9 tasks</li> -->
<!--                     <li> -->
                      <!-- Inner menu: contains the tasks -->
<!--                       <ul class="menu"> -->
<!--                         <li> -->
                          <!-- Task item -->
<!--                           <a href="#"> -->
                            <!-- Task title and progress text -->
<!--                             <h3> -->
<!--                               Design some buttons -->
<!--                               <small class="pull-right">20%</small> -->
<!--                             </h3> -->
                            <!-- The progress bar -->
<!--                             <div class="progress xs"> -->
                              <!-- Change the css width attribute to simulate progress -->
<!--                               <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
<!--                                 <span class="sr-only">20% Complete</span> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                           </a> -->
<!--                         </li> -->
                        <!-- end task item -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="footer"> -->
<!--                       <a href="#">View all tasks</a> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </li> -->
<%--                 </c:when> --%>
<%--               </c:choose> --%>
                <!-- User Account Menu -->


                <c:choose>
                  <c:when test="${empty LoginOK}">
                    <li><a href="_02_login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
                  </c:when>
                  <c:when test="${!empty LoginOK}">
                    <li class="dropdown user user-menu">
                      <!-- Menu Toggle Button -->
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="${file_name}" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">${userName}</span>
                      </a>
                      <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                          <img src="${file_name}" class="img-circle" alt="User Image">

                          <p>
                            ${userName} 
                          </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                          <div class="row">
                            <div class="col-xs-4 text-center">
                              <a href="Javascript:" id="Follow">追蹤名單</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="javasript:;" id="sp_user_list">投資計畫</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="_15_ShoppingCart/ShoppingCart_List.jsp">購物車</a>
                            </div>
                          </div>
                          <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                          <div id="mid" class="mid">
                            <a href="${context}/_14_UserData/ModifyUserInfo.jsp" id="mid_bt" class="btn btn-default btn-flat">個人資料</a>
                          </div>
                          <c:if test = "${LoginOK.check_tag}" >
                          <div id="mid" class="mid" >
                          <input id="artId" name = "artId" value="<c:out value ="${IsArtist.art_id}"/>" type="hidden"/>
                            <a href="Javascript:;" class="btn btn-default btn-flat" id="sp-personal-page">個人主頁</a>
                          </div>
                          </c:if>
                          <div id="mid" class="mid">
                            <a href="${context}/_02_login/logout.jsp" id="mid_bt" class="btn btn-default btn-flat">登出</a>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </c:when>
                </c:choose>
                <c:choose>
                  <c:when test="${empty LoginOK}">
                    <li><a href="_01_register/register.jsp"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
                  </c:when>
                </c:choose>
                <!-- User Account Menu -->

                <!-- Control Sidebar Toggle Button -->
                <li>
                  <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
              </ul>
            </div>
          </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

          <!-- sidebar: style can be found in sidebar.less -->
          <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
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
		                <!-- Status -->
<!-- 		                <a href="#"><i class="fa fa-circle text-success"></i> 在線</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
              <li class="header"></li> <!-- HEADER -->
              <!-- Optionally, you can add icons to the links -->
<!--               <li class="treeview"> -->
<!--                 <a href="#"><i class="fa fa-fw fa-search"></i><span>搜尋系統</span> -->
<!-- 		            <span class="pull-right-container"> -->
<!-- 		              <i class="fa fa-angle-left pull-right"></i> -->
<!-- 		            </span> -->
<!--          		 </a> -->
<!--                 <ul class="treeview-menu"> -->
<!--                   <li><a href="#" class = "sp_search">創作者</a></li> -->
<!--                   <li><a href="#" class = "sp_search">商城作品</a></li> -->
<!--                   <li><a href="#" class = "sp_search">募集作品</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
              
              <li class = "sp_search"><a href="javascript:;" ><i class="glyphicon glyphicon-search"></i><span>搜尋系統</span></a></li>
              <li id = "sp-artist"><a href="javascript:;"><i class="glyphicon glyphicon-pencil"></i><span>創作平台</span></a></li>
              <li id = "sp-funds"><a href="javascript:;"><i class="glyphicon glyphicon-picture"></i><span>作品募資</span></a></li>
              <li id = "sp-product"><a href="javascript:;"><i class="glyphicon glyphicon-gift"></i><span>文創商城</span></a></li>
				
            </ul>
            <!-- /.sidebar-menu -->
          </section>
          <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" id = "mainframe">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <div class="row">
	            <div class="col-md-12">
	              <div class="box box-solid">
	                <div class="box-header with-border">
	                  <h3 class="box-title">加入彙思，讓你的創意被大家看見!</h3>
	                </div>
	                <!-- /.box-header -->
	                <div class="box-body">
	                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	                    <ol class="carousel-indicators">
	                      <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
	                      <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
	                      <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
	                    </ol>
	                    <div class="carousel-inner">
	                      <div class="item" align ="center">
	<!--                         <img src="http://img.91ddcc.com/ue_65828_1731.jpg" alt="First slide"> -->
							<img src="${context}/images/Creations/12.jpg" alt="First slide">
	                        <div class="carousel-caption">
	                          	新近作品
	                        </div>
	                      </div>
	                      <div class="item active" align ="center" >
	<!--                         <img src="http://saudade.myasustor.com/JPjt/fc_pic_address/2.jpg" alt="Second slide" > -->
	                        <img src="${context}/images/Creations/6.jpg" alt="Second slide" > 
	                       
	                        <div class="carousel-caption">
	                          	近期更新
	                        </div>
	                      </div>
	                      <div class="item" align ="center">
	<!--                         <img src="http://img10.3lian.com/d0214/file/2011/08/14/05a25b2ca462adafb8f6a258f8db2739.jpg" alt="Third slide"> -->
	 						<img src="${context}/images/Creations/11.jpg" alt="Third slide" >
	                        <div class="carousel-caption">
	                           	人氣最高
	                        </div>
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
	                <!-- /.box-body -->
	              </div>
	              <!-- /.box -->
	            </div>
	<!--             <ol class="breadcrumb"> -->
	<!--               <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li> -->
	<!--               <li class="active">Here</li> -->
	<!--             </ol> -->
          	</div>
          </section>

          <!-- Main content -->
<!--           <section class="content"> -->
<!--           Your Page Content Here -->
<!--           </section> -->
<!--           /.content -->
        
        
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
        <footer class="main-footer">
          <!-- To the right -->
          <div class="pull-right hidden-xs">
            	The Wise Choice.
          </div>
          <!-- Default to the left -->
          <strong>Copyright &copy; 2017 <a href="mailto:wisejava004@gmail.com">彙思</a>.</strong> All rights reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
          <!-- Create the tabs -->
          <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
          </ul>
          <!-- Tab panes -->
          <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
              <h3 class="control-sidebar-heading">最近活動</h3>
              <ul class="control-sidebar-menu">
                <li>
                  <a href="javascript:;">
<!--                     <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->

                    <div class="menu-info">
                      <h4 class="control-sidebar-subheading">募資計畫：機器人崛起 進行了更新</h4>

                      <p>on April 1st</p>
                    </div>
                  </a>
                </li>
              </ul>
              <!-- /.control-sidebar-menu -->

              <h3 class="control-sidebar-heading">參與計畫一覽</h3>
              <ul class="control-sidebar-menu">
                <li>
                  <a href="javascript:;">
                    <h4 class="control-sidebar-subheading">
                       	募資計畫：風景畫募資
                      <span class="pull-right-container">
                  <span class="label label-danger pull-right">70%</span>
                      </span>
                    </h4>

                    <div class="progress progress-xxs">
                      <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                    </div>
                  </a>
                </li>
              </ul>
              <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
              <form method="post">
                <h3 class="control-sidebar-heading">General Settings</h3>

                <div class="form-group">
                  <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

                  <p>
                    Some information about this general settings option
                  </p>
                </div>
                <!-- /.form-group -->
              </form>
            </div>
            <!-- /.tab-pane -->
          </div>
        </aside>
        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
      </div>
    <!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.2.3 -->
<!--     <script src="plugins/jQuery/jquery-2.2.3.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js" integrity="sha384-tIwI8+qJdZBtYYCKwRkjxBGQVZS3gGozr3CtI+5JF/oL1JmPEHzCEnIKbDbLTCer" crossorigin="anonymous"></script>
     
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
   	<script src="${context}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="${context}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE for demo purposes -->
<%-- 	<script src="${context}/dist/js/demo.js"></script> --%>
	<!-- iCheck -->
	
	<script src="${context}/plugins/iCheck/icheck.min.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="${context}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<%--     <script src="${context}\js\img-search.js?ver=1"></script> --%>
    
      <!-- Bootstrap 3.3.7 as Backup -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
      <script type="text/javascript">
      $(document).ready(function(){
    	  $("#sp-artist").click(function(){
      	    $.ajax({
  				url:"\_05_CreationsFrame\\Creations_All.jsp",
  				context: document.body,
  				success: function(responseCreatorAll){
  					$("#mainframe").empty();
  					$('#mainframe').html(responseCreatorAll);
//       	    	  $('.content-wrapper').append('<section class =".content-header"></section>');
  					$(".mainfooter").empty();
      	      }
      	    });
      	  })
    	  
    	  $("#sp-funds").click(function(){
      	    $.ajax({
  				url:"\_07_fundsFrame\\funds.jsp",
  				context: document.body,
  				success: function(responseFundsAll){
  					$("#mainframe").empty();
  					$('#mainframe').html(responseFundsAll);
  					$(".mainfooter").empty();
      	      }
      	    });
      	  });
          
	      $("#sp-product").click(function(){
	    	    $.ajax({
					url:"\_13_Product_info\\Product_All.jsp",
					context: document.body,
					success: function(responseProAll){
						$("#mainframe").empty();
						$('#mainframe').html(responseProAll);
						$(".mainfooter").empty();
	    	      }
	    	    });
	    	  });
	      $(".sp_search").click(function(){
		  	$.ajax({
				url:"\_08_ImgSearch\\img-search-page.jsp",
				context: document.body,
				success: function(responseImgSearch){
					$("#mainframe").empty();
					$('#mainframe').html(responseImgSearch);
					$(".mainfooter").empty();
		    	}
			});
		  });
	      $("#sp-personal-page").click(function(){
	    	  var artId = $('#artId').val();
	    	  console.log(artId);
			  	$.ajax({
					url:"\_05_CreationsFrame\\DisplayArtist?art_id=" + artId,
					context: document.body,
					success: function(responseRSS){
						$("#mainframe").empty();
						$('#mainframe').html(responseRSS);
						$(".mainfooter").empty();
			    	}
				});
		  });
	      $("#sp_user_list").click(function(){
	         	$.ajax({
                  url:"\_17_Fc_List\\Fc_List_User.jsp",
					context: document.body,
					success: function(responseUsL){
						$("#mainframe").empty();
						$('#mainframe').html(responseUsL);
						$(".mainfooter").empty();
			    	}
				});
		  });
	      var userId = $('#msg_user_id').val();
	      $("#msg-sys-tog").click(function(){
	    	  $.ajax({
				  url: "\_06_mailbox\\messageReceived.do?r_user_id=" + userId,
				  type: "GET", 
				  success: function(responseMsg) {
					$("#mainframe").empty();
					$('#mainframe').html(responseMsg);
				  },
				  error: function(responseMsgErr) {
					  responseMsgErr.abort();
				  }
			});
		  });
		});
	     $("#Follow").click(function(){
			  	$.ajax({
					url:"\_18_Follow_List\\Follow_List.jsp",
					context: document.body,
					success: function(responseFollow){
						$("#mainframe").empty();
						$('#mainframe').html(responseFollow);
						$(".mainfooter").empty();
			    	}
				});
	     })
	     
      </script>

   </body>

</html>