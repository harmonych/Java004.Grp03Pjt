<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Read Mail</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
<!--   <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"> -->
  <!-- Font Awesome -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
  <!-- Ionicons -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  <!-- fullCalendar 2.2.5-->
<!--   <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.min.css"> -->
<!--   <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.print.css" media="print"> -->
<!--   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!--   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
  <style>
  .nav-stacked>li.active>a, .nav-stacked>li.active>a:hover {
      border-left-color: #f39c12;
	}
		
	
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        魚雁往返
      </h1>
<!--       <ol class="breadcrumb"> -->
<!--         <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
<!--         <li class="active">Mailbox</li> -->
<!--       </ol> -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
<%--           <a href="Javascript:;" id = "" class="btn btn-warning btn-block margin-bottom composeMailLink">回信</a><input id="sender_name" value="${msgb.sender_name}" type="hidden"/> --%>
			<input id="s_user_id" value="${msgb.s_user_id}" type="hidden"/>
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title" id="receiver_name"><c:out value ="${LoginOK.user_name}"/></h3>
				<input id="r_user_id" value="${msgb.r_user_id}" type="hidden"/>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="javascript:;" class = "mailBoxLink"><i class="fa fa-inbox"></i> 收信匣</a></li>
                  
                <li><a href="javascript:;" class="sentBoxLink"><i class="fa fa-envelope-o"></i> 寄件備份</a></li>
                               
                
<!--                 <li><a href="#"><i class="fa fa-trash-o"></i> Trash</a></li> -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
<!--           <div class="box box-solid"> -->
<!--             <div class="box-header with-border"> -->
<!--               <h3 class="box-title">Labels</h3> -->

<!--               <div class="box-tools"> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="box-body no-padding"> -->
<!--               <ul class="nav nav-pills nav-stacked"> -->
<!--                 <li><a href="#"><i class="fa fa-circle-o text-red"></i> Important</a></li> -->
<!--                 <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> Promotions</a></li> -->
<!--                 <li><a href="#"><i class="fa fa-circle-o text-light-blue"></i> Social</a></li> -->
<!--               </ul> -->
<!--             </div> -->
            <!-- /.box-body -->
<!--           </div> -->
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">閱讀備份</h3>

              <div class="box-tools pull-right">
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>標題：<c:out value ="${msgb.title}"/></h3>
                <h5>寄信者：<c:out value ="${msgb.sender_name}"/>
                  <span class="mailbox-read-time pull-right"><c:out value ="${msgb.msg_time}"/></span></h5>
              </div>
              <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center"><c:out value ="${msgb.msg_txt}"/>
<!--                 <div class="btn-group"> -->
<!--                   <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Delete"> -->
<!--                     <i class="fa fa-trash-o"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Reply"> -->
<!--                     <i class="fa fa-reply"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Forward"> -->
<!--                     <i class="fa fa-share"></i></button> -->
<!--                 </div> -->
                <!-- /.btn-group -->
                
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                
                
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
<!--             <div class="box-footer"> -->
<!--               <ul class="mailbox-attachments clearfix"> -->
<!--                 <li> -->
<!--                   <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span> -->

<!--                   <div class="mailbox-attachment-info"> -->
<!--                     <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> Sep2014-report.pdf</a> -->
<!--                         <span class="mailbox-attachment-size"> -->
<!--                           1,245 KB -->
<!--                           <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> -->
<!--                         </span> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <span class="mailbox-attachment-icon"><i class="fa fa-file-word-o"></i></span> -->

<!--                   <div class="mailbox-attachment-info"> -->
<!--                     <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> App Description.docx</a> -->
<!--                         <span class="mailbox-attachment-size"> -->
<!--                           1,245 KB -->
<!--                           <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> -->
<!--                         </span> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <span class="mailbox-attachment-icon has-img"><img src="../../dist/img/photo1.png" alt="Attachment"></span> -->

<!--                   <div class="mailbox-attachment-info"> -->
<!--                     <a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> photo1.png</a> -->
<!--                         <span class="mailbox-attachment-size"> -->
<!--                           2.67 MB -->
<!--                           <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> -->
<!--                         </span> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <span class="mailbox-attachment-icon has-img"><img src="../../dist/img/photo2.png" alt="Attachment"></span> -->

<!--                   <div class="mailbox-attachment-info"> -->
<!--                     <a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> photo2.png</a> -->
<!--                         <span class="mailbox-attachment-size"> -->
<!--                           1.9 MB -->
<!--                           <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> -->
<!--                         </span> -->
<!--                   </div> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
            <!-- /.box-footer -->
            <div class="box-footer">
              <div class="pull-right">
<!--               寄件者，不讓其第二次回信 -->
<!--                 <button type="button" class="btn btn-default composeMailLink"><i class="fa fa-reply "></i> 回信</button> -->
<!--                 <button type="button" class="btn btn-default"><i class="fa fa-share"></i> Forward</button> -->
              </div>
<!--               <button type="button" class="btn btn-default"><i class="fa fa-trash-o"></i> Delete</button> -->
<!--               <button type="button" class="btn btn-default"><i class="fa fa-print"></i> Print</button> -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
       </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  <!-- Bootstrap 3.3.6 -->
<!-- <script src="../bootstrap/js/bootstrap.min.js"></script> -->
<!-- Slimscroll -->
<!-- <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script> -->
<!-- FastClick -->
<!-- <script src="../plugins/fastclick/fastclick.js"></script> -->
<!-- AdminLTE App -->
<!-- <script src="../dist/js/app.min.js"></script> -->
<!-- AdminLTE for demo purposes -->
<!-- <script src="../dist/js/demo.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	var si = $('#s_user_id').val();	
	console.log(si);
	//此頁面下選回信
	$(".composeMailLink").click(function(){

		$.ajax({
			  url: "\_06_mailbox\\messageReply.do" ,
			  type: "GET", 
			  async: false,
			  data: { 
			    "r_user_id":si,
			  },
			  success: function(responseMsg) {
				$("#mainframe").empty();
				$('#mainframe').html(responseMsg);
			  },
			  error: function(responseMsgErr) {
				  responseMsgErr.abort();
			  }
		});
	})
	//此頁面下選收信
	var r_user_id = $('#r_user_id').val();
	console.log(r_user_id);
	$(".mailBoxLink").click(function(){
		$.ajax({
			  url: "\_06_mailbox\\messageReceived.do?r_user_id=" + r_user_id,
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
			  url: "\_06_mailbox\messageSent.do?s_user_id=" + s_user_id,
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
