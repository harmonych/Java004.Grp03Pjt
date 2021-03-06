<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<c:set var="context" value="${pageContext.request.contextPath}"/>
	<%-- 	<c:set var ="pic_address" value = "${ppb. }" --%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品內容頁</title>
	            				
		<!-- Tell the browser to be responsive to screen width -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js" ></script>
		<meta
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Font Awesome -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
			
		<link rel="stylesheet" href="${context}/css/Product_info.css">
		
	</head>
	<body class="hold-transition skin-yellow-light sidebar-mini ">
	<!-- Content Wrapper. Contains page content -->
<!-- 		<div class="content-wrapper"> -->
			<!-- Content Header (Page header) -->
<!-- 			<section class="content-header"></section> -->

			<!-- Main content -->
			<input id="proid"  value="<c:out value ="${pb.pro_id}"/>" type="hidden"/>
			<section class="content">
				<!-- Your Page Content Here -->
				<div class="row">
					<!-- 圖片顯示欄 -->
					<div class="card_card01 col-md-4 col-md-offset-2">
					  <div id="img_area" class = "showbox">
						<img src=" <c:out value ="${pbl[0].pic_adress}"/>" id="pro_img" width="400" height="400">						
					  </div>
					  <a>
					  <div class="pic_address" id ="selections">
						<c:forEach var="i" begin="0" end="${fn:length(pbl)-1}">
   							<img src="<c:out value="${pbl[i].pic_adress}"/>" title=""> 
						</c:forEach>
						<br clear="all">
					  </div>
					  </a>
					</div>
				
					<!-- 商品介紹欄 -->
					<div class="card_card02 col-md-4">
						<header id="info_area">
							
								<div id="pro_name">
									<h1><c:out value ="${pb.pro_name}"/></h1>
								</div>
							
								<div id="art_id" >
									<a href ="javascript:;" id ="ip_art_id<c:out value = "${ab.art_id }"/>" class = "img-link">
									<h3><c:out value ="${mb.user_name}"/></h3></a>
								</div>
							
								<div id="sale_time">
									上架時間：<c:out value ="${pb.sale_time}"/>
								</div>
							
								<div id="price">
									單價：<c:out value ="${pb.price}"/>
								</div>
								<div id="pro_inv">
									 庫存：<c:out value ="${pb.pro_inv}"/>
								</div>
						
							<div id="line"></div>
					
							<div id="pro_introduction">
								<label id="lb">商品簡介 : </label><br>
								<p>
									<c:out value ="${pb.pro_introduction}"/> <br>
								</p>
							</div>
						</header>
					
						<div id="line"></div>
					<c:choose>
						<c:when test="${LoginOK != null}">
						<div id="buy_area">
							<form id="cartFormList"  method="POST">
								<div id="quantity">
									<div>
										<label>購買數量</label>
									</div>
									<div>
										<select class="form-control" name="ord_amount" >
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
										</select>
									</div>
								</div>
									<Input type='hidden' id='pro_inv_input' name='pro_inv' value="${pb.pro_inv}"> 
									<Input type='hidden' id='pro_id_input' name='pro_id' value="${pb.pro_id}"> 
									<Input type='hidden' id='pro_name_input' name='pro_name' value="${pb.pro_name}"> 
									<Input type='hidden' id='art_id_input' name='art_id' value="${pb.art_id}">
									<Input type='hidden' id='price_input' name='price' value="${pb.price}">
									<Input type='hidden' id='user_id_input' name='user_id' value='${LoginOK.user_id}'>

								
								<div id="bt_area">
								<input type="button" id = "sp-OrderList" name="addShoppingCart" class="btn2 btn-lg btn-block" 
								value="加入購物車" onClick="this.form.action='<c:url value='/_04_ShoppingCart/OrderList.do' />';this.form.submit();">
								
								<input type="button" id ="sp-ListNow" name="buyNow" class="btn1 btn-lg btn-block"
									value="立即購買" onClick="this.form.action='<c:url value='/_04_ShoppingCart/OrderListNow.do' />';this.form.submit();">
								
<!-- 								<button type="submit" id = "sp-OrderList" name="addShoppingCart" class="btn2 btn-lg btn-block formSubmit"  -->
<!-- 								value="submit" >加入購物車</button> -->
								
<!-- 								<button type="submit" id ="sp-ListNow" name="buyNow" class="btn1 btn-lg btn-block orderNow" -->
<!-- 									value="submit"> 立即購買</button> -->
								</div>
							</form>
						</div>
						</c:when>
						<c:otherwise>
						<div id="buy_area">
							<form id="form1">													
								<div id="bt_area">
									<a href="${context}/_02_login/login.jsp">
										<input type="button" class="btn1 btn-lg btn-block" value="立即登入購買">
									</a>
									<a href="${context}/_01_register/register.jsp">
										<input type="button" class="btn2 btn-lg btn-block" value="立即註冊購買">
									</a>
								</div>
							</form>		
						</div>
						
						</c:otherwise>
					</c:choose>
					</div>
				</div>

								
			  	<!-- 留言填寫欄位 -->   
			  	                 
	          	<div id="r2" class="row">
	          	<c:choose>
								<c:when test= "${LoginOK != null}"> 
	          		<form ENCTYPE="multipart/form-data" method="POST"  id="proMessage" >
	          		<div class="card03 col-md-8 col-md-offset-2">
	          			<div class="box box-warning">
	            			<div class="box-header with-border">
	            				<input id="pro_id" name = "pro_id" value="<c:out value ="${pb.pro_id}"/>" type="hidden"/>
	            				<input id="receiver_name" name = "receiver_name" value="<c:out value ="${mb.user_name}"/>" type="hidden"/>
	            				<input id="receiver_id" name = "receiver_id" value="<c:out value ="${mb.user_id}"/>" type="hidden"/>
	            				<input id="user_id" name = "user_id" value="<c:out value ="${LoginOK.user_id }"/>" type="hidden"/>
	              				<input id="sender_name" name = "sender_name" value="<c:out value ="${LoginOK.user_name}"/>" type="hidden"/>
	              				 
	              				<h3 class="box-title">我要留言給<c:out value ="${mb.user_name}"/>
									<input type="checkbox" name="msg_status" value="0">並設為私密留言</h3>
	            			</div>
	            					            	
					       
			         			<div class="box-body">
			              			<div class="form-group">
			                			<input class="form-control" name= "msg_title" placeholder="留言標題">
			              			</div>      	
			              			<div class="form-group">
			                    		<textarea id="compose-textarea" class="form-control" name ="msg_txt" placeholder="在此輸入內容" style="height: 300px"></textarea>
			              			</div>
			            		</div>
			            		<!-- /.box-body -->
			            		<div class="box-footer">
			              			<div class="pull-right">
			                			<button type="submit" id="btn3" class="btn btn-warning">送出留言 </button> 
			              			</div>
			            		</div>
			           			<!-- /.box-footer -->
	          			</div>
	          			<!-- /. box box-warning -->
	        		</div>
	        		</form>
	        	</div>
	      	</section>
	      	</c:when>
	      	
      	<c:otherwise>
      		<section class="content">
	          	<div class="row">
	          		<div class="card03 col-md-8 col-md-offset-2">
	          			<div class="box box-warning">
	            			<div class="box-header warning">
	            				<h3 class="box-title">欲留言請先登入</h3>
	            			</div>
	            		</div>
	          		<!-- /. box -->
	        		</div>
	        	</div>      
      		</section>
      	</c:otherwise>
      	</c:choose>
        <!-- /.content -->
       

		<!-- 留言串列 -->
        <section>
        	<div class="row" id ="renewToView">
          		<div class="card03 col-md-8 col-md-offset-2">
<!-- 			        <div class="box box-warning " id = "previous_msg"> -->
<!-- 			          <div class="box-header with-border"> -->
<!-- 			            <div> -->
<!-- 			            	<h4 class="box-title">留言標題</h4> -->
<!-- 			            </div> -->
<!-- 			            <br> -->
<!-- 			            <div> -->
<!-- 			            	<div class="mes_by">留言人</div> -->
<!-- 			            </div> -->
<!-- 			          </div> -->
<!-- 			          <div class="box-body"> -->
<!-- 			          		<div class="message">留言內容</div> -->
<!-- 			          </div> -->
<!-- 			          /.box-body -->
<!-- 			        </div> -->
			   </div>     
			</div>	        
        </section>		
<script>
$(document).ready(function(){
	$(function() {
	    $("#selections").find('img').bind("click", function() {
        var src = $(this).attr("src");
        // 把src抓到的當前url值帶入
        $(this).attr("src", src);
        //把當前的元素砍掉
        $(".showbox").children('img').remove();
        //增加新url在showbox這class下面
        $(".showbox").append('<img src="' + $(this).attr('src') + '" id="pro_img"  width="400px" height="400px">');
        });	
    });
	var pro_id = $('#proid').val();
	//讀取瀏覽者user_id
	var reader_id = $('#user_id').val();
	//讀取創作者user_id
	var receiver_id = $('#receiver_id').val();
	console.log(pro_id);
	console.log(reader_id);
	console.log(receiver_id);
	
	$.ajax({
		  url: "\_11_message\\promessage.json",
		  type: "GET", 
		  data: { 
		    "pro_id": pro_id, 
		  },
		  success: function(resMsgOK) {
			  var respm = resMsgOK;
			  var msgStr ='<div class="card03 col-md-8 col-md-offset-2">';
			  msgStr += '<div class="box box-warning " id = "previous_msg">';
			  //start of fist for-loop
			  var j = respm.length;
			  for (var i = 0 ; i<respm.length; i++){
				  //如果設為私密，但讀者非寄送者或者擁有者 first if
				  if(respm[i].msg_status == 0 && (reader_id != respm[i].user_id && reader_id != receiver_id || reader_id == null || reader_id =="" )){
					  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#' + (j--);
					  msgStr += '</h4></div><br>' ;
// 					  msgStr += '<div><div class="mes_by"></div></div>';
					  msgStr += '</div><div class="box-body"><div class="message">此為私密留言內容</div></div>';
				  }else{
					  //second if 讀者為寄送者或者擁有者
					  if(respm[i].msg_status == 0 && (reader_id == respm[i].user_id || reader_id == receiver_id)){
						  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#';
						  msgStr += (j--) + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_title + '</h4></div><br><div>';
						  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
						  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
					  }else{						  
						  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#' ;
						  msgStr += (j--) + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_title + '</h4></div><br><div>';
						  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
						  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
					  }//end of second if
					  
				  }//end of first if
				  
			  }
			  msgStr += '</div></div>';
			  console.log(msgStr);
			  console.log(resMsgOK);
			  var divm = document.getElementById('renewToView');
			  divm.innerHTML = msgStr;
		  },
		  error: function(resMsgErr) {
			  resMsgErr.abort();
		  }
});
	var opts = {
			url:'\_11_message\\proMessage.do',
			success: function(){	
				$('#renewToView').empty();
		        alert("留言成功!");
		        $.ajax({
					  url: "\_11_message\\promessage.json",
					  type: "GET", 
					  data: { 
					    "pro_id": pro_id, 
					  },
					  success: function(resMsgOK) {
						  var respm = resMsgOK;
						  var msgStr ='<div class="card03 col-md-8 col-md-offset-2">';
						  msgStr += '<div class="box box-warning " id = "previous_msg">';
						  //start of fist for-loop
						  for (var i = 0 ; i<respm.length; i++){
							  //如果設為私密，但讀者非寄送者或者擁有者 first if
							  if(respm[i].msg_status == 0 && (reader_id != respm[i].user_id && reader_id != receiver_id || reader_id == null || reader_id =="" )){
								  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">';
								  msgStr += '</h4></div><br><div>#' + (i+1);
								  msgStr += '<div class="mes_by"></div></div></div>';
								  msgStr += '<div class="box-body"><div class="message">此為私密留言內容</div></div>';
							  }else{
								  //second if 讀者為寄送者或者擁有者
								  if(respm[i].msg_status == 0 && (reader_id == respm[i].user_id || reader_id == receiver_id)){
									  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">';
									  msgStr += respm[i].msg_title + '</h4></div><br><div>#' + (i+1);
									  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
									  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
								  }else{						  
									  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">';
									  msgStr += respm[i].msg_title + '</h4></div><br><div>#' + (i+1);
									  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
									  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
								  }//end of second if
								  
							  }//end of first if
							  
						  }
						  msgStr += '</div></div>';
						  console.log(msgStr);
						  console.log(resMsgOK);
						  var divm = document.getElementById('renewToView');
						  divm.innerHTML = msgStr;
					  },
					  error: function(resMsgErr) {
						  resMsgErr.abort();
					  }
				});
			}
	}
	$("#proMessage").unbind('click').click(function(){
		$('#proMessage').on('submit', function(e){
		    e.preventDefault();
			$(this).ajaxSubmit(opts);		
			return false;
		})
	})
	function CheckForm(){
		var pro_inv = document.getElementById("pro_inv_input").value;
		var ord_amount = document.getElementById("ord_amount").value;
		if(pro_inv < ord_amount){
			alert("訂購數量高於庫存數量");
			return false;
		}else{
			  if(confirm("是否將此商品加入購物車?")){
				  return true;
			  }else{
				  return false;
			  }
		}   
	}
	 $(document).on('click', ".img-link" , function(){
		  //抓出內頁ID
		  var uni_ip_id = $(this).attr('id');
		  //命名邏輯為ip_xxx_id_y, xxx { fc, pro, art}, y為整數
		  //start of first if-else
		  if (uni_ip_id.substring(0,2)==="ip"){
			  //先判斷是否為fc_id
			  //start of second if-else
			  if(uni_ip_id.substring(3,5)==="fc"){
				  var fc_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
				  console.log("this is fc_id" + uni_ip_id);
		  		  $.ajax({
		  			  //執行Servlet 07 DisplaySingleFundPage.java
		  			  url:"\_11_Fc_info\\DisplayFund?fc_id=" + fc_id,
		  			  context: document.body,
		  			  type: "get",
		  			  success: function(responseIpFcId){
		  				  $("#mainframe").empty();
		  				  $('#mainframe').html(responseIpFcId);
		  			  },
		  			  error: function(responseIpFcIdErr){
		  				  console.log(fc_id);
		  			  }
		  		  });
			  }else{
				  //再判斷是否為pro_id
				  //start of third if-else
				  if(uni_ip_id.substring(3,5)==="pr"){
					  var pro_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
					  console.log("this is pro_id : " + uni_ip_id);
			  		  $.ajax({
			  			  //執行Servlet 08 DisplaySingleProductPage.java
			  			  url:"\_13_Product_info\\DisplayProduct?pro_id=" + pro_id,
			  			  context: document.body,
			  			  type: "get",
			  			  success: function(responseIpProId){
			  				  $("#mainframe").empty();
			  				  $('#mainframe').html(responseIpProId);
			  			  },
			  			  error: function(responseIpProIdErr){
			  				  console.log(pro_id);
			  			  }
			  		  });
				  }else{
					  //最後判斷是否為art_id
					  //start of fourth if-else
					  if(uni_ip_id.substring(3,5)==="ar"){
						  var art_id = parseInt(uni_ip_id.replace( /[^\d.]/g, '' ), 10);
						  console.log("this is art_id : " + uni_ip_id);
				  		  $.ajax({
				  			  //執行Servlet 01 DisplaySingleProductPage.java
				  			  url:"\_05_CreationsFrame\\DisplayArtist?art_id=" + art_id,
				  			  context: document.body,
				  			  type: "get",
				  			  success: function(responseIpArtId){
				  				  $("#mainframe").empty();
				  				  $('#mainframe').html(responseIpArtId);
				  			  },
				  			  error: function(responseIpArtIdErr){
				  				  console.log(art_id);
				  			  }
				  		  });
					  }else{
						  //三者皆非的狀況
						  console.log("!!!!!!!!!!!!!!!!!!!!")
						  console.log("無法辦別該uni_ip_id字串。")  
						  console.log(uni_ip_id)
					  }//end of fourth if-else
				  }//end of third if-else
				}//end of second if-else 
			  }//end of first if-else
		  
 	  });
	
})
</script>
</body>

</html>