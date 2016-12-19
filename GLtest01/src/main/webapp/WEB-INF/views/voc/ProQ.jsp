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
<script type="text/javascript">
	
</script>
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
		<h1>ProQ 리스트</h1>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-condensed">
					<c:forEach items="${vlist }" var="bean">
						<tr>
							<th rowspan="2">${bean.vocid }</th>
							<th>고객 Id</th>
							<td colspan="2">${bean.customid }</td>
							<th>삭제</th>
							<td><a class="btn btn-default" href="del?id=${bean.vocid }&field=OneQ" role="button">삭제</a></td>
						</tr>
						<tr>
							<th>문의 제목</th>
							<td colspan="2">${bean.voctitle }</td>
							<th>답글 여부</th>
							<c:if test="${bean.answer ne null }">
								<td>
									<a class="btn btn-info" href="detail?id=${bean.vocid }&field=ProQ" role="button">수정</a>
								</td>
							</c:if>
							<c:if test="${bean.answer eq null }">
								<td>
									<a class="btn btn-success" href="detail?id=${bean.vocid }&field=ProQ" role="button">입력</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>