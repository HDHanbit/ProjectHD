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
<style type="text/css">
@import
	url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
	;
</style>
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
		<h1>${field} ${title} 페이지</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="update${field }" method="post">
					<!--쿠폰생성 폼-->
					<div class="form-group col-md-4">
						<label class="control-label">문의 내용</label>
					</div>
					<div class="form-group col-md-8">
						<label for="vocid" class="control-label">VoC ID</label>
						<input
							type="text" class="form-control" id="vocid" name="vocid"
							value="${bean.vocid }" readonly="readonly">
					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
						<label for="customid" class="control-label">고객 ID</label>
						<input
							type="text" class="form-control" id="customid" name="customid"
							value="${bean.customid }" readonly="readonly">
					</div>
					<c:if test="${bean.proid ne null }">
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
						<label for="proid" class="control-label">상품 ID</label>
						<input
							type="text" class="form-control" id="proid" name="proid"
							value="${bean.proid }" readonly="readonly">
					</div>
					</c:if>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
						<label for="voctitle" class="control-label">문의 제목</label>
						<input
							type="text" class="form-control" id="voctitle" name="voctitle"
							value="${bean.voctitle }" readonly="readonly">
					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
					<label for="voccontent" class="control-label">문의 내용</label>
							<textarea class="form-control" rows="10" id="voccontent"
								name="voccontent" >${bean.voccontent }</textarea>
					</div>
					<div class="form-group col-md-4">
						<label class="">답글 달기</label>
					</div>
					<div class="form-group col-md-8">
					<label for="answer" class="control-label">답글 내용</label>
							<textarea class="form-control" rows="10" id="answer"
								name="answer" >${bean.answer }</textarea>
					</div>
					<div class="form-group col-md-12">
						<p class="col-md-2">&nbsp;</p>
						<button type="submit" class="btn btn-primary col-md-4">입력</button>
						<button type="reset" class="btn btn-default col-md-4">취소</button>
						<p class="col-md-2">&nbsp;</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>