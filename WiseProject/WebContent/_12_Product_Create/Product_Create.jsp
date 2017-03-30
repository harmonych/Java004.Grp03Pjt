<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/Product_Create.css">
    <title>建立商品</title>
    
    <script type="text/javascript">
		//由<body>的onLoad事件處理函數觸發此函數
		// function setFocusToUserId(){   
		// 	 document.forms[0].mid.focus();   // 將游標放在mid欄位內
		// }
	</script>
</head>
<body>
	<c:set var="funcName" value="REG" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/top.jsp" />
	
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

                    <ul class="nav navbar-nav navbar-right">

                        <!-- <li><a href="#">購物車</a></li> -->
                        <li><a href="#">登入</a></li>
                        <li><a href="#">註冊</a></li>
                    </ul>

                    
                </div>
            </div>
        </nav>
     </header>


    <section class="container-fluid" id="about">
        <div id="wrapper">
            <!-- Sidebar -->

            <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                <ul class="nav sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#"> </a>
                    </li>

                    <li>
                        <a href="../Second_frame/test0301.html">創作大廳</a>
                    </li>
                    <li>
                        <a href="#">募資大廳</a>
                    </li>
                    <li>
                        <a href="#">作品商城</a>
                    </li>
                    <li>
                        <a href="#">購物車</a>
                    </li>
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
		
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<script src="../asset/js/bootstrap.min.js"></script>
			<script src="../js/default.js"></script>
		</div>		
	</section>
	
	
	<section class="product_page">
		<div class="row">
			<!-- 圖片顯示欄 -->
			<div class="card_card01 col-md-4 col-md-offset-2">
				<div class="pro_img">
					<img src="../images/v06.jpg" class="pro_img"> <!-- width="400" height="400" -->
				</div>
				<div>
			    </div>
			</div>
				
				
				<!-- 商品輸入欄 -->
			<div class="card02 col-md-4">
				<form ENCTYPE="multipart/form-data" method="POST" action="<c:url value='../_09_product/ProductCreate.do' />"  id="ProductCreate.do" >
					<div>	
						<div id="ipt1">
							<label id="lb">商品名稱</label>
							<input type="text" name="proname" value="${param.proname}" class="tx1"><br>
							<font size="-1" color="#FF0000">${MsgMap.errorpronameEmpty}</font>
						</div>			
						<div id="ipt1">	
							<label id="lb">商品金額</label>
							<input type="text" name="prices" value="${param.prices}" class="tx1"><br>
							<font color="red" size="-1">${MsgMap.errorpricesEmpty}</font> 
						</div>	
						<div id="ipt1">	
							<label id="lb">上架時間</label>
							<input type="date" name="saletime" value="${param.saletime}" class="tx1"><br>
							<font color="red" size="-1">${MsgMap.errorsaletimeEmpty}</font> 
						</div>	
						<div id="ipt1">	
							<label id="lb">庫存數量</label>
							<input type="number" min="0" name="proinvs" value="${param.proinvs}" class="tx1"><br>
							<font color="red" size="-1">${MsgMap.errorproinvsEmpty}</font>
						</div>	
							<div id="ipt1">	
								<label id="lb">分類標籤</label>
								<input type="text" name="hashtag" value="${param.hashtag}" class="tx1"><br>
								<font color="red" size="-1">${MsgMap.errorhashtagEmpty}</font>
							</div>	
						<div id="ipt1">	
							<label id="lb">商品簡介</label>
							<textarea name="prointroduction" class="txa1"></textarea><br>
							<font color="red" size="-1">${MsgMap.errorprointroduction}</font>
						</div>							
					</div>
					<p>----------------------------------------------------------------------------------</p>
					<div id="bt">
						<input type="submit" name="submit" class="btn1 btn-lg btn-block" value="建立商品">
					</div>
					<div id="bt">	
						<input type="reset" name="cancel" class="btn2 btn-lg btn-block" value="清除重填">
					</div>
				</form>
			</div>
		</div>
	</section>	
	
	
	
</body>
</html>