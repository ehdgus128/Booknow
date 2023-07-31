<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지_0712 창훈응용   -->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

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
								<div class="card border-secondary  col-12 mx-2 my-2"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">
								 	 <hr>
									 <h3>질문수정하기</h3>
								 	 </div>
								  <div class="card-body"> 

				<form role="form" id="frmModify" method="post" name="frmBoard">
			 
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				 
		 		 <div class="form-group my-1">
						 <label>아이디</label> <input class="form-control" name="qnaQwriter" readonly="readonly"
						 							value='<c:out value="${qnaBoards.qnaQwriter}"/>' >
				 </div>
		 		 <div class="form-group my-2">
					 <label>카테고리</label> <input class="form-control " name="qnaQcategory" readonly="readonly"
						 							value='<c:out value="${qnaBoards.qnaQcategory}"/>' >
				 </div>
				 <div class="form-group my-2 ">
					 <label class="form-label mt-8 text-success" style="font-weight:bolder;">제목</label>
					 <input class="form-control is-valid" name="qnaQtitle" value='<c:out value="${qnaQtitle}"/>'>
				 </div>
				 <div class="form-group my-2">
						 <label class="form-label mt-8 text-success" style="font-weight:bolder;">질문내용</label> <textarea class="form-control is-valid" rows="3" name="qnaQcontent"
						 							></textarea>
				 </div>
				
				 <div class="form-group my-2 ">
					  <label class="form-label mt-8" style="font-weight:bolder;">최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
 																												value="${qnaBoards.qnaQregDate}"/>]
					  <input  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaBoards.qnaQmodDate}"/>'
					   		 class="form-control" name="qnaQmodDate" disabled="disabled">
				  </div>
				
				 
						<button type="button" class="btn btn-primary my-3 " id="btnModify" data-oper="modify">수정</button>
						
						<button type="button" class="btn btn-secondary my-3" id="btnList" data-oper="list" style="float: right;">취소</button>
						
						
						<input type="hidden" name="qnaQno" value="${qnaBoards.qnaQno}">
						
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
//form 수정 버튼 이벤트 처리
var frmModify = $("#frmModify");

$('button').on("click",function(e){
	var operation=$(this).data("oper");

	
	//alert("operation: "+operation);
	
	if(operation =="modify"){
		
		frmModify.attr("action","${contextPath}/qna/modify");
		
		
	} else if(operation =="list"){
		frmModify.attr("action","${contextPath}/qna/list").attr("method","get");
		frmModify.empty();
	}
	frmModify.submit();
});

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