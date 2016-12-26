<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$('#person').hide();
    		$('#start').change(function() {
    			var start = $('#start').val().split("&");
    			$.ajax({
    				 type:"GET",
    				 url:"../ticket/",
    				 dataType:"JSON",
    				 data:{
    					 "maxp":'${buypro.maxp  }',
    					 "proid":'${buypro.proid }',
    					 "startday":start[0],
    					 "air":start[1]
    				 },
    				 'error':function(jqXHR,textStatus,errorThrown){
    					 alert("통신실패"+textStatus+"(code:)"+jqXHR.status+
    							 "(errorThrown):"+errorThrown);
    				 },
    				 'success':function(data){
    					 var msg=(data);
    					$('#tot').text(msg);
    				 }
    				 
    			});
    			$('#person').show();
			});
    		$(document).ready(function(){
    			$('#payment').click(function() {
    				var tot = $('#tot').text();
    				tot*=1;
    				if(tot>=$('#num').val()){
    				window.location.replace("./complete/")
    				}else{
    					alert("당일 여행 가능인원이 초과하였습니다.");
    					return false;
    				}
    			});
    		});
    		
			$('#num').focusout(function() {
				$('#sp_num').text($('#num').val());
				total();
			});
		});
    	
    	function total() {
    		var dis = '${buypro.price }'-('${buypro.price }'*'${buypro.discount }');
    		var pop = dis*$('#num').val();
    		var tot = pop-(pop*($('#coupon').val()/100));
    		$('#total').text(tot);
		}
    		
    		
    	
    </script>
</head>
<body>
<table>
<tr><td>아이디=${id }</td></tr>
</table>

<br/>
<table>
<tr><td>상품아이디=${buypro.proid }</td></tr>
<tr><td>상품명=${buypro.proname }</td></tr>
<tr><td>가격=${buypro.price }</td></tr>
<tr><td>기간=${buypro.peris  }</td></tr>
<tr><td>상품이미지=<img src="../file/${buypro.thumb }"> </td></tr>
<tr><td>할인율=${buypro.discount }</td></tr>
<tr><td>설명=${buypro.exp  }</td></tr>
<tr><td>총티켓=${buypro.maxp  }</td></tr>
</table>

<br/>
<table>

<tr>
	<td>
	출발일
	<select id="start">
		<c:forEach items="${buypro2 }" var="buypro2">
		<option value="${buypro2.startday }&${buypro2.trans }">
		${buypro2.startday },  
		항공편=${buypro2.trans }
		</option>
		</c:forEach>
	</select>
	<div id="person">신청가능 인원:<span id="tot"></span></div>	
	</td>
</tr>
<tr>
	<td>여행 인원수 <input type="text" id="num">명 </td>
</tr>
<tr>
	<td>보유 쿠폰
		<select id="coupon">
		<c:forEach items="${coupon }" var="coup">
			<option value="${coup.percent }">
				${coup.cupname }, ${coup.percent }%
			</option>
		</c:forEach>
		</select>
	</td>
</tr>
<tr>
<td>
	결재 금액 = ${buypro.price }-(${buypro.price }*${buypro.discount })*<span id="sp_num"></span>
	=<span id="total"></span>
</td>
</tr>
<tr>
	<td><input id="payment" type="button" value="결재하기"></td>
</tr>
</table>


</body>
</html>