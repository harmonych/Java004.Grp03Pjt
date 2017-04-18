<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<c:set var="context" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>私訊頁面</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<%-- <link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.min.css"> --%>
<!-- Font Awesome -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
<!-- Ionicons -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
<!-- fullCalendar 2.2.5-->
<!-- <link rel="stylesheet" -->
<%-- 	href="${context}/plugins/fullcalendar/fullcalendar.min.css"> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="${context}/plugins/fullcalendar/fullcalendar.print.css" media="print"> --%>
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="${context}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>魚雁往返</h1>
				<!--       <ol class="breadcrumb"> -->
				<!--         <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
				<!--         <li class="active">Mailbox</li> -->
				<!--       </ol> -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-3">
<!-- 						<a href="MailBox.jsp" -->
<!-- 							class="btn btn-warning btn-block margin-bottom">Back to Inbox</a> -->

						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title"><c:out value = "${LoginOK.user_name}"/></h3>
								<div class="box-tools">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="javascript:;" id="mailBox"><i class="fa fa-inbox"></i>
											收件匣 <span class="label label-warning pull-right"></span></a></li>
									<li><a href="#" class ="sentBoxLink"><i class="fa fa-envelope-o"></i> 寄件備份</a></li>

<!-- 									<li><a href="#"><i class="fa fa-trash-o"></i> Trash</a></li> -->
								</ul>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
						<div class="box box-solid">
<!-- 							<div class="box-header with-border"> -->
<!-- 								<h3 class="box-title">Labels</h3> -->

<!-- 								<div class="box-tools"> -->
<!-- 									<button type="button" class="btn btn-box-tool" -->
<!-- 										data-widget="collapse"> -->
<!-- 										<i class="fa fa-minus"></i> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- /.box-header -->
							<!--             <div class="box-body no-padding"> -->
							<!--               <ul class="nav nav-pills nav-stacked"> -->
							<!--                 <li><a href="#"><i class="fa fa-circle-o text-red"></i> Important</a></li> -->
							<!--                 <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> Promotions</a></li> -->
							<!--                 <li><a href="#"><i class="fa fa-circle-o text-light-blue"></i> Social</a></li> -->
							<!--               </ul> -->
							<!--             </div> -->
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
					<div class="col-md-9">
					<form ENCTYPE="multipart/form-data" action="${context}/_11_message/messagecreate.do" method="POST" id="messagecreate">
						
						<div class="box box-warning">
							<div class="box-header with-border">
								<h3 class="box-title">發送信件</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="form-group">收件者: <c:out value ="${mb.user_name}" />
								</div><input type="hidden" class="form-control" id = "rn" name='receiver_name' value='${mb.user_name}' placeholder="To:">
								<div class="form-group">
								</div><input class="form-control" name='title' value='${param.title}' placeholder="主題:">
								<div class="form-group" id="w5">
									<textarea id="compose-textarea" class="form-control" name='msg_txt' style="height: 300px">${param.msg_txt}
                   					</textarea>
								</div>
								<input type="hidden" id = "s_user_id" name='s_user_id' value='${LoginOK.user_id}'>
								<input type="hidden" name='sender_name'	value='${LoginOK.user_name}'>
							</div>
						</div>
							<div class="box-footer">
								<div class="pull-right">
									<button type="submit" class="btn btn-warning">
										<i class="fa fa-envelope-o"></i> 寄出
									</button>
								</div>
								<button type="reset" class="btn btn-default">
									<i class="fa fa-times"></i> 重填
								</button>
							</div>
						</form>
						<!-- /.box-footer -->
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
		<!-- /.row -->
		</section>
		<!-- /.content -->	

	<!-- jQuery 2.2.3 -->
<!-- 	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script> -->
	<!-- Bootstrap 3.3.6 -->
<!-- 	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
	<!-- Slimscroll -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js" integrity="sha384-tIwI8+qJdZBtYYCKwRkjxBGQVZS3gGozr3CtI+5JF/oL1JmPEHzCEnIKbDbLTCer" crossorigin="anonymous"></script> -->
    
	<!-- Page Script -->
	<script>
	$(document).ready(function(){
		$(function() {
			$(".wysihtml5-toolbar").empty();
			//Add text editor
			$("#compose-textarea").wysihtml5();
		});
		var aun = $('#rn').val();
		console.log(aun);
		var options={
				url:'\_11_message\\messagecreate.do',
				success: function(){	
					$.ajax({
						  url: "\_06_mailbox\\Compose.jsp",
						  type: "GET", 
						  data: { 
						    "receiver_name":aun,
						  },
						  success: function(responseMsg) {
							$("#mainframe").empty();
			  				$('#mainframe').html(responseMsg);
						  },
						  error: function(responseMsgErr) {
							  responseMsgErr.abort();
						  }
					});
			        alert("寄信成功!");	
				}
			}			
		$('#messagecreate').on('submit', function(e){
		    e.preventDefault();
			$(this).ajaxSubmit(options);		
			return false;
		})
		var s_user_id = $('#s_user_id').val();
		$("#mailBox").click(function(){
			$.ajax({
				  url: "\_06_mailbox\\messageReceived.do?r_user_id=" + s_user_id,
				  type: "GET", 
				  success: function(responseMsg) {
					$("#mainframe").empty();
					$('#mainframe').html(responseMsg);
				  },
				  error: function(responseMsgErr) {
					  responseMsgErr.abort();
				  }
			});
		});
		//此頁面下選寄信備份
		$(".sentBoxLink").click(function(){
			$.ajax({
				  url: "\_06_mailbox\\messageSent.do?s_user_id=" + s_user_id,
				  type: "GET", 
				  success: function(responseMsg) {
					$("#mainframe").empty();
					$('#mainframe').html(responseMsg);
				  },
				  error: function(responseMsgErr) {
					  responseMsgErr.abort();
				  }
			});
		});
	})
	</script>
</body>
</html>
