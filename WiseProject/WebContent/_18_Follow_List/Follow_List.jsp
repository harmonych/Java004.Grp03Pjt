<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<c:set var="context" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>追蹤清單</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${context}/dist/css/AdminLTE.min.css">
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

.navbar-form {
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



		<!-- Main content -->
		<section class="content">
			<!-- Your Page Content Here -->
			<div class="row">
				<div class="card1 col-md-8 col-md-offset-2">
					<div class="box box-warning">
						<div class="box-header with-border">
							<h3 class="box-title">
								<b>追蹤清單</b>
							</h3>
						</div>

						<!-- /.box-header -->
						<div class="box-body no-padding">
							<div class="mailbox-controls">
								<div class="btn-group">
									<a href="/index.jsp">
										<button type="button" class="btn btn-block btn-warning">回上頁</button>
									</a>
								</div>
							</div>

							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">

									<thead id="title">
										<tr>
											<th class="mailbox-name">創作者名稱</th>
											<th class="mailbox-name">加入時間</th>
											<th class="mailbox-star">刪除追蹤</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td class="mailbox-name"><a
												href="../_05_CreationsFrame/CreationsPage2.jsp">XXX 作者名稱</a>
											</td>
											<td class="mailbox-name">加入時間 follow_time</td>
											<td class="mailbox-star">
												<button type="button" class="btn btn-default btn-sm">
													<i class="fa fa-trash-o"></i>
												</button>
											</td>
										</tr>

										

										<div id="follow"></div>

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
									<a href="../_13_Product_info/Product_info.jsp">
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

	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
<!-- 	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script> -->
<!-- 	<!-- Bootstrap 3.3.6 --> -->
<!-- 	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
<!-- 	<!-- AdminLTE App --> -->
<!-- 	<script src="../dist/js/app.min.js"></script> -->

<!-- 	<script src="default.js"></script> -->
	
	<script>
	$(document).ready(function(){
		
		var content="";
		var id =1; //${mb.user_id};
		var art_name;
		$.ajax({
			  //得到所有該artist的募資計畫 01 ArtToFunds Servlet
			  url: "\_06_follow\follow.json",
			  type: "GET", 
			  async: false,
			  data: { 
			    "user_id":id, 
			  },
			  success: function(response) {
				 
				  follows_len = response.length;
				  $("#follow").empty();
				  for(var i=0; i < follows_len ; i++){
					 content += '<div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">';
					 $.ajax({
							url: "\_07_funds\\singleFcPic.json",
							type: "GET",
							async: false,
							data: {
								"art_id": response[i].follow_id,
							},
							success: function(artname) {
								art_name=artname;
							}
					 })
					 content += '<td class="mailbox-name"><a href="/_05_CreationsFrame/CreationsPage2.jsp">'+art_name+'</a>'
						 content +=		'</td>'
						 content +=		'<td class="mailbox-name">'+response[i].follow_time+'</td>'
						 content +=		'<button type="button" class="btn btn-default btn-sm">'
						 content +=		'<i class="fa fa-trash-o"></i></button></td>'
					  //end of ajax-fcAdr
					 content += "</div>"; 
				  }
				  //end of for-fBA
				  var divp = document.getElementById("follow");
				  divp.innerHTML = content;
			  },			 
		});
	})
	</script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>

</html>