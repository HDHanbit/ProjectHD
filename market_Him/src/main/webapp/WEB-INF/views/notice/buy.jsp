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
    		    	if($('#start').val()==""){
    		    		alert("출발일/항공편을 선택해주세요");
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
    					return false;
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
/*     .one{ */
/*     	margin: auto; */
/*     	width: 80%; */
/*     } */
/*     .one tr td h2{ */
/*     	color: red; */
/*     } */
/*     .two{ */
/*     	margin: auto; */
/*     	width: 80%; */
/*     } */
    
    </style>
</head>
<body>
	<div class = "header" >
		<%@ include file = "../../header/header.jsp" %>
	</div>
<form id="buypage">
	<input type="hidden" name="cmd" value="_xclick" size="50" /><br />
	<input type="hidden" name="business" value="6class.test2@gmail.com" size="50" /><br />
	
	<div>
		<h1>주문/결제</h1>
	</div>
	<div>
		<img src="/market/file/${buypro.thumb }">
	</div>
	<div>
		<h2>(${buypro.proname } )<small>를 주문합니다.</small></h2>
	</div>
	<div>
		<h1>구매자정보</h1>
	</div>
	<div>아이디</div>
	<div>${id }</div>
	<div>이름</div>
	<div>${name }</div>
	<div><h1>구매 상품</h1></div>
		<div>출발편&항공편</div>
		<div>
		<select id="start">
		<%-- <option>${ticket }</option> --%>
		<option value="">출발일/항공편을 선택해주세요.</option>
		<c:forEach items="${buypro2 }" var="buypro2">
		<option value="${buypro2.startday }&${buypro2.trans }">
						${buypro2.startday }&${buypro2.trans }
		</option>
		</c:forEach>
		</select>
	</div>
		<div>기간</div>
		<div>${buypro.peris  } </div>
		<div>신청가능티켓</div>
		<div><div id="person"><span id="tot">${orderticket }</span>장</div> </div>
		<div>여행인원수</div>
		<div><input type="text" id="num">명</div>
		<div><h1>결제 금액</h1></div>
		<div>상품금액</div>
		<div><p class="totpay">${buypro.price }</p></div>
		<div>기본할인</div>
		<div><p class="dis"></p></div>
		<div>사용가능쿠폰</div>
		<div>보유 쿠폰 &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
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
	</div>
		<div>마일리지</div>
		<div>${mile }point &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp<input type="text" id="mile"><button id="use">사용하기</button></div>
	<div>
		<div>총 결제금액</div>
		<div>
			<span id="total"></span>
			<input id="payment" type="button" class="btn btn-info" value="결제하기" size="50" />
		</div>
	</div>
	<input type="hidden" id="amount" name="amount" value="" size="50" /><br />
	<input type="hidden" id="item_name" name="item_name" value="${buypro.proname }" size="50" /><br />
	<input type="hidden" id="return" name="return" value="" size="50" /><br />
	<input type="hidden" id="notify_url" name="notify_url" value="" size="50" /><br />
	<input type="hidden" id="cancel_return" name="cancel_return" value="" size="50" /><br />
	<input type="hidden" name="charset" value="UTF-8" size="50" /><br />
    <input type="hidden" name="currency_type" value="USD" size="50" /><br />
</form>
	<div class="footer">
		<jsp:include page="../../footer/footer.jsp"/>
	</div>
</body>
</html>