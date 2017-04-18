<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<c:set var="context" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--       <link rel="stylesheet" href="../css/Fc_Create2.css"> -->
	<title>商品主頁</title>
<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
      <!-- <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"> -->
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

        @media screen and (max-width: 768px) {
			.container .jumbotron, .container-fluid .jumbotron {
		     padding-top: 80px;
		    
			}
		}
			
		div.col-sm-4 {
			margin-bottom: 20px;
		}
		
		p {
		    margin: 0 0 10px;
		    text-align: center;
		}

      </style>
  </head>

<body>
 		 <section class="container-fluid" id="about">	
 			<div class="jumbotron">
                    <div class="container text-center">
<!--                         <h1>文創商城</h1> -->
                         <img src="${context}/images/words/productWord1s.png" >

                        <p> </p>
                    </div>
                </div>
        <!-- Content Wrapper. Contains page content -->
<!--         <div class="content-wrapper"> -->
          <!-- Content Header (Page header) -->
          <section class="content-header">
          </section>

          <!-- Main content -->
          <section class="content" id = "main">
          <!-- Your Page Content Here -->
				<div class="row">
                    	<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品1</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品2</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品3</p>
                        </div>
                     </div>
				<div class="row">
 						<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品4</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品5</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品6</p>
                        </div>
                 </div>
				<div class="row">
 						<div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品7</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品8</p>
                        </div>
                        <div class="col-sm-4">
                            <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                            <p>商品9</p>
                        </div>
                 </div>


          </section>
          <!-- /.content -->
<!--         </div> -->
        <!-- /.content-wrapper -->

          <!-- To the right -->
<!--           <div class="pull-right hidden-xs"> -->
<!--             Anything you want -->
<!--           </div> -->
<!--           Default to the left -->
<!--           <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved. -->
<!--         </footer> -->

<!--         Control Sidebar -->
<!--         <aside class="control-sidebar control-sidebar-dark"> -->
<!--           Create the tabs -->
<!--           <ul class="nav nav-tabs nav-justified control-sidebar-tabs"> -->
<!--             <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li> -->
<!--             <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li> -->
<!--           </ul> -->
<!--           Tab panes -->
<!--           <div class="tab-content"> -->
<!--             Home tab content -->
<!--             <div class="tab-pane active" id="control-sidebar-home-tab"> -->
<!--               <h3 class="control-sidebar-heading">Recent Activity</h3> -->
<!--               <ul class="control-sidebar-menu"> -->
<!--                 <li> -->
<!--                   <a href="javascript:;"> -->
<!--                     <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->

<!--                     <div class="menu-info"> -->
<!--                       <h4 class="control-sidebar-subheading">Langdon's Birthday</h4> -->

<!--                       <p>Will be 23 on April 24th</p> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
              <!-- /.control-sidebar-menu -->

<!--               <h3 class="control-sidebar-heading">Tasks Progress</h3> -->
<!--               <ul class="control-sidebar-menu"> -->
<!--                 <li> -->
<!--                   <a href="javascript:;"> -->
<!--                     <h4 class="control-sidebar-subheading"> -->
<!--                       Custom Template Design -->
<!--                       <span class="pull-right-container"> -->
<!--                  		<span class="label label-danger pull-right">70%</span> -->
<!--                       </span> -->
<!--                     </h4> -->

<!-- 	                    <div class="progress progress-xxs"> -->
<!-- 	                      <div class="progress-bar progress-bar-danger" style="width: 70%"></div> -->
<!-- 	                    </div> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
              <!-- /.control-sidebar-menu -->

<!--             </div> -->
<!--             /.tab-pane -->
<!--             Stats tab content -->
<!--             <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div> -->
<!--             /.tab-pane -->
<!--             Settings tab content -->
<!--             <div class="tab-pane" id="control-sidebar-settings-tab"> -->
<!--               <form method="post"> -->
<!--                 <h3 class="control-sidebar-heading">General Settings</h3> -->

<!--                 <div class="form-group"> -->
<!--                   <label class="control-sidebar-subheading"> -->
<!--               Report panel usage -->
<!--               <input type="checkbox" class="pull-right" checked> -->
<!--             </label> -->

<!--                   <p> -->
<!--                     Some information about this general settings option -->
<!--                   </p> -->
<!--                 </div> -->
<!--                 /.form-group -->
<!--               </form> -->
<!--             </div> -->
<!--             /.tab-pane -->
<!--           </div> -->
<!--         </aside> -->
<!--         /.control-sidebar -->
<!--         Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
<!--         <div class="control-sidebar-bg"></div> -->
    
      <!-- ./wrapper -->
  </body>
  	<script type="text/javascript">
	$(document).ready(function(){
		var k = 0;
		var pn = '';
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", '\_08_product\\allproduct.json', true);
// 		xhr.send();
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
		$.ajax({
			url: "\_08_product\\allproduct.json",
			type: "GET", 
			async: false,
			success: function(resAllPro) {
				var products = resAllPro;
				var content = '';
				console.log("this is products:");
				console.log(products);	
				for(var j =0  ; j <(products.length / 3) ; j++){
					content += '<div class="row">';
					for(var i=0; i < 3; i++){
						content += '<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal" >';
						content += '<a href="javascript:;" >';
						$.ajax({
							  url: "\_08_product\\singlepropic.json",
							  type: "GET", 
							  async: false,
							  data: { 
							    "pro_id": k+1, 
							  },
							  success: function(resProPica) {
								 //丟回針對pro_id的所有pic_address
 								 if (!$.trim(resProPica)){  
									 return false;	 
 								 }else{
 									 
									 pn = resProPica;
 								 }								 
							  },
							  error: function(proPicErr) {
								 console.log(proPicErr);
								 console.log(pn);
							     proPicErr.abort();
							  }
						});	
						content += '<img src="'+ pn[0].pic_adress +'" class="img-thumbnail img-link" style="width:100%" id="ip_pro_id' + products[k].pro_id + '">';
// 						content += '<span>' + an + '</span></a></div>';
						content += '<p text-align = "center">' + products[k].pro_name + '</p>' + '</a></div>';   
						
						k++;
 						if (k == products.length) break;
					}//end of inner-for-ajax
				
					content += '</div>';
				}//end of for-ajax
				console.log(content);
				var divs = document.getElementById("main");
				divs.innerHTML = content;
			}		
		})
	})

		
	</script>
	<script src="${context}/js/default.js"></script>

</html>