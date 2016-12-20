<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>GreenLight master</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	// Get the Sidenav
	var mySidenav = document.getElementById("mySidenav");

	// Get the DIV with overlay effect
	var overlayBg = document.getElementById("myOverlay");

	// Toggle between showing and hiding the sidenav, and add overlay effect
	function w3_open() {
		if (mySidenav.style.display === 'block') {
			mySidenav.style.display = 'none';
			overlayBg.style.display = "none";
		} else {
			mySidenav.style.display = 'block';
			overlayBg.style.display = "block";
		}
	}

	// Close the sidenav with the close button
	function w3_close() {
		mySidenav.style.display = "none";
		overlayBg.style.display = "none";
	}
</script>


<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.header {
	height: 6%;
}

.img {
	margin-top: -10px;
	margin-left: 10px;
	height: 50px;
	width: 50px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	//입력된 값에 따라 미리 선택되어 있도록 하기 위한 js
	var grade = $("#gradeP").text();
	if (grade == "") {
		$(".gradeSel").val("흙흙모쏠").attr("selected", "selected");
	} else {
		$(".gradeSel").val(grade).attr("selected", "selected");
	}
	$(document).on('click','.delBtn',function(){
		//삭제 승인
		var customid = $("#id").val();
		var cupid = $(this).attr("id");
		var r = window.confirm("쿠폰을 취소하시겠습니까?\n취소가 불가하오니, 한번 더확인 하신 뒤 버튼을 눌러주십시오.");
		    if (r == true) {
		        location.href="delete?customid="+customid+"&cupid="+cupid;
		    }
		    return false;
	});
});

//쿠폰 삭제


</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../template/container.jsp"%>
	<!-- 
		//add:그냥 입력으로 폼 보여주기
		//proid:값을 가진 입력 폼으로 수정가능하게 보여주기 
		//title : 입력 / 수정
		//ProductVo : bean
		-->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">
		<div class=" w3-container container">
			<%-- <h1>${title }페이지</h1> --%>
			<form action="${url }" enctype="multipart/form-data" method="post">


				<div class="form-group col-md-12">
					<label for="id" class="col-md-2 control-label">고객ID</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="바꿀수없듬!" value="${bean.id }" readonly="readonly">
					</div>
				</div>
				<div class="form-group col-md-12">
					<label for="pw" class="col-md-2 control-label">고객PW</label>
					<div class="col-md-10">
						<input type="password" class="form-control" id="pw" name="pw"
							placeholder="바꿀수없듬!" value="${bean.pw }" readonly="readonly">
					</div>
				</div>
				<div class="form-group col-md-12">
					<label for="name" class="col-md-2 control-label">고객이름</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="바꿀수있나?" value="${bean.name }">
					</div>
				</div>


				<div class="form-group col-md-12">
					<label for="phone" class="col-md-2 control-label">고객핸드폰번호</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="바꿀수있나?" value="0${bean.phone }">
					</div>
				</div>


				<div class="form-group col-md-12">
					<label for="cash" class="col-md-2 control-label">고객적립금</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="cash" name="cash"
							placeholder="고객누적금액(기준 : 원)" value="${bean.cash }">
					</div>
				</div>

				<div class="form-group col-md-12 ">
					<label for="tcash" class="col-md-2 control-label">고객누적금액</label>
					<div class="col-md-10">
						<input type="text" class="form-control" id="tcash" name="tcash"
							placeholder="고객적립금(기준 : 원)" value="${bean.tcash }">
					</div>
				</div>

				<div class="form-group col-md-12">
			<label for="grade" class="col-md-2 control-label">고객등급</label>
				<div class="col-md-4">
					<p hidden="hidden" id="gradeP">${bean.grade }</p>
					<%-- <input type="text" class="form-control" id="event" name="event"
						placeholder="마켓팅팀 제공 관련 이벤트 작성" value="${bean.event }"> --%>
					<select class="gradeSel form-control input-default" name="grade">
						<option value="흙흙모쏠">흙흙모쏠</option>
						<option value="프로썸러">프로썸러</option>
						<option value="파워러버">파워러버</option>
						<option value="카사노바">카사노바</option>
					</select>
				</div>
			</div>
			<div class="form-group col-md-12">	
			<label for="coupon" class="col-md-2 control-label">고객보유쿠폰</label>
				<div class="col-md-10">
					<table class="table table-hover">
						<tr>
							<!--  고객아이디, 고객비번, 고객이름, 고객핸드폰번호, 고객누적금액, 고객등급, 고객마일리지 -->
							<th>쿠폰ID</th>
							<th>쿠폰이름</th>
							<th>할인율</th>
							<th>고객이름</th>
							<th>&nbsp;</th>
						</tr>
						<c:forEach items="${list }" var="bean">
							<tr>
								<td>${bean.cupid }</td>
								<td>${bean.cupname }</td>
								<td>${bean.percent }</td>	
								<td>${bean.customid }</td>	
								<td><a class="btn delBtn btn-danger" id="${bean.cupid}" role="button">삭 제</a></td>
								
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>	
	
			<div class="form-group col-md-12">
				<button type="submit" class="btn btn-primary">${title}</button>
				<button type="reset" class="btn btn-default">취소</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>