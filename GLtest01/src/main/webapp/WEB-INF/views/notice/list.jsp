<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>GreenLight master</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    .header{
        height:6%;
    }
    .img {
          margin-top:-10px;
          margin-left:10px;
          height:50px;
          width:50px;
     }
    
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".addDiv").hide();
						$(function() {
							$(document).on('change', "#notF", function() {
								readURLIM(this);
							});
						});

						function readURLIM(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();

								reader.onload = function(e) {
									$('#popIMG').attr('src', e.target.result);
								}
								reader.readAsDataURL(input.files[0]);
							}
						}//file 이미지 미리보기 detail img
						$(".imgBtn")
								.on(
										"click",
										function() {
											var target = $('.imgDiv');
											target
													.html("<input type=\"file\" class=\"form-control\" id=\"notF\" name=\"notF\"/> ");
											$(".imgBtn").hide();
											return false;
										});
						$(document).on("click", ".addBtn", function() {
							var target = $('.addDiv');
							$(".addDiv").show();
							$(".addBtn").hide();
							return false;
						});
						$(".reset").on("click",function(){
							$(".addDiv").hide();
							$(".addBtn").show();
						});
					});
</script>
<style type="text/css"></style>
</head>
<body class="w3-light-grey">
<%@ include file="../template/container.jsp" %>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <div class="w3-container container">
		<!-- 	<div class="row">
			<div class="col-fm-12">
				<ol class="breadcrumb">
					<li><a href="/sts04/">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
		</div> -->
		<!-- <h1>공지사항, 팝업 리스트</h1> -->
		<div class="row">
			<div class="col-md-12">
				<div>
					<p>
						<a class="btn btn-success addBtn" href="detail?id=add"
							role="button">입력</a>
					</p>
					<form action="insert" method="post">
						<div class="addDiv form-group col-md-12">
							<table class="table table-hover">
								<tr>
									<th>ID</th>
									<td><input type="text" class="form-control" id="notid"
										name="notid" value="notice${cnt }" readonly="readonly"></td>
									<th>제목</th>
									<td><input type="text" class="form-control" id="notitle"
										name="notitle" placeholder="공지사항제목"></td>
									<th>등록일</th>
									<td></td>
								</tr>

								<tr>
									<th>내용</th>
									<td colspan="5"><textarea class="form-control" rows="5"
											id="notcontent" name="notcontent"></textarea></td>
								</tr>
							</table>
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-default reset">취소</button>
						</div>
					</form>
				</div>
				<c:forEach items="${nlist }" var="bean">
					<form action="update" enctype="multipart/form-data" method="post">
						<table class="table table-hover">
							<tr>
								<th>ID</th>
								<td><input type="text" hidden="hidden" name="notid"
									value="${bean.notid }">${bean.notid }</td>
								<th>제목</th>
								<td><input type="text" class="form-control" id="notitle"
									name="notitle" value="${bean.notitle }"></td>
								<th>등록일</th>
								<td>${bean.notday }</td>
							</tr>
							<tr>
								<th>내용</th>
								<c:if test="${bean.notcontent ne null }">
									<td colspan="5"><textarea class="form-control" rows="5"
											id="notcontent" name="notcontent">${bean.notcontent }</textarea>
									</td>
								</c:if>
								<c:if test="${bean.notcontent eq null }">
									<td colspan="5"><img alt="팝업 이미지" id="popIMG"
										src="${pageContext.request.contextPath}/file/${bean.notfile }"
										class="img-thumbnail">
										<div class="imgDiv">
											<button type="button" class="btn btn-success imgBtn">팝업
												이미지 수정</button>
											<input hidden="hidden" name="notfile"
												value="${bean.notfile }">
										</div></td>
								</c:if>
							</tr>
							<tr>
								<td colspan="6"><button class="btn btn-success"
										type="submit">수 정</button> <a class="btn btn-danger"
									href="del?id=${bean.notid }" role="button">삭 제</a></td>
							</tr>
						</table>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>