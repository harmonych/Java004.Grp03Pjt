<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊成功</title>
<style type="text/css">

#content {
  width: 500px;
  height:200px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -120px 0 0 -270px;
}
</style>

</head>
<body  style="background:white;">

<%
	int n =5;
	response.setHeader("Refresh", n + ";URL=http://saudade.myasustor.com:8080/WiseProject/index.jsp");
%>
<div id='content' width='500px' style="border-width:2; background:#E0E0E0; 
    border-style:inset; border-color:#EF02A4; display: table-cell;
    vertical-align: middle;">
	<h3   style="text-align: center; margin:50px">註冊會員成功!</h3>
	<div style="text-align: center;">請記得至您的信箱收取驗證信</div>
	<div style="text-align: center;">網頁將在5秒後自動導向首頁</div>
    </div>
</body>
</html>