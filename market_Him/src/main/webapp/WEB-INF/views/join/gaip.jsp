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
<style type="text/css">
	.agreebox .inner {
		width:360px;
		height:80px;
		overflow-y:scroll;
		padding:10px; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#allYN').click(function () {
	        if( $("#allYN").is(':checked') == true){
	            $('input[type="checkbox"]').prop('checked', true);
	        }else{
	            $('input[type="checkbox"]').prop('checked', false);
	        }
	    });
		$('#nextbtn').click(function() {
			if ($("#serviceYN").is(':checked') != true) {
	            alert("서비스이용 약관 동의가 필요합니다.");
	            $("#serviceYN").focus();
	            return;
	        }
	        if ($("#privacyYN").is(':checked') != true) {
	            alert("개인정보 수집/이용 약관 동의가 필요합니다.");
	            $("#privacyYN").focus();
	            return;
	        }
	        
	        $('#bfjoin').attr('method','post');
	        $('#bfjoin').attr('action','/market/joinform');
	        $('#bfjoin').submit();
		});
	});
</script>


</head>
<body>
	<div class="contents">
	<form id="bfjoin">
		<div class="cont_top">
			<h2><span>이용 약관 동의</span></h2>
		</div>
		<div class="cont_mid">
			<div class="cont">
				<h3>서비스이용 약관 동의(필수)</h3>
				<div class="agreebox">
					<div class="inner" id="service">aaaaa</div>
				</div>
				<input type="checkbox" name="serviceYN" id="serviceYN">
				<label for="serviceYN">약관에 동의합니다.</label>
				
				<h3>개인정보 수집/이용 약관 동의(필수)</h3>
				<div class="agreebox">
					<div class="inner" id="privacy">aaaaa</div>
				</div>
				<input type="checkbox" name="privacyYN" id="privacyYN">
				<label for="privacyYN">약관에 동의합니다.</label>
			</div>
		</div>
		<div class="cont_low">
			<div>
				<input type="checkbox" name="allYN" id="allYN">
				<label for="allYN">전체 동의</label>
			</div>
			<button type="button" class="btn btn-success" id="nextbtn"><span>다음</span></button>
		</div>
	</form>	
	</div>
</body>
</html>