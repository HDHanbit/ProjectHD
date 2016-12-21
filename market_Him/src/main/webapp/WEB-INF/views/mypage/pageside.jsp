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
<style type="text/css">
	.cont_side{
		height: 500px;
		border: 1px solid;
	}
	.menu_head{
		background-color: gray;
		border-top: 1px solid;
		border-bottom: 1px solid;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	var id='${id }';
	if(id==""){
		alert("접속이 종료되었습니다.");
		window.location.replace("./logform");
	}else{
		$.ajax({
			'url':'./cashcheck?id='+id,
			'error' : function(jqXHR, textStatus) {
				alert("마일리지를 불러오지 못하였습니다.");
// 				alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);
				},
			'success' : function(data) {
				var msg = (data);
				$('.mile').text(msg);
			}
		});
		
		$.ajax({
			'url':'./copcheck?id='+id,
			'error' : function(jqXHR, textStatus) {
				alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
			'success' : function(data) {
				var msg = (data);
				$('.coupon').text(msg);
				
			}
		}); // copcheck end
	}
	
</script>
</head>
<body>
	<div class="cont_side">
		<div class="side_head">
			<p>${name }님의 마이페이지</p>
			<p>적립금<span class="mile">0</span>Point</p>
			<p>보유쿠폰<span class="coupon">0</span>개</p>
		</div>
		<div class="side_menu">
			<div class="menu_head">상품관련정보</div>
			<div class="menu_cont">
				<a href="./julist?idx=1">상품주문내역</a>
			</div>
			<div class="menu_cont">
				<a href="#">위시리스트</a>
			</div>
			<div class="menu_cont">
				<a href="./basket?idx=1">장바구니</a>
			</div>
			<div class="menu_cont">
				<a href="./coplist?idx=1">쿠폰함</a>
			</div>
			<div class="menu_cont">
				<a href="./cnllist?idx=1">결제취소내역</a>
			</div>
			<div class="menu_head">회원관련정보</div>
			<div class="menu_cont">
				<a href="./editform">개인정보수정</a>
			</div>
			<div class="menu_cont">
				<a href="./outform">회원탈퇴</a>
			</div>
			<div class="menu_head">고객센터</div>
		</div>
	</div>
</body>
</html>