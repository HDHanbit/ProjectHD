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
		<h1>FAQ 리스트</h1>
		<div class="row">
			<div class="col-md-12">
				<div class="panel-group" id="accordion">
					<c:forEach items="${vlist }" var="bean">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#${bean.vocid }"><strong>${bean.vocid} : </strong>${bean.voctitle }</a>
								</h4>
							</div>
							<div id="${bean.vocid }" class="panel-collapse collapse">
								<div class="panel-body">${bean.voccontent }</div>
								<div class="panel-body">
								<strong>Answer : </strong>${bean.answer }
								</div>
								<div class="panel-body">
								<a class="btn btn-success"
								href="detailFAQ?id=${bean.vocid }" role="button">수 정</a><a class="btn btn-danger"
									href="del?id=${bean.vocid }&field=FAQ" role="button">삭 제</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div>
					<p>
						<a class="btn btn-success addBtn" href="detailFAQ?id=add"
							role="button">입력</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>