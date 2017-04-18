<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <c:set var="userName" value="${LoginOK.user_name}" />
    <c:set var="file_name" value="${LoginOK.file_name}" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${context}/css/Fc_List_User.css">
    <title>贊助清單</title>
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
          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
		  	<div class="card1 col-md-8 col-md-offset-2">
	          <div class="box box-warning">
	            <div class="box-header with-border">
	              <h3 class="box-title"><b>贊助清單</b></h3>
	               <input id="msg_user_id" value="<c:out value ="${LoginOK.user_id}"/>" type="hidden"/>
		        </div>
	            
	            <!-- /.box-header -->
	            <div class="box-body no-padding">
	              <div class="mailbox-controls">
	                <!-- Check all button -->
<!-- 	                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> -->
<!-- 	                </button> -->
	                <div id="btn_area">
	                	<a href="../_11_Fc_info/Fc_Info.jsp">	              		
		              		<input type="button" class="btn btn-warning" id="btn1" value="回上頁">
		              	</a>
<!-- 		                	<input type="submit" class="btn btn-danger" id="btn2" value="確認修改">     -->
	              	</div>
	              	<!-- /.btn-group -->
	              
	              </div>
	              <div class="table-responsive mailbox-messages">
	                <table class="table table-hover table-striped">
	                
	                  <thead id="title">
	                  	<tr>
	                    	<th class="mailbox-name">募資名稱</th>
	                    	<th class="mailbox-name">作者名稱</th>
	                    	<th class="mailbox-name">贊助方式</th>
	                    	<th class="mailbox-name">贊助金額</th>
	                    	<th class="mailbox-star">截止日期</th>
	                    	<th class="mailbox-star">目前進度</th>
	                    	       
	                  	</tr>
					</thead>
	                  
	                <tbody id= "sponsorList">
	                  <tr>
<!-- 	                <td><input type="checkbox"></td> -->
	                   	<td hidden="">
	                   	
	                   	</td>
	                    <td class="mailbox-name">
	                    	<a href="../_11_Fc_info\Fc_Info.jsp">募資名稱fc_name</a>
	                    </td>
	                    <td class="mailbox-name">
	                    	<a href="../_05_CreationsFrame/CreationsPage2.jsp">作者名稱artist_id</a>
	                    </td> 
	                    <td class="mailbox-name">
	                    	1轉帳
	                    </td>
	                    <td class="mailbox-name">
	                    	$1000
	                    </td>                   
	                    <td class="mailbox-name">	                    
	                    	<div id="red">
	                    		1作者確認中
	                    	</div>
	                    </td>                    
	                  </tr>
	                  
	                                   
	                </tbody>
	                </table>
	                <!-- /.table -->
	              </div>
	              <!-- /.mail-box-messages -->
	            </div>
	            
	            <!-- /.box-body -->
	            <div class="box-footer no-padding">
	              <div class="mailbox-controls">
	              	<div id="btn_area">	              		
		              	<a href="${context}/_11_Fc_info/Fc_Info.jsp">	              		
		              		<input type="button" class="btn btn-warning" id="btn1" value="回上頁">
		              	</a>
		              	
<!-- 		                	<input type="submit" class="btn btn-danger" id="btn2" value="確認修改">     -->
	              	</div>
	              	<!-- /.btn-group -->
	            </div>
	          </div>
	          <!-- /. box -->
	        </div>
			</div>
          </section>
</body>
<script>
	var fcl_content = '';
	var prods_len = 0;
	var sponMode = '';
	$(document).ready(function(){

        var member_id = $('#msg_user_id').val();
		console.log(member_id);
		$.ajax({
			url: "\_09_sponsor\\allSponsorByUser.json",
			type: "GET", 
			async:false,
			data: { 
			  "userId" : member_id, 
			},
			success: function(responseSponByUser) {
				 console.log(responseSponByUser)
				 //start of first if-else
				 if (!$.trim(responseSponByUser)){  
					 return false;	 
				 }else{
					 var fclist = responseSponByUser;
					 var artName = "";
					 var fcPercentage = 0; 
					 for (var i = 0 ; i < fclist.length; i++){
						 fcPercentage = ((fclist[i][9])/(fclist[i][10]).toFixed(2))*100;
						 fcl_content += '<tr>';
						 fcl_content += '<td class="mailbox-name"><a href="javascript:;" class = "nametag-link" id = "il_fc_id' + fclist[i][1] + '">' + fclist[i][2] + '</a>';
						 fcl_content += '<td class="mailbox-name"><a href="javascript:;" class = "nametag-link" id = "il_art_id' + fclist[i][1] + '">';
						 $.ajax({
							 url: "\_01_register\\singleartusername.json",
								type: "GET", 
								async:false,
								data: { 
								  "art_id" : fclist[i][1], 
								},
								success: function(responseArtId) {
									 console.log(responseArtId)
									 //start of first if-else
									 if (!$.trim(responseArtId)){  
										 return false;	 
									 }else{
										artName = responseArtId;
									 }
						 		}
						 })//end of aN-ajax	
     					 console.log(artName);
 						 fcl_content += artName +'</a></td>';
						 if(fclist[i][1]==1){
							 sponMode = "轉帳";
						 }else{
							 sponMode = "信用卡";
						 }
						 fcl_content += '<td class="mailbox-name">' + sponMode + '</td><td class="mailbox-name">NTD$' + fclist[i][6] + '</td>';
						 fcl_content += '<td class="mailbox-name">'+ fclist[i][8] +'</a></td>';
						 fcl_content += '<td class="mailbox-name">'+ fcPercentage +'%</a></td>';
						 fcl_content += '</tr>';
						}//end of fcl-loop					
					 console.log(fcl_content);
					 var divl = document.getElementById("sponsorList");
					 divl.innerHTML = fcl_content;
				 }//end of first if-else
			}
		});
	})
</script>
	 	<script src="${context}\js\fc_list.js"></script>
</html>