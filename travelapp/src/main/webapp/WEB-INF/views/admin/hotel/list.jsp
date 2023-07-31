<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="/WEB-INF/views/include/adminheader.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

        <div class="container">


<div class="album py-5 bg-light">
       <div class="row">
	        <div class="col-lg-12">
	            <h1 class="page-header">TLBOOK 호텔 페이지</h1>
	        </div>
    	</div>
    	 <!-- 등록 버튼 -->
           <div class="row" >
         	 <div class="text-right" style="margin:20px">
				<a href="${contextPath}/admin/hotel/register" class="btn btn-primary">호텔등록</a>
			 </div>
			</div>
		  <!--  호텔리스트화면  -->
          <div class="row">
           <c:forEach var="hotel" items="${hotelList }" >
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
              	<h3>${hotel.htName}</h3> 
				<img class="card-img-top" src="${contextPath}/admin/hotel/hotelFiles/${hotel.htNo}"  style="width:300px;height:250px">
                <div class="card-body">
                  <p class="card-text">[성급] : ${hotel.htRank}</p>
                  <p class="card-text">[숙소분류 ]:${hotel.htType}</p> 
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${contextPath}/admin/hotel/detail?htNo=${hotel.htNo}&busId=${hotel.busId}'">확인</button>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
             </c:forEach>
          </div>
       
         
          <!-- 페이징처리 -->
  		<div class="row">
	     	   <div class="col-lg-12" style="text-align: center;">
               	<div class="d-none d-md-block" style="display: inline-block;">
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${contextPath }/admin/hotel/list?pageNum=${pageBean.prevPage}" class="page-link">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
							<c:choose>
								<c:when test="${idx == pageBean.currentPage }">
									<li class="page-item active">
										<a href="${contextPath }/admin/hotel/list?pageNum=${idx}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a href="${contextPath }/admin/hotel/list?pageNum=${idx}" class="page-link">${idx }</a>
									</li>
							</c:otherwise>
							</c:choose>	
						</c:forEach>
						
						<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt }">
							<li class="page-item disabled">
								<a href="#" class="page-link">다음</a>
							</li>
						</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${contextPath }/admin/hotel/list?pageNum=${pageBean.nextPage}" class="page-link">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
				</ul>
				</div>
			</div>
			</div>
		</div>
				<!--페이징 처리 끝-->	
			 
			 
        </div>   
      </div>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>