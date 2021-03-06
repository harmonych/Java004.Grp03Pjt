<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="../css/Fc_info.css">
	  <title>募資內容頁</title>
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

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script>

// $(document).ready (function () {
// 	var xhr1 = new XMLHttpRequest();
// 	xhr1.open("GET", '..\\_07_funds\\singlefcpic.json', true);
// 	xhr1.send();
// 	xhr1.onreadystatechange = function() {
// 		if (xhr1.readyState == 4 && xhr1.status == 200) {
// 			var picj = JSON.parse(xhr1.responseText);
			
// 			var pic_address = "<img src ="+ picj[0].fc_adress + " width = '400px' >" ;
			
// 			var divp = document.getElementById("img_area");
// 			divp.innerHTML = pic_address;
// 			console.log(picj);
// 			console.log(pic_address);
// 		}
// 	};

		
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", '..\\_07_funds\\singlefund.json', true);
// 	xhr.send();
// 	xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
// //			var content = "";
// 			var fc_name = "";
// 			var art_id = "";
// 			var start_time = "";
// 			var end_time = "";
// 			var fc_money = "";
// 			var now_money = "";
// 			var fc_introduction = "";
			
// 			var funds = JSON.parse(xhr.responseText);
// 			fc_name ="<h1><b>" +funds.fc_name+"</b></h1>" ;
// 			art_id = "<h4><b>創作者編號 : </b>" +funds.art_id+ "</h4>" ;
// 			start_time = "<b>開始時間 : </b>" +funds.start_time ;
// 			end_time = "<b>結束時間 : </b>" +funds.end_time ;
// 			fc_money = "<b>募資金額 : </b>" +funds.fc_money ;
// 			now_money = "<b>目前金額  : </b>" +funds.now_money ;
// 			fc_introduction = "<b>募資簡介 : </b><br>" +funds.fc_introduction ;			
	
// 		}
// 		//content += "";
// 		//var divs = document.getElementById("somedivS");
// 		//divs.innerHTML = content;
		
// 		fc_name += "";
// 		var divs = document.getElementById("fc_name");
// 		divs.innerHTML = fc_name;
		
// 		art_id += "";
// 		var divs = document.getElementById("art_id");
// 		divs.innerHTML = art_id;
		
// 		start_time += "";
// 		var divs = document.getElementById("start_time");
// 		divs.innerHTML = start_time;
		
// 		end_time += "";
// 		var divs = document.getElementById("end_time");
// 		divs.innerHTML = end_time;
		
// 		fc_money += "";
// 		var divs = document.getElementById("fc_money");
// 		divs.innerHTML = fc_money;
		
// 		now_money += "";
// 		var divs = document.getElementById("now_money");
// 		divs.innerHTML = now_money;
		
// 		fc_introduction += "";
// 		var divs = document.getElementById("fc_introduction");
// 		divs.innerHTML = fc_introduction;
// 	};
// });

</script>


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
			
				<!-- 圖片顯示欄 -->
				<div class="card_card01 col-md-4 col-md-offset-2">
					<div id="img_area">
						<img id="pro_img" width="400" height="400">  
						<!-- src="../images/v06.jpg" -->						
					</div>
				</div>


				<!-- 募資介紹欄 -->
				<div class="card_card02 col-md-4">
					<div id="info_area">
						
						<div id="fc_name">
							<h1>fc_name 募資名稱 <c:out value ="${fb.fc_name}" /></h1>
						</div>
						<div id="art_id">	
							<label id='lb'>創作者編號:</label>
						</div>
						<div id="start_time" >
							<label id="lb">start_time 開始時間</label>
						</div>
						<div id="end_time" >
							<label id="lb">end_time 結束時間</label>
						</div>
						<div id="fc_money" >
							<label id="lb">fc_money 募資金額</label>
						</div>	
						<div id="now_money" >
							<label id="lb">now_money 目前金額</label>
						</div>
					
						<div id="line"></div><br>
					
						<div id="fc_introduction">
							<label id="lb">募資簡介</label><br>
						
							<p>
								fc_Introduction<br> 
							</p>
						</div>
					</div>	
					<div id="line"></div>
					
					<div id="sponsor_area">
						<form id="form1">
							<div>
								<div id="sponsor_money">
									<label>贊助金額</label>								
									<select class="form-control">
										<option value="1">NT $500</option>
										<option value="2">NT $1,000</option>
										<option value="3">NT $2,000</option>
										<option value="4">NT $3,000</option>
										<option value="5">NT $5,000</option>
										<option value="6">NT $10,000</option>
										<option value="7">NT $20,000</option>
										<option value="8">NT $30,000</option>
										<option value="8">NT $50,000</option>
									</select>
								</div>
								<div id="sponsor_money">
									<label>贊助方式</label>								
									<select class="form-control">
										<option value="1">轉帳</option>
										<option value="2">匯款</option>
										
									</select>
								</div>
							</div>

							<div id="bt_area">
								<a href="../_17_Fc_List/Fc_List_User.jsp">
									<input type="button" name="submit" class="btn1 btn-lg btn-block" value="我要贊助">
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>		
	    </section>
         	<!-- /.content -->
         
         <!-- 留言填寫欄位 -->
          <section id="s2" class="content">
          	<div class="row">
          		<div class="card03 col-md-8 col-md-offset-2">
          			<div class="box box-warning ">
            			<div class="box-header with-border">
              				<h3 class="box-title">我要留言</h3>
            			</div>
            			
            		<!-- /.box-header -->
            		<div class="box-body">
              			<div class="form-group">
                			<input class="form-control" placeholder="留言標題">
              			</div>
              			              	
              			<div class="form-group">
                    		<textarea id="compose-textarea" class="form-control" placeholder="在此輸入內容" style="height: 300px"></textarea>
              			</div>
              	
              	   <!-- <div class="form-group">
                			<div class="btn btn-default btn-file">
                  				<i class="fa fa-paperclip"></i> Attachment
                  				<input type="file" name="attachment">
                			</div>
                	    </div> -->
            		</div> 
            		
            		<!-- /.box-body -->
            		<div class="box-footer">
              			<div class="pull-right">
                			<button type="submit" id="btn3" class="btn btn-primary">送出留言 </button> 
                			<!--<i class="fa fa-envelope-o"></i> Send  -->
              			</div>
              			
            		</div>
           			<!-- /.box-footer -->
          			</div>
          		<!-- /. box -->
        		</div>
        	</div>
       
       
      	</section>
        <!-- /.content -->
        <!-- 留言串列 -->
        <section>
        	<div class="row">
          		<div class="card03 col-md-8 col-md-offset-2">
			        <div class="box box-warning ">
			          <div class="box-header with-border">
			            <div>
			            	<h4 class="box-title">留言標題</h4>
			            </div>
			            <br>
			            <div>
			            	<div class="mes_by">留言人</div>
			            </div>
			          </div>
			          <div class="box-body">
			          		<div class="message">留言內容</div>
			          </div>
			          <!-- /.box-body -->
			        </div>
			   </div>     
			</div>	        
        </section>
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

      <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>

</html>