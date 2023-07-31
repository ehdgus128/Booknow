<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!-- container -->
<div class="container-fluid position-relative">
    <div class="row mx-2 my-2">
        <div class="col-12">
			<div class="row">
                <div class="col-2">
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
					</div>  
					<!-- /end div left-sidebar  -->
                </div>
                <div class="col-10">
                	<div class="card border-secondary mx-2 my-2">
	                    <h3 class="mx-2 my-2 px-2 py-2">나의 호텔 예약 내역</h3>
	                    <div class="card border-secondary mx-2 my-2">
	                        <table class="table table-hover" style="text-align: center;">
	                            <thead  class="table-active">
	                                <tr>
	                                    <th>결제 번호</th>
	                                    <th>결제 일자</th>
	                                    <th>결제 상태</th>
	                                    <th>결제 총 금액</th>
	                                    <th>자세히보기</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach var="pay" items="${payList}">
	                                <tr>
	                                    <td>${pay.htSellTranId}</td>
	                                    <td>${pay.htSellTranDate}</td>
	                                    <td>${pay.htSellStatus}</td>
	                                    <td>${pay.htSellPrice}</td>
										<td>
	                                    	<c:choose>
	                                    		<c:when test="${pay.htSellStatus == '결제취소'}">
	                                    			<button class="btn btn-secondary" disabled>취소된 예약</button>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<button class="htResDetail btn btn-secondary" data-htresno="${pay.htResNo}">예약 상세</button>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </td>
	                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	
	                    <ul class="pagination justify-content-center">
	                        <c:if test="${payListPage.prev}">   
	                            <li class="page-item">
	                                <a class="page-link" href="1">&laquo;&laquo;</a>
	                            </li>
	                        </c:if>
	                        <c:if test="${payListPage.prev}">
	                            <li class="page-item">
	                                <a class="page-link" href="${payListPage.mypagePagingStart - 1}">&laquo;</a>
	                            </li>
	                        </c:if>
	                        <!-- 페이징 숫자 부분 -->
	                        <c:forEach var="pageNum" begin="${payListPage.min}" end="${payListPage.max}" step="1">
	                            <li class='page-item ${payListPage.currentPage == pageNum ? "active" : "" }'>
	                                <a class="page-link" href="${pageNum}">${pageNum}</a>
	                            </li>
	                        </c:forEach> 
	                        <c:if test="${payListPage.next}">
	                            <li class="page-item">
	                                <a class="page-link" href="${payListPage.mypagePagingEnd + 1}">&raquo;</a>
	                            </li>
	                        </c:if>
	                        <c:if test="${payListPage.next}">   
	                            <li class="page-item">
	                                <a class="page-link" href="${payListPage.mypagePagingLast}">&raquo;&raquo;</a>
	                            </li>
	                        </c:if>
	                    </ul>
                	
                	</div>
                </div>
            </div>
        </div>
        <!-- col end -->
    </div>
    <!-- row end -->
</div>
<!-- container end -->

<script>

//페이징 버튼 클릭 이벤트 처리
$(".pagination a").on("click",function(e){
	e.preventDefault();
	document.location.href = "${contextPath }/hotel/htres/my?pageNum="+$(this).attr("href");
});

//예약 상세 버튼 이벤트 처리 
$(".htResDetail").on("click",function(e){
	document.location.href = "${contextPath }/hotel/htres/detail?htResNo="+$(this).data("htresno");
});

</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>