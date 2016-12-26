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
<script type="text/javascript">
	$(document).ready(function(){
		$('#ok').click(function() {
		var title = $('#title').val();
		var content = $('#content').val();	
			if(title==""){
				alert("제목을 입력해주세요");		
			}else if(title.length>20){
				alert("제목은 20자 이내로 입력해주세요");			
			}else if(content==""){
				alert("문의사항을 입력해주세요");			
			}else if(content.length>4000){
				alert("질문 내용은 4000자를 넘을수 없습니다.");			
			}
			else{		
			alert("문의 사항이 접수 되었습니다.");
			window.location.replace("/market/notice/voc/list?title="+title+"&content="+content);				
			}
			
				
		});
	});

	$(document).ready(function(){
		$('#re').click(function() {
			window.location.replace("/market/notice/noticelist/")
		});
	});
	</script>


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
<body>
<div class="notice">
  <h1>질문 하기</h1>
  <br/>
  <br/>
</div>


<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
   		<th width="10%">제 목</th>
   		<th><textarea rows="1" cols="100" style="overflow:hidden" id="title" name="title"></textarea></th>
    </tr>
    <tr>
    	<th width="10%">문의내용</th>
    	<th><textarea rows="30" cols="100" style="overflow:hidden" id="content" name="content"></textarea> </th>
    </tr>
  </table>
</div>  
  <br/>
			<input id="ok" type="button" value="문 의">
			<input id="re" type="button" value="취 소">
</body>
</html>