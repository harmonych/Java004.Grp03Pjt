<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Mail Box</title>
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
  <!-- iCheck -->
<!--   <link rel="stylesheet" href="../plugins/iCheck/flat/blue.css"> -->
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>
  .nav-stacked>li.active>a, .nav-stacked>li.active>a:hover {
      border-left-color: #f39c12;
	}
		
	
</style>
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
<!--           <a href="javascript:;" class="btn btn-warning btn-block margin-bottom">寄信</a> -->

          <div class="box box-solid">
            <div class="box-header with-border">
            <input id="user_id" value="<c:out value ="${LoginOK.user_id}"/>" type="hidden"/>	
              <h3 class="box-title" id="sender_name"><c:out value = "${LoginOK.user_name}"/></h3>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="javascript:;" class ="mailBoxLink"><i class="fa fa-inbox"></i>收件匣
                  <span class="label label-warning pull-right"></span></a></li>
                <li><a href="Javascript:;" class =" sentBoxLink "><i class="fa fa-envelope-o"></i>寄件備份</a></li>
                               
<!--                 <li><a href="#"><i class="fa fa-trash-o"></i> Trash</a></li> -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          <div class="box box-solid">
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
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">寄件備份</h3>

              <div class="box-tools pull-right">
<!--                 <div class="has-feedback"> -->
<!--                   <input type="text" class="form-control input-sm" placeholder="Search Mail"> -->
<!--                   <span class="glyphicon glyphicon-search form-control-feedback"></span> -->
<!--                 </div> -->
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
<!--                 <div class="btn-group"> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button> -->
<!--                 </div> -->
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
<!--                 <div class="pull-right"> -->
<!--                   1-10/50 -->
<!--                   <div class="btn-group"> -->
<!--                     <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button> -->
<!--                     <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button> -->
<!--                   </div> -->
                  <!-- /.btn-group -->
<!--                 </div> -->
                <!-- /.pull-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
					<c:forEach var="i" begin="0" end="${fn:length(smbl)}">
					<c:choose>
					<c:when test="${empty smbl[i].msg_id}">
					</c:when>
					<c:otherwise>
						<tr class="readMailLink" id ="<c:out value ="${smbl[i].msg_id}"/>">
					<td class="mailbox-star"><a href="javascript:;"><i class="fa fa-star-o text-yellow"></i></a></td>
                    <td class="mailbox-name"><c:out value = "${smbl[i].receiver_name }"/></td>
	                <td class="mailbox-subject"><a href="javascript:;"><b><c:out value = "${smbl[i].title}"/></b></a></td>
						</tr>
								</c:otherwise>
					</c:choose>
					</c:forEach>
<!--                   <tr> -->
<!--                     <td><input type="checkbox"></td> -->
<!--                     <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td> -->
<!--                     <td class="mailbox-name">寄件人</td> -->
<!--                     <td class="mailbox-subject"><a href="ReadMail.jsp"><b>標題</b></a></td> -->
<!--                     <td class="mailbox-attachment"></td> -->
<!--                     <td class="mailbox-date">5 mins ago</td> -->
<!--                   </tr> -->
                 
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
<!--                 <div class="btn-group"> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button> -->
<!--                   <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button> -->
<!--                 </div> -->
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
<!--                 <div class="pull-right"> -->
<!--                   1-50/200 -->
<!--                   <div class="btn-group"> -->
<!--                     <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button> -->
<!--                     <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button> -->
<!--                   </div> -->
                  <!-- /.btn-group -->
<!--                 </div> -->
                <!-- /.pull-right -->
              </div>
            </div>
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
<!-- jQuery 2.2.3 -->
<!-- <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script> -->
<!-- Bootstrap 3.3.6 -->
<!-- <script src="../bootstrap/js/bootstrap.min.js"></script> -->
<!-- Slimscroll -->
<!-- <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script> -->
<!-- FastClick -->
<!-- <script src="../plugins/fastclick/fastclick.js"></script> -->
<!-- AdminLTE App -->
<!-- <script src="../dist/js/app.min.js"></script> -->
<!-- iCheck -->
<!-- <script src="../plugins/iCheck/icheck.min.js"></script> -->
<!-- Page Script -->
<script>
  $(function () {
    //Enable iCheck plugin for checkboxes
    //iCheck for checkbox and radio inputs
    $('.mailbox-messages input[type="checkbox"]').iCheck({
      checkboxClass: 'icheckbox_flat-blue',
      radioClass: 'iradio_flat-blue'
    });

    //Enable check and uncheck all functionality
    $(".checkbox-toggle").click(function () {
      var clicks = $(this).data('clicks');
      if (clicks) {
        //Uncheck all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
      } else {
        //Check all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("check");
        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
      }
      $(this).data("clicks", !clicks);
    });

    //Handle starring for glyphicon and font awesome
    $(".mailbox-star").click(function (e) {
      e.preventDefault();
      //detect type
      var $this = $(this).find("a > i");
      var glyph = $this.hasClass("glyphicon");
      var fa = $this.hasClass("fa");

      //Switch states
      if (glyph) {
        $this.toggleClass("glyphicon-star");
        $this.toggleClass("glyphicon-star-empty");
      }

      if (fa) {
        $this.toggleClass("fa-star");
        $this.toggleClass("fa-star-o");
      }
    });
    //於此頁面按下某一信件時
    $(".readMailLink").click(function(){
    	var msg_id = $(this).attr('id');
    	console.log(msg_id)
		  $.ajax({
			  url:"\_06_mailbox\\messageByMsgIdS.do?msg_id=" + msg_id,
			  context: document.body,
			  success: function(responseRMsg){
				$("#mainframe").empty();
				$('#mainframe').html(responseRMsg);
			  }
		  });
	  });
    //於此頁面按下收信頁面時
    var r_user_id = $('#user_id').val();
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
  });
</script>
<!-- AdminLTE for demo purposes -->
<%-- <script src="${context}/dist/js/demo.js"></script> --%>
</body>
</html>
