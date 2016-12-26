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
	<script type="text/javascript">
	$(document).ready(function(){
		$('#qq').click(function() {
			window.location.replace("./question")
		});
	});
	</script>

</head>
<body>
	<div class="notice">
  <h1>1:1 문의</h1>
  <br/>
  <br/>
</div>
<div class="table-responsive">
<table class="table table-bordered" >
	<input id="qq" type="button" value="질문하기">
<tr>
		<th width="10%">아이디</th>
		<th width="80%">질문 목록</th>
		<th width="100%">답변 여부</th>
	</tr>
	<c:forEach items="${list }" var="bean">
		<tr>
  		<td>${bean.customid  }</td>
  			<td><a href="/market/notice/voc/vocanswer/voc?idx=${bean.vocid }">${bean.voctitle }</a></td>
			<c:if test="${empty bean.answer  }" ><td>답변중</td></c:if>
			<c:if test="${!empty bean.answer  }" ><td>답변완료</td></c:if>
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>