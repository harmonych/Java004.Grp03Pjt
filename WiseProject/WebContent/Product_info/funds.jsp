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
  <link rel="stylesheet" href="css/backer_page.css">
 
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
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
		<img src="../images/MuMu2.jpg"  class="img-responsive" style="width:70%" alt="Image">
		<div class="info">

		   <div class="owner">by<a href="../Second_frame/Creations.jsp" target="_blank">user_name</a></div>
			<!-- <div class="crowd-mask-money money"><span class="label">總金額</span>
			<span class="crowd-total"> </span></div> -->
		</div> 
    </div>
    <div class="col-sm-4"> 
    	<div>fc_name</div>
		<img src="../images/MuMu3.jpg"  class="img-responsive" style="width:80%" alt="Image">
        <div class="info">
			<div class="owner">by<a href="../Second_frame/Creations.jsp" target="_blank">user_name</a></div>
		    <!--  <div class="crowd-mask-money money"><span class="label">總金額</span>
			<span class="crowd-total"> </span></div> -->
		</div> 
	</div>
    <div class="col-sm-4">
    	<div>fc_name</div>
		<img src="../images/MuMu5.jpg"  class="img-responsive" style="width:60%" alt="Image">
		<div class="info">
			<div class="owner">by<a href="../Second_frame/Creations.jsp" target="_blank">user_name</a></div>
		</div>
    </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
  	<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
  	<script>
			var xhr = new XMLHttpRequest();
			var json='[{"fcname":"募資名稱","fcmoney":"募資金額","user_name":"創作者名稱","pic_address":"募資圖片位址",}]'
			funds=JSON.parse(json);
			xhr.open("GET", '../ch07/allfunds.json', true);
// 			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					var funds = JSON.parse(xhr.responseText);
					//fund.legenth依照funds的長度,來決定跑幾次
					for(var i=0; i < funds.length; i++){
						content += "<tr><td>" + funds[i].fcname + "</td>" +
					               "<td>" + funds[i].fcmoney + "</td>"
					               "<td>" + funds[i].user_name + "</td>"
						           "</tr>";    
					}
					content += "</table>";
					var divs = document.getElementById("somedivS");
					divs.innerHTML = content;
				}
			}
	</script>
    <div class="col-sm-3">
	  <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
	</div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
    </div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
	</div>
    <div class="col-sm-3">
    <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Some text..</p>
    <hr>
	<div id='somedivS'></div>
    </div>
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


</body>
</html>