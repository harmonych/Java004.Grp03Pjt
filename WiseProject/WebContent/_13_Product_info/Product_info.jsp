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
			<section class="content">
				<!-- Your Page Content Here -->
				<div class="row">
					<!-- 圖片顯示欄 -->
					<div class="card_card01 col-md-4 col-md-offset-2">
						<div id="img_area">
						<img src=" ${context}/images/ajaxloader1.gif">
							<!-- width="400" height="400" -->
						
						</div>
					</div>
				
					<!-- 商品介紹欄 -->
					<div class="card_card02 col-md-4"><input id="pro_id" value="<c:out value ="${pb.pro_id}"/>" type="hidden"/>
						<header id="info_area">
							
								<div id="pro_name">
									<h1>商品名稱：<c:out value ="${pb.pro_name}"/></h1>
								</div>
							
								<div id="art_id">
									<h3>賣家名稱：<c:out value ="${mb.user_name}"/></h3>
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
					
						<div id="buy_area">
							<form id="form1">													
								<div id="bt_area">
									<a href="${context}/_15_ShoppingCart/ShoppingCart_Order.jsp">
										<input type="button" class="btn1 btn-lg btn-block" value="立即購買">
									</a>
									<a href="${context}/_15_ShoppingCart/ShoppingCart_List.jsp">
										<input type="button" class="btn2 btn-lg btn-block" value="加入購物車">
									</a>
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
          			<div class="box box-warning">
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
        <!-- 留言串列 -->
        <section>
        	<div class="row">
          		<div class="card03 col-md-8 col-md-offset-2">
			        <div class="box box-warning ">
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
<!-- 		</div> -->
		<!-- /.content-wrapper -->
<script>
$(document).ready(function(){
	
	var id = $('#pro_id').val();
	console.log(id);
	$.ajax({
		  url: "\_08_product\\singlepropic.json",
		  type: "get", 
		  data: { 
		    "pro_id": id, 
		  },
		  success: function(responseppa) {
			  console.log(responseppa);
				var pic_address = "<img src ="+ responseppa[0].pic_adress + " width = '400px' >" ;			
				var divp = document.getElementById("img_area");
				divp.innerHTML = pic_address;
				console.log(pic_address);
		  },
		  error: function(xhrppa) {
		    xhrppa.abort();
		  }
	});	
})
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", '/_08_product/singleproduct.json', true);
// 	xhr.send();
// 	xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
// 			var pro_name = "";
// 			var art_id = "";
// 			var sale_time = "";
// 			var price = "";
// 			var pro_inv = "";
// 			var pro_introduction = "";
						
// 			var funds = JSON.parse(xhr.responseText);			
// 			pro_name ="<h1><b>" +funds.pro_name+"</b></h1>" ;
// 			art_id = "<h4><b>創作者編號 : </b>" +funds.art_id+ "</h4>" ;
// 			sale_time = "<b>上架時間 : </b>" +funds.sale_time ;
// 			price = "<b>單價 : </b>" +funds.price ;
// 			pro_inv = "<b>剩餘數量  : </b>" +funds.pro_inv ;
// 			pro_introduction = "<b>商品簡介 : </b><br>" +funds.pro_introduction ;			
	
// 		}
		
// 		pro_name += "";
// 		var divs = document.getElementById("pro_name");
// 		divs.innerHTML = pro_name;
		
// 		art_id += "";
// 		var divs = document.getElementById("art_id");
// 		divs.innerHTML = art_id;
		
// 		sale_time += "";
// 		var divs = document.getElementById("sale_time");
// 		divs.innerHTML = sale_time;
		
// 		price += "";
// 		var divs = document.getElementById("price");
// 		divs.innerHTML = price;
		
// 		pro_inv += "";
// 		var divs = document.getElementById("pro_inv");
// 		divs.innerHTML = pro_inv;
		
// 		pro_introduction += "";
// 		var divs = document.getElementById("pro_introduction");
// 		divs.innerHTML = pro_introduction;
// 	}
</script>
</body>

</html>