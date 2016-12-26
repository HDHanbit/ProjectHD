<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#logbtn').click(function() {
			
			$.ajax({
				'url':'/market/logcheck?id='+$('#logId').val()+'&pw='+$('#logPw').val(),
				'error' : function(jqXHR, textStatus, errorThrown) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status+"(errorThrown):"+errorThrown);},
				'success' : function(data) {
					var msg = (data);
					if(msg>0){
						$('#logfrom').attr('method','post');
				        $('#logfrom').attr('action','/market/login');
				        $('#logfrom').submit();
					}else{
						alert("ID또는 PW가 틀렸습니다.");
					}
					
				}
			});
			
		});
	});
</script>
</head>
<body>
	<div class="contents">
	<form id="logfrom">
		<div class="cont_top">
			<h3>GREENLIGHT</h3>
		</div>
		<div class="cont_mis">
			<div class="form-group">
				<input type="text" name="id" id="logId" class="form-control" placeholder="아이디를 입력해주세요."/>
			</div>
			<div class="form-group">
				<input type="password" name="pw" id="logPw" class="form-control" placeholder="패스워드를 입력해주세요."/>
			</div>
			<div>
				<button type="button" class="btn btn-success" id="logbtn">로그인</button>
			</div>
		</div>
		<div class="cont_low">
			<a href="/market/gaip">회원가입</a>
			<a href="/market/selidpw">ID/PW찾기</a>
		</div>
	</form>
	</div>
</body>
</html>