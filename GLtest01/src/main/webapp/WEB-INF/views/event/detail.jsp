<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight master</title>
<link href="/master/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/master/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $(function() {
         $(document).on('change',"#eimgFile", function() {
            readURLTB(this);
         });
      }); 

      function readURLTB(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
               $('#eimgFile').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
      //file 이미지 미리보기 eimg
      
      
      //버튼 누를 시 파일 입력창 출력
        $(".eimgBtn").on("click", function(){
         var target = $('.eimgDiv');
         target.html("<input type=\"file\" class=\"form-control\" id=\"eimgFile\"name=\"eimgFile\" />");
         $(".eimgBtn").hide();
         return false;
      });

   });
      
</script>
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
<style type="text/css"></style>
</head>
<body class="w3-light-grey">
<%@ include file="../template/container.jsp" %>
   <!-- 
      //add:그냥 입력으로 폼 보여주기
      //proid:값을 가진 입력 폼으로 수정가능하게 보여주기 
      //title : 입력 / 수정
      //ProductVo : bean
      -->
   <div class="w3-main" style="margin-left:300px;margin-top:43px;">
   <div class=" w3-container container">
     <%--  <h1>${title }페이지</h1> --%>
      <form action="${url }" enctype="multipart/form-data" method="post">
         <div class="form-group col-md-12">
            <label for="eid" class="col-md-2 control-label">이벤트ID</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="eid" name="eid"
                  placeholder="이벤트코드는 자동으로 작성됩니다." value="${bean.eid }"
                  readonly="readonly">
            </div>
         </div> <!-- 이벤트id -->
         
         
         <div class="form-group col-md-12">
            <label for="ename" class="col-md-2 control-label">이벤트명</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="ename" name="ename"
                  placeholder="이벤트명을 작성하십시오." value="${bean.ename }">
            </div>
         </div> <!-- 이벤트명 -->
         
         <div class="form-group col-md-12">
            <label for="eexp" class="col-md-2 control-label">이벤트상세내용</label>
            <div class="col-md-10">
               <textarea class="form-control" rows="5" id="eexp" name="eexp"
                  placeholder="이벤트 상세내용 작성.">${bean.eexp }</textarea>
               <%-- <input type="text" class="form-control" id="exp" name="exp"
                  placeholder="상품 상세 설명 작성." rows="5" value="${bean.exp }"> --%>
            </div>
         </div> <!-- 이벤트상세내용 -->
         
         
         <div class="form-group col-md-12">
            <label for="eurl" class="col-md-2 control-label">관련URL</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="eurl" name="eurl"
                  placeholder="페이지 이동할URL을 적어주시기 바랍니다" value="${bean.eurl }">
            </div>
         </div> <!-- 관련url -->
         
         
         <div class="form-group col-md-12">
            <label for="eprio" class="col-md-2 control-label">우선순위</label>
            <div class="col-md-4">
               <input type="text" class="form-control" id="eprio" name="eprio"
                  placeholder="마켓팅팀 제공 우선순위 작성. 숫자 낮을 수록 상위 노출"
                  value="${bean.eprio }">
            </div>
            <label for="eduring" class="col-md-2 control-label">이벤트기간</label>
            <div class="col-md-4">
               <input type="date" class="form-control" id="eduring" name="eduring"
                  value="${bean.eduring }">
            </div>
         </div> <!-- 우선순위+이벤트기간 -->
         
         
         <div class="form-group col-md-12">
            <div class="col-md-4">
               <img alt="이벤트 상세 이미지" id="eImg" 
                  src="${pageContext.request.contextPath}/file/${bean.eimg}"
                  class="img-event" width="350px">
            </div>
            <label for="eimgFile" class="col-md-2 control-label">이벤트 상세이미지</label>
            <div class="col-md-6 eimgDiv">
               <button type="button" class="btn btn-success eimgBtn form-control">이벤트 이미지 ${title}</button> 
               <input hidden="hidden" name="eimg" value="${bean.eimg }">
               <!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기 -->
            </div>
         </div> <!-- 이벤트이미지 -->
         
         
         
         <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary">${title}</button>
            <button type="reset" class="btn btn-default">취소</button>
         </div> 
         
      </form>
   </div>
</div>
</body>
</html>