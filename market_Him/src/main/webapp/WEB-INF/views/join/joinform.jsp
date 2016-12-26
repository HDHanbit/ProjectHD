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

	function onlynum() {
		if ((event.keyCode<48)||(event.keyCode>57)){
			$('.joinPhone').text("숫자만 입력해주세요.");
			//alert ("숫자로 입력해주세요.");
		    event.returnValue = false;	
		}
	};
	
	$(document).ready(function() {
		
		$('#nextbtn').click(function() {
			$('span').text("");
			if($('#joinId').val() == ""){
				$('.joinId').text("아이디를 입력해주세요.");
				$('.joinId').focus();
				return;
			}
			if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test($('#joinId').val())){
				$('.joinId').text("영문자 혹은 숫자만 입력해주세요.");
				$('.joinId').focus();
				return;
			}
			if($('#joinNic').val() == ""){
				$('.joinNic').text("이름을 입력해주세요.");
				$('.joinNic').focus();
				return;
			}
			if($('#joinPw').val() == ""){
				$('.joinPw').text("비밀번호를 입력해주세요.");
				$('.joinPw').focus();
				return;
			}
			if($('#joinPw').val().length<8 || $('#joinPw').val().length>20){
				$('.joinPw').text("비밀번호를 8~20자 이내에 입력해주세요.");
				$('.joinPw').focus();
				return;
			}
			if($('#joinPwRe').val() == ""){
				$('.joinPwRe').text("비밀번호를 한번더 확인해주세요.");
				$('.joinPwRe').focus();
				return;
			}
			if($('#joinPw').val() != $('#joinPwRe').val()){
				$('.joinPwRe').text("비밀번호가 다릅니다.");
				$('.joinPwRe').focus();
				return;
			}
			if($('#joinPhone').val() == ""){
				$('.joinPhone').text("전화번호를 입력해주세요.");
				$('.joinPhone').focus();
				return;
			}
			
			$.ajax({
				'url':'/market/joincheck?id='+$('#joinId').val(),
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data) {
					var msg = (data);
					if(msg>0){
						alert("이미 존재하는 아이디입니다.");
					}else{
						$('#joinform').attr('method','post');
				        $('#joinform').attr('action','./join');
				        $('#joinform').submit();
					}
					
				}
			});
			
		});
	});
</script>
</head>
<body>
	<div class="contents">
	<form id="joinform">
		<div class="cont_top">
			<h2>회원가입</h2>
		</div>
		<div class="cont_mid">
			<div class="cont">
				<div class="form-group">
					<input type="text" name="id" id="joinId" class="form-control" placeholder="아이디를 입력해주세요."/>
					<span class="joinId"></span>
				</div>
				<div class="form-group">
					<input type="text" name="name" id="joinNic" class="form-control" placeholder="이름을 입력해주세요"/>
					<span class="joinNic"></span>
				</div>
				<div class="form-group">
					<input type="password" name="pw" id="joinPw" class="form-control" placeholder="비밀번호를 입력해주세요(8~20자)"/>
					<span class="joinPw"></span>
				</div>
				<div class="form-group">
					<input type="password" name="pwre" id="joinPwRe" class="form-control" placeholder="비밀번호를 한번더 확인해주세요(8~20자)"/>
					<span class="joinPwRe"></span>
				</div>
				<div class="form-group">
					<input type="text" name="phone" id="joinPhone" class="form-control" placeholder="휴대폰 번호를 ‘–’ 없이 입력해주세요" onkeypress="onlynum();"/>
					<span class="joinPhone"></span>
				</div>
			</div>
		</div>
		<div class="cont_low">
			<button type="button" class="btn btn-success" id="nextbtn">다음</button>
		</div>
	</form>	
	</div>
</body>
</html>