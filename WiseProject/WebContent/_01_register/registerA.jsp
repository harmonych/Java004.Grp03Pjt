<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入會員</title>
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
function setFocusToUserId(){   
	 document.forms[0].mid.focus();   // 將游標放在mid欄位內
}
</script>
</head>
<body onLoad="setFocusToUserId()" >
<c:set var="funcName" value="REG" scope="session"/>
  <div id="content"> 
  <Table width="700" border='2' cellspacing="0" bgColor='#E7CDFF'>
     <TR height="60" >
         <TD>
         <TABLE cellspacing="1" >
         <TR>
             <TD width="680" colspan='3' align="center" >
                 <Font color="#006600" size='5' face="標楷體">${AppName}</Font>
             </TD>
         </TD>
         </TR>
         <TR>
             <TD width="240" ></TD>
             <TD width="200"  align="center">
                 <Font color="#006600" size='4' face="標楷體">加入會員</Font>
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
  <form ENCTYPE="multipart/form-data" method="POST" action="<c:url value='register.do' />"  id="register.do" >
      <Font color="red" size='2' face="verdana" >*為必填欄位</Font><br/>
      <label class="fontSize" >*會員帳號：</label>
      <input type="text" name="account" value="${param.account}" class="fieldWidth" maxlength="20" style="width: 200px" >
  	  <font size="-1" color="#FF0000">${MsgMap.errorAccount}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　會員帳號長度最長20字</Font><br/>
      
      <label class="fontSize" >*會員密碼：</label>
      <input type="password" name="password" value="${param.password}" class="fieldWidth" maxlength="16" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorPassword}</font>      
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　密碼長度須介於6-16字，並包含英文與數字</Font><br/>
      
      <label class="fontSize" >*密碼確認：</label>
      <input type="password" name="password2" value="${param.password2}"   class="fieldWidth" maxlength="16" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorPassword2}</font>            
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　必須與會員密碼相同</Font><br/>
      
      <label class="fontSize" >*會員名稱：</label>
      <input type="text" name="user_name" value="${param.user_name}"  class="fieldWidth" maxlength="20" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorUserName}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　會員名稱長度最長20字</Font><br/>
      
      <label class="fontSize" >*手機號碼：</label>
      <input type="text"  name="phonenum" value="${param.phonenum}"    class="fieldWidth" maxlength="10" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorPhonenum}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　須輸入台灣手機號碼格式，ex:09XXXXXXXX</Font><br/>
      
      <label class="fontSize" >*會員信箱：</label>
          <input type="text"  name="email" value="${param.email}"   class="fieldWidth" maxlength="50" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorEmail}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　須輸入正規Email格式，ex:123@xxx.xxx</Font><br/>
      
      
      
      <label class="fontSize" >會員性別：</label>
      <select name="gender" class="fieldWidth" style="width: 60px;">
　			<option value="1"></option>
			<option value="2">男</option>
　			<option value="3">女</option>
	  </select>
	   <br/>
      
      <label class="fontSize" >會員生日：</label>
          <input type="date"  name="birthday"  value="${param.birthday}"   class="fieldWidth" style="width: 150px;">
          <font color="red" size="-1">${MsgMap.errorBirthday}</font> 
      <br/>
      
      
      <label class="fontSize" >大頭貼照：</label>
      <Input Type="file" size="40" class="fieldWidth" style="width: 400px;"  name="portrait"><BR>
      <br/>        	
      
      <label >註冊為創作者</label>	
      <input type="checkbox" name="registerArtist" value="true"><BR>
      <br/>	
      
      <label class="fontSize" >作者簡介：</label>
      <textarea name="Introduction" rows="5" cols="20" class="fieldWidth" maxlength="500"></textarea><br>
      <font color="red" size="-1">${MsgMap.errorIntroduction}</font>
      <br/>

      <label class="fontSize" >*簡介圖片：</label>
      <Input Type="file" size="40" class="fieldWidth" style="width: 400px;"  name="intro_pic">
      <font color="red" size="-1">${MsgMap.errorIntroPic}</font>
      <br/>
      
      <label class="fontSize" >銀行帳戶：</label>
          <input type="text"  name="bank_account" value="${param.bank_account}"   class="fieldWidth" maxlength="20" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorBankAccount}</font>
      <br/>
      
      <label class="fontSize" >*身分證字號：</label>
          <input type="text"  name="ID" value="${param.ID}"   class="fieldWidth" maxlength="10" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorID}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　須輸入合法台灣身分證字號</Font><br/>
      
      <label class="fontSize" >*真實姓名：</label>
          <input type="text"  name="art_name" value="${param.art_name}"   class="fieldWidth" maxlength="20" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorArtName}</font>
      <br/>
      
      <label class="fontSize" >*通訊地址：</label>
          <input type="text"  name="art_address" value="${param.art_address}"   class="fieldWidth" maxlength="100" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorArtAddress}</font>
      <br/>
      
      <label class="fontSize" >*聯絡電話：</label>
          <input type="text"  name="art_num" value="${param.art_num}"   class="fieldWidth" maxlength="10" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorArtNum}</font>
      <br/>
      <label></label>
      <Font color="black" size='1' face="verdana">　須輸入台灣手機號碼格式，ex:09XXXXXXXX</Font><br/>
      
      <label class="fontSize" >分類標籤：</label>
          <input type="text"  name="hashtag" value="${param.hashtag}"   class="fieldWidth" maxlength="50" style="width: 200px;">
          <font color="red" size="-1">${MsgMap.errorHashTag}</font>
      <br/>
       <label></label>
      <Font color="black" size='1' face="verdana">　用於分類創作作品，每項標籤請以#開頭，ex: #動物</Font><br/><br/>
           
        	
      <div id="btnArea" align="center">
         <input type="submit" name="submit" id="submit" value="註冊"/>
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