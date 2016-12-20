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
	$(document).ready(function() {
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
		$(document).on('click', '.useridBtn', function() {
			var id = $(this).attr("id");
			$("#customid").attr("value", id);
		});

	});
</script>
<style type="text/css">
@import
	url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
	;
</style>
</head>
<body class="w3-light-grey">
<%@ include file="../template/container.jsp" %>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <div class="w3-container container">		<!-- 	<div class="row">
			<div class="col-fm-12">
				<ol class="breadcrumb">
					<li><a href="/sts04/">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
		</div> -->
		<%-- <h1>FAQ ${title } 페이지</h1> --%>
		<div class="row">
			<div class="col-md-12">
				<form action="${url }" method="post">
					<!--쿠폰생성 폼-->
					<div class="form-group col-md-4">
						<label class="control-label">FAQ ${title }</label>
					</div>
					<div class="form-group col-md-8">
						<input type="text" hidden="hidden" value="${bean.vocid }" id="vocid" name="vocid"/>
						<input
							type="text" class="form-control" id="voctitle" name="voctitle"
							value="${bean.voctitle }"  placeholder="FAQ 내용 작성">

					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
							<textarea rows="10" class="form-control" id="voccontent"
								name="voccontent" placeholder="해당 질문을 작성해주십시오." >${bean.voccontent }</textarea>
					</div>
					<div class="form-group col-md-4">
						<label class="">&nbsp;</label>
					</div>
					<div class="form-group col-md-8">
							<textarea class="form-control" rows="10" id="answer"
								name="answer" placeholder="해당 질문에 대한 답을 작성해주십시오.">${bean.answer }</textarea>
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