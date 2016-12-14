<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {
		$(".cat").on("click", function() {
			var code = $(".catSel").val();
			$.ajax({
				"url" : "cat?code=" + code,
				"success" : function(data) {
					alert("code : " + code);
				}

			});
			return false;
		});

	});
</script>
<style type="text/css"></style>
</head>
<body>
	<!-- 
		//add:그냥 입력으로 폼 보여주기
		//proid:값을 가진 입력 폼으로 수정가능하게 보여주기 
		//title : 입력 / 수정
		//ProductVo : bean
		-->
	<form>
		<div class="form-group">
			<label for="thumb" class="col-sm-2 control-label">썸네일 이미지</label>
			<div class="col-sm-10">
				<input type="file" class="form-control" id="thumb" name="thumb"
					value="${bean.thumb }" />
				<!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기 -->
			</div>
		</div>
		<div class="form-group">
			<label for="proid" class="col-sm-2 control-label">상품ID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="proid" name="proid"
					placeholder="상품코드는 자동으로 작성됩니다." value="${bean.proid }"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="proname" class="col-sm-2 control-label">상품명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="proname"
					placeholder="상품명을 작성하십시오." value="${bean.proname }">
			</div>
		</div>
		<div class="form-group">
			<label for="proname" class="col-sm-2 control-label">카테고리</label>
			<div class="col-sm-9">
				<select class="catSel form-control input-sm">
					<c:forEach items="${catList }" var="cat">
						<option value="${cat.code }">${cat.name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn btn-success cat">선택</button>
			</div>
		</div>
		<div class="form-group">
			<label for="proname" class="col-sm-2 control-label">지역</label>
			<div class="col-sm-10 cat">
				<!-- js로 처리 예정 -->
				<input type="text" class="form-control" id="price"
					placeholder="상품 가격(기준 : &#92;)" value="js로처리예정">
			</div>
		</div>
		<div class="form-group">
			<label for="price" class="col-sm-2 control-label">가격</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="price"
					placeholder="상품 가격(기준 : &#92;)" value="${bean.price }">
			</div>
		</div>
		<div class="form-group">
			<label for="minp" class="col-sm-3 control-label">최소 인원</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minp" placeholder="최소인원"
					value="${bean.minp }">
			</div>
			<label for="maxp" class="col-sm-3 control-label">최대 인원</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maxp" placeholder="최대인원"
					value="${bean.maxp }">
			</div>
		</div>

		<div class="form-group">
			<label for="">파일 업로드</label> <input type="file" id="exampleInputFile">
			<p class="help-block">여기에 블록레벨 도움말 예제</p>
		</div>
		<div class="checkbox">
			<label> <input type="checkbox"> 입력을 기억합니다
			</label>
		</div>
		<button type="submit" class="btn btn-default">제출</button>
	</form>

</body>
</html>