<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	  <c:set var = "fc_id" value = "${fb.fc_id}" />
	  <c:set var = "userId" value = "${LoginOK.user_id}" />
	  <c:set var="context" value="${pageContext.request.contextPath}" />
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <link rel="stylesheet" href="${context}/css/Fc_info.css">
	  <title>募資內容頁</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body class="hold-transition skin-yellow-light sidebar-mini ">
      <c:set var="userName" value="${LoginOK.user_name}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />
<!--       <div class="wrapper"> -->
        <!-- Content Wrapper. Contains page content -->
<!--         <div class="content-wrapper"> -->
          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
	          	<div id="r1" class="row">
				
					<!-- 圖片顯示欄 -->
					<div class="card_card01 col-md-4 col-md-offset-2">
						<div id="img_area" class = "showbox">
							<img src="<c:out value ='${fpl[0].fc_adress}'/>"  id="pro_img"  width = "400" height ="400">
							<!-- width="400" height="400" -->
						</div>
						<a>
						<div class="pic_address" id ="selections">
							<c:forEach var="i" begin="0" end="${fn:length(fpl)-1}">
	   							<img src="<c:out value="${fpl[i].fc_adress}"/>" title=""> 
							</c:forEach>
							<br clear="all">
						</div>
						</a>
					</div>
		
					<!-- 募資介紹欄 -->
					<div class="card_card02 col-md-4"><input id="fcid" value="${fb.fc_id}" type="hidden"/>
						<div id="info_area">
							
							<div id="fc_name" >
								<b>
									<h1><c:out value ="${fb.fc_name}"/> </h1>
								</b>
							</div>
							<div id="art_id">
								<b>	
									<a href ="javascript:;" class = "img-link" id ='ip_art_id<c:out value ="${ab.art_id}"/>'><h4><label id='lb'><c:out value ="${mb.user_name}"/></label></h4></a>
								</b>
							</div>
							<div id="start_time" >
								<b>
									<label id="lb">開始時間:<c:out value ="${fb.start_time}"/></label>
								</b>							
							</div>
							<div id="end_time" >
								<b>
									<label id="lb">結束時間:<c:out value ="${fb.end_time}"/></label>
								</b>
							</div>
							<div id="fc_money" >
								<b>
									<label id="lb">募資金額:<c:out value ="${fb.fc_money}"/></label>
								</b>
							</div>	
							<div id="now_money" >
								<b>
									<label id="lb">目前金額:<c:out value ="${fb.now_money}"/></label>
								</b>
							</div>
						
							<div id="line"></div><br>
						
							<div id="fc_introduction">
								<label id="lb">簡介:</label><br>
							
								<p>
									<c:out value ="${fb.fc_introduction}"/><br> 
								</p>
							</div>
						</div>	
						<div id="line"></div>
					<c:choose>	
					<c:when test="${(LoginOK != null )}">
						<c:set var="contains" value="false" />
						<c:forEach var="i" begin="0" end="${fn:length(sl)}">
	   					<c:if test="${(sl[i].user_id) == (userId)}">
<!-- 	   					偵測投資與否 -->
						<c:set var = "spond_money" value ="${(sl[i].spon_money)}"/>
	   					<c:set var="contains" value="true" />
<%-- 	   					<c:out value ="${contains }"/> --%>
	   					</c:if>
						</c:forEach>
						<div id="sponsor_area">
						<h4 class="control-sidebar-subheading">
	                       	募資進度：
	                      <span class="pull-right-container">
	                  <span class="label label-danger pull-right">目前進度：<fmt:formatNumber  value ="${(fb.now_money)/(fb.fc_money)*100}" maxFractionDigits="2"/>%</span>
	                      </span>
	                    </h4>
	
	                    <div class="progress progress-xxs">
	                      <div class="progress-bar progress-bar-danger" style="width: <fmt:formatNumber  value ="${(fb.now_money)/(fb.fc_money)*100}" maxFractionDigits="2"/>%"></div>
	                    </div>
							<form ENCTYPE="multipart/form-data" method="POST" action="<c:url value='/_09_sponsor/sponsoringFc.do' />"  id="sponsoringFc" >
	          				  <input id="fc_id2" name = "fc_id2" value="<c:out value ="${fb.fc_id}"/>" type="hidden"/>
	            			  <input id="user_id2" name = "user_id2" value="<c:out value ="${LoginOK.user_id }"/>" type="hidden"/>
	              			  <input id="spon_account" name = "spon_account" value="<c:out value ="${IsArtist.bank_account}"/>" type="hidden"/>			
								<c:choose>
								  <c:when test ="${(contains)== true}">
								  	<span class ="btn1 btn-lg btn-block" align ="center">感謝您的支持</span>
								  </c:when>
								  <c:otherwise>
								  <div id="sponsor_money">
									<div>
										<label>贊助金額</label>
									</div>
										<div>
											<select class="form-control" id ="spon_money" name ="spon_money">
												<option value="100">NT $100</option>
												<option value="200">NT $200</option>
												<option value="300">NT $300</option>
												<option value="500">NT $500</option>
												<option value="900">NT $900</option>
												<option value="1000">NT $1,000</option>
												<option value="3000">NT $3,000</option>
												<option value="5000">NT $5,000</option>
											</select>
										</div>
									<div id="pay_money">
	                                    <label>贊助方式</label>                                
	                                    <select class="form-control" id = "spon_mode" name ="spon_mode">
	                                        <option value="1">轉帳</option>
	                                        <option value="2">信用卡</option>
	                                        
	                                    </select>
	                                </div>
										
							  </div>

								<div id="bt_area">
								  
									<input type="submit" name="submit" class="btn1 btn-lg btn-block" value="我要贊助">
									</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
<%-- 						<c:set var="contains" value="false" /> --%>
<%-- 						<c:forEach var="item" items="${sl.user_id}"> --%>
<%--   						<c:if test="${item eq userId}"> --%>
<%--   						<c:out value="${item } }"></c:out> --%>
<%--     					<c:set var="contains" value="true" /> --%>
<%--   						</c:if> --%>
<%-- 						</c:forEach> --%>
<%-- 						<c:if test ="${!empty sl['userId'] }"> --%>
						</c:when>
						<c:otherwise>
							<div id="buy_area">
								<form id="form1">													
									<div id="bt_area">
										<a href="${context}/_02_login/login.jsp">
											<input type="button" class="btn1 btn-lg btn-block" value="立即登入贊助">
										</a>
										<a href="${context}/_01_register/register.jsp">
											<input type="button" class="btn2 btn-lg btn-block" value="立即註冊贊助">
										</a>
									</div>
								</form>		
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>		
		  		<br><br>
		  		<c:choose>
	         		<c:when test= "${(LoginOK != null)}">	         		
		          <form ENCTYPE="multipart/form-data" method="POST"  id="fcMessage" >
		  		<div id="r2" class="row">
	          		<div class="card03 col-md-8 col-md-offset-2">
	          			<div class="box box-warning">
	            			<div class="box-header with-border">
	            				<input id="fc_id" name = "fc_id" value="<c:out value ="${fb.fc_id}"/>" type="hidden"/>
								<input id="receiver_name" name = "receiver_name" value="<c:out value ="${mb.user_name}"/>" type="hidden"/>
	            				<input id="receiver_id" name = "receiver_id" value="<c:out value ="${mb.user_id}"/>" type="hidden"/>
	            				<input id="user_id" name = "user_id" value="<c:out value ="${LoginOK.user_id }"/>" type="hidden"/>
	              				<input id="sender_name" name = "sender_name" value="<c:out value ="${LoginOK.user_name}"/>" type="hidden"/>
	              				<h3 class="box-title">我要留言給<c:out value ="${mb.user_name}"/>
									<input type="checkbox" name="msg_status" value="0">並設為私密留言</h3>
	            			</div>
	            			
	            		<!-- /.box-header -->
	        		
	            		<div class="box-body">
	              			<div class="form-group">
	                			<input class="form-control" name= "msg_title" placeholder="留言標題">
	              			</div>
	              			              	
	              			<div class="form-group">
	                    		<textarea id="compose-textarea" class="form-control" name ="msg_txt" placeholder="在此輸入內容" style="height: 300px"></textarea>
	              			</div>
	              	
	              	   <!-- <div class="form-group">
	                			<div class="btn btn-default btn-file">
	                  				<i class="fa fa-paperclip"></i> Attachment
	                  				<input type="file" name="attachment">
	                			</div>
	                	    </div> -->
	            		</div> 
	            		
	            		<!-- /.box-body -->
	            		<div class="box-footer">
	              			<div class="pull-right">
	                			<button type="submit" id="btn3" class="btn btn-warning">送出留言 </button> 
	           
	                			<!--<i class="fa fa-envelope-o"></i> Send  -->
	              			</div>
	              			
	            		</div>
	           			<!-- /.box-footer -->
	          			</div>
	          		<!-- /. box -->
	        		</div>
        	</div>
		  
		  </section>
          <!-- /.content -->
         
         <!-- 留言填寫欄位 -->

<!--         	<section class="content">          	       -->
<!--       		</section> -->
      	  </form>
      	
      	</c:when>
      	<c:otherwise>
      		<section class="content">
	          	<div class="row">
	          		<div class="card03 col-md-8 col-md-offset-2">
	          			<div class="box box-warning">
	            			<div class="box-header with-border">
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
<!-- 			        <div class="box box-default" id = "previous_msg"> -->
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
<!--       </div> -->
      <!-- /.content-wrapper -->
<!--       </div> -->
      <!-- ./wrapper -->
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
			var fc_id = $('#fcid').val();
			//讀取瀏覽者user_id
			var reader_id = $('#user_id').val();
			//讀取創作者user_id
			var receiver_id = $('#receiver_id').val();
			console.log(fc_id);
			console.log(reader_id);
			console.log(receiver_id);
			$.ajax({
				  url: "\_11_message\\fcmessage.json",
				  type: "GET", 
				  data: { 
				    "fc_id": fc_id, 
				  },
				  success: function(resMsgOK) {
					  var respm = resMsgOK;
					  var msgStr ='<div class="card03 col-md-8 col-md-offset-2">';
					  msgStr += '<div class="box box-default " id = "previous_msg">';
					  //start of fist for-loop
					  var j = respm.length;
					  for (var i = 0 ; i<respm.length; i++){
						  //如果設為私密，但讀者非寄送者或者擁有者 first if
						  if(respm[i].msg_status == 0 && (reader_id != respm[i].user_id && reader_id != receiver_id || reader_id == null || reader_id =="" )){
							  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#' + (j--);
							  msgStr += '</h4></div><br>';
// 							  msgStr += '<div><div class="mes_by"></div></div>';
							  msgStr += '</div><div class="box-body"><div class="message">此為私密留言內容</div></div>';
						  }else{
							  //second if 讀者為寄送者或者擁有者
							  if(respm[i].msg_status == 0 && (reader_id == respm[i].user_id || reader_id == receiver_id)){
								  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#';
								  msgStr += (j--) + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_title + '</h4></div><br><div>';
								  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
								  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
							  }else{						  
								  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">#';
								  msgStr += (j--) + respm[i].msg_title + '</h4></div><br><div>';
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
			$.ajax({
				  url: "\_09_sponsor\\allSponsorByFc.json",
				  type: "GET", 
				  data: { 
				    "fc_id": fc_id, 
				  },
				  success: function(resSponOK){
					  console.log(resSponOK)
				  },
				  error: function(resSponErr){
					  resSponErr.abort();
				  }
			})
			var opts = {
					url:'\_11_message\\fcMessage.do',
					success: function(){	
						$('#renewToView').empty();
				        alert("留言成功!");
				        $.ajax({
							  url: "\_11_message\\fcmessage.json",
							  type: "GET", 
							  data: { 
							    "fc_id": fc_id, 
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
										  msgStr += '</h4></div><br><div>';
										  msgStr += '<div class="mes_by"></div></div></div>';
										  msgStr += '<div class="box-body"><div class="message">此為私密留言內容</div></div>';
									  }else{
										  //second if 讀者為寄送者或者擁有者
										  if(respm[i].msg_status == 0 && (reader_id == respm[i].user_id || reader_id == receiver_id)){
											  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">';
											  msgStr += respm[i].msg_title + '</h4></div><br><div>';
											  msgStr += '<div class="mes_by">' + respm[i].sender_name + '&nbsp&nbsp&nbsp&nbsp' + respm[i].msg_time +'</div></div></div>';
											  msgStr += '<div class="box-body"><div class="message">' + respm[i].msg_text + '</div></div>';
										  }else{						  
											  msgStr += '<div class="box-header with-border"><div><h4 class="box-title">';
											  msgStr += respm[i].msg_title + '</h4></div><br><div>';
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
			
			$("#fcMessage").unbind('click').click(function(){
				$('#fcMessage').on('submit', function(e){
				    e.preventDefault();
					$(this).ajaxSubmit(opts);		
					return false;
				})
			})
			
			
			
			
			var options={
				url:'\_09_sponsor\\sponsoringFc.do',
				success: function(){	
					$.ajax({
						  url: "\_09_sponsor\\allSponsorByFc.json",
						  type: "GET", 
						  data: { 
						    "fc_id": fc_id, 
						  },
						  success: function(resSponOK){
							  console.log(resSponOK)
						  },
						  error: function(resSponErr){
							  resSponErr.abort();
						  }
					})
			        alert("贊助成功!");
					$.ajax({
						  url: "\_11_Fc_info\\DisplayFund",
						  type: "GET", 
						  data: { 
						    "fc_id": fc_id, 
						  },
						  success: function(resSPage){
							  $("#mainframe").empty();
								$('#mainframe').html(resSPage);
								$(".mainfooter").empty();
						  },
						  error: function(resSpageErr){
							  resSpageErr.abort();
						  }
					})
				}
			}
			
			
			$('#sponsoringFc').on('submit', function(e){
			    e.preventDefault();
				$(this).ajaxSubmit(options);		
				return false;
			})
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