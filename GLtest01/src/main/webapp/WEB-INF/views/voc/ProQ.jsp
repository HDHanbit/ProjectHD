<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
	
</script>
<style type="text/css"></style>
</head>
<body class="w3-light-grey">
<%@ include file="../template/container.jsp" %>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <div class="w3-container container">
		<!-- 	<div class="row">
			<div class="col-fm-12">
				<ol class="breadcrumb">
					<li><a href="/sts04/">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
		</div> -->
		<!-- <h1>ProQ 리스트</h1> -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-condensed">
					<c:forEach items="${vlist }" var="bean">
						<tr>
							<th rowspan="2">${bean.vocid }</th>
							<th>고객 Id</th>
							<td colspan="2">${bean.customid }</td>
							<th>삭제</th>
							<td><a class="btn btn-default" href="del?id=${bean.vocid }&field=OneQ" role="button">삭제</a></td>
						</tr>
						<tr>
							<th>문의 제목</th>
							<td colspan="2">${bean.voctitle }</td>
							<th>답글 여부</th>
							<c:if test="${bean.answer ne null }">
								<td>
									<a class="btn btn-info" href="detail?id=${bean.vocid }&field=ProQ" role="button">수정</a>
								</td>
							</c:if>
							<c:if test="${bean.answer eq null }">
								<td>
									<a class="btn btn-success" href="detail?id=${bean.vocid }&field=ProQ" role="button">입력</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>