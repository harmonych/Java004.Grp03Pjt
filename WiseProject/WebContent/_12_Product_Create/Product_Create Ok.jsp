<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>商品建立成功</title>


<style >

#floater { 
	height:50%; 
 	margin-bottom:-100px; 
 
}
#middle {  
	clear:both; height:200px; position:relative; 
}


#meg{
	text-align:center;
	
}

</style>

</head>
<body  style="background:white;">

<%
	int n =5;
	response.setHeader("Refresh", n + ";URL=http://saudade.myasustor.com:8080/WiseProject/index.jsp");
%>
<!-- <div id='content' width='500px' style="border-width:2; background:#E0E0E0;  -->
<!--               border-style:inset; border-color:#EF02A4; display: table-cell;  -->
<!--     vertical-align: middle;"> -->
<!-- 	<h3   style="text-align: center; margin:50px">註冊會員成功!</h3> -->
<!-- 	<div style="text-align: center;">請記得至您的信箱收取驗證信</div> -->
<!-- 	<div style="text-align: center;">網頁將在5秒後自動導向首頁</div> -->
<!--     </div>   alert-dismissible    -->
    
	
	    <div class="row">
	    	<div id="floater"></div>
			    <div id="middle" class="alert alert-success alert-dismissible">
					<div id="meg">
						<h2><i class="icon fa fa-check"></i> 商品建立成功!!</h2>
			        </div><br>
<!-- 			        <div id="meg"> -->
<!-- 			        	<h4>請記得至您的信箱收取驗證信</h4> -->
<!-- 			        </div> --><br>
			        <div id="meg">
			        	<h4>網頁將在5秒後自動導向首頁</h4>
			        </div>
				</div>		   
		</div>    
	
    
</body>
</html>