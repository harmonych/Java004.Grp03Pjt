<!--
   執行本網頁之前，會先執行_02_login.filter.FindUserPassword.java這個Filter。
        本網頁 login.jsp 提供登入的畫面，然後將userId與pswd傳給
   <Form>的action屬性為login.do，它對應的程式為_02_login.controller.LoginServlet.java
   ，由該Servlet來檢查userId與pswd是否正確。    -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入</title>
<style type="text/css">
#main {
	position:relative;
	top: 50px;
    width:100%;
    text-align:center;
}
#content {
  width: 500px ;
  margin-top: 100px;
  margin-left: auto ;
  margin-right: auto ;
}
</style>
<script type="text/javascript">
//由<body>的onLoad事件處理函數觸發此函數
function setFocusToUserId(){   
	 document.forms[0].userId.focus();   // 將游標放在userId欄位內
}
</script>
</head>
<body onLoad="setFocusToUserId()" style="background:#EBFFEB;">
<!-- 下列敘述設定變數funcName的值為LOG，top.jsp 會用到此變數 -->
<c:set var="funcName" value="LOG" scope="session"/>
<c:set var="msg" value="登入" />
<%-- <c:if test="${ ! empty sessionScope.timeOut }" > <!-- 表示使用逾時，重新登入 --> --%>
<%--    <c:set var="msg" value="<font color='red'>${sessionScope.timeOut}</font>" /> --%>
<%-- </c:if> --%>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/top.jsp" />


<Form action="<c:url value='login.do' />" method="POST" name="loginForm">
<div id='content'>
    <Table  width='500px' style="border-width:2; background:#E0E0E0; 
                        border-style:inset; border-color:#EF02A4;">
         <TR>
             <TH width="180">&nbsp;</TH>
             <TH width="180">&nbsp;</TH>
         </TR>
         <TR>
             <TD colspan='2' align="CENTER" style="font-size:0.6cm;font-weight: 300;"> 
                <Font color="#006600" face="標楷體">
                    ${AppName}
                </Font>
             </TD>
         </TR>
         <TR>
             <TD height='50' colspan='2' align="CENTER" style="font-size:0.5cm;font-weight: 300;"> 
                <Font color="#006600"  face="標楷體">
                    ${msg}
                </Font>
             </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
         <TR>
             <TD width="180" align="right">帳號：　</TD>
             <TD width="180" colspan='2' align="LEFT">
             <input  type="text" name="account" size="10" 
             value="${sessionScope.account}">
             
             &nbsp;<small><Font color='red' size="-3">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
         </TR>
         <TR>
             <TD width="180" align="right">密碼：　</TD>
             <TD width="180" colspan='2' align="LEFT" >
             <input  type="password" name="password"  size="10" 
             value="${sessionScope.password}">
              
             &nbsp;<small><Font color='red'  size="-3">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
             
         </TR>  
         <tr>
         <TD width="180" align="right" >
             <input type="checkbox" name="rememberMe" 
               <c:if test='${sessionScope.rememberMe==true}'>
                  checked='checked'
               </c:if> 
             value="true">
         </TD>
         <TD width="180"  colspan='2' align="left"><small>記住密碼</small></TD>
             
         </tr>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;<Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
         </TR>
        <TR>
            <TD colspan="2" align="center"><input type="submit" value="登入"> </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
    </Table>
    </div>
</Form>
</body>
</html>