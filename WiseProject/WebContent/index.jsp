<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
    <!DOCTYPE html>
    <!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
    <html>

    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Wise彙思創作募資</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <!-- Bootstrap 3.3.6 -->
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
      <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
      <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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

    <body class="hold-transition skin-green sidebar-mini">
      <c:set var="userName" value="${LoginOK.user_name}" />
      <div class="wrapper">

        <!-- Main Header -->
        <header class="main-header">

          <!-- Logo -->
          <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Admin</b>LTE</span>
          </a>

          <!-- Header Navbar -->
          <nav class="navbar navbar-static-top" role="navigation">
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
                              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
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
                    <li><a href="_01_register/register.jsp"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
                  </c:when>
                </c:choose>
                <c:choose>
                  <c:when test="${empty LoginOK}">
                    <li><a href="_02_login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
                  </c:when>
                  <c:when test="${!empty LoginOK}">
                    <li class="dropdown user user-menu">
                      <!-- Menu Toggle Button -->
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">${userName}</span>
                      </a>
                      <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                          <p>
                            ${userName} - Web Developer
                            <small>Member since Nov. 2012</small>
                          </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                          <div class="row">
                            <div class="col-xs-4 text-center">
                              <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">Friends</a>
                            </div>
                          </div>
                          <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                          <div class="pull-left">
                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                          </div>
                          <div class="pull-right">
                            <a href="_02_login/logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                          </div>
                        </li>
                      </ul>
                    </li>
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
            <div class="user-panel">
              <div class="pull-left image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
              </div>
              <div class="pull-left info">
                <p>${userName}</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
              </div>
            </div>

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
              <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
              </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
              <li class="header">HEADER</li>
              <!-- Optionally, you can add icons to the links -->
              <li class="active"><a href="Second_frame/Creations.jsp"><i class="fa fa-link"></i> <span>創作平台</span></a></li>
              <li><a href="Third_frame/backer.jsp"><i class="fa fa-link"></i> <span>募資平台</span></a></li>
              <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>搜尋系統</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
                <ul class="treeview-menu">
                  <li><a href="ImgSearch\img-search-page.html">創作者</a></li>
                  <li><a href="ImgSearch\img-search-page.html">商城作品</a></li>
                  <li><a href="ImgSearch\img-search-page.html">募集作品</a></li>
                </ul>
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
            <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">最新創作品</h3>
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
                  <div class="item">
                    <img src="images/demo01.jpg" alt="First slide">

                    <div class="carousel-caption">
                      First Slide
                    </div>
                  </div>
                  <div class="item active">
                    <img src="images/demo02.jpg" alt="Second slide">

                    <div class="carousel-caption">
                      Second Slide
                    </div>
                  </div>
                  <div class="item">
                    <img src="images/demo03.jpg" alt="Third slide">

                    <div class="carousel-caption">
                      Third Slide
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
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
              <li class="active">Here</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">

            <!-- Your Page Content Here -->

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
      <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
      <!-- Bootstrap 3.3.6 -->
      <script src="bootstrap/js/bootstrap.min.js"></script>
      <!-- AdminLTE App -->
      <script src="dist/js/app.min.js"></script>

      <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
    </body>

    </html>
=======
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="asset/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/page.css">
	<title>創作募資平台</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet" />
</head>

<body>
<c:set var="userName" value="${LoginOK.user_name}" />

<header class="container-fluid">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed" data-toggle="offcanvas">
				<span class="hamb-top"></span>
				<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
			</button>
		</div>

		<div class="btn-toolbar">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand textup" href="#"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
			  <span class="sr-only">Toggle navigation</span>
				<ul class="nav navbar-nav navbar-right">
				<li class="username"><span>${userName}</span></li>		
					
					<c:choose>
						<c:when test="${empty LoginOK}">
							<li><a href="_01_register/register.jsp"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<li><a href="_02_login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
						</c:when>
						<c:when test="${!empty LoginOK}">
							<li><a href="_02_login/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> 登出</a></li>
						</c:when>
					</c:choose>
					<!-- <li><a href="#">搜尋</a></li>
					<li><a href="#">購物車</a></li> -->
				</ul>
			</div>
		</div>
	</nav>



		
	<div class="jumbotron text-center">
		 
		<form class="form-inline">
			<div class="form-group">

				<input class="form-control" type="search" placeholder="搜尋" size="50" required>
			</div>
				<button type="submit" class="btn btn-default">search</button>
				<p>
			<div class="checkbox">
    			<label><input type="checkbox" checked>創作者</label>
  			</div>
  			<div class="checkbox">
    			<label><input type="checkbox" checked>商城作品</label>
  			</div>
  			<div class="checkbox">
    			<label><input type="checkbox" checked>募集作品</label>
  			</div>
		</form>
	</div>
</header>


<section class="container-fluid" id="about">
	<div id="wrapper">
		<!-- Sidebar -->

		<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				
				<li class="sidebar-brand">
					<a href="#"> </a>			
				</li>
				<li class="username"><span>${userName}</span></li>
				<li>
					<a href="_05_CreationsFrame/Creations.jsp">創作平台</a>
				</li>
				<li>
					<a href="_06_fundsFrame/funds.jsp">募資平台</a>
				</li>
				<li>
					<a href="#">商城系統</a>
				</li>
				<li>
					<a href="index2.html">會員中心</a>
				</li>
				<li>
					<a href="ImgSearch\img-search-page.html">搜尋系統</a>
				</li>
									
				
				<!-- <li>
					<a href="#">社群交流</a>
				</li> -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header">下拉標題</li>
						<li><a href="#">副選單一</a></li>
						<li><a href="#">副選單二</a></li>
					</ul>
				</li>

			</ul>
		</nav>
	
		<!-- #sidebar-->
	<div class="row">
		<!-- Modal -->
		<div class="modal fade bs-java" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						...
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
		<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h4 ><br><span style="font-style:normal;">
					<img src="images/picture.png" class="img-rounded" width="50" height="60">
					新作品分享圖</span></h4>
				</div>
				<div class="item">
					<h4> <br><span style="font-style:normal;">
					<img src="images/photocamera1.png" class="img-circle" width="60" height="60" >
					募資新資訊</span></h4>
				</div>
				<div class="item">
					<h4> <br><span style="font-style:normal;">
					<img src="images/teddybear.png" class="img-thumbnail" width="30" height="30">
					新加入創作者</span></h4>
				</div>
			
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="row">
		<div class="card _card01 col-sm-4 col-md-4 col-md-4" data-toggle="modal">最新主題</div>
		<div class="card _card02 col-sm-4 col-md-4 col-md-4" data-toggle="modal">最新募資</div>
		<div class="card _card03 col-sm-4 col-md-4 col-md-4" data-toggle="modal">社群系統</div>
		
</div>
		
</div>

</section>

<footer class="container-fluid text-center">
	<p>
	</p>
	
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script src="js/default.js"></script>


</body>
</html>
>>>>>>> 5522254d3344653853d74bafb2460ee930eaed05
