<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>建立商品</title>
<style type="text/css">
<!--
body {
	background-attachment: fixed;
	background-color: #EBFFEB;
	background-repeat: no-repeat;
	background-position: 20px 50px;
}
.myBorder {
	color:#FFFF99;
	border: thin dotted #FFFFFF;
}
h1 {
	font-family: "標楷體", "新細明體", sans-serif;
	font-size: 24px;
}
.formBkgnd {
	color: #FFFFFF;
	background-color: #666666;
}
label {
	float:left;
	width:8em;
	font-weight:bold;
	color:#000000;
	margin-top:10px;
	margin-bottom:2px;
	margin-right:10px;
	text-align: right;
}

br {
	clear:both;
}
.fieldWidth {
    margin-top:10px;
	margin-bottom: 2px;
	width: 200px;
	background:#F6E497;
	font-size:1.1em;
}
/* 設定字體大小 */
.fontSize {
	font-size:1.1em;
}

#main {
    position:relative;
	left:70px;
	width:600px;
	height:543px;	
	top: 0px;
	z-index:2;
	font-size:0.9em; 
}
/* 主要內容的區塊 */
#content {
  width: 700px ;
  margin-left: auto ;
  margin-right: auto ;
}
/* 設定傳送鈕的樣式 */
#submit {
	width:64px;
	height:30px;
	font-size:1.2em
	color:#FFFFFF;
	margin-right:1.5em;
	border-width:2px;
	border-color: #FFEDAF #B2A268 #B2A268 #FFEDAF;
	background:#A9A9A9;
}
/* 設定取消鈕的樣式 */
#cancel {
	width:64px;
	height:30px;
	font-size:1.2em
	color:#ffffff;
	border-width:2px;
	border-color: #FFEDAF #B2A268 #B2A268 #FFEDAF;
	background:#a9a9a9;
}

#errorMsg {
    position:relative;
    top:0px; 
    left:0px;    
	color:#FF0000;
	font-size:0.8em;
}
-->
</style>
<script type="text/javascript">
//由<body>的onLoad事件處理函數觸發此函數
// function setFocusToUserId(){   
// 	 document.forms[0].mid.focus();   // 將游標放在mid欄位內
// }
</script>
</head>
<body>
<c:set var="funcName" value="REG" scope="session"/>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/top.jsp" />
  <div id="content"> 
  <Table width="700" border='2' cellspacing="0" bgColor='#E7CDFF'>
     <TR height="60" >
         <TD>
         <TABLE cellspacing="1" >
         <TR>
             <TD width="680" colspan='3' align="center" >
                 <Font color="#006600" size='5' face="標楷體">${funcName}</Font>
             </TD>
         </TD>
         </TR>
         <TR>
             <TD width="240" ></TD>
             <TD width="200"  align="center">
                 <Font color="#006600" size='4' face="標楷體">建立商品</Font>
             </TD>
         <!-- 此區塊顯示程式執行後的訊息 -->
             <TD width="240" aligh="left"><font size="-1" color="#FF0000">
                 ${MsgMap.InsertNG}${MsgMap.errorSaveData}</font>
             </TD>
         </TR>         
         </TABLE>
         </TD>
     </TR>
     <TR><TD colspan="3">
  <form ENCTYPE="multipart/form-data" method="POST" action="<c:url value='../_09_product/ProductCreate.do' />"  id="ProductCreate.do" > 
	  <label class="fontSize" >商品名稱：</label>
      <input type="text" name="proname" value="${param.proname}" class="fieldWidth" style="width: 200px;">
      <!-- 
         注意value屬性的內容以及顯示錯誤訊息的寫法
      -->
      <font size="-1" color="#FF0000">${MsgMap.errorpronameEmpty}</font>
      <br/>
      <label class="fontSize" >商品金額：</label>
      <input type="text" name="prices" value="${param.prices}" class="fieldWidth" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorpricesEmpty}</font>      
      <br/>
      
      <label class="fontSize" >上架日期：</label>
      <input type="date" name="saletime" value="${param.saletime}"   class="fieldWidth" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorsaletimeEmpty}</font>            
      <br/>
      
      <label class="fontSize" >庫存個數：</label>
      <input type="number" min="0" name="proinvs" value="${param.proinvs}"  class="fieldWidth" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorproinvsEmpty}</font>
      <br/>
      
      <label class="fontSize" >商品簡介：</label>
      <textarea name="prointroduction" rows="5" cols="20" class="fieldWidth"></textarea><br>
      <font color="red" size="-1">${MsgMap.errorprointroduction}</font>
      <br/>
      
      <label class="fontSize" >標籤：</label>
          <input type="text"  name="hashtag" value="${param.hashtag}"   class="fieldWidth" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorhashtagEmpty}</font>
      <br/>
            
     <div id="btnArea" align="center">
         <input type="submit" name="submit" id="submit" value="建立"/>
         <input type="reset" name="cancel" id="cancel" value="重填">
      </div>
      <br/>
</form>
</TD>
</TR>
</Table>
</div>
</body>
</html>