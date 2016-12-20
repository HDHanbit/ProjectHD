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
<style type="text/css">
@import
	url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
	;
</style>
</head>
<body class="w3-light-grey">
	<%@ include file="../template/container.jsp"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">

		<div class="w3-container container">
			<!-- 	<div class="row">
			<div class="col-fm-12">
				<ol class="breadcrumb">
					<li><a href="/sts04/">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
		</div> -->
			<%-- <h1>${field} ${title} 페이지</h1> --%>
			<div class="row">
				<div class="col-md-12">
					<form action="update${field }" method="post">
						<!--쿠폰생성 폼-->
						<div class="form-group col-md-4">
							<label class="control-label">문의 내용</label>
						</div>
						<div class="form-group col-md-8">
							<label for="vocid" class="control-label">VoC ID</label> <input
								type="text" class="form-control" id="vocid" name="vocid"
								value="${bean.vocid }" readonly="readonly">
						</div>
						<div class="form-group col-md-4">
							<label class="">&nbsp;</label>
						</div>
						<div class="form-group col-md-8">
							<label for="customid" class="control-label">고객 ID</label> <input
								type="text" class="form-control" id="customid" name="customid"
								value="${bean.customid }" readonly="readonly">
						</div>
						<c:if test="${bean.proid ne null }">
							<div class="form-group col-md-4">
								<label class="">&nbsp;</label>
							</div>
							<div class="form-group col-md-8">
								<label for="proid" class="control-label">상품 ID</label> <input
									type="text" class="form-control" id="proid" name="proid"
									value="${bean.proid }" readonly="readonly">
							</div>
						</c:if>
						<div class="form-group col-md-4">
							<label class="">&nbsp;</label>
						</div>
						<div class="form-group col-md-8">
							<label for="voctitle" class="control-label">문의 제목</label> <input
								type="text" class="form-control" id="voctitle" name="voctitle"
								value="${bean.voctitle }" readonly="readonly">
						</div>
						<div class="form-group col-md-4">
							<label class="">&nbsp;</label>
						</div>
						<div class="form-group col-md-8">
							<label for="voccontent" class="control-label">문의 내용</label>
							<textarea class="form-control" rows="10" id="voccontent"
								name="voccontent">${bean.voccontent }</textarea>
						</div>
						<div class="form-group col-md-4">
							<label class="">답글 달기</label>
						</div>
						<div class="form-group col-md-8">
							<label for="answer" class="control-label">답글 내용</label>
							<textarea class="form-control" rows="10" id="answer"
								name="answer">${bean.answer }</textarea>
						</div>
						<div class="form-group col-md-12">
							<p class="col-md-2">&nbsp;</p>
							<button type="submit" class="btn btn-primary col-md-4">입력</button>
							<button type="reset" class="btn btn-default col-md-4">취소</button>
							<p class="col-md-2">&nbsp;</p>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>