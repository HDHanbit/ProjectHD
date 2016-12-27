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
<link href="/market/css/offcanvas.css" rel="stylesheet">
<link href="/market/fonts/**" rel="stylesheet">
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
		var delurl = window.location.search.substring(1);
		var array = delurl.split('=');
		var cnt = array[1]-1;
		$('.pagecnt').eq(cnt).attr('class','active');
		
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
				<h3>쿠폰함</h3>
				<div class="coupon_list">
						<div class="col-md-4 col-xs-4">쿠폰명</div>
						<div class="col-md-4 col-xs-4">할인율</div>
						<div class="col-md-4 col-xs-4">기  간</div>
					<c:if test="${coplist.size() != 0}">
						<c:forEach items="${coplist }" var="bean">
							<div class="col-md-4 col-xs-4">${bean.cupname }</div>
							<div class="col-md-4 col-xs-4">${bean.percent }</div>
							<div class="col-md-4 col-xs-4">${bean.cupperi }</div>
						</c:forEach>
					</c:if>
					<c:if test="${coplist.size() == 0}">
							<div class="col-md-12 col-xs-12">보유하신 쿠폰이 없습니다.</div>
					</c:if>		
					<nav>
					  <ul class="pagination">
					    <li>
					      <a href="/market/coplist?idx=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="i" begin="1" end="${pTot }" step="1">
						    <li class="pagecnt"><a href="/market/coplist?idx=${i }">${i }</a></li>
					    </c:forEach>
					    <li>
					      <a href="/market/coplist?idx=${pTot }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../../footer/footer.jsp"/>
	</div>
</body>
</html>