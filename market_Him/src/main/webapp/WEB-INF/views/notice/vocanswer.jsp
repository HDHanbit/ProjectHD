<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <style type="text/css">
 .notice{
 text-align: center;
 }
 table{
  margin: 0px auto;
 }
</style>
</head>
<body>

  <div class="notice">
  <h1>1:1문의 답변</h1>
  <br/>
  <br/>
</div>


<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
   		<th width="10%">아이디</th>
   		<th>${bean.customid }</th>
    </tr>
    <tr>
    	<th width="10%">제목</th>
    	<th>${bean.voctitle }</th>
    </tr>
    <tr>
    	<th width="10%">문의내용</th>
    	<th>${bean.voccontent }</th>
    </tr>
    <tr>
    	<th width="10%">답변</th>
    	
		<c:if test="${empty bean.answer  }" ><th>빠린시일내로 답변 드리겠습니다.</th></c:if>
		<c:if test="${!empty bean.answer  }" ><th>${bean.answer }</th></c:if>
		
    </tr>
  </table>
</div>
</body>
</html>