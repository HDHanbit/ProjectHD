<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header페이지</title>
<style type="text/css">
body {
	position: relative;
}

.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix ~ .container-fluid {
	position: relative;
	top: 300px;
}

.navbar {
	margin-bottom: 0px;
}

#myCarousel  .item {
	height: 600px;
}

#myCarousel img {
	position: absolute;
	top: 0;
	left: 0;
	min-width: 100%;
	height: 800px;
}

#wrap>.container {
	padding: 60px 15px 0;
}

.container .credit {
	margin: 20px 0;
}

.carousel-caption {
	z-index: 100;
}

#nav-bar {
	vertical-align: middle;
}
</style>
<!-- jQuery -->
</head>




<body>

	<nav class="navbar navbar-inverse" data-spy="affix"
		data-offset-top="197">
		<div class="container-fluid">
			<!-- menu -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<div class="brand-logo">
					<a href="/market/"> <img alt="Logo"
						src="/market/img/logo2_77x15.png" />
					</a>
				</div>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li class="active"><a href="/market/">Home</a></li>
					<li><a href="/market/go/HD">핫딜</a></li>
					<li><a href="/market/go/total">전체보기</a></li>
					<li><a href="/market/go/KR">국내</a></li>
					<li><a href="/market/go/GL">국외</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">테마
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/market/go/HU">휴양지</a></li>
							<li class="divider"></li>
							<li><a href="/market/go/FM">가족여행</a></li>
							<li class="divider"></li>
							<li><a href="/market/go/FO">맛집탐방</a></li>
							<li class="divider"></li>
							<li><a href="/market/go/OD">당일치기</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.id eq null}">
						<li><a href="/market/logform">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.id ne null }">
						<li><a href="/market/logout">로그아웃(이미지처리 예정)</a></li>
					</c:if>
					<li><a href="/market/gaip">회원가입</a></li>
					<li><a href="/market/notice/">고객센터</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- menu end -->


</body>
</html>
