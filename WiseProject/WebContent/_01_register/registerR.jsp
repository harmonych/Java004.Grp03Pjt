<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../asset/css/bootstrap.min.css">
	<link rel="stylesheet" href="../asset/css/bootstrap-theme.min.css">
    <script src='..\js\react.js'></script>
    <script src='..\js\react-dom.js'></script>
    <script src='..\js\babel.min.js'></script>
    <style>
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
				}
				
				.main-center {
					margin-top: 30px;
					margin: 0 auto;
					max-width: 400px;
					padding: 10px 40px;
					background: #fff;
					/*background: #009edf;*/
					color: dodgerblue;
					text-shadow: none;
					-webkit-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
					-moz-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
					box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
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
			</style>
    <title>test</title>
</head>
<body onLoad="setFocusToUserId()">
		<c:set var="funcName" value="REG" scope="session" />
    <div class="" id="header"></div>
    <script type='text/babel'>
    ReactDOM.render(
        <div className="container">
			<div className="row main">
				<div className="main-login main-center">
					<p className="text-center">Already have an account? <a href="#">Sign in here</a></p>
					<h5>能被欣賞的創作，才是有價值的，快加入證明你的天才作品吧</h5>
					<form ENCTYPE="application/x-www-form-urlencoded" method="POST" action="<c:url value='register.do' />" id="register.do">
						<div className="form-group">
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon addon-facebook">
									<i className="fa fa-fw fa-2x fa-facebook fa-fw"></i>
								</span>
									<a className="btn btn-lg btn-block btn-facebook" href="#"> Register with Facebook</a>
								</div>
							</div>
						</div>
						<div className="form-group">
							<label for="username" className="cols-sm-2 control-label">Username</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" className="form-control" name="account" value="${param.account}" id="username" placeholder="會員帳號長度最長20字" />
									<font size="-1" color="#FF0000">"${MsgMap.errorAccount}"</font>
								</div>
							</div>
						</div>

						<div className="form-group">
							<label for="password" className="cols-sm-2 control-label">Password</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" className="form-control" name="password" value="${param.password}" id="password" placeholder="密碼長度須介於6-16字，並包含英文與數字"
									/>
									<font color="red" size="-1">"${MsgMap.errorPassword}"</font>
								</div>
							</div>
						</div>

						<div className="form-group">
							<label for="confirm" className="cols-sm-2 control-label">Confirm Password</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" className="form-control" name="password2" value="${param.password2}" id="confirm" placeholder="與會員密碼相同"
									/>
									<font color="red" size="-1">"${MsgMap.errorPassword2}"</font>
								</div>
							</div>
						</div>
						<div className="form-group">
							<label for="name" className="cols-sm-2 control-label">Your Name</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" className="form-control" name="user_name" value="${param.user_name}" id="name" placeholder="長度最長20字" />
									<font color="red" size="-1">"${MsgMap.errorUserName}"</font>
								</div>
							</div>
						</div>

						<div className="form-group">
							<label for="email" className="cols-sm-2 control-label">Your Phone</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" className="form-control" name="phonenum" value="${param.phonenum}" id="phone" placeholder="Ex:09XXXXXXXX"
									/>
									<font color="red" size="-1">"${MsgMap.errorPhonenum}"</font>
								</div>
							</div>
						</div>
						<div className="form-group">
							<label for="email" className="cols-sm-2 control-label">Your Email</label>
							<div className="cols-sm-10">
								<div className="input-group">
									<span className="input-group-addon"><i className="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" className="form-control" name="email" value="${param.email}" id="email" placeholder="須輸入正規Email格式，ex:123@xxx.xxx"
									/>
									<font color="red" size="-1">"${MsgMap.errorEmail}"</font>
								</div>
							</div>
						</div>


						<div className="form-group ">
							<input className="btn btn-primary btn-lg btn-block login-button" type="submit" name="submit" id="submit" value="註冊" />

						</div>
						<p className="text-center">You agree to the <strong>Terms & Conditions</strong>.</p>


					</form>
				</div>
			</div>
		</div>,document.getElementById('header')
    );
</script>
</body>
</html>