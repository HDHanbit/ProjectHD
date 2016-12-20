
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>GreenLight master</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
// Get the Sidenav
var mySidenav = document.getElementById("mySidenav");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidenav, and add overlay effect
function w3_open() {
    if (mySidenav.style.display === 'block') {
        mySidenav.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidenav.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidenav with the close button
function w3_close() {
    mySidenav.style.display = "none";
    overlayBg.style.display = "none";
}
</script>

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    .header{
        height:6%;
    }
    .img {
          margin-top:-10px;
          margin-left:10px;
          height:50px;
          width:50px;
     }
    
</style>



<body class="w3-light-grey">
<%@ include file="../template/container.jsp" %>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <div class="w3-container container">
		<!-- <h1>고객전체페이지</h1> -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<!--  고객아이디, 고객비번, 고객이름, 고객핸드폰번호, 고객누적금액, 고객등급, 고객마일리지 -->
						<th>고객ID</th>
						<th>고객이름</th>
						<th>고객핸드폰번호</th>
						<th>고객누적금액</th>
						<th>고객적립금</th>
						<th>고객등급</th>
						<th>&nbsp;</th>
					</tr>

					<c:forEach items="${clist }" var="bean">

						<tr>
							<td>${bean.id }</td>
							<td>${bean.name }</td>
							<td>${bean.phone }</td>
							<td>${bean.cash}</td>
							<td>${bean.tcash}</td>
							<td>${bean.grade }</td>
			
							<td><a class="btn btn-success"
								href="detail?id=${bean.id }" role="button">수 정</a> <a
								class="btn btn-danger" href="del?id=${bean.id }"
								role="button">삭 제</a></td>
						</tr>
						

					</c:forEach>
				</table>
			</div>
			
		</div>
	</div>
	</div>
</body>
</html>