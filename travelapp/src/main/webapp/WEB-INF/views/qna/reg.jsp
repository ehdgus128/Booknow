<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지_0712 창훈응용   -->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

   <style>

  
select {

width: 300px;

padding: .9em .5em;

border: 1px solid #999;

font-family: inherit;

border-radius: 0px;

-webkit-appearance: none;

-moz-appearance: none;

appearance: none;



}  
    
</style>

<div class="container-fluid position-relative"> <!--큰틀-->
	<div class="row mx-2 my-2">
		<div class="col-12">
			<div class="row">
				<div class="col-2"><!-- div left-sidebar -->
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
				<div class="col-10">
					 <div class="main"> <!-- 본문 시작   -->
						  <div class="row">
								<div class="card border-primary   col-12 mx-2 my-2"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">
								 	 <hr>
									 <h3>질문하기</h3>
								 	 </div>
								  <div class="card-body"> 

				 <form role="form" action="${contextPath}/qna/reg" method="post" name="frmBoard">
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				 <div class="row">
				    <div class="col-md-8">
						  <span>
						  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-signpost" viewBox="0 0 16 16">
							  <path d="M7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414a1 1 0 0 0-2 0zM12.532 5l1.666 2-1.666 2H2V5h10.532z"/>
							</svg>
							    <select class="form-group d-inline" name="qnaQcategory" >
								 	<option >카테고리를 선택해주세요 </option>
								 	<option value="공통" >공통</option>
								 	<option value="호텔" >호텔</option>
								 	<option value="항공" >항공</option>
								 </select>
							
						  </span>
					</div>
				    <div class="col-6 col-md-4">
				    
				     <label>아이디</label> <input class="form-control"  name="qnaQwriter" value='<sec:authentication property="principal.username"/>' readonly="readonly">
				     
				     </div>
				  </div>

				 </div>

				 <div class="form-group mt-3">
					 <label>제목</label> <input class="form-control" name="qnaQtitle">
				 </div>
				 <div class="form-group mb-3">
						 <label>내용</label> <textarea class="form-control" rows="3" name="qnaQcontent"></textarea>
				 </div>
				
				 
					<div class="mx-3 mb-3" ><button type="submit" class="btn btn-primary">등록</button>
						
						<button type="button" class="btn btn-secondary" style="float: right;"
							 onclick="location.href='${contextPath}/qna/list'">취소
						</button></div>
				<sec:csrfInput />
			 </form>
		 	<form id="mypagefrm">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" value="${userId}">
			</form>


								  </div>
								</div>
						  </div>
					</div><!-- .main 본문끝  -->
				</div>
			</div>
		</div><!-- page col end -->
	</div><!-- page row end -->
</div> <!-- container end -->


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
</script>





<%@include file="../include/footer.jsp" %>