<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
    		var dis = '${buypro.price }'-('${buypro.price }'*'${buypro.discount }');
    		var mile=0;
    
    	$(document).ready(function() {
    		
    		$('.dis').html(('${buypro.price }'*'${buypro.discount }')+"원");
    		
    		
    		var ticket = '${ticket}';
			var orderticket = '${orderticket}';
    		$('#tot').val(tot).attr("selected");
    		$('#start').val(ticket).attr("selected");
    		$('#start').change(function() {
    			$("#ticket").hide();
    			var start = $('#start').val().split("&");
    			$.ajax({
    				 type:"GET",
    				 url:"/market/notice/ticket/",
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
    					$('#tot').text("");
    					$('#tot').text(msg);
    				 }
    				 
    			});
    			$('#person').show();
    			});
    		
    			$('#payment').click(function() {
    				
    				mile = '${mile }'*1;
    				var usemile = $('#mile').val();
    				if(mile<usemile){
    					alert("보유마일리지보다큽니다.");
    					return;
    				}
    				
    				var id='${id }';
    		    	var proid='${buypro.proid }';
    		    	var id2=id.substring(0, 2);
    		    	var proid2=proid.substring(0, 2);
    		    	var oderid=id2+"_"+proid2+"_"; 
    		    	var start = $('#start').val().split("&");
    		    	var startday1 = start[0];
    		    	var trans = start[1];
    		    	var num = $('#num').val();
    				var tot = $('#total').text();
    				mile = ('${mile }'*1)-$('#mile').val();
    				var coup=$('#coupon').val().split("&");
    				
    				tot*=1;
    					alert("확인");
    				if(tot>=$('#num').val()){
    					$('#return').val("http://localhost:8080/market/notice/buy/complete?total="+tot+"&num="+num+"&start="+startday1+"&air="+trans+"&proid="+proid+"&oderid="+oderid+"&userid="+id+"&mile="+mile+"&coup="+coup[1]);
    					$('#notify_url').val("http://localhost:8080/market/notice/buy/complete?total="+tot+"&num="+num+"&start="+startday1+"&air="+trans+"&proid="+proid+"&oderid="+oderid+"&userid="+id+"&mile="+mile+"&coup="+coup[1]);
    					$('#cancel_return').val("http://localhost:8080/market/notice/buy/complete?total="+tot+"&num="+num+"&start="+startday1+"&air="+trans+"&proid="+proid+"&oderid="+oderid+"&userid="+id+"&mile="+mile+"&coup="+coup[1]);
    					$('#buypage').attr('method','post');
				        $('#buypage').attr('action','https://www.sandbox.paypal.com/cgi-bin/webscr');
				        $('#buypage').submit();
    				}else{
    					alert("당일 여행 가능인원이 초과하였습니다.");
    					return false;
    				}
    			});
    			
    			$('#coupon').change(function() {
    	    		total();
    	    	});
    			
    			$('#use').click(function() {
    				mile = '${mile }'*1;
    				var usemile = $('#mile').val();
    				if(mile<usemile){
    					alert("보유마일리지보다큽니다.");
    				}else{
    					total();
    					return false;
    				}
    				
    			});
    			
			$('#num').focusout(function() {
				var oder = '${buypro.price }'*$('#num').val();
				var discount= ('${buypro.price }'*'${buypro.discount }')*$('#num').val();
				$('.totpay').text(oder);
				$('.dis').text(discount);
				total();
			});
		});
    	
    	function total() {
    		var coup=$('#coupon').val().split("&");
    		var pop = dis*$('#num').val();
    		var tot = pop-(pop*coup[0]/100);
    		var pay= tot-$('#mile').val();
    		$('#total').text(pay);
    		$('#amount').val(pay);
		}
    </script>
    <style type="text/css">
    .one{
    	margin: auto;
    	width: 80%;
    }
    .one tr td h2{
    	color: red;
    }
    .two{
    	margin: auto;
    	width: 80%;
    }
    
    </style>
</head>
<body>
<form id="buypage">
	<input type="hidden" name="cmd" value="_xclick" size="50" /><br />
	<input type="hidden" name="business" value="info-facilitator@myemail.co.kr" size="50" /><br />
	<h1>주문/결제</h1>
	<br/>
	<table class="one">
	<tr>
		<td width="25%"><img src="/market/file/${buypro.thumb }"></td>
		<td><h2>(${buypro.proname } )<small>를 주문합니다.</small></h2></td>
	</tr>
	</table>
	<br/><br/>
	<h1>구매자정보</h1>
	<br/>
	<div class="table-responsive">
	<table class="table table-bordered two" >
		<tr>
			<th width="20%">아이디</th>
			<th>${id }</th>
		</tr>
		<tr>
				<td width="20%">이름</td>
				<td>${name }</td>
		</tr>
	</table>
	</div>
	<br/><br/>
	<h1>구매 상품</h1>
	<br/>
	<div class="table-responsive">
	<table class="table table-bordered two" >
		<tr>
			<th width="20%">출발편&항공편</th>
			<th colspan="2">
			<select id="start">
			<%-- <option>${ticket }</option> --%>
			<c:forEach items="${buypro2 }" var="buypro2">
			<option value="${buypro2.startday }&${buypro2.trans }">
							${buypro2.startday }&${buypro2.trans }
			</option>
			</c:forEach>
			</select>
		</th>
		</tr>
		<tr>
				<td width="20%">기간</td>
				<td>${buypro.peris  } </td>
		</tr>
		<tr>
				<td width="20%">신청가능티켓</td>
				<td><div id="person"><span id="tot">${orderticket }</span>장</div> </td>
		</tr>
		<tr>
				<td width="20%">여행인원수</td>
				<td><input type="text" id="num">명</td>
		</tr>
	</table>
	</div>
	<br/><br/>
	<h1>결제 금액</h1>
	<br/>
	<div class="table-responsive">
	<table class="table table-bordered two" >
		
		<tr>
				<td width="20%">상품금액</td>
				<td><p class="totpay">${buypro.price }</p></td>
		</tr>
		<tr>
				<td width="20%">기본할인</td>
				<td><p class="dis"></p></td>
		</tr>
		<tr>
				<td width="20%">사용가능쿠폰</td>
				<td>보유 쿠폰 &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
			<select id="coupon">
			<c:if test="${empty coupon  }" ><option value="0">쿠폰이 없습니다.</option></c:if>
			<c:if test="${!empty coupon  }" >
				<option value="0">쿠폰을 선택해주세요.</option>
			<c:forEach items="${coupon }" var="coup">
				<option value="${coup.percent }&${coup.cupid }">
					${coup.cupname }, ${coup.percent }%
				</option>
			</c:forEach>
			</c:if>
			</select>
		</td>
		</tr>
		<tr>
				<td width="20%">마일리지</td>
				<td>${mile }point &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp<input type="text" id="mile"><button id="use">사용하기</button></td>
		</tr>
		<tr>
				<td width="20%">총 결제금액</td>
				<td><span id="total"></span></td>
		</tr>
	</table>
	<input type="hidden" id="amount" name="amount" value="" size="50" /><br />
	<input type="hidden" id="item_name" name="item_name" value="${buypro.proname }" size="50" /><br />
	<input type="index" id="return" name="return" value="" size="50" /><br />
	<input type="index" id="notify_url" name="notify_url" value="" size="50" /><br />
	<input type="index" id="cancel_return" name="cancel_return" value="" size="50" /><br />
	<input type="hidden" name="charset" value="UTF-8" size="50" /><br />
    <input type="hidden" name="currency_type" value="USD" size="50" /><br />
    <input id="payment" type="button" value="결제하기" size="50" />
</form>
</body>
</html>