<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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


<!-- Top container -->
<div class="header w3-container w3-top w3-green w3-large w3-padding  w3-card-4 " style="z-index:4">
  <button class="w3-btn w3-green w3-hide-large w3-padding-0" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <img class="img" src="${pageContext.request.contextPath}/file/logo.png"> 그린라이트 관리자페이지
  
  <span class="w3-right" style="margin-right:0px"> <!--모바일버전에서는 안나오게 id값주고 난 뒤, hidden으로 해주기 -->
      <ul class="nav navbar-nav navbar-right">
        <li><button type="button" class="btn btn-default glyphicon glyphicon-earphone" style="margin-right:20px"> V O C</button></li>
        <!-- /master/voc/list?field=OneQ -->
        <li><button type="button" class="btn btn-default glyphicon glyphicon-home" style="margin-right:20px"> 마켓페이지</button></li>
        <li><button type="button" class="btn btn-default glyphicon glyphicon-log-out" style="margin-right:20px"> 로그아웃</button></li>
      </ul></span>
</div>

<!-- Sidenav/menu -->
<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidenav"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="${pageContext.request.contextPath}/file/vixx.jpg" class="w3-circle w3-margin-right" style="width:80px">
    </div>
    <div class="w3-col s7">
     <p></p>
      <span>Welcome, <strong>ADMIN</strong></span><br>
    </div>
  </div>
  <hr>

  <a href="#" class="w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
  <!-- <a data-toggle="collapse" data-parent="#accordion" href="/master/product/list" aria-expanded="true" aria-controls="collapseOne"><i class="fa fa-users fa-fw"></i>  상품관리</a>
   -->
   <a  href="/master/product/list" ><i class="fa fa-users fa-fw"></i>  상품관리</a>
 <!-- <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">상품등록
    </div>                                   
    </div>
   --> 
  <a  href="/master/event/list" ><i class="fa fa-eye fa-fw"></i>  이벤트관리</a>
  <!--  
   <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">이벤트등록
       </div>
    </div>
       --> 
  <a href="/master/order/total" class="w3-padding"><i class="fa fa-bank fa-fw"></i>  주문관리</a>
  <!-- 
  		전체 주문관리 : /master/order/total
  		취소 주문건 관리 : /master/order/cancel
  -->
  <a href="/master/coupon/" class="w3-padding"><i class="fa fa-bullseye fa-fw"></i>  쿠폰관리</a>
  <a href="/master/customer/list" class="w3-padding"><i class="fa fa-users fa-fw"></i>  고객관리</a>
  <a href="/master/voc/list?field=OneQ" class="w3-padding"><i class="fa fa-bell fa-fw"></i>  VoC관리</a>
  <!-- 
  		FAQ관리 : /master/voc/list?field=FAQ 
  		1대1문의 : /master/voc/list?field=OneQ
  		상품문의 : /master/voc/list?field=ProQ
  -->
  <a href="/master/notice/" class="w3-padding"><i class="fa fa-cog fa-fw"></i>  공지사항관리</a>
</nav>
