<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>建立商品</title>
<link rel="stylesheet" href="../css/Product_Create.css">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
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


			<section class="content-header">
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				<!-- 網頁內容部分 -->
				<div class="row">
					
					<!-- 商品輸入欄 -->
					<div class="card02 col-md-8 col-md-offset-2">
						<div class="box box-warning">
							<div class="box-header with-border">
				        		<h3 class=""><b>建立商品</b></h3>
				        		<div class="box-title">步驟2 >> 選擇精美圖片</div>
				        	</div>
							
							<div class="box-body">
								<form ENCTYPE="multipart/form-data" method="POST"action="<c:url value='../_09_product/ProductCreate.do' />"
									  id="ProductCreate.do">														
									
									<div id="ipt1">
									    <label for="exampleInputFile">上傳圖片</label>
									    <input type="file" id="exampleInputFile">
									
									    <p class="help-block">請選擇上傳圖檔</p>
									</div>
									
									<div class="box-footer">
										<div id="bt_area">
										<a href="">
											<input type="submit" name="submit" class="btn1 btn-lg " value="建立商品"></a>
										</div>
<!-- 									<div id="bt"> -->
<!-- 										<input type="reset" name="cancel" class="btn2 btn-lg btn-block" value="清除重填"> -->
<!-- 									</div> -->
									</div>
								</form>
							</div>
						</div>	
					</div>
				</div>
			</section>
			<!-- /.content -->
	



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