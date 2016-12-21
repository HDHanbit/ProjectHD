<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>GreenLight master</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.header {
	height: 6%;
}

.img {
	margin-top: -10px;
	margin-left: 10px;
	height: 50px;
	width: 50px;
}
</style>
<script type="text/javascript">
</script>
<style type="text/css"></style>
</head>
<!-- 
		//prodetail : 항공편 & 출발일
		-->
<body class="w3-light-grey">
	<%@ include file="../template/container.jsp"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">

		<div class="w3-container container">
			<%-- <h1>${title }페이지</h1> --%>
			<div class="col-md-12">
				<form action="insertDetail" method="post">
					<div class="col-md-4">
						<label>상품 코드 : ${id }</label> <input hidden="hidden" value="${id}"
							name="proid" id="proid">
					</div>
					<div class="form-group col-md-8">
						<label for="imgFile" class="col-md-2 control-label">출발일</label>
						<div class="col-md-4">
							<input type="date" class="form-control" id="startday"
								name="startday" min="${sysdate }">
						</div>
						<label for="imgFile" class="col-md-2 control-label">항공편</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="trans"
								name="trans" placeholder="항공편을 작성해 주십시오.">
						</div>
					</div>
					<div class="form-group col-md-8">
						<button type="submit" class="btn btn-primary">입력</button>
						<button type="reset" class="btn btn-default">취소</button>
					<a role="button" class="btn btn-info" href="detail?id=${id }">상품으로 돌아가기</a>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>출발일</th>
						<th>항공편</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${pdlist }" var="bean">
						<tr>
							<td>${bean.startday }</td>
							<td>${bean.trans }</td>
							<td><a role="button" class="btn btn-danger" href="delDetail?proid=${id}&startday=${bean.startday}&trans=${bean.trans}">삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
</body>
</html>