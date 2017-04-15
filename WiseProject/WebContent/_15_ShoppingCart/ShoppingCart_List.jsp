<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="../css/ShoppingCart_List.css">
	  <title>購物車清單</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <!-- Bootstrap 3.3.6 -->
      <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
      <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
      <!-- <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"> -->
      <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

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
        
        .carousel-inner .item img {
          max-height: 600px;
        }
        .navbar-form{
          display: inline-flex;
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
      <c:set var="userName" value="${LoginOK.user_name}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />
      <div class="wrapper">

        <!-- Main Header -->
        <header class="main-header">

          <!-- Logo -->
          <a href="../index.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><img src="../image/logo-tw-1.png" alt="minilogo"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img src="../image/logo-tw.png" alt="normallogo"></span>
          </a>

          <!-- Header Navbar -->
          <nav class="navbar navbar-static-top" role="navigation">
            <!-- search form (Optional) -->
            <form action="#" method="get" class="navbar-form">
              <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
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
                <li class="dropdown messages-menu">
                  <!-- Menu toggle button -->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-envelope-o"></i>
                    <span class="label label-success">4</span>
                  </a>
                  <ul class="dropdown-menu">
                    <li class="header">You have 4 messages</li>
                    <li>
                      <!-- inner menu: contains the messages -->
                      <ul class="menu">
                        <li>
                          <!-- start message -->
                          <a href="#">
                            <div class="pull-left">
                              <!-- User Image -->
                              <!-- 留言系統代入留言者頭像及資料 -->                      
                              <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                            </div>
                            <!-- Message title and timestamp -->
                            <h4>
                              Support Team
                              <small><i class="fa fa-clock-o"></i> 5 mins</small>
                            </h4>
                            <!-- The message -->
                            <p>Why not buy a new awesome theme?</p>
                          </a>
                        </li>
                        <!-- end message -->
                      </ul>
                      <!-- /.menu -->
                    </li>
                    <li class="footer"><a href="#">See All Messages</a></li>
                  </ul>
                </li>
                <!-- /.messages-menu -->

                <!-- Notifications Menu -->
                <li class="dropdown notifications-menu">
                  <!-- Menu toggle button -->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i>
                    <span class="label label-warning">10</span>
                  </a>
                  <ul class="dropdown-menu">
                    <li class="header">You have 10 notifications</li>
                    <li>
                      <!-- Inner Menu: contains the notifications -->
                      <ul class="menu">
                        <li>
                          <!-- start notification -->
                          <a href="#">
                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                          </a>
                        </li>
                        <!-- end notification -->
                      </ul>
                    </li>
                    <li class="footer"><a href="#">View all</a></li>
                  </ul>
                </li>
                <!-- Tasks Menu -->
                <li class="dropdown tasks-menu">
                  <!-- Menu Toggle Button -->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-flag-o"></i>
                    <span class="label label-danger">9</span>
                  </a>
                  <ul class="dropdown-menu">
                    <li class="header">You have 9 tasks</li>
                    <li>
                      <!-- Inner menu: contains the tasks -->
                      <ul class="menu">
                        <li>
                          <!-- Task item -->
                          <a href="#">
                            <!-- Task title and progress text -->
                            <h3>
                              Design some buttons
                              <small class="pull-right">20%</small>
                            </h3>
                            <!-- The progress bar -->
                            <div class="progress xs">
                              <!-- Change the css width attribute to simulate progress -->
                              <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">20% Complete</span>
                              </div>
                            </div>
                          </a>
                        </li>
                        <!-- end task item -->
                      </ul>
                    </li>
                    <li class="footer">
                      <a href="#">View all tasks</a>
                    </li>
                  </ul>
                </li>
                <!-- User Account Menu -->


                <c:choose>
                  <c:when test="${empty LoginOK}">
                    <li><a href="../_02_login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
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
                              <a href="#">追蹤名單</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">投資計畫</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">訂購清單</a>
                            </div>
                          </div>
                          <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                          <div class="pull-left">
                            <a href="../_14_UserData/ModifyUserInfo.jsp" class="btn btn-default btn-flat">個人資料</a>
                          </div>
                          <div class="pull-right">
                            <a href="../_02_login/logout.jsp" class="btn btn-default btn-flat">登出</a>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </c:when>
                </c:choose>
                <c:choose>
                  <c:when test="${empty LoginOK}">
                    <li><a href="../_01_register/register.jsp"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
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
            <c:choose>
            	<c:when test="${empty LoginOK}">
                </c:when>
                <c:when test="${!empty LoginOK}">
		            <div class="user-panel">
		              <div class="pull-left image">
		                <img src="${file_name}" class="img-circle" alt="User Image">
		              </div>
		              <div class="pull-left info">
		                <p>${userName}</p>
		                <!-- Status -->
		                <a href="#"><i class="fa fa-circle text-success"></i> 在線</a>
		              </div>
		            </div>
				</c:when>
			</c:choose>


            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
              <li class="header">HEADER</li>
              <!-- Optionally, you can add icons to the links -->
              <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>搜尋系統</span>
		            <span class="pull-right-container">
		              <i class="fa fa-angle-left pull-right"></i>
		            </span>
         		 </a>
                <ul class="treeview-menu">
                  <li><a href="../_08_ImgSearch\img-search-page.html">創作者</a></li>
                  <li><a href="../_08_ImgSearch\img-search-page.html">商城作品</a></li>
                  <li><a href="../_08_ImgSearch\img-search-page.html">募集作品</a></li>
                </ul>
              </li>
              <li class="active"><a href="../_05_CreationsFrame/Creations.jsp"><i class="fa fa-link"></i> 
              <span>創作平台</span></a>
              </li>
              <li><a href="../_06_fundsFrame/funds.jsp"><i class="fa fa-link"></i> 
              <span>募資平台</span></a>
              </li>

            </ul>
            <!-- /.sidebar-menu -->
          </section>
          <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
          <!-- Content Header (Page header) -->
          <section class="content-header">
          </section>

          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
	          <div class="row">
				  <div class="card1 col-md-8 col-md-offset-2">
			          <div class="box box-warning">
			            <div class="box-header with-border">
			              <h3 class="box-title"><b>購物車清單</b></h3>
				        </div>
			            
			            <!-- /.box-header -->
			            <div class="box-body no-padding">
			              <div class="mailbox-controls">			                		
			                <div class="btn-group">
			                	<a href="../_13_Product_info/Product_info.jsp" >	                	
		 	                		<button type="button" class="btn btn-block btn-warning">回上頁</button>
		 	                	</a>		            	
			                </div>
			              </div>
			              
			              <div class="table-responsive mailbox-messages">
			                <table class="table table-hover table-striped">
		
				               	<thead id="title">
				                  	<tr>
				                    	<th class="mailbox-name">創作者名稱</th>
				                    	<th class="mailbox-name">購物車內商品數</th>
				                    	<th class="mailbox-star">檢視購物車</th>
				                    	<th class="mailbox-star">刪除購物車</th>            
				                  	</tr>
								</thead>
					                  
					            <tbody>
					                  <tr>
					                    <td class="mailbox-name"><a href="../_05_CreationsFrame/CreationsPage2-1.jsp">XXX 作者名稱</a>
					                    </td>
					                    <td class="mailbox-name">
											購物車內共<font id="red" >1</font>筆商品
					                    </td>
					                    <td class="mailbox-star">
					                    	<a href="ShoppingCart_Order.jsp"><button type="button" class="btn btn-default btn-sm checkbox-toggle">
					                		<i class="fa fa-fw fa-shopping-cart"></i>
					                		</button></a>
					                    </td>
					                    <td class="mailbox-star">
					                    	<button type="button" class="btn btn-default btn-sm">
					                    	<i class="fa fa-trash-o" ></i>
					                    	</button>
					                    </td>
					                  </tr>
					                  
					                  <tr>
					                    <td class="mailbox-name"><a href="../_05_CreationsFrame/CreationsPage2-1.jsp">XXX 作者名稱</a>
					                   <td class="mailbox-name">
											購物車內共<font id="red" >2</font>筆商品
					                    </td>
					                    </td>
					                    <td class="mailbox-star">
					                    	<a href="ShoppingCart_Order.jsp"><button type="button" class="btn btn-default btn-sm checkbox-toggle">
					                		<i class="fa fa-fw fa-shopping-cart"></i>
					                		</button></a>
					                    </td>
					                    <td class="mailbox-star">
					                    	<button type="button" class="btn btn-default btn-sm">
					                    	<i class="fa fa-trash-o" ></i>
					                    	</button>
					                    </td>
					                  </tr>
					                  
					                  <tr>
					                    <td class="mailbox-name"><a href="../_05_CreationsFrame/CreationsPage2-1.jsp">XXX 作者名稱</a>
					                    </td>
					                    <td class="mailbox-name">
											購物車內共<font id="red" >3</font>筆商品
					                    </td>
					                    <td class="mailbox-star">
					                    	<a href="ShoppingCart_Order.jsp"><button type="button" class="btn btn-default btn-sm checkbox-toggle">
					                		<i class="fa fa-fw fa-shopping-cart"></i>
					                		</button></a>
					                    </td>
					                    <td class="mailbox-star">
					                    	<button type="button" class="btn btn-default btn-sm">
					                    	<i class="fa fa-trash-o" ></i>
					                    	</button>
					                    </td>
					                  </tr>
					                  
				            	</tbody>
				            </table>
			                <!-- /.table -->
			              </div>
			              <!-- /.mail-box-messages -->
			            </div>
			            
			            <!-- /.box-body -->
			            <div class="box-footer no-padding">
			              <div class="mailbox-controls">
			              	<div class="btn-group">
			                	<a href="../_13_Product_info/Product_info.jsp" >	                	
		 	                		<button type="button" class="btn btn-block btn-warning">回上頁</button>
		 	                	</a>		            	
			                </div>
			            </div>
			          </div>
			          <!-- /. box -->
			        </div>
					</div>
	          </div>
          </section>
          <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
        <footer class="main-footer">
          <!-- To the right -->
          <div class="pull-right hidden-xs">
            Anything you want
          </div>
          <!-- Default to the left -->
          <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
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
              <h3 class="control-sidebar-heading">Recent Activity</h3>
              <ul class="control-sidebar-menu">
                <li>
                  <a href="javascript:;">
                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                    <div class="menu-info">
                      <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                      <p>Will be 23 on April 24th</p>
                    </div>
                  </a>
                </li>
              </ul>
              <!-- /.control-sidebar-menu -->

              <h3 class="control-sidebar-heading">Tasks Progress</h3>
              <ul class="control-sidebar-menu">
                <li>
                  <a href="javascript:;">
                    <h4 class="control-sidebar-subheading">
                      Custom Template Design
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
      <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
      <!-- Bootstrap 3.3.6 -->
      <script src="../bootstrap/js/bootstrap.min.js"></script>
      <!-- AdminLTE App -->
      <script src="../dist/js/app.min.js"></script>
      
      <script src="default.js"></script>

      <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>

</html>