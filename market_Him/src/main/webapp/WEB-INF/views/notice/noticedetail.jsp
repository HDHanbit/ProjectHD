<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <h1>공 지 사 항</h1>
  <br/>
  <br/>


<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
   		<th width="10%">번호</th>
   		<th width="10%">${bean.notid }</th>
   		<th width="20%">작성일</th>
   		<th width="60%">${bean.notday }</th>
    </tr>
    <tr>
    	<th width="10%">제목</th>
    	<th width="90%" colspan="3">${bean.notitle }</th>
    </tr>
    <tr>
    	<th width="10%">내용</th>
    	<th width="90%" colspan="3">${bean.notcontent }</th>
    </tr>
  </table>
</div>
</body>
</html>