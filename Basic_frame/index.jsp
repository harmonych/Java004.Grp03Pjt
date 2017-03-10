
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

</* html lang="zh" */>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="asset/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/page.css">
	<title>創作募資平台</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet" />
</head>

<body>

<header class="container-fluid">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed" data-toggle="offcanvas">
				<span class="hamb-top"></span>
				<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
			</button>
		</div>

		<div class="btn-toolbar">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand textup" href="#"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
			  <span class="sr-only">Toggle navigation</span>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">註冊</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<!-- <li><a href="#">搜尋</a></li>
					<li><a href="#">購物車</a></li> -->
				</ul>
			</div>
		</div>
	</nav>



		
	<div class="jumbotron text-center">
		 
		<form class="form-inline">
			<div class="form-group">
				<input class="form-control" type="search" placeholder="搜尋" size="50" required>
			</div>
				<button type="submit" class="btn btn-default">search</button>
				<p>
			<div class="checkbox">
    			<label><input type="checkbox" checked>創作者</label>
  			</div>
  			<div class="checkbox">
    			<label><input type="checkbox" checked>商城作品</label>
  			</div>
  			<div class="checkbox">
    			<label><input type="checkbox" checked>募集作品</label>
  			</div>
		</form>
	</div>
</header>


<section class="container-fluid" id="about">
	<div id="wrapper">
		<!-- Sidebar -->

		<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				<li class="sidebar-brand">
					<a href="#"> </a>			
				</li>
				
				<li>
					<a href="Second_frame/Creations.html">創作作品</a>
				</li>
				<li>
					<a href="Third_frame/backer.html">募資平台</a>
				</li>
				<li>
					<a href="#">商城系統</a>
				</li>
				<!-- <li>
					<a href="#">社群交流</a>
				</li> -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header">下拉標題</li>
						<li><a href="#">副選單一</a></li>
						<li><a href="#">副選單二</a></li>
					</ul>
				</li>

			</ul>
		</nav>
	
		<!-- #sidebar-->
	<div class="row">
		<!-- Modal -->
		<div class="modal fade bs-java" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						...
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
		<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h4 ><br><span style="font-style:normal;">
					<img src="images/picture.png" class="img-rounded" width="50" height="60">
					新作品分享圖</span></h4>
				</div>
				<div class="item">
					<h4> <br><span style="font-style:normal;">
					<img src="images/photocamera1.png" class="img-circle" width="60" height="60" >
					募資新資訊</span></h4>
				</div>
				<div class="item">
					<h4> <br><span style="font-style:normal;">
					<img src="images/teddybear.png" class="img-thumbnail" width="30" height="30">
					新加入創作者</span></h4>
				</div>
			
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="row">
		<div class="card _card01 col-sm-4 col-md-4 col-md-4" data-toggle="modal">最新主題</div>
		<div class="card _card02 col-sm-4 col-md-4 col-md-4" data-toggle="modal">最新募資</div>
		<div class="card _card03 col-sm-4 col-md-4 col-md-4" data-toggle="modal">社群系統</div>
		
</div>
		
</div>

</section>

<footer class="container-fluid text-center">
	<p>
	</p>
	
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script src="js/default.js"></script>


</body>

</html>
<%@><%>
