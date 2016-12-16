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
	//상품 최대 인원수, 주문된 인원수 ajax
	$(document).on("click", ".proBtn", function() {
		var proid = $(this).text();
		var target = $(".proDiv");
		$.ajax({
			"url" : "selpo",
			"data" : {
				'proid' : proid
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
	//상품 최대 인원수, 주문된 인원수 ajax
	
	//주문 취소
	$(document).on('click','.delBtn',function(){
		//취소 승인
		var id = $(this).attr("id");
		var userid = $("."+id).eq(0).text();
		var price = $("."+id).eq(1).text();
		    var r = window.confirm("주문을 취소하시겠습니까?\n구매자로부터 취소 승인이 되거나\n유선상으로 취소 요청이 들어 온 경우에만 확인 버튼을 눌러주십시오.");
		    if (r == true) {
		        location.href="del?id="+id+"&userid="+userid+"&price="+price;
		    }
		    return false;
	});

	//인원 수 수정 + 결제일 sysdate 처리 ajax upBtn
	$(document).on('click','.upBtn',function(){
		//인원 수 수정 승인
		var id = $(this).attr("id");
		var userid = $("."+id).eq(0).text();
		var gop = $("#"+id+"go").val();
		    var r = window.confirm("인원수를 조정하시겠습니까?\n추가 금액 결제 후 인원 수 조정이 가능합니다.\n추가 금액이 결제 완료 되었는지를 확인 후 승인하시길 바랍니다.");
		    	//alert(url+" href : "+"./insertagreed?"+url);
		    if (r == true) {
		        location.href="update?id="+id+"userid="+userid+"gop="+gop ;
		    }
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
		<h1>주문 전체 리스트 페이지</h1>
		<div class="row">
			<div class="col-md-12">
			<div class="proDiv">
					<!-- 주문의 최대인원,주문된 인원 보여줄 예정 -->
				</div>
				<table class="table table-hover">
					<tr>
						<th rowspan="2">주문ID</th>
						<th>상품코드</th>
						<th>주문자</th>
						<th>결제일</th>
					</tr>
					<tr>
						<th>인원</th>
						<th>결제 금액</th>
						<th>삭제</th>
					</tr>
					<c:if test="${empty olist}">
						<td colspan="6">주문목록이 없습니다.</td>
					</c:if>
					<c:if test="${!empty olist}">
						<c:forEach items="${olist }" var="bean">
							<tr>
								<td rowspan="2">${bean.orderid}</a></td>
								<td><button class="proBtn btn btn-info" type="button"
										id="${bean.proid}">${bean.proid}</button></td>
								<td class="${bean.orderid}">${bean.customid}</td>
								<td><c:if test="${bean.payd ne null}">
							${bean.payd }
							</c:if> <c:if test="${bean.payd eq null}">
							결제 전
							</c:if></td>
							</tr>
							<tr>
								<td><div class="col-md-6">
										<input type="text" id="${bean.orderid}go" name="goperson"
											value="${bean.goperson }" class="form-control">
									</div></td>
								<td class="${bean.orderid}">${bean.paycash }</td>
								<td><button class="btn upBtn btn-success"
								type="button" id="${bean.orderid }">수 정</button> <button
								class="btn delBtn btn-danger" 
								type="button" id="${bean.orderid }">주문 취소</button></td>
							</tr>
							<tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>