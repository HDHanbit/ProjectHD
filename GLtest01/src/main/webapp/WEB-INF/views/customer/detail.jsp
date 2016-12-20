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
</head>
<body class="w3-light-grey">
	<%@ include file="../template/container.jsp"%>
	<!-- 
		//add:그냥 입력으로 폼 보여주기
		//proid:값을 가진 입력 폼으로 수정가능하게 보여주기 
		//title : 입력 / 수정
		//ProductVo : bean
		-->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">
		<div class=" w3-container container">
			<%-- <h1>${title }페이지</h1> --%>
			<form action="${url }" enctype="multipart/form-data" method="post">


				<div class="form-group col-md-12">
					<label for="id" class="col-md-2 control-label">고객ID</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="바꿀수없듬!" value="${bean.id }" readonly="readonly">
					</div>
				</div>
				<div class="form-group col-md-12">
					<label for="pw" class="col-md-2 control-label">고객PW</label>
					<div class="col-md-10">
						<input type="password" class="form-control" id="pw" name="pw"
							placeholder="바꿀수없듬!" value="${bean.pw }" readonly="readonly">
					</div>
				</div>
				<div class="form-group col-md-12">
					<label for="name" class="col-md-2 control-label">고객이름</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="바꿀수있나?" value="${bean.name }">
					</div>
				</div>


				<div class="form-group col-md-12">
					<label for="phone" class="col-md-2 control-label">고객핸드폰번호</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="바꿀수있나?" value="${bean.phone }">
					</div>
				</div>


				<div class="form-group col-md-12">
					<label for="cash" class="col-md-2 control-label">고객누적금액</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="cash" name="cash"
							placeholder="고객누적금액(기준 : 원)" value="${bean.cash }">
					</div>
				</div>

				<div class="form-group col-md-12 ">
					<label for="tcash" class="col-md-2 control-label">고객적립금</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="tcash" name="tcash"
							placeholder="고객적립금(기준 : 원)" value="${bean.tcash }">
					</div>
				</div>

				<div class="form-group col-md-12 ${errs.grade }">
					<label for="grade" class="col-md-2 control-label">고객등급</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="grade" name="grade"
							placeholder="0원~1000000원 등급1" value="${bean.grade }">
					</div>
				</div>


				<div class="form-group col-md-12">
					<button type="submit" class="btn btn-primary">${title}</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>