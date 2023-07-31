<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>  
 <!-- 20230703 세연 생성 -->   
    
 

<div class="container-fluid position-relative"> <!--큰틀-->
	<div class="row mx-2 my-2">
		<div class="col-12">
			<div class="row">
				<div class="col-2">
					 		<!-- div left-sidebar -->
				 	  <div class="left-sidebar">
						  <div class="list-group">
						    <a class="list-group-item list-group-item-action active" href="${contextPath }/mypage/myMain">마이페이지</a>
						    <a href="#" class="list-group-item list-group-item-action" id="goDetail">회원정보/수정</a>
						  
						    
						    	    <a class="list-group-item list-group-item-action active">나의예약</a>
						    <a href="${contextPath }/hotel/htres/my" class="list-group-item list-group-item-action">호텔예약</a>
						     <a href="${contextPath }/airways/airResList" class="list-group-item list-group-item-action">항공예약</a>
						    
						    
						    
						    <a class="list-group-item list-group-item-action active">QnA</a>
						    <a href="${contextPath }/qna/list" class="list-group-item list-group-item-action">나의문의내역</a>	
						    <a href="${contextPath }/qna/reg" class="list-group-item list-group-item-action">질문하기</a>
						    <a class="list-group-item list-group-item-action active" href="${contextPath }/boards/faq" >FAQ</a>
						    
						    
						    
						    
					  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
					  
					  <button type="button" class="btn btn-primary">나의리뷰</button>
					  <div class="btn-group" role="group">
					    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" >
					      <a class="dropdown-item" href="${contextPath }/mypage/myAirRev">항공리뷰</a>
					      <a class="dropdown-item" href="${contextPath }/mypage/myHTRev">호텔리뷰</a>
					    </div>
					  </div>
							    
		     
		 
					  </div>
					  </div> 
			 	 </div>  <!-- /end div left-sidebar  -->
 	 	
				</div>
			
				
	<div  style="width: 65%;margin: left ;" >
		<div class="col-12 mt-2">
				<img class="rounded mx-auto d-block" alt="로고어디감" src="${contextPath}/resources/img/mypage.png" style="width: 100px; height: 100px;">
				<h2 class="text-center text-light mt-3">${user.userName}님 안녕하세요!</h2>
			</div>
	<div class="card border-light mb-3" style="width: 100%;margin: left ;" >
		
		<div class="col-10 text-center" style="width: 100%;">
		
					
					 <hr>
					 <h4>마이페이지</h4>
					 <hr>
		<div class ="card border-light"> <!-- 맨외곽 테두리 -->
				<div class="card border-light mb-3"  margin: auto;"><!-- 내역없다는 상자 테두리 -->
					<div class="card-body">
						<span>
		  					<button type="button" class="btn btn-warning btn-lg " id="communityBtn" style="float: left;">커뮤니티페이지</button>&nbsp;&nbsp;&nbsp;  
		  					<button type="button" class="btn btn-primary btn-lg" id="airwaysBtn"  style="margin-left: 5%;">항공메인페이지</button>&nbsp;&nbsp;&nbsp;
		  					<button type="button" class="btn btn-secondary btn-lg " id="hotelBtn" style="float: right;">호텔메인페이지</button>&nbsp;&nbsp;&nbsp;
						</span>
									
					  </div>
					</div><!-- END/내역없다는 상자 테두리 -->	
	
						</div><!-- 맨외곽테두리 끝 -->

				</div>
			</div>	
			</div>	
		</div>

	</div>
	<!-- page col end -->
</div>
<!-- page row end -->


</div> <!-- container end -->



<form id="mypagefrm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="hidden" value="${userId}">

</form>
  
<script>

	var csrfHeaderName = "${_csrf.headerName}" ;
	var csrfToken = "${_csrf.token}" ;

	$(document).ajaxSend(function(e, xhr, options){
	   xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
	});
	

	$("#goDetail").on("click",function(){
		$("#mypagefrm").attr("action","${contextPath}/mypage/myDetail");
		$("#mypagefrm").attr("method","get");
		$("#mypagefrm").submit();
	});
	
	//버튼밖에 a태그를 걸면 버튼이 나란히 정렬이 안되고 줄 띄어서 되더라고요 그래서 스크립트문을 추가하였습니다
	$("#communityBtn").on("click",function(){
		location.href ="${contextPath}/community/list" ;
	})
	
	$("#airwaysBtn").on("click",function(){
		location.href ="${contextPath}/airways/" ;
		  
	})
	
	$("#hotelBtn").on("click",function(){
		location.href ="${contextPath}/hotel/" ;
	})
	
 

</script>		  
  


 
 <%@include file="../include/footer.jsp" %>
