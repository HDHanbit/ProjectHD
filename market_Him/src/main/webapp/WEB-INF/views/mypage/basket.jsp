<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	function cancel(data) {
		var basketid = data;
		if (confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")) {
			window.location.href = "/market/bkcnl?idx="+basketid;
        }else {
            return false;
        }
		
	}

	$(document).ready(function() {
		var delurl = window.location.search.substring(1);
		var array = delurl.split('=');
		var cnt = array[1]-1;
		$('.pagecnt').eq(cnt).attr('class','active');
		
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
				<h3>장바구니</h3>
				<div class="basket_list">
					<table class="table table-bordered">
						<tr>
							<td>등록일</td>
							<td colspan="2">주문 상세 정보</td>
							<td>상품금액</td>
							<td>주문</td>
						</tr>
					<c:if test="${bklist.size() != 0}">
						<c:forEach items="${bklist }" var="bean">
						<tr>
							<td>${bean.payd }</td>
							<td>${bean.thumb }</td>
							<td>${bean.proname }</td>
							<td>${bean.price }</td>
							<td>
								<button type="button" class="btn btn-primary">상세보기</button>
								<button type="button" class="btn btn-primary">주문하기</button>
								<button type="button" class="btn btn-primary" onclick="cancel('${bean.basketid }');">삭제하기</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${bklist.size() == 0}">
						<tr>
							<td colspan="5">장바구니가 비었습니다.</td>
						</tr>
					</c:if>		
					</table>
					<nav>
					  <ul class="pagination">
					    <li>
					      <a href="/market/basket?idx=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="i" begin="1" end="${pTot }" step="1">
						    <li class="pagecnt"><a href="/market/basket?idx=${i }">${i }</a></li>
					    </c:forEach>
					    <li>
					      <a href="/market/basket?idx=${pTot }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
	</div>
</body>
</html>