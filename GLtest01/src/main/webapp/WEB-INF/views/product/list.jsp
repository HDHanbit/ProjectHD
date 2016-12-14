<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/master/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/master/js/bootstrap.min.js"></script>
<style type="text/css"></style>
</head>
<body>
	<div class="container">
		<!-- 	<div class="row">
			<div class="col-fm-12">
				<ol class="breadcrumb">
					<li><a href="/sts04/">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
		</div> -->
		<h1>상품 리스트 페이지-헤더 푸터 메뉴 적용 예정</h1>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>지역</th>
						<th>가격</th>
						<th>할인율</th>
						<th>별점</th>
						<th>우선순위</th>
						<th>이벤트 항목</th>
						<th>&nbsp;</th>
					</tr>

					<c:forEach items="${plist }" var="bean">

						<tr>
							<td>${bean.proid }</td>
							<td>${bean.proname }</td>
							<td>${bean.cat }</td>
							<td>${bean.loc }</td>
							<td><fmt:formatNumber value="${bean.price }" type="currency"
									currencySymbol="￦" /></td>
							<td><fmt:formatNumber value="${bean.discount }"
									type="percent" /></td>
							<td><fmt:formatNumber value="${bean.point }" pattern=".00" /></td>
							<td>${bean.prio }</td>
							<!-- 핫딜 : 1 / 마감임박 : 2 /신규상품 : 3 /매진임박:인원수가 최대-4일 경우 -->
							<c:if test="${bean.event eq(1) }">
								<td>핫딜</td>
							</c:if>
							<c:if test="${bean.event eq(2) }">
								<td>마감임박</td>
							</c:if>
							<c:if test="${bean.event eq(3) }">
								<td>신규상품</td>
							</c:if>
							<c:if test="${bean.event eq(4) }">
								<td>매진임박</td>
							</c:if>
							<td><a class="btn btn-success"
								href="detail?id=${bean.proid }" role="button">수 정</a> <a
								class="btn btn-danger" href="del?id=${bean.proid }"
								role="button">삭 제</a></td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div>
				<p>
					<a class="btn btn-success" href="detail?id=add" role="button">입력</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>