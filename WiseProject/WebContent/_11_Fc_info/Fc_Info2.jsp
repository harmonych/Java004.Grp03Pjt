<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	  <c:set var = "fc_id" value = "${fb.fc_id}" />
	  <c:set var="context" value="${pageContext.request.contextPath}" />
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="${context}/css/Fc_info.css">
	  <title>募資內容頁</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<script>

$(document).ready(function(){
	var id = $('#fcid').val();
	console.log(id);
	$.ajax({
		  url: "\_07_funds\\singleFcPic.json",
		  type: "get", 
		  async: false,
		  data: { 
		    "fc_id":id, 
		  },
		  success: function(responseFcP) {
			  console.log(responseFcP);
				var pic_address = "<img src ="+ responseFcP[0].fc_adress + " width = '400px' >" ;			
				var divp = document.getElementById("img_area");
				divp.innerHTML = pic_address;
		  },
		  error: function(responseFcPErr) {
			  responseFcPErr.abort();
		  }
	});	

		
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", '\_07_funds\\singlefund.json', true);
// 	xhr.send();
// 	xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
// 			var fc_name = "";
// 			var art_id = "";
// 			var start_time = "";
// 			var end_time = "";
// 			var fc_money = "";
// 			var now_money = "";
// 			var fc_introduction = "";
			
// 			var funds = JSON.parse(xhr.responseText);
// 			fc_name ="<h1><b>" +funds.fc_name+"</b></h1>" ;
// 			art_id = "<h4><b>創作者編號 : </b>" +funds.art_id+ "</h4>" ;
// 			start_time = "<b>開始時間 : </b>" +funds.start_time ;
// 			end_time = "<b>結束時間 : </b>" +funds.end_time ;
// 			fc_money = "<b>募資金額 : </b>" +funds.fc_money ;
// 			now_money = "<b>目前金額  : </b>" +funds.now_money ;
// 			fc_introduction = "<b>募資簡介 : </b><br>" +funds.fc_introduction ;			
	
// 		}
		//content += "";
		//var divs = document.getElementById("somedivS");
		//divs.innerHTML = content;
		
// 		fc_name += "";
// 		var divs = document.getElementById("fc_name");
// 		divs.innerHTML = fc_name;
		
// 		art_id += "";
// 		var divs = document.getElementById("art_id");
// 		divs.innerHTML = art_id;
		
// 		start_time += "";
// 		var divs = document.getElementById("start_time");
// 		divs.innerHTML = start_time;
		
// 		end_time += "";
// 		var divs = document.getElementById("end_time");
// 		divs.innerHTML = end_time;
		
// 		fc_money += "";
// 		var divs = document.getElementById("fc_money");
// 		divs.innerHTML = fc_money;
		
// 		now_money += "";
// 		var divs = document.getElementById("now_money");
// 		divs.innerHTML = now_money;
		
// 		fc_introduction += "";
// 		var divs = document.getElementById("fc_introduction");
// 		divs.innerHTML = fc_introduction;
// 	};
});

</script>


<body class="hold-transition skin-yellow-light sidebar-mini ">
      <c:set var="userName" value="${LoginOK.user_name}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />
<!--       <div class="wrapper"> -->
        <!-- Content Wrapper. Contains page content -->
<!--         <div class="content-wrapper"> -->
          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
          	<div class="row">
			
				<!-- 圖片顯示欄 -->
				<div class="card_card01 col-md-4 col-md-offset-2">
					<div id="img_area">
						<img id="pro_img" >  
						<img src="${context}/images/ajaxloader.gif">
						<!-- width="400" height="400" -->
					</div>
				</div>


				<!-- 募資介紹欄 -->
				<div class="card_card02 col-md-4"><input id="fcid" value="${fb.fc_id}" type="hidden"/>
					<div id="info_area">
						
						<div id="fc_name" >
							<b>
								<h1>募資名稱：<c:out value ="${fb.fc_name}"/> </h1>
							</b>
						</div>
						<div id="art_id">
							<b>	
								<h4><label id='lb'>創作者編號:<c:out value ="${fb.art_id}"/></label></h4>
							</b>
						</div>
						<div id="start_time" >
							<b>
								<label id="lb">開始時間<c:out value ="${fb.start_time}"/></label>
							</b>							
						</div>
						<div id="end_time" >
							<b>
								<label id="lb">結束時間<c:out value ="${fb.end_time}"/></label>
							</b>
						</div>
						<div id="fc_money" >
							<b>
								<label id="lb">募資金額<c:out value ="${fb.fc_money}"/></label>
							</b>
						</div>	
						<div id="now_money" >
							<b>
								<label id="lb">目前金額<c:out value ="${fb.now_money}"/></label>
							</b>
						</div>
					
						<div id="line"></div><br>
					
						<div id="fc_introduction">
							<label id="lb">募資簡介</label><br>
						
							<p>
								<c:out value ="${fb.fc_introduction}"/><br> 
							</p>
						</div>
					</div>	
					<div id="line"></div>
					
					<div id="sponsor_area">
						<form id="form1">
							<div id="sponsor_money">
								<div>
									<label>贊助金額</label>
								</div>
									<div>
										<select class="form-control">
											<option value="1">NT $500</option>
											<option value="2">NT $1,000</option>
											<option value="3">NT $2,000</option>
											<option value="4">NT $3,000</option>
											<option value="5">NT $5,000</option>
											<option value="6">NT $10,000</option>
											<option value="7">NT $20,000</option>
											<option value="8">NT $30,000</option>
											<option value="8">NT $50,000</option>
										</select>
									</div>
							</div>

							<div id="bt_area">
								<input type="submit" name="submit" class="btn1 btn-lg btn-block" value="我要贊助">
							</div>
						</form>
					</div>
				</div>
			</div>		
	    </section>
         	<!-- /.content -->
         
         <!-- 留言填寫欄位 -->
          <section class="content">
          	<div class="row">
          		<div class="card03 col-md-8 col-md-offset-2">
          			<div class="box box-primary">
            			<div class="box-header with-border">
              				<h3 class="box-title">我要留言</h3>
            			</div>
            			
            		<!-- /.box-header -->
            		<div class="box-body">
              			<div class="form-group">
                			<input class="form-control" placeholder="留言標題">
              			</div>
              			              	
              			<div class="form-group">
                    		<textarea id="compose-textarea" class="form-control" placeholder="在此輸入內容" style="height: 300px"></textarea>
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
                			<button type="submit" id="btn3" class="btn btn-primary">送出留言 </button> 
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
        <!-- 留言串列 -->
        <section>
        	<div class="row">
          		<div class="card03 col-md-8 col-md-offset-2">
			        <div class="box box-default">
			          <div class="box-header with-border">
			            <div>
			            	<h4 class="box-title">留言標題</h4>
			            </div>
			            <br>
			            <div>
			            	<div class="mes_by">留言人</div>
			            </div>
			          </div>
			          <div class="box-body">
			          		<div class="message">留言內容</div>
			          </div>
			          <!-- /.box-body -->
			        </div>
			   </div>     
			</div>	        
        </section>
<!--       </div> -->
      <!-- /.content-wrapper -->
<!--       </div> -->
      <!-- ./wrapper -->

</body>

</html>