<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${context}\asset\css\bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${context}\css\img-search.css">
    <title>Search-Bar</title>
</head>
<body style="padding-top: 70px;">
    <nav class="navbar navbar-fixed-right">
        <div class="container-fault">
            <div class="navbar-header">
<!--  Logo               <a class="navbar-brand" href="#"> -->
<!--                     <img width="90" alt="Brand" src="../image/logo-tw-2.png"> -->
<!--                 </a> -->
<!--  Search form               <form class="navbar-form navbar-left" role="search"> -->
<!--                     <input type="text" class="form-control icon-search" id="search" name="search" placeholder="Search"> -->
<!--                 </form> -->
<!--                 <div class="button-group form-group navbar-form navbar-left" id="filters"> -->
					<div class="button-group form-group navbar-form navbar-left" id="filters">
                    <button class="button is-checked" data-filter="*">全部類別</button>
                    <button class="button" data-filter=".creatter">創作者</button>
                    <button class="button" data-filter=".fundraising">作品募資</button>
                    <button class="button" data-filter=".product">文創商城</button>
                    <button class="button cancel-search" data-filter="*">取消搜尋</button>
                    <!--<button class="button" data-filter=":not(.transition)">not transition</button>
                    <button class="button" data-filter="numberGreaterThan50">number > 50</button>
                    <button class="button" data-filter="ium">name ends with &ndash;ium</button>-->
                </div>
<!--                 <div id="sorts" class="button-group navbar-form navbar-left"> -->
	                 <div id="sorts" class="button-group navbar-form">
<!--                     <button class="button is-checked" data-sort-by="original-order">潛力排序</button> -->
<!--                     <button class="button" data-sort-by="name">人氣</button> -->
<!--                     <button class="button" data-sort-by="symbol">作者</button> -->
<!--                     <button class="button" data-sort-by="number">金額</button> -->
<!--                     <button class="button" data-sort-by="category">分類</button> -->
                    <!--<button class="button" data-sort-by="weight">weight</button>-->
               
                </div>

            </div>
        </div>
    </nav>
    <!--navbar end-->
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-12 col-md-offset-1">
            <div id="searchfont"></div>
                <div class="grid" id="searchbox">
<!--                     <div class="element-item transition creatter" data-category="transition"> -->
<!--                         <img src="img/2.jpg" alt="..."> -->
<!--                         <h3 class="name">Mercury</h3> -->
<!--                         <p class="symbol">Hg</p> -->
<!--                         <p class="number">80</p> -->
<!--                         <p class="weight">200.59</p> -->
<!--                     </div> -->
                    
                 </div>
                 
            </div>
        </div>
       </div>
<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<%--         <script src="${context}\js\jquery-3.1.1.min.js"></script> --%>
<%--         <script src="${context}\asset\js\bootstrap.min.js"></script> --%>
        <script src="${context}\js\isotope.pkgd.min.js"></script>
        <script src="${context}\js\img-search.js?ver=1"></script>
	 	<script src="${context}\js\default.js"></script>
</body>

</html>