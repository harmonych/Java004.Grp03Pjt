<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="context" value="${pageContext.request.contextPath}" />
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
				.input-group .form-control{
					width: 270px;	
				}
				.input-group-addon:first-child{
					width: 50px;
				}
			</style>
            <title>Login</title>
    </head>

    <body>
        <c:set var="funcName" value="LOG" scope="session"/>
<c:set var="msg" value="登入" />
<%-- <c:if test="${ ! empty sessionScope.timeOut }" > <!-- 表示使用逾時，重新登入 --> --%>
<%--    <c:set var="msg" value="<font color='red'>${sessionScope.timeOut}</font>" /> --%>
<%-- </c:if> --%>
<!-- 引入共同的頁首 -->
        <div class="container">
            <div class="row main">
                <div class="main-login main-center">
                    <p class="text-center">Register an account? <a href="${context}/_01_register/register.jsp">Register in here</a></p>
                    <h5 class="text-center">創作不為什麼，只是刻下痕跡</h5>
                    <Form action="<c:url value='login.do' />" method="POST" name="loginForm">
                    <!--<Font color="#006600" face="標楷體">${funcName},${msg}</Font>-->

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">帳號：</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="account" value="${sessionScope.account}" id="username" placeholder="Enter your Username" />
                                    <small><Font color='red' size="-3">${ErrorMsgKey.AccountEmptyError}</Font></small>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">密碼：</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" value="${sessionScope.password}" id="password" placeholder="Enter your Password" />
                                    <small><Font color='red'  size="-3">${ErrorMsgKey.PasswordEmptyError}</Font></small>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <input type="checkbox" name="rememberMe" <c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if> value="true">
                            <small>記住密碼</small>
                            <Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font>
                            <input class="btn btn-primary btn-lg btn-block login-button" type="submit" name="submit" id="submit" value="Login" />
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>