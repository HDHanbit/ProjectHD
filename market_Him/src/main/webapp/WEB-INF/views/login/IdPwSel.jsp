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
	.cont_mid>div{
		display: inline-block;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#newPwIn').click(function() {
			if($('#newPw').val()==""){
				$('.newPw').text("비밀번호를 입력해주세요.");
				$('.newPw').focus();
				return;
			}
			
			if($('#newPwRe').val()==""){
				$('.newPwRe').text("비밀번호를 다시 입력해주세요.");
				$('.newPwRe').focus();
				return;
			}
			
			if($('#newPw').val()!=$('#newPwRe').val()){
				$('.newPwRe').text("비밀번호가 서로 다릅니다.");
				$('.newPwRe').focus();
				return;
			}
			var id=$('#hidId').val();
			var pw=$('#newPw').val();
// 			alert("id:"+id+", pw:"+pw);
			window.location.replace("/market/newpw?id="+id+"&pw="+pw);
		});
		
		$('#newIdch').click(function() {
			window.location.replace("/market/logform");
		});
		
		$('#idbtn').click(function() {
			
			$('span').text("");
			
			if($('#selIdName').val()==""){
				$('.selIdName').text("이름을 입력해주세요.");
				$('.selIdName').focus();
				return;
			}
			
			if($('#selIdPhone').val()==""){
				$('.selIdPhone').text("전화번호를 입력해주세요.");
				$('.selIdPhone').focus();
				return;
			}
			$.ajax({
				'url':'./selid?name='+$('#selIdName').val()+'&phone='+$('#selIdPhone').val(),
				'error' : function(jqXHR, textStatus, errorThrown) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status+"(errorThrown):"+errorThrown);},
				'success' : function(data) {
					var msg = (data);
					if(msg != "" && msg != null){
						$('.modal_text').text($('#selIdName').val()+"님의 아이디는 : "+msg+"입니다.");
						$('#myModal').modal();
					}else{
						$('.modal_text').text("없는회원정보입니다.");
					}
				}
			});
		});
		
		$('#pwbtn').click(function() {
			
			$('span').text("");

			if($('#selPwId').val()==""){
				$('.selPwId').text("아이디를 입력해주세요.");
				$('.selPwId').focus();
				return;
			}
			
			if($('#selPwPhone').val()==""){
				$('.selPwPhone').text("전화번호를 입력해주세요.");
				$('.selPwPhone').focus();
				return;
			}
			
			$.ajax({
				'url':'/market/selpw?id='+$('#selPwId').val()+'&phone='+$('#selPwPhone').val(),
				'error' : function(jqXHR, textStatus, errorThrown) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status+"(errorThrown):"+errorThrown);},
				'success' : function(data) {
					var msg = (data);
					if(msg != "" && msg != null){
						$('.newPw_text').text("아이디:"+msg);
						$('#hidId').attr('value',msg);
						$('#newPwModal').modal();
					}else{
						alert("없는회원정보입니다.");
					}
				}
			});
		});
		
	});
</script>
</head>
<body>
	<div class="contents">
		<div class="cont_top">
			<h3>ID/PW찾기</h3>
		</div>
		<div class="cont_mid">
			<div class="selId">
				<h4>아이디찾기</h4>
				<div class="form-group">
					<input type="text" name="selIdName" id="selIdName" class="form-control" placeholder="이름을 입력해주세요."/>
					<span class="selIdName"></span>
				</div>
				<div class="form-group">
					<input type="text" name="selIdPhone" id="selIdPhone" class="form-control" placeholder="전화번호를 입력해주세요."/>
					<span class="selIdPhone"></span>
				</div>
				<div class="btn">
					<button type="button" class="btn btn-success" id="idbtn">아이디찾기</button>
				</div>
			</div>
			<div class="selPw">
				<h4>패스워드찾기</h4>
				<div class="form-group">
					<input type="text" name="selPwId" id="selPwId" class="form-control" placeholder="아이디를 입력해주세요."/>
					<span class="selPwId"></span>
				</div>
				<div class="form-group">
					<input type="text" name="selPwPhone" id="selPwPhone" class="form-control" placeholder="전화번호를 입력해주세요."/>
					<span class="selPwPhone"></span>
				</div>
				<div class="btn">
					<button type="button" class="btn btn-success" id="pwbtn">비밀번호찾기</button>
				</div>
			</div>
		</div>
		<div class="cont_low">
			<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">아이디 확인</h4>
					</div>
				<div class="modal-body">
					<p class="modal_text"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" id="newIdch" class="btn btn-primary logback">확인</button>
				</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			<div id="newPwModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">새로운 비밀번호</h4>
					</div>
				<div class="modal-body">
					<p class="newPw_text"></p>
					<input type="hidden" id="hidId"/>
					<div class="form-group">
						<input type="password" name="newPw" id="newPw" class="form-control" placeholder="새로운 비밀번호를 입력해주세요(8~20자)"/>
						<span class="newPw"></span>
					</div>
					<div class="form-group">
						<input type="password" name="newPwRe" id="newPwRe" class="form-control" placeholder="비밀번호를 한번더 확인해주세요(8~20자)"/>
						<span class="newPwRe"></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" id="newPwIn" class="btn btn-primary">확인</button>
				</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>