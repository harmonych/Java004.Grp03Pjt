<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<!--<link rel="stylesheet" href="../asset/css/bootstrap.min.css">-->
			<!--<link rel="stylesheet" href="../asset/css/bootstrap-theme.min.css">-->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<style>
				/*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
				/*
 * General styles
 */
				
				#playground-container {
					height: 500px;
					overflow: hidden !important;
					-webkit-overflow-scrolling: touch;
				}
				
				body,
				html {
					height: 100%;
					background-repeat: no-repeat;
					/*background:url(https://i.ytimg.com/vi/4kfXjatgeEU/maxresdefault.jpg);*/
					font-family: 'Oxygen', sans-serif;
					background-size: cover;
				}
				
				.main {
					margin: 50px 15px;
				}
				
				h1.title {
					font-size: 50px;
					font-family: 'Passion One', cursive;
					font-weight: 400;
				}
				
				hr {
					width: 10%;
					color: #fff;
				}
				
				.form-group {
					margin-bottom: 15px;
				}
				
				label {
					margin-bottom: 15px;
				}
				
				input,
				input::-webkit-input-placeholder {
					font-size: 11px;
					padding-top: 3px;
				}
				
				.main-login {
					background-color: #fff;
					/* shadows and rounded borders */
					-moz-border-radius: 2px;
					-webkit-border-radius: 2px;
					border-radius: 2px;
					-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
					-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
					box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
				}
				
				.form-control {
					height: auto!important;
					padding: 8px 12px !important;
				}
				
				.input-group {
					-webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.21)!important;
					-moz-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.21)!important;
					box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.21)!important;
				}
				
				#button {
					border: 1px solid #ccc;
					margin-top: 28px;
					padding: 6px 12px;
					color: #666;
					text-shadow: 0 1px #fff;
					cursor: pointer;
					-moz-border-radius: 3px 3px;
					-webkit-border-radius: 3px 3px;
					border-radius: 3px 3px;
					-moz-box-shadow: 0 1px #fff inset, 0 1px #ddd;
					-webkit-box-shadow: 0 1px #fff inset, 0 1px #ddd;
					box-shadow: 0 1px #fff inset, 0 1px #ddd;
					background: #f5f5f5;
					background: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
					background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #eeeeee));
					background: -webkit-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
					background: -o-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
					background: -ms-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
					background: linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5', endColorstr='#eeeeee', GradientType=0);
				}
				
				.addon-facebook {
					background-color: #345387;
					border: none;
					border-radius: 2px 0px 0px 2px;
					color: #fff;
				}
				
				.btn-facebook,
				.btn-facebook:hover {
					background-color: #4b6ea9;
					color: #fff;
					border-radius: 0px 2px 2px 0px;
					font-size: 15px;
					width: 270px;
				}
				
				.main-center {
					margin-top: 30px;
					margin: 0 auto;
					max-width: 400px;
					padding: 10px 40px;
					background: rgba(167, 142, 12, 0.2);
					/*background: #009edf;*/
					color: dodgerblue;
					text-shadow: none;
					-webkit-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
					-moz-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
					box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
					border-top: 5px solid #f39c12;
				}
				
				span.input-group-addon i {
					color: #009edf;
					font-size: 17px;
				}
				
				.login-button {
					margin-top: 5px;
				}
				
				.login-register {
					font-size: 11px;
					text-align: center;
				}
				.input-group .form-control{
					width: 270px;	
				}
				.input-group-addon:first-child{
					width: 50px;
				}
				h5{
					color:black;
				}
				.fa-user-circle-o:before {  
					content: "\f2be";  
					color:#f39c12;  
				}  
				
				.fa-lock:before {	
					content: "\f023"; 	
					color: #f39c12;	
				} 
				.fa-vcard:before, .fa-address-card:before {
					content: "\f2bb";
					color: #f39c12;	
				}
				
				.fa-mobile-phone:before, .fa-mobile:before {
					content: "\f10b";
					color: #f39c12;	
				}

				.fa-envelope:before {
					content: "\f0e0";
					color: #f39c12;
				}
				.fa-address-book-o:before {
					content: "\f2ba";
					color: #f39c12;
				}
				fa-drivers-license:before, .fa-id-card:before {
				    content: "\f2c2";
				    color:#f39c12
				}
				
				
				.fa-institution:before, .fa-bank:before, .fa-university:before {
				    content: "\f19c";
				    color:#f39c12
				}
				label {
				    margin-bottom: 15px;
				    color: black;
				}
				p {
				    margin: 0 0 10px;
					color: black;
				}
					
				a {
				    color: #f39c12;
				    text-decoration: none;
				}
				
				body {
    				margin:0;
    				padding:0;
    				background: #000 url(http://yejuan.com.cn/blog/wp-content/uploads/2017/02/131-5-1920x1200.jpg) center center fixed no-repeat;
    				-moz-background-size: cover;
    				background-size: cover;
					}

</style>
			<title>Register</title>
	</head>

	<body>
		<c:set var="funcName" value="REG" scope="session" />

		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
					<p class="text-center">Already have an account? <a href="../_02_login/login.jsp">Sign in here</a></p>
					<h5 class="text-center" id="demo2">能被欣賞的創作，才是有價值的，快加入證明你的天才作品吧</h5>

					<form ENCTYPE="multipart/form-data" method="POST" action="<c:url value='register.do' />" id="register.do">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#normal">一般會員</a></li>
							<li><a data-toggle="tab" href="#creator">創作者</a></li>
						</ul>

						<div class="tab-content">
							<div id="normal" class="tab-pane fade in active">
								<div class="form-group">
									<div class="cols-sm-10">
<!-- 										<div class="input-group"> -->
<!-- 											<span class="input-group-addon addon-facebook"> -->
<!-- 									<i class="fa fa-fw fa-2x fa-facebook fa-fw" ></i> -->
<!-- 								</span> -->
<!-- 											<a class="btn btn-lg btn-block btn-facebook" href="#"> Register with Facebook</a> -->
<!-- 										</div> -->
									</div>
								</div>
								<div class="form-group">
									<label for="username" class="cols-sm-2 control-label">帳戶名稱：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user-circle-o"   aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="account" value="${param.account}" id="username" placeholder="會員帳號長度最長20字" />
											<font size="-1" color="#FF0000">${MsgMap.errorAccount}</font>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="password" class="cols-sm-2 control-label">密碼：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock fa-lg"  aria-hidden="true" ></i></span>
											<input type="password" class="form-control" name="password" value="${param.password}" id="password" placeholder="密碼長度須介於6-16字，並包含英文與數字"
											/>
											<font color="red" size="-1">${MsgMap.errorPassword}</font>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="confirm" class="cols-sm-2 control-label">確認密碼：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock fa-lg"   aria-hidden="true"></i></span>
											<input type="password" class="form-control" name="password2" value="${param.password2}" id="confirm" placeholder="與會員密碼相同"
											/>
											<font color="red" size="-1">${MsgMap.errorPassword2}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">暱稱：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-vcard fa"   aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="user_name" value="${param.user_name}" id="name" placeholder="長度最長20字" />
											<font color="red" size="-1">${MsgMap.errorUserName}</font>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">手機：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-mobile"   aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="phonenum" value="${param.phonenum}" id="phone" placeholder="Ex:09XXXXXXXX"
											/>
											<font color="red" size="-1">${MsgMap.errorPhonenum}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Email：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-envelope fa"   aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="email" value="${param.email}" id="email" placeholder="須輸入正規Email格式，ex:123@xxx.xxx"
											/>
											<font color="red" size="-1">${MsgMap.errorEmail}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">大頭貼照：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-address-book-o"   aria-hidden="true"></i></span>
											<input type="file" size="40"  class="form-control" name="portrait" />
										</div>
									</div>
								</div>
							</div>

							<div id="creator" class="tab-pane fade">
								<label>註冊為創作者</label>
								<input type="checkbox" name="registerArtist" value="true">
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">真實姓名：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="art_name" value="${param.art_name}" id="art_name" placeholder="輸入您的真實姓名" />
											<font color="red" size="-1">${MsgMap.errorArtName}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">身分證字號：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="ID" value="${param.ID}" id="ID" placeholder="輸入合法台灣身分證字號" />
											<font color="red" size="-1">${MsgMap.errorID}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">生日：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="birthday" value="${param.birthday}" id="birthday" placeholder="輸入您的生日 e.g.1990-01-01" />
											<font color="red" size="-1">${MsgMap.errorBirthday}</font>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">銀行帳戶：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bank"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="bank_account" value="${param.bank_account}" placeholder="輸入您的收款帳號"
											/>
											<font color="red" size="-1">${MsgMap.errorArtNum}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">通訊地址：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="art_address" value="${param.art_address}" placeholder="輸入您的通訊地址"
											/>
											<font color="red" size="-1">${MsgMap.errorArtAddress}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">作者簡介：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<textarea name="Introduction" rows="5" cols="20" class="form-control" maxlength="500" placeholder="寫篇吸引人的介紹"></textarea><br>
											<font color="red" size="-1">${MsgMap.errorIntroduction}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">簡介圖片：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input Type="file" size="40" class="form-control"  name="intro_pic">
											<font color="red" size="-1">${MsgMap.errorIntroPic}</font>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">分類標籤：</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-id-card"  aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="hashtag" value="${param.hashtag}" placeholder="用於分類創作作品，每項標籤請以#開頭，ex: #動物"
											/>
											<font color="red" size="-1">${MsgMap.errorHashTag}</font>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<input class="btn btn-warning btn-lg btn-block login-button" type="submit" name="submit" id="submit" value="註冊" />

						</div>
						<p class="text-center" id="demo">You agree to the <strong>Terms & Conditions</strong>.</p>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script>
    $(function() {

        $("#demo").click(function() {
        	//若會員輸入區塊有空格則填滿。
        	if($('input[name="account"]').val() === "")	$('input[name="account"]').val("test02");            	 
            console.log($('input[name="account"]').val());
            if($('input[name="password"]').val() === "")	$('input[name="password"]').val("123qwe");            	 
            console.log($('input[name="password"]').val());
            if($('input[name="password2"]').val() === "")	$('input[name="password2"]').val("123qwe");
            console.log($('input[name="password2"]').val());
            if($('input[name="user_name"]').val() === "")	$('input[name="user_name"]').val("測試一號");        
            console.log($('input[name="user_name"]').val());
            if($('input[name="phonenum"]').val() === "")	$('input[name="phonenum"]').val("0919123456");            	 
            console.log($('input[name="phonenum"]').val());
            if($('input[name="email"]').val() === "")	$('input[name="email"]').val("wisejava004@gmail.com");            	 
            console.log($('input[name="email"]').val());      
        });
        
        $("#demo2").click(function() {
        	//若創作者輸入區塊有空格則填滿。
        	if($('input[name="account"]').val() === "")	$('input[name="account"]').val("test03");            	 
            if($('input[name="password"]').val() === "")	$('input[name="password"]').val("123qwe");            	 
            console.log($('input[name="password"]').val());
            if($('input[name="password2"]').val() === "")	$('input[name="password2"]').val("123qwe");
            console.log($('input[name="password2"]').val());
            if($('input[name="user_name"]').val() === "")	$('input[name="user_name"]').val("測試二號");        
            console.log($('input[name="user_name"]').val());
            if($('input[name="phonenum"]').val() === "")	$('input[name="phonenum"]').val("0919123457");            	 
            console.log($('input[name="phonenum"]').val());
            if($('input[name="email"]').val() === "")	$('input[name="email"]').val("wisejava004@gmail.com");            	 
            console.log($('input[name="email"]').val()); 
        	$('input[name="registerArtist"]').prop("checked",true);
	        if($('input[name="art_name"]').val() === "")	$('input[name="art_name"]').val("張君雅");            	 
	        console.log($('input[name="art_name"]').val());
	        if($('input[name="ID"]').val() === "")	$('input[name="ID"]').val("A123456789");            	 
	        console.log($('input[name="ID"]').val());
	        if($('input[name="birthday"]').val() === "")	$('input[name="birthday"]').val("1990-01-01");            	 
	        console.log($('input[name="birthday"]').val());
	        if($('input[name="bank_account"]').val() === "")	$('input[name="bank_account"]').val("01234567891234");            	 
	        if($('input[name="art_address"]').val() === "")	$('input[name="art_address"]').val("台北市凱達格蘭大道一號");            	 
	        if($('textarea[name="Introduction"]').val() === "")	$('textarea[name="Introduction"]').val("認真上進的好青年");  
            console.log($('textarea[name="Introduction"]').val());
	        if($('input[name="hashtag"]').val() === "")	$('input[name="hashtag"]').val("#認真 #上進 #好青年");            	 
        });
    });
	
	</script>

	</html>