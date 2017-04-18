<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
      <c:set var="userName" value="${LoginOK.user_name}" />
      <c:set var="file_name" value="${LoginOK.file_name}" />   
	  <c:set var="context" value="${pageContext.request.contextPath}" />
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="stylesheet" href="${context }/css/Fc_list_Artist.css">
	  <title>會員贊助清單列表</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

      <!-- Theme style -->
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
    <!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

    <body class="hold-transition skin-yellow-light sidebar-mini ">

        <div class="content-wrapper">
          <!-- Content Header (Page header) -->
          <section class="content-header">
          </section>

          <!-- Main content -->
          <section class="content">
          <!-- Your Page Content Here -->
		  	<div class="card1 col-md-10 col-md-offset-1">
	          <div class="box box-warning">
	            <div class="box-header with-border">
	              <h3 class="box-title"><b>會員贊助清單列表</b></h3>
		        </div>
	            
	            <!-- /.box-header -->
	            <div class="box-body no-padding">
	       
	              <div class="table-responsive mailbox-messages">
	                <table class="table table-hover table-striped">
	                
	                  <thead id="title">
	                  	<tr>
	                    	<th class="mailbox-name">贊助編號</th>
	                    	<th class="mailbox-name">募資名稱</th>
	                    	<th class="mailbox-name">贊助會員</th>
	                    	<th class="mailbox-name">贊助方式</th>
	                    	<th class="mailbox-name">贊助金額</th>
	                    	<th class="mailbox-star">贊助狀態</th>
	                    	       
	                  	</tr>
					</thead>
	                  
	                <tbody>
	                  <tr>
<!-- 	                <td><input type="checkbox"></td> -->
	                    <td class="mailbox-name">
	                    	贊助編號spon_id
	                    </td>
	                    <td class="mailbox-name">
	                    	募資名稱fc_name
	                    </td>
	                    <td class="mailbox-name">
	                    	會員名稱user_id
	                    </td> 
	                    <td class="mailbox-name">
	                    	1轉帳
	                    </td>
	                    <td class="mailbox-name">
	                    	$1000
	                    </td>                   
	                    <td class="mailbox-name">	                    
	                    	<form>
		                    	<div id="btn_area"> <!-- btn-group -->
									<select id="status" class="form-control">
										<option value="1" selected="selected">作者確認中</option>
										<option value="2">款項交易中</option>
										<option value="3">贊助完成</option>									
									</select>
									<input type="submit" class="btn btn-danger" id="btn3" value="確認">
								</div>
							</form>
	                    </td>                     
	                  </tr>
	                  
	                  <tr>
<!-- 	                <td><input type="checkbox"></td> -->
	                    <td class="mailbox-name">
	                    	贊助編號spon_id
	                    </td>
	                    <td class="mailbox-name">
	                    	募資名稱fc_name
	                    </td>
	                    <td class="mailbox-name">
	                    	會員名稱user_id
	                    </td> 
	                    <td class="mailbox-name">
	                    	1轉帳
	                    </td>
	                    <td class="mailbox-name">
	                    	$1000
	                    </td>                   
	                    <td class="mailbox-name">	                    
	                    	<form>
		                    	<div id="btn_area"> <!-- btn-group -->
									<select id="status" class="form-control">
										<option value="1" selected="selected">作者確認中</option>
										<option value="2">款項交易中</option>
										<option value="3">贊助完成</option>									
									</select>
									<input type="submit" class="btn btn-danger" id="btn3" value="確認">
								</div>
							</form>
	                    </td>                    
	                  </tr>
	                  <tr>
<!-- 	                <td><input type="checkbox"></td> -->
	                    <td class="mailbox-name">
	                    	贊助編號spon_id
	                    </td>
	                    <td class="mailbox-name">
	                    	募資名稱fc_name
	                    </td>
	                    <td class="mailbox-name">
	                    	會員名稱user_id
	                    </td> 
	                    <td class="mailbox-name">
	                    	2匯款
	                    </td>
	                    <td class="mailbox-name">
	                    	$1000
	                    </td>                   
	                    <td class="mailbox-name">	                    
	                    	<form>
		                    	<div id="btn_area"> <!-- btn-group -->
									<select id="status" class="form-control">
										<option value="1" selected="selected">作者確認中</option>
										<option value="2">款項交易中</option>
										<option value="3">贊助完成</option>									
									</select>
									<input type="submit" class="btn btn-danger" id="btn3" value="確認">
								</div>
							</form>
	                    </td>                    
	                  </tr>
	                                   
	                </tbody>
	                </table>
	                <!-- /.table -->
	              </div>
	              <!-- /.mail-box-messages -->
	            </div>
	            

	          <!-- /. box -->
	        </div>
			</div>
          </section>
          <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

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
						 fcl_content += '<td class="mailbox-name">'+ fcPercentage.toFixed(2) +'%</a></td>';
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