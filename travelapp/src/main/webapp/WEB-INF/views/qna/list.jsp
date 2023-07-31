
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" --%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지_0712 창훈응용   -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

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
				<div class="col-10">
					 <div class="main"> <!-- 본문 시작   -->
						  <div class="row">
								<div class="card border-primary col-12 mx-2 my-2"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">
								 	  <hr>
									 <h3>나의 문의 내역</h3>
								 	 </div>
								  <div class="card-body"> 
								 
					
							<table class="table table-hover " style="width:100%; text-align:center; margin-left:auto; margin-right:auto;" >
								<thead>
								  <tr  class="table-light" >
									 <th style="text-align:center;">카테고리</th>
									 <th style="text-align:center;">제목</th>
									 <th style="text-align:center;">아이디</th>
									 <th style="text-align:center;">작성일</th>
									 <th style="text-align:center;">수정일</th>
									 <th style="text-align:center;">답변</th>
								  </tr>
								</thead>
							 
								<tbody>
								 <c:forEach items="${qnaLidst}" var="board">
									 <c:if test="${board.qnaQprocFlag == 1}">
										 <tr style="background-color:Moccasin; text-align:center" class="moveDetail" data-qnaqno='<c:out value="${board.qnaQno }"/>'>
										 	 <td><c:out value="${board.qnaQcategory}" /></td>
											 <td style="text-align:left;" ><c:out value="${board.qnaQtitle}"/></td>
											 <td><c:out value="${board.qnaQwriter}" /></td>
											 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.qnaQregDate}" /><br>
												 </td>
											 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.qnaQmodDate}" /><br>
											 	</td>
											  <td><c:out value="완료" /></td>	
										 </tr>
									 </c:if>
									 <c:if test="${board.qnaQprocFlag == 0}">
										 <tr style="background-color:Moccasin; text-align:center" class="moveDetail" data-qnaqno='<c:out value="${board.qnaQno }"/>'>
											 <td><c:out value="${board.qnaQcategory}" /></td>
											 <td style="text-align:left;" ><c:out value="${board.qnaQtitle}"/></td>
											 <td><c:out value="${board.qnaQwriter}" /></td>
											 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.qnaQregDate}" /><br>
												 </td>
											 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.qnaQmodDate}" /><br>
											 	</td>
											  <td><c:out value="대기중" /></td>	
										 </tr>
									 </c:if>
								 </c:forEach>
								</tbody>
							</table>
								  <%-- Pagination 시작 --%>
									<div style="display: flex; justify-content: center; "class="mt-3" >
									  <ul class="pagination"  >
									  
										  	<c:if test="${pagingCreator.prev}">
												 <li class="page-item ">
												 <a class="page-link" href="1">&laquo;</a><%-- 맨 앞으로 페이지로 이동 --%>
											 </li>
											 </c:if>
											 
									  <c:if test="${pagingCreator.prev}">
										 <li class="page-item ">
										 <a class="page-link" href="${pagingCreator.startPagingNum - 1}">이전</a><%-- 이전 페이징 그룹 끝 페이지로 이동 --%>
										 </li>
									  </c:if>
									  
									  <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}">
										 <li class='page-item ${pagingCreator.qnaQuestionPagingDTO.pageNum == pageNum ? "active":"" }'>
										 <a class="page-link" href="${pageNum}">${pageNum}</a>
										 </li>
									 </c:forEach>
								
										<c:if test="${pagingCreator.next}">
											 <li class="page-item">
											 <a class="page-link" href="${pagingCreator.endPagingNum +1}">다음</a><%-- 다음 페이징 그룹의 첫 페이지로 이동 --%>
											 </li>
										 </c:if>
									  
									  <c:if test="${pagingCreator.next}">
										 <li class="page-item">
										 <a class="page-link" href="${pagingCreator.lastPageNum}">&raquo;</a><%-- 맨 마지막으로 페이지로 이동 --%>
										 </li>
									 </c:if>
									 	    
										    
									  </ul>
									</div>
								<form id ="frmSendValue">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name='pageNum' value='${pagingCreator.qnaQuestionPagingDTO.pageNum}'>
									<input type="hidden" name='rowAmountPerPage' value='${pagingCreator.qnaQuestionPagingDTO.rowAmountPerPage}'>
									<input type="hidden" name='lastPageNum' value='${pagingCreator.lastPageNum}'>
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

	</div>
	<!-- page col end -->
</div>
<!-- page row end -->


</div> <!-- container end -->






<script type="text/javascript">
var frmSendValue=$("#frmSendValue");

$(".moveDetail").on("click",function(e){
	frmSendValue.append("<input type='hidden' name='qnaQno' value='"+$(this).data("qnaqno")+"'/>");
	frmSendValue.attr("action","${contextPath}/qna/detail");
	frmSendValue.attr("method","get");
	frmSendValue.submit();
	
});


	$(".page-item a").on("click",function(e){
		e.preventDefault();
		frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
		//alert(frmSendValue.find("input[name='pageNum']").val());
		frmSendValue.attr("action","${contextPath}/qna/list");
		frmSendValue.attr("method","get");
		frmSendValue.submit();
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