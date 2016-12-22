<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var id='${id }';
		if(id==""){
			alert("접속이 종료되었습니다.");
			window.location.replace("./logform");
			return false;
		}else{
			$.ajax({
				'url':'./cashcheck?id='+id,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data) {
					var msg = (data);
					$('.mile').text(msg);
					
				}
			}); // cashcheck end
			
			$.ajax({
				'url':'./copcheck?id='+id,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data) {
					var msg = (data);
					$('.coupon').text(msg);
					
				}
			}); // copcheck end
			
		} //if end
	});
</script>
</head>
<body>
    <div class="container">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#">About</a></li>
            <li role="presentation"><a href="#">Contact</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">GreenLight</h3>
      </div>

      <div class="jumbotron">
      <div class="row marketing">
      	<div class="col-lg-9">
        <h1>${name }님의 마이페이지</h1>
        </div>
        <div class="col-lg-3">
          <p>적립금 <span class="mile">0</span>Point</p><br/>
          <p>보유쿠폰 <span class="coupon">0</span>개</p>
        </div>
      </div>
        
      </div>

      <div class="row marketing">
        <div class="col-lg-3">
          <a href="./julist?idx=1">주문내역</a>
        </div>
        <div class="col-lg-3">
          <a href="./wishlist?idx=1">위시리스트</a>
        </div>
        <div class="col-lg-3">
          <a href="./basket?idx=1">장바구니</a>
        </div>
        <div class="col-lg-3">
          <a href="./cnllist?idx=1">결제취소내역</a>
        </div>
        <div class="col-lg-3">
          <a href="./editform">개인정보수정</a>
        </div>
        <div class="col-lg-3">
          <a href="./coplist?idx=1">쿠폰함</a>
        </div>
        <div class="col-lg-3">
          <a href="#">1:1문의내역</a>
        </div>
        <div class="col-lg-3">
          <a href="#">고객센터</a>
        </div>
      </div>

      <footer class="footer">
      </footer>

    </div> <!-- /container -->
</body>
</html>