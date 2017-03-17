<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>作品頁面</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/Creations_page.css">
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
		  <a class="navbar-brand" href="#">創作者平台</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
		  <ul class="nav navbar-nav">
			<li class="active"><a href="../index.jsp">Home</a></li>
	       <!-- <li><a href="#">作品分類一</a></li> -->
	         <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">實體作品 <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header"></li>
						<li><a href="#">副選單一</a></li>
						<li><a href="#">副選單二</a></li>
					</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">周邊<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li class="dropdown-header"></li>
					<li><a href="#">副選單一</a></li>
					<li><a href="#">副選單二</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">書籍<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li class="dropdown-header"></li>
					<li><a href="#">副選單一</a></li>
					<li><a href="#">副選單二</a></li>
				</ul>
			</li>
		  </ul>
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		  </ul>
		</div>
	  </div>
	</nav>

	<div class="container-fluid text-center">    
	  <div class="row content">
		<div class="col-sm-2 sidenav">
	<!-- 	 <div id="mySidenav" class="sidenav">
		  <a href="#" id="about">作品</a>
		  <a href="#" id="blog">創作者</a>
		  <a href="#" id="projects">Projects</a>
		  <a href="#" id="contact">Contact</a>
		 </div> -->
		</div>
		<div class="col-sm-8 text-left"> 
		  <h1>創作者平台</h1>
		<!--   <p></p>
		  <hr>
		  <h3></h3>
		  <p> </p> -->
		  <div class="container">
			<div class="row">
			
			<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal">
				<a href="#">
				<img src="../images/MuMu1.jpg" class="img-thumbnail" width="140" height="140"> MuMu</a>
				</div>
				<div class="card col-sm-4 col-md-4 col-md-4" data-toggle="modal">
				<a href="#">
				<img src="../images/九1.png" class="img-thumbnail" width="140" height="140"> 喵窩</a>
				</div>
				<!-- <div class="card col-md-4 col-xs-12" >1</div> -->
				<!-- <div class="card col-md-4 col-xs-12" >2</div> -->
				<div class="card col-md-4 col-xs-12" >3</div>
				
			</div>
			<div class="row">
				<div class="card col-md-4 col-xs-12" >5</div>
				<div class="card col-md-4 col-xs-12" >6</div>
				<div class="card col-md-4 col-xs-12" >7</div>
			</div>
			<div class="row">
				<div class="card col-md-4 col-xs-12" >4</div>
				<div class="card col-md-4 col-xs-12" >8</div>
				<div class="card col-md-4 col-xs-12" >9</div>
			</div>
		  </div>
		  
		</div>
	
	  </div>
	</div>

<footer class="container-fluid text-center">
  <p> </p>
</footer>

</body>
</html>