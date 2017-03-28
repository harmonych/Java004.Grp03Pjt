<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>募資平台</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/funds_page.css">
 
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" ><img src="../image/logo-tw-1.png" width=35px height=35px></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="../index.jsp">Home</a></li>
       <!--  <li><a href="#">About</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Contact</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="username"><span>${userName}</span></li>		

					<li><a href="#"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron">
  <div class="container text-center">
    <h1>募資平台</h1>      
    <p> </p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h3></h3><br>
  <p id="demo"></p>
  <div class="row">
 <div class="col-sm-4">
		<div>fc_name</div>
		<img src="http://saudade.myasustor.com/JPjt/fc_pic_address/2.jpg" width=50% title="">
		<div class="info">
		   <div class="owner">by<a href="../CreationsFrame/Creations.jsp" target="_blank">MuMu</a></div>
			<!-- <div class="crowd-mask-money money"><span class="label">總金額</span>
			<span class="crowd-total"> </span></div> -->
		</div> 
    </div>
    <div class="col-sm-4"> 
		<div>fc_name</div>
 			<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
     		<div class="info">
			<div class="owner">by<a href="../CreationsFrame/Creations.jsp" target="_blank">MuMu</a></div>
		    <!--  <div class="crowd-mask-money money"><span class="label">總金額</span>
			<span class="crowd-total"> </span></div> -->
		</div> 
	</div>
    <div class="col-sm-4">
		<div>fc_name</div>
		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
			<div class="owner">by<a href="../CreationsFrame/Creations.jsp" target="_blank">MuMu</a></div>
		</div>
    </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
  	<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
  	<script>
			var xhr = new XMLHttpRequest();
			xhr.open("GET", '../ch07/allfunds.json', true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					var funds = JSON.parse(xhr.responseText);
					for(var i=0; i < funds.length; i++){
						content += "<tr><td>" + funds[i].fcid + "</td>" ; 
// 						               "<td>" + funds[i].artid + "</td>" +
// 						               "<td>" + funds[i].fcname + "</td>" +
// 						               "<td>" + funds[i].fcmoney + "</td>"; 
						           "</tr>";    
					}
					content += "</table>";
					var divs = document.getElementById("somedivS");
					divs.innerHTML = content;
				}
			}
	</script>
    <div class="col-sm-4">
	  <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
	</div>
    <div class="col-sm-4">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
    </div>
    <div class="col-sm-4">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
	</div>
    
	<div id='somedivS'></div>
   
    	<div class="w3-bar">
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
		  <a href="#" class="w3-bar-item w3-black w3-button">1</a>
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">5</a>
		  <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
	    </div>
  </div>
</div><br><br>

<footer class="container-fluid text-center">
  <p> </p>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script src="../js/default.js"></script>

</body>
</html>