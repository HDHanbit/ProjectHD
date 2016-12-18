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
	$(".searchBtn").on("click", function() {
		var target = $('.searchDiv');
		var id = $("#search").val();
		$.ajax({
			"url" : "searchUser",
			"data" : {
				'id' : id
			},
			'success' : function(data, textStatus, jqXHR) {
				target.html("");
				data = data.replace(/\+/gi, '%20');
				data = decodeURIComponent(data);
				target.append(data);
			},
			"error" : function(jqXHR, textStatus) {
				alert("통신실패 " + textStatus + "(code): " + jqXHR.status);
			},

		});
		return false;
	});
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
		<h1>쿠폰 입력 페이지</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="add" method="post">
					<!--쿠폰생성 폼-->
					<div class="form-group col-md-4">
						<label class="">쿠폰생성</label>
					</div>
					<div class="form-group col-md-8">
						<label for="cupid" class="col-md-4 control-label">쿠폰ID</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="cupid" name="cupid"
								placeholder="쿠폰코드는 자동으로 작성됩니다." readonly="readonly">
						</div>
					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
						<label for="cupname" class="col-md-4 control-label">쿠폰명</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="cupname"
								name="cupname" placeholder="해당 쿠폰명을 작성해 주십시오.">
						</div>
					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
						<label for="percent" class="col-md-4 control-label">적용률</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="percent"
								name="percent" placeholder="적용될 할인율 작성. 10%->0.10 형식으로 작성">

						</div>
					</div>
					<!--고객 리스트-->
				</form>
				<div class="form-group col-md-4">
					<label class="">받는 고객 설정</label>
				</div>
				<form action="searchUser" method="post">
					<div class="form-group col-md-8">
						<label for="search" class="col-md-4 control-label">고객 검색</label>
						<div class="col-md-8 form-group">
							<input type="text" class="form-control col-md-8" id="search"
								name="search" placeholder="아이디 검색">
							<button type="submit" class="btn btn-info form-control searchBtn">
								<span class="glyphicon glyphicon-search"></span> 검색
							</button>
						</div>
					</div>
				</form>
				<div class="col-md-12 searchDiv">검색결과 노출</div>
			</div>
		</div>
	</div>
</body>
</html>