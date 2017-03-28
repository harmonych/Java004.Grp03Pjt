<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Creations_page2.css">
        <title>創作者大廳</title>
    </head>

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
                            <li class="username"><span>${userName}</span></li>
                            <li><a href="#"><span class="glyphicon glyphicon-registration-mark"></span>註冊</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
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
                            <a href="CreationsPage3.jsp">作品頁面</a>
                        </li>
                        <li>
                            <a href="../_06_fundsFrame/funds.jsp">募資大廳</a>
                        </li>
                        <li>
                            <a href="#">商城系統</a>
                        </li>
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
                    <div class="container-fluid">
                        <div class="row content">
                            <div class="col-md-9 col-xs-9">
                                <div class="BH-lbox MSG-box5">
                                    <div class="HOME-mainbox1">
                                        <!--內容開始-->
                                        <div class="row">
                                            <h2>作品</h2>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6" >
                                            <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/1.jpg" class="img-thumbnail" width=90% height=50% title=""> </div>
<!--                                             <p> <a href="CreationsPage3.jsp"><h5>作品1</h5></a> -->
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                        </div>
                                        <div class="row">
                                            <h2>商品</h2>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                            <img src="http://saudade.myasustor.com/JPjt/pro_pic_address/17.jpg" class="img-thumbnail" width=60% height=50% title=""> 
                                            </div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                        </div>
                                        <div class="row">
                                            <h2>募資</h2>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                            <img src="http://saudade.myasustor.com/JPjt/fc_pic_address/2.jpg" width=50% title=""></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                            <div class="card col-lg-3 col-md-3 col-sm-6 col-xs-6"></div>
                                         </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <h4>創作者 Blog</h4>
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="Creations.jsp">創作平台</a></li>
                                    <li>
                                        <a href="pic_address 簡介圖片位址">
                                            <img src="../images/picture.png" class="pic_id 簡介圖片編號"></a>
                                        <ul class="MSG-mydata1">
                                            <li>帳號：<span class="r_user_id ">創作者編號</span></li>
                                            <li>暱稱：<span class="user_name ">會員名稱</span></li>
                                        </ul>
                                    </li>
                                    </a>
                                    </li>
                                    <li><a href="#section3">訪客留言</a></li>
                                    <li><a href="#section3">相關...</a></li>
                                </ul><br>
                            </div>
                        </div>
                    </div>

                    <footer class="container-fluid">
                        <p></p>
                    </footer>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                    <script src="asset/js/bootstrap.min.js"></script>
                    <script src="../js/default.js"></script>
        </section>
    </body>

    </html>