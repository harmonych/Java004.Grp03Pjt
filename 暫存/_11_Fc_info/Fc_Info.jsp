<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	  rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	  rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../asset/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/Fc_info.css">
<title>募資詳細頁</title>

</head>


<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script>
	var xhr = new XMLHttpRequest();
	xhr.open("GET", '../_07_funds/singlefund.json', true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "";
			var fc_name = "";
			var art_id = "";
			var start_time = "";
			var end_time = "";
			var fc_money = "";
			var now_money = "";
			var fc_introduction = "";
			
			var funds = JSON.parse(xhr.responseText);
			//content ="<div class='pro_name'><h1>募資名稱"+funds.fc_name+"</h1></div>" +
			//			"<div class='art_id'><h3>創作者編號"+funds.art_id+"</h3></div>" +
			//			"<div class='sale_time'>開始時間"+funds.start_time+"</div>" +
			//			"<div class='end_time'>結束時間"+funds.end_time+"</div>" +
			//			"<div class='fc_money'>募資金額"+funds.fc_money+"</div>" +
			//			"<div class='now_money'>目前金額"+funds.now_money+"</div>" +
			//			"<div class='fc_introduction'>募資簡介"+funds.fc_introduction+"</div>" ;
			
			fc_name ="<h1><b>" +funds.fc_name+"</b></h1>" ;
			art_id = "<h4><b>創作者編號 : </b>" +funds.art_id+ "</h4>" ;
			start_time = "<b>開始時間 : </b>" +funds.start_time ;
			end_time = "<b>結束時間 : </b>" +funds.end_time ;
			fc_money = "<b>募資金額 : </b>" +funds.fc_money ;
			now_money = "<b>目前金額  : </b>" +funds.now_money ;
			fc_introduction = "<b>募資簡介 : </b><br>" +funds.fc_introduction ;			
	
		}
		//content += "";
		//var divs = document.getElementById("somedivS");
		//divs.innerHTML = content;
		
		fc_name += "";
		var divs = document.getElementById("fc_name");
		divs.innerHTML = fc_name;
		
		art_id += "";
		var divs = document.getElementById("art_id");
		divs.innerHTML = art_id;
		
		start_time += "";
		var divs = document.getElementById("start_time");
		divs.innerHTML = start_time;
		
		end_time += "";
		var divs = document.getElementById("end_time");
		divs.innerHTML = end_time;
		
		fc_money += "";
		var divs = document.getElementById("fc_money");
		divs.innerHTML = fc_money;
		
		now_money += "";
		var divs = document.getElementById("now_money");
		divs.innerHTML = now_money;
		
		fc_introduction += "";
		var divs = document.getElementById("fc_introduction");
		divs.innerHTML = fc_introduction;
	}
</script>

<body>
	<!-- 標題列 -->
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
			<ul class="nav navbar-nav navbar-right">

				<!-- <li><a href="#">購物車</a></li> -->
				<li><a href="#">登入</a></li>
				<li><a href="#">註冊</a></li>
			</ul>
		</div>
		</div>
	</nav> 
</header>


	<section class="container-fluid" id="about">
	<div id="wrapper">
		<!-- Sidebar -->

		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation">
		<ul class="nav sidebar-nav">
			<li class="sidebar-brand"><a href="#"> </a></li>

			<li><a href="../Second_frame/test0301.html">創作大廳</a></li>
			<li><a href="#">募資大廳</a></li>
			<li><a href="#">作品商城</a></li>
			<li><a href="#">購物車</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">下拉 <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li class="dropdown-header">下拉標題</li>
					<li><a href="#">副選單一</a></li>
					<li><a href="#">副選單二</a></li>
				</ul></li>

		</ul>
		</nav>

		<!-- #sidebar-->
		<div class="row">
			<!-- Modal -->
			<div class="modal fade bs-java" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Savechanges</button>
						</div>
					</div>
				</div>
			</div>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<script src="../asset/js/bootstrap.min.js"></script>
			<script src="../js/default.js"></script>
	</section>


	<!-- 內容部分 -->
	<section>
		<div class="row">
			
			<!-- 圖片顯示欄 -->
			<div class="card_card01 col-md-4 col-md-offset-2">
				<div class="pro_img">
					<img src="../images/v06.jpg" class="pro_img">
					<!-- width="400" height="400" -->
				</div>
			</div>


			<!-- 募資介紹欄 -->
			<div class="card_card02 col-md-4">
				<div id="info_area">
						
					<div id="fc_name">
						<h1>fc_name 募資名稱</h1>
					</div>
					
					<div id="art_id">	
						<label id='lb'>創作者編號:</label>
					</div>
						
					<div id="start_time" >
						<label id="lb">start_time 開始時間</label>
					</div>
					<div id="end_time" >
						<label id="lb">end_time 結束時間</label>
					</div>
					<div id="fc_money" >
						<label id="lb">fc_money 募資金額</label>
					</div>	
					<div id="now_money" >
						<label id="lb">now_money 目前金額</label>
					</div>
				
				<p>-------------------------------------------------------------------</p>
					<div id="fc_introduction">
						<label id="lb">募資簡介</label><br>
						
						<p>
							fc_Introduction<br> 
							我是募資簡介!<br> 
							我是募資簡介!!<br>
							我是募資簡介!!!<br> 
							我是募資簡介!!!!<br> 
							我是募資簡介!!!!!<br>
						</p>
					</div>
				</div>	
				<p>-------------------------------------------------------------------</p>
				<div id="sponsor_area">
					<form id="form1">
						<div id="sponsor_money">
							<div>
								<label>贊助金額</label>
							</div>
								<div>
									<select class="form-control">
										<option value="1">NT $500</option>
										<option value="2">NT $1,000</option>
										<option value="3">NT $2,000</option>
										<option value="4">NT $3,000</option>
										<option value="5">NT $5,000</option>
										<option value="6">NT $10,000</option>
										<option value="7">NT $20,000</option>
										<option value="8">NT $30,000</option>
										<option value="8">NT $50,000</option>
									</select>
								</div>
						</div>

						<div id="bt_area">
							<input type="submit" name="submit" class="bt1 btn-lg btn-block" value="我要贊助">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>
</html>