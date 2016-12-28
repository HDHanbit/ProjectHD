<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link href="/market/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/market/js/bootstrap.min.js"></script>
</head>
<body>
	<div class = "header" >
		<%@ include file = "../header/header.jsp" %>
	</div>

	<div class="container">
		<div class="jumbotron">
			<div class="row marketing">
		      	<div class="col-lg-9 col-xs-12">
		        	<h1>GREENLIGHT<br/>고객센터</h1>
		        </div>
		        <div class="col-lg-3 col-xs-12">
					<div class=" col-xs-6">카톡상담관련 IMG</div>
					<div class=" col-xs-6">전화상담관련 IMG</div>
				</div>
			</div>
        </div>
        <div class="row marketing">
        	<div class="col-lg-4 col-xs-12">
				<a href="/market/notice/noticelist/" >공지사항</a>
			</div>
			<div class="col-lg-4 col-xs-12">
				<a href="/market/notice/qna/" >자주묻는질문</a>
			</div>
			<div class="col-lg-4 col-xs-12">
				<a href="/market/notice/event/">이벤트</a>
			</div>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../footer/footer.jsp"/>
	</div>		
</body>
</html>
