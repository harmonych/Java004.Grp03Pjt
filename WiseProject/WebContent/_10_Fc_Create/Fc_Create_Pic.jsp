<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="../css/Fc_Create.css">
	  <title>建立專案</title>
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
<!--       <div class="wrapper"> -->

       
<!--         Content Wrapper. Contains page content -->
<!--         <div class="content-wrapper"> -->
<!--           Content Header (Page header) -->
          <section class="content-header">
          </section>

          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
          <!-- 網頁內容部分 -->
			<div class="row">				
				
				<!-- 募資輸入欄 -->
				<div class="card02 col-md-8 col-md-offset-2">
					<div class="box box-warning">
						<div class="box-header with-border">
				        	<h3 class=""><b>建立專案</b></h3>
				        	<div class="box-title">步驟2 >> 選擇精美的圖片</div>
				        </div>
						
						<div class="box-body">	
							<form  ENCTYPE="multipart/form-data" method="POST" action="<c:url value='../_07_funds/pic.do' />" 
									id="fcpic.do" >
								
								<div id="ipt1">
									    <label for="exampleInputFile">上傳圖片</label>
									    <input name="fcids" value="${fc_id}" type="hidden">
									    <input type="file" size="40"  class="form-control" name="filename" />
									
									    <p class="help-block">請選擇上傳圖檔</p>
								</div>	
																												
								<div class="box-footer">
									<div id="bt_area">
										<a href="Fc_Create_OK.jsp">
										<input type="submit" name="submit" class="btn1 btn-lg" value="上傳圖片"></a>
									</div>
<!-- 									<div id="bt">	 -->
<!-- 										<input type="reset" name="cancel" class="btn2 btn-lg btn-block" value="清除重填"> -->
<!-- 									</div> -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
          </section>    
<!--    		</div> -->
        <!-- /.content-wrapper -->


        
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
<!--               /.control-sidebar-menu -->

<!--               <h3 class="control-sidebar-heading">Tasks Progress</h3> -->
<!--               <ul class="control-sidebar-menu"> -->
<!--                 <li> -->
<!--                   <a href="javascript:;"> -->
<!--                     <h4 class="control-sidebar-subheading"> -->
<!--                       Custom Template Design -->
<!--                       <span class="pull-right-container"> -->
<!--                   <span class="label label-danger pull-right">70%</span> -->
<!--                       </span> -->
<!--                     </h4> -->

<!--                     <div class="progress progress-xxs"> -->
<!--                       <div class="progress-bar progress-bar-danger" style="width: 70%"></div> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--               /.control-sidebar-menu -->

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
<!--        immediately after the control sidebar --> -->
<!--         <div class="control-sidebar-bg"></div> -->
<!--       </div> -->
<!--       ./wrapper -->

      
      <!-- REQUIRED JS SCRIPTS -->

      <!-- jQuery 2.2.3 -->
      <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
      <!-- Bootstrap 3.3.6 -->
      <script src="../bootstrap/js/bootstrap.min.js"></script>
      <!-- AdminLTE App -->
      <script src="../dist/js/app.min.js"></script>
		<script>console.log(${fc_id})</script>
      <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
