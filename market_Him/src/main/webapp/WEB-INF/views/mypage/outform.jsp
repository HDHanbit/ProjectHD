<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#delbtn').click(function() {
			if($('#delPw').val() == ""){
				$('.delPw').text("비밀번호를 입력해주세요.");
				$('.delPw').focus();
				return;
			}
			$.ajax({
				'url':'./pwcheck?id=${id}',
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data) {
					var msg = (data);
					if(msg == $('#delPw').val()){
						if (confirm("회원탈퇴 하시겠습니까?")) {
							$('#delform').attr('method','post');
					        $('#delform').attr('action','./delete');
					        $('#delform').submit();
				        }else {
				            return false;
				        }
					}else{
						alert("비밀번호가 틀렸습니다.");
					}
				}
			});
		});	
		
	});
</script>
</head>
<body>
	<div class="content">
		<div class="row marketing">
			<div class="col-lg-2">
				<jsp:include page="pageside.jsp"/>
			</div>
			<div class="col-lg-10">
				<div class="cnt_mid">
				<form id="delform">
					<h3>회원탈퇴</h3>
					<input type="password" name="delPw" id="delPw" class="form-control" placeholder="비밀번호를 입력해주세요"/>
					<span class="delPw"></span><br/>
					<button type="button" class="btn btn-success" id="delbtn">확인</button>
				</form>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>