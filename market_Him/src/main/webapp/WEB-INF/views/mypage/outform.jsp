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
<link href="/market/css/offcanvas.css" rel="stylesheet">
<style type="text/css">
	.container{
		overflow: hidden;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script src="/market/js/offcanvas.js"></script>
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
					        $('#delform').attr('action','/market/delete');
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
		
		var side = $('#sidebar').height();
		var cont = $('.container').height(); 
		if(cont<side){
			$('.container').height(side);
		}else{
			$('#sidebar').height(cont);
		}
		
	});
</script>
</head>
<body>
	<div class = "header" >
		<%@ include file = "../../header/header.jsp" %>
	</div>
	<div class="container">
		<div class="row marketing row-offcanvas row-offcanvas-right">
				<jsp:include page="pageside.jsp"/>
			<div class="col-xs-12 col-sm-10">
				<p class="pull-right visible-xs">
					<button type="button" id="side_btn" class="btn btn-primary btn-xs" data-toggle="offcanvas">
						<span class="glyphicon glyphicon-list" aria-hidden="true"/>
					</button>
				</p>
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
	<div class="footer">
		<jsp:include page="../../footer/footer.jsp"/>
	</div>
</body>
</html>