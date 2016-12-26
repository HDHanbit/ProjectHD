<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
 .notice{
 text-align: center;
 }
 table{
  margin: 0px auto;
 }
</style>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/market/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="notice">
  <h1>공 지 사 항</h1><br/><br/>
</div>
	<%-- <img src="../file/${pop.notfile }"><br/> --%>
<table>
	<th>
	<c:forEach items="${list }" var="pop">
		<c:if test="${!empty pop.notfile }">
		<img src="/market/file/${pop.notfile }">
		</c:if>
	</c:forEach>
	</th>
</table>	
	
<div class="table-responsive">
<table class="table table-bordered" >
	<br/>
	<tr>
		
		<th>제  목</th>
		<th width="20%">작성일</th>
	</tr>
	<c:forEach items="${list }" var="bean">
		<c:if test="${empty bean.notfile }">
		<tr>
			
			<td><a href="/market/notice/detail/${bean.notid }">${bean.notitle }</a></td>
			<td>${bean.notday }</td>
		</tr>
		</c:if>
	</c:forEach>
</table>
</div>
</body>
</html>