<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/htheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div class="container position-relative">
	<div class="row mx-2" >
		<div class="col-12 mt-3">
			<img class="rounded mx-auto d-block" alt="로고어디감" src="${contextPath}/resources/img/communities.png" style="width: 100px; height: 100px;">
			<h2 class="text-center text-light mt-3">Booknow에서 소통해 보세요!</h2>
		</div>
	</div>
<!-- 게시글 리스트 -->
<div class="container" style="margin-top:23px">
	<div class="card shadow">
		<div class="card-body">
			<div class="header" style="margin-bottom:5px">
				<h4 class="card-title">TLBOOK 커뮤니티</h4>	
			</div>
			<!-- 카테고리 -->
			<div class="category" style="margin-top:20px">
				<ul class="navbar-nav">
					<li class="nav-item" >
						<c:forEach var="category" items="${cateList}">	
						<a style="text-decoration:none;"  href="${contextPath }/community/list?tvcCatId=${category.tvcCatId}" >
						<button type="button" class="btn btn-primary"  ># ${category.tvcCatName }</button>
								</a>
						</c:forEach>
					</li>
				</ul>
			</div>
			<!-- 게시판 -->
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">작성자</th>
						<th class="text-center d-none d-md-table-cell">작성날짜</th>
						<th class="text-center d-none d-md-table-cell">조회수</th>
					</tr>
				</thead>
				<!-- 게시판 -->
				<tbody>
					<c:forEach var="board" items="${boardList}">	
						<tr>
							<td class="text-center d-none d-md-table-cell">${board.tvcBno }</td>
							<td><a href='${contextPath }/community/detail?tvcCatId=${board.tvcCatId}&tvcBno=${board.tvcBno}'>${board.tvcBtitle }</a></td>
							<td class="text-center d-none d-md-table-cell">${board.tvcBwriter }</td>
							<td class="text-center d-none d-md-table-cell"><fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${board.tvcBregDate }'/></td>	
							<td class="text-center d-none d-md-table-cell">${board.tvcBviewsCnt }</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-right">
				<a href="${contextPath }/community/write?tvcCatId=<c:choose><c:when test='${not empty param.tvcCatId}'>${param.tvcCatId }</c:when><c:otherwise>1</c:otherwise></c:choose>" class="btn btn-primary">글쓰기</a>
			</div>
			
			<!-- 페이징처리 -->
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
									<a href="${contextPath }/community/list?tvcCatId=${param.tvcCatId}&pageNum=${pageBean.prevPage}" class="page-link">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
							<c:choose>
								<c:when test="${idx == pageBean.currentPage }">
									<li class="page-item active">
										<a href="${contextPath }/community/list?tvcCatId=${param.tvcCatId}&pageNum=${idx}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a href="${contextPath }/community/list?tvcCatId=${param.tvcCatId}&pageNum=${idx}" class="page-link">${idx }</a>
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
									<a href="${contextPath }/community/list?tvcCatId=${param.tvcCatId}&pageNum=${pageBean.nextPage}" class="page-link">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
				</ul>
			</div>
				<!--페이징 처리 끝-->	
		</div>
	</div>
</div>
	
	
	
	
</div>

<%@ include file="../include/footer.jsp" %>
    
    
    
    