<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script>
			var xhr = new XMLHttpRequest();
			xhr.open("GET", '../_07_funds/allfunds.json', true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					var funds = JSON.parse(xhr.responseText);
					for(var i=0; i < funds.length; i++){
						content += "<tr><td>" + funds[i].fc_id + "</td>" + 
						               "<td>" + funds[i].art_id + "</td>" +
						               "<td>" + funds[i].fc_name + "</td>" +
						               "<td>" + funds[i].fc_money + "</td>" ;
						             

						           "</tr>";    
					}
					content += "</table>";
					var divs = document.getElementById("somedivS");
					divs.innerHTML = content;
				}
			}
</script>
<script>
// $(document).ready(
// 	function() {
// 	$('#clickmeQ').click(
// 		function() {
// 			$("#somedivS").empty();
// 		    $.getJSON('../..//ch07/allfunds.json',
// 				function(categoriesJson) {
		    	
// 				var $table = $(
// 				'<table border="1">')
// 					.appendTo(
// 					$('#somedivS'));
// 				     $.each(categoriesJson,
// 		             function(index, element) {
// 						$('<tr>').appendTo($table)
// 						.append($('<td>').text(element.fcid))
// 						.append($('<td>').text(element.artid))
// 						.append($('<td>').text(element.fcname + "(JQuery版)"))
// 						.append("<td></td>")
						
// 								;
// 					  });
// 				});
// 			});
// 			});
</script>
</head>
<body>
	
	<hr>
	<div id='somedivS'></div>

</body>
</html>