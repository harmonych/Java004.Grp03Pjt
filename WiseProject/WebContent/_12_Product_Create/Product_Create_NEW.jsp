<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<c:set var="context" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>建立商品</title>
<link rel="stylesheet" href="${context}/css/Product_Create.css">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
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
				        		<div class="box-title">步驟1 >> 填寫資訊</div>
				        	</div>
				        	
							<div class="box-body">
								<form ENCTYPE="multipart/form-data" method="POST"action="<c:url value='/_12_Product_Create/ProductCreate.do' />"
									  id="ProductCreate.do">
									
									<div>
										<div id="ipt1">
											<input id="art_id" name = "art_id" value="<c:out value ="${IsArtist.art_id}"/>" type="hidden"/>
											<label id="lb">商品名稱</label> <br>
											<input type="text" name="pro_name" value="${param.proname}" class="form-control"> 
											<font size="-1" color="#FF0000">${MsgMap.errorpronameEmpty}</font>
										</div>
										<div id="ipt1">
											<label id="lb">商品金額</label> <br>
											<input type="text" name="price" value="${param.price}" class="form-control"> 
											<font color="red" size="-1">${MsgMap.errorpricesEmpty}</font>
										</div>
										<div id="ipt1">
											<label id="lb">上架時間</label> <br>
											<input type="date" name="sale_time" value="${param.saletime}" class="form-control"> 
											<font color="red" size="-1">${MsgMap.errorsaletimeEmpty}</font>
										</div>
										<div id="ipt1">
											<label id="lb">庫存數量</label> <br>
											<input type="number" min="0"name="pro_inv" value="${param.proinvs}" class="form-control">
											<font color="red" size="-1">${MsgMap.errorproinvsEmpty}</font>
										</div>
										<div id="ipt1">
											<label id="lb">分類標籤</label> <br>
											<input type="text" name="hashtag" value="${param.hashtag}" class="form-control">
												<font color="red" size="-1">${MsgMap.errorhashtagEmpty}</font>
										</div>
										<div id="ipt1">
											<label id="lb">商品簡介</label> <br>
											<textarea name="pro_introduction" class="form-control" rows="5"></textarea><br>
											<font color="red" size="-1">${MsgMap.errorprointroduction}</font>
										</div>
									</div>
									
									<div id="ipt1">
									    <label for="exampleInputFile">上傳簡介圖檔</label>
									    <input type="file" id="intro_pic" name ="intro_pic">
									
									    <p class="help-block">請選擇上傳圖檔</p>
									</div>
									<div id="ipt2">
									    <label for="exampleInputFile">上傳圖檔</label>
									    <input type="file" id="pic_1" name = "pic_1">
									
									    <p class="help-block">請選擇上傳圖檔</p>
									</div>
									<div id="ipt3">
									    <label for="exampleInputFile">上傳圖檔</label>
									    <input type="file" id="pic_2" name ="pic_2">
									
									    <p class="help-block">請選擇上傳圖檔</p>
									</div>
									<div id="ipt4">
									    <label for="exampleInputFile">上傳圖檔</label>
									    <input type="file" id="pic_3" name ="pic_3">
									
									    <p class="help-block">請選擇上傳圖檔</p>
									</div>
									
									
									<div class="box-footer">
										<div id="bt_area">
										<a href="">
											<input type="submit" name="submit" class="btn1 btn-lg " value="建立商品資訊"></a>
										</div>
									</div>
								</form>
							</div>
						</div>	
					</div>
				</div>
			</section>
			<!-- /.content -->
	<!-- jQuery 2.2.3 -->
<%-- 	<script src="${context}/plugins/jQuery/jquery-2.2.3.min.js"></script> --%>
	<!-- Bootstrap 3.3.6 -->
<%-- 	<script src="${context}/bootstrap/js/bootstrap.min.js"></script> --%>
</body>

</html>