<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
	<c:set var="context" value="${pageContext.request.contextPath}" />
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="${context}/css/Fc_Create.css">
	  <title>建立專案</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

      <style>
        .logo img {
          width: 50px;
          height: 35px;
        }
        
        .carousel-inner .item img {
          max-height: 600px;
        }
        .navbar-form{
          display: inline-flex;
        }
      </style>
    </head>
 
    <body class="hold-transition skin-yellow-light sidebar-mini ">
      <c:set var="userName" value="${LoginOK.user_name}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />

          <section class="content-header">
          </section>

          
          <section class="content">
          
			<div class="row">				
				
				<!-- 募資輸入欄 -->
				<div class="card02 col-md-8 col-md-offset-2">
					<div class="box box-warning">
						<div class="box-header with-border">
				        	<h3 class="" ><b>建立專案</b></h3>
				        	<div class="box-title" id ="demo3">步驟1 >> 填寫資訊</div>
				        </div>
						
						<div class="box-body">	
							<form  ENCTYPE="multipart/form-data" method="POST" action="<c:url value='/_10_Fc_Create/FundCreate.do' />" 
									id="FundCreate.do" >
								
								<div id="ipt1">
						        	<label>專案名稱</label>
						        	<input id="art_id" name = "art_id" value="<c:out value ="${IsArtist.art_id}"/>" type="hidden"/>
						        	<input type="text" id= "fcname" name="fcname" value="${param.fcname}" class="form-control">
									<font size="-1" color="#FF0000">${MsgMap.errorfcnameEmpty}${MsgMap.errorfcnameDup}</font>
					            </div>
										
								<div id="ipt1">
				                 	<label>專案金額</label>
				                 	<input type="text" name="fcmoneys" value="${param.fcmoneys}" class="form-control">
									<font color="red" size="-1">${MsgMap.errorfcmoneysEmpty}</font>
				                </div>
										
								<div id="ipt1">
				                 	<label>開始時間</label>
				                 	<input type="date" name="starttime" value="${param.starttime}" class="form-control ">
									<font color="red" size="-1">${MsgMap.errorstarttimeEmpty}</font>
				                </div>
				                
								<div id="ipt1">
				                 	<label>結束時間</label>
				                 	<input type="date" name="endtime" value="${param.endtime}" class="form-control ">
									<font color="red" size="-1">${MsgMap.errorendtimeEmpty}</font>
				                </div>
				                				               
								<div id="ipt1">
				                 	<label>分類標籤</label>
				                 	<input type="text" name="hashtag" value="${param.hashtag}" class="form-control">
									<font color="red" size="-1">${MsgMap.errorhashtagEmpty}</font>
				                </div>
				                
				                <div id="ipt1">
					                <label>專案簡介</label>
					                <textarea name="fcintroduction" class="form-control" rows="5"></textarea><br>
									<font color="red" size="-1">${MsgMap.errorfcintroduction}</font>					                
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
										<input type="submit" name="submit" class="btn1 btn-lg" value="發起專案"></a>
									</div>
<!-- 									<div id="bt">	 -->
<!-- 										<input type="reset" name="cancel" class="btn2 btn-lg btn-block" value="清除重填"> -->
<!-- 									</div> -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
          </section>    

      <!-- jQuery 2.2.3 -->
<%--       <script src="${context}/plugins/jQuery/jquery-2.2.3.min.js"></script> --%>
      <!-- Bootstrap 3.3.6 -->
<%--       <script src="${context}/bootstrap/js/bootstrap.min.js"></script> --%>
<!--       AdminLTE App -->
<%--       <script src="${context}/dist/js/app.min.js"></script> --%>
	<script type="text/javascript">
$(function() {

    $("#demo3").click(function() {
    	//若會員輸入區塊有空格則填滿。
    	if($('input[name="fcname"]').val() === "")	$('input[name="fcname"]').val("人類與狗的一生");            	 
        console.log($('input[name="fcname"]').val());
        if($('input[name="fcmoneys"]').val() === "")	$('input[name="fcmoneys"]').val("17630");            	 
        console.log($('input[name="fcmoneys"]').val());
        if($('input[name="starttime"]').val() === "")	$('input[name="starttime"]').val("2017-04-21");
        console.log($('input[name="starttime"]').val());
        if($('input[name="endtime"]').val() === "")	$('input[name="endtime"]').val("2017-07-21");        
        console.log($('input[name="endtime"]').val());
        if($('input[name="hashtag"]').val() === "")	$('input[name="hashtag"]').val("#狗 #人類 #好朋友 #動物 #城市");            	 
        console.log($('input[name="hashtag"]').val());
        if($('textarea[name="fcintroduction"]').val() === "")	$('textarea[name="fcintroduction"]').val("狗是人類最好的朋友不僅是狗狗種種窩心的舉動，讓人類認定狗狗是最好的動物朋友，連冷冰冰的科學研究也指出「狗是人類最好的朋友」這句話可能不是人類的一廂情願，是禁得起考驗的。狗會義氣相挺");            	      
    });
});
</script>	
</body>

</html>
