<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/flyheader.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingDTO" %>

<style>
.container {width:80% !important; padding:50px 0;}
.card {width:100% !important;}
.btn-group {float:right; }
.pagination {display: inline-flex;}

.form-select{width: 30% !important;}
#page-wrapper {
  padding: 50px;
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  margin-top: 50px;
  #selectScope {
    display: none;
  }
}

 .forClass {
    background-color: #f2f2f26e;
    border: 1px solid #cccccc42;
    border-radius: 5px;
    padding: 10px;
    box-shadow: 0 2px 0px rgb(0 0 0 / 10%);
    font-family: Arial, sans-serif;
    font-size: 16px;
    color: #333;
  }

.input-group {
    width: max-content;
    }
}


</style>
<div class="container position-relative">

 
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox1" autocomplete="off"  >
	    <label class="btn btn-outline-primary" for="btncheckbox1" onclick="goToAirlineDetails('KAL')">대한항공</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox2" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox2" onclick="goToAirlineDetails('AAR')">아시아나항공</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox3" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox3" onclick="goToAirlineDetails('ABL')">에어부산</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox4" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox4" onclick="goToAirlineDetails('ASV')">에어서울</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox5" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox5" onclick="goToAirlineDetails('ESR')">이스타항공</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox6" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox6" onclick="goToAirlineDetails('JJA')">제주항공</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox7" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox7" onclick="goToAirlineDetails('JNA')">진에어</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox8" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox8" onclick="goToAirlineDetails('TWB')">티웨이항공</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox9" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox9" onclick="goToAirlineDetails('FGW')">플라이강원</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox10" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox10" onclick="goToAirlineDetails('HGG')">하이에어</label>
	    <input type="checkbox" class="btn-check" name="btncheckbox" id="btncheckbox11" autocomplete="off" >
	    <label class="btn btn-outline-primary" for="btncheckbox11" onclick="goToAirlineDetails('UFO')">해외항공사</label>
	  </div>
	  
		<div id="page-wrapper">
		<div class="container" >
 
 <%-- 	<sec:authorize access="isAuthenticated()">
	  <span> 로그인 유저:  <sec:authentication property="principal.username"/> </span>
	</sec:authorize>  --%>

 <div class="alert alert-dismissible alert-success"	>
   <div><small>${airlineId}	    </small><h2> <span>
          <c:choose>
            <c:when test="${airlineId == 'KAL'}">대한항공</c:when>
            <c:when test="${airlineId == 'AAR'}">아시아나항공</c:when>
            <c:when test="${airlineId == 'ABL'}">에어부산</c:when>
            <c:when test="${airlineId == 'ASV'}">에어서울</c:when>
            <c:when test="${airlineId == 'ESR'}">이스타항공</c:when>
            <c:when test="${airlineId == 'JJA'}">제주항공</c:when>
            <c:when test="${airlineId == 'JNA'}">진에어</c:when>
            <c:when test="${airlineId == 'TWB'}">티웨이항공</c:when>
            <c:when test="${airlineId == 'FGW'}">플라이강원</c:when>
            <c:when test="${airlineId == 'HGG'}">하이에어</c:when>
            <c:when test="${airlineId == 'UFO'}">해외항공사</c:when>
            <c:otherwise>""</c:otherwise>
          </c:choose>
        </span></h2> <h5  >총 리뷰수   ${revTotal} 개</h5> 
		</div> 
         <c:if test="${averageStar != null}">
		    평균 별점: ${averageStar} 점 
		</c:if>
	</div>
	
	 
	<div id="yoyack">
	<c:choose>
	  <c:when test="${airlineId == 'KAL'}">
<!-- 	    <img src="../../resources/img/KAL.jpg" alt="대한항공 로고"  style="width: 500px; height: auto;"> -->
			<a href="https://www.koreanair.com/kr/ko/footer/about-us/who-we-are/overview/introduce-corporation" target="_blank">
			  <img src="../../resources/img/KAL.jpg" alt="대한항공 로고" style="width: 500px; height: auto;">
			</a>
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      대한민국 대표 항공사이므로 대한항공(KE)은 한국에서 가장 큰 항공사입니다. 서울에 본사를 둔 이 항공사는 국내 20개 도시와 아시아, 호주, 아프리카, 유럽, 북아메리카, 남아메리카에 걸친 100여 개의 국제적인 도시로 운항하고 있습니다. 또한 스카이팀 제휴 멤버인 이 항공사는 40여 개 항공사와 코드 셰어 협정을 맺고 있습니다. 보유 항공기들은 2종 클래스 항공기(비즈니스 클래스의 한 버전인 프레스티지 클래스, 이코노미 클래스)와 3종 클래스 항공기(퍼스트 클래스, 프레스티지 클래스, 이코노미 클래스)로 구성되어 있습니다. 대한항공은 서울 김포국제공항(GMP)과 서울 인천국제공항(ICN)에 허브가 있습니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'AAR'}">
	  <a href="https://www.koreanair.com/kr/ko/footer/about-us/who-we-are/overview/introduce-corporation" target="_blank">
	    <img src="../../resources/img/AAR.jpg" alt="아시아나항공 로고" style="width: 500px; height: auto;">
	    </a>
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      아시아나항공(OZ)은 대한민국의 항공사로, 서울에 본사를 두고 있습니다. 국내선과 국제선을 운영하며 아시아, 유럽, 미주, 중동 등 다양한 목적지로 운항하고 있습니다. 아시아나항공은 스타 얼라이언스에 소속되어 있으며, 퍼스트 클래스, 비즈니스 클래스, 이코노미 클래스를 제공합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'ABL'}">
	    <img src="../../resources/img/ABL.jpg" alt="에어부산 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      에어부산(BX)은 대한민국의 저비용 항공사입니다. 부산을 중심으로 국내선과 국제선을 운항하고 있으며, 일본, 중국, 동남아시아 등 지역적인 노선을 운영합니다. 이코노미 클래스로 운영되는 항공기를 사용하고 있습니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'ASV'}">
	    <img src="../../resources/img/ASV.jpg" alt="에어서울 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      에어서울(RS)은 대한민국의 항공사로, 인천을 중심으로 국제선을 운항하고 있습니다. 다양한 아시아 도시로 비행을 제공하며, 이코노미 클래스를 제공합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'ESR'}">
	   <img src="../../resources/img/ESR.jpg" alt="이스타항공 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      이스타항공(ZE)은 대한민국의 저비용 항공사입니다. 국내선과 국제선을 운항하며, 일본, 중국, 동남아시아 등으로의 노선을 운영합니다. 이스타항공은 이코노미 클래스로 운영되는 항공기를 사용합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'JJA'}">
	   <img src="../../resources/img/ESR.jpg" alt="이스타항공 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      제주항공(7C)은 본사가 제주시에 있는 대한민국 항공사입니다. 인천국제공항(ICN)과 제주국제공항(CJU)를 주요 거점으로, 김해국제공항(PUS)을 보조 허브로 운영하고 있습니다. 국내에서는 6개 도시로 운항하고 있습니다. 또한 캄보디아, 괌, 홍콩, 일본, 북 마리아나 제도, 중국, 필리핀, 대만, 태국, 베트남으로의 정기적인 국제노선뿐 아니라 전세항공도 제공합니다. 제주항공은 이코노미 클래스로만 구성된 보잉 737-800 20기를 보유하고 있습니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'JNA'}">
	   <img src="../../resources/img/JNA.jpg" alt="진에어 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      진에어(LJ)는 대한민국의 항공사로, 인천을 중심으로 국내선과 국제선을 운항하고 있습니다. 저비용 항공사로 알려져 있으며, 이코노미 클래스를 제공합니다.
	    </p>
	  </c:when>
		<c:when test="${airlineId == 'TWB'}">
	   <img src="../../resources/img/TWB.jpg" alt="티웨이항공 로고" style="width: 500px; height: auto;">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      티웨이항공(TW)은 대한민국의 저비용 항공사로, 국내선과 국제선을 운항하고 있습니다. 주로 동북아시아 지역을 비행하며, 이코노미 클래스를 제공합니다. 티웨이항공은 김포국제공항(GMP)을 주요 허브로 사용합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'FGW'}">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      플라이강원(W4)은 대한민국의 항공사로, 원주를 기반으로 국내선과 국제선을 운항하고 있습니다. 플라이강원은 주로 동북아시아 지역을 비행하며, 이코노미 클래스를 제공합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'HGG'}">
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      하이에어(H9)는 대한민국의 항공사로, 국내선과 국제선을 운항하고 있습니다. 이스타항공과 합작하여 운영되는 저비용 항공사로 알려져 있습니다. 이코노미 클래스를 제공합니다.
	    </p>
	  </c:when>
	  <c:when test="${airlineId == 'UFO'}">
	    <h4> </h4>
	    <p>
	     항공사 정보를 찾을 수 없습니다.
	    </p>
	  </c:when>
	  <c:otherwise>
	    <h4><br><br>항공사 요약  <br></h4>
	    <p>
	      항공사 정보를 찾을 수 없습니다.
	    </p>
	  </c:otherwise>
	</c:choose>
	</div>




	<div class="d-grid gap-2">
	  <button type="button"  id="btnMoveRegister" class="btn btn-lg btn-primary" style="margin-bottom:50px;">리뷰 등록</button>
	</div>
	 
       <div class="forClass">
       
    <%--  <form class="form-inline" id="frmSendValue" action="${contextPath }/review/airline/list"   method="get" name="frmSendValue">
	  <div>
	    <div class="form-group">
	      <label for="selectScope" class="form-label mt-4">검색란</label>
	      <select  class="form-select" id="selectScope" name="scope">
	        <option value="TC" ${pagingCreator.airlineRevPaging.scope eq 'TC' ? 'selected' : '' }>검색란</option>
	      </select>
	    </div>


	<!--  http://localhost:8080/travelapp/airways/airLineRevList?scope=W&keyword=KAL 값으로 본-->
	    <!-- 검색어 입력 -->
	    
	    <div class="input-group">
	      <input class="form-control me-sm-2" id="keyword" name="keyword" type="text" placeholder="검색어를 입력해주세요..!" value='<c:out value="${pagingCreator.airlineRevPaging.keyword}" />'>
	      <button class="btn btn-secondary my-2 my-sm-0" type="button" id="btnSearch">검색</button>
	    </div>
	  </div>
	  
	  <input type='hidden' id='pageNum' name='pageNum' value='${pagingCreator.airlineRevPaging.pageNum}'>
	  <input type='hidden' id='lastPageNum' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
	  <input type='hidden' id='lastPageNum' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
	  <input type='hidden' id='airlineId' name='airlineId' value='${airlineId}'>
	</form>  --%>    
 
	 	<c:forEach items="${revList}" var="list">
	  <div class="boardList">
	    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
	      <div class="btn-group" role="group">	
	        <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle show" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">설정 </button>
	        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);" data-popper-placement="bottom-start">
	         
			  <button type="button" class="dropdown-item delete_btn"   
			    data-revno="${list.airlineRevno}" 
			    data-id="${list.airlineId}"
			    data-user="${list.userId}">삭제</button><!-- 실제DB 삭제 -->
	         
	          <button type="button" class="dropdown-item edit-btn" 
	                  data-revno="${list.airlineRevno}" 
	                  data-revtitle="${list.airlineRevTitle}" 
	                  data-revcontents="${list.airlineRevContents}"
	                  data-revstar="${list.airlineStar}"
	                  data-id="${list.airlineId}"
	                  data-user="${list.userId}"

	          >수정</button><!-- 수정 -->
			  <button type="button" class="dropdown-item report-btn"  
			  data-id="${list.airlineId}"
			  data-revno="${list.airlineRevno}"
			    >신고</button>
	        </div>
	      </div>
	    </div>
	    <div class="card border-primary mb-3 card">
	      <div class="card-header">
	        <small>${list.airlineRevno}</small>
	        ${list.userId} 님이 리뷰를 작성했습니다
	      </div>
	     
	      <div class="card-header">
	        <span>별점  :<c:choose>
	            <c:when test="${list.airlineStar == '1'}">⭐     <br></c:when>
	            <c:when test="${list.airlineStar == '2'}">⭐⭐    <br></c:when>
	            <c:when test="${list.airlineStar == '3'}">⭐⭐⭐   <br></c:when>
	            <c:when test="${list.airlineStar == '4'}">⭐⭐⭐⭐  <br></c:when>
	            <c:when test="${list.airlineStar == '5'}">⭐⭐⭐⭐⭐ <br></c:when>
	            <c:otherwise>알 수 없음</c:otherwise>
	          </c:choose> 
	          항공사: ${list.airlineId} </span>
	      
	        <span>
	          <c:choose>
	            <c:when test="${list.airlineId == 'KAL'}">대한항공</c:when>
	            <c:when test="${list.airlineId == 'AAR'}">아시아나항공</c:when>
	            <c:when test="${list.airlineId == 'ABL'}">에어부산</c:when>
	            <c:when test="${list.airlineId == 'ASV'}">에어서울</c:when>
	            <c:when test="${list.airlineId == 'ESR'}">이스타항공</c:when>
	            <c:when test="${list.airlineId == 'JJA'}">제주항공</c:when>
	            <c:when test="${list.airlineId == 'JNA'}">진에어</c:when>
	            <c:when test="${list.airlineId == 'TWB'}">티웨이항공</c:when>
	            <c:when test="${list.airlineId == 'FGW'}">플라이강원</c:when>
	            <c:when test="${list.airlineId == 'HGG'}">하이에어</c:when>
	            <c:when test="${list.airlineId == 'UFO'}">해외항공사</c:when>
	            <c:otherwise>알 수 없음</c:otherwise>
	          </c:choose>
	        </span>
	      </div>
	      
	      <div class="card-body">
	        <h4 class="card-title">${list.airlineRevTitle}</h4>
	        <p class="card-text">${list.airlineRevContents}</p>
	        <p class="card-text"><fmt:formatDate value="${list.airlineRevRegDate}" pattern="yyyy년 MM월 dd일 HH:mm "/></p>
	        <div class="card-header">
	          <button type="button" class="btn btn-outline-primary like-btn" data-revno="${list.airlineRevno}">
	            좋아요 <span class="like-count">${list.airlineLike}</span>
	          </button>
	        </div>
	      </div>
	    </div>
	  </div>
	</c:forEach>
  </div>

	<!-- 수정 모달 창 -->
	<div class="modal" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <form id="editForm" method="GET">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="editModalLabel">리뷰 수정</h5>
	                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true"></span>
			        </button>
	                </div>
	                <div class="modal-body">
	                    <input type="hidden" id="revNoInput" name="airlineRevno">
	                    <div class="form-group">
	                        <label for="revTitleInput">제목</label>
	                        <input type="text" class="form-control" id="revTitleInput" name="airlineRevTitle">
	                    </div>
	                    <div class="form-group">
	                        <label for="revContentsInput">내용</label>
	                        <textarea class="form-control" id="revContentsInput" name="airlineRevContents"></textarea>
	                    </div>
	                   <div class="form-group">
	    				<label for="revAirlineStarInput">별점</label>
						    <select class="form-control" id="revAirlineStarInput" name="airlineRevairlineStar">
						        <option value="1">1</option>
						        <option value="2">2</option>
						        <option value="3">3</option>
						        <option value="4">4</option>
						        <option value="5">5</option>
						    </select>
						</div>
	                 <div class="form-group">
				    <label for="revAirlineIdInput">항공사</label>
				    <select class="form-control" id="revAirlineIdInput" name="airlineRevairlineId">
				        <option value="KAL">대한항공</option>
				        <option value="AAR">아시아나항공</option>
				        <option value="JJA">제주항공</option>
				        <option value="JNA">진에어</option>
				        <option value="ABL">에어부산</option>
				        <option value="ESR">이스타항공</option>
				        <option value="HGG">하이에어</option>
				        <option value="ASV">에어서울</option>
				        <option value="FGW">플라이강원</option>
				        <option value="UFO">해외항공사</option>
				        <option value="TWB">티웨이항공</option>
				    </select>
					</div> 
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                    <button type="submit" class="btn btn-primary">수정하기</button>
	                </div>
	                  <sec:csrfInput/>
	            </form>
	        </div>
	    </div>
	</div>
	<!-- 삭제 모달 창 -->
	<div id="deleteConfirmationModal" class="modal" style="display: none;">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"></span>
        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer"> 
	        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-secondary"  >삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
 	
   
	<!-- 신고 모달 창 -->
	<div id="reportConfirmationModal" class="modal" style="display: none;">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">신고</h5>
	         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"></span>
        </button>
	      </div>
	      <div class="modal-body">
	        <p>신고하시겠습니까?</p>
	      </div>
	      <div class="modal-footer"> 
	        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-secondary">신고</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
 <div style="text-align:center;">
	<ul class="pagination">
	<c:if test="${pagingCreator.prev }">
		<li class="page-item">
		    <a href="1" aria-label="Previous" class="page-link">
		      <span aria-hidden="true">&laquo;</span>
		    </a>
	  	</li>
	 </c:if>
 	<c:if test="${pagingCreator.prev }">
		<li class="page-item">
		    <a href="${pagingCreator.startPagingNum - 1}" aria-label="Previous" class="page-link">
		      <span aria-hidden="true">이전</span>
		    </a>
	  	</li>
	 </c:if>
	  
	<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}" step="1"> 
 		<li class='page-item ${pagingCreator.airlineRevPaging.pageNum == pageNum ? "active" : ""}'>
			<a class="page-link" href="${pageNum }">${pageNum }</a>
		</li>
	</c:forEach>	
		
	<c:if test="${pagingCreator.next }">
		<li class="page-item">
			<a href="${pagingCreator.endPagingNum + 1 }" class="page-link" aria-label="Next">
				<span aria-hidden="true">다음</span>
			</a>
		</li>
	</c:if>
	<c:if test="${pagingCreator.next }">
		<li class="page-item">
		  <a href="${pagingCreator.lastPageNum }" class="page-link" aria-label="Next">
		    <span aria-hidden="true">&raquo;</span>
		  </a>
		</li>
	</c:if>
	</ul>

</div>      
</div>      
</div>
 

 
</div>


	<script>
	
	/*  로그인 유저*/
	
	var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
	 var loginUser = "";
	<sec:authorize access="isAuthenticated()">
	loginUser = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
 
	// 삭제 버튼 클릭 시 모달 표시
	$('.delete_btn').on('click', function() {
	  var revno = $(this).data('revno');
	  var id = $(this).data('id');
	  
	  // 작성자 확인
	  var user = $(this).data('user');
	  if (user !== loginUser) {
	    alert("작성자가 아닙니다.");
	    return;
	  }
	
	  $('#deleteConfirmationModal').modal('show');
	  
	  $('#deleteConfirmationModal').on('click', '.btn-secondary', function() {
	    $.ajax({
	      url: '/travelapp/review/airline/Delete',
	      method: 'GET',
	      data: {
	        airlineRevno: revno,
	        airlineId: id
	      },
	      success: function(response) {
	        console.log('삭제 요청이 완료되었습니다.');
	        var redirectUrl = "/travelapp/review/airline/list?airlineId=" + id;
	        window.location.href = redirectUrl;
	      },
	      error: function() {
	        alert('삭제 요청 실패');
	      }
	    });
	  });
	});

	
 
	 
	
	/* 신고 모달창   */
	$('.report-btn').on('click', function() {
	  var revno = $(this).data('revno');
	  var id = $(this).data('id');
	
	  // 작성자 확인
	  
	  if(!loginUser) {
		 alert("로그인 후, 신고 등록이 가능합니다.") ;
			return ;
		}
	
	
	  $('#reportConfirmationModal').modal('show');
	
	  // 확인 버튼 클릭 시 신고 요청 보내기
	  $('#reportConfirmationModal').on('click', '.btn-secondary', function() {
	    $.ajax({
	      url: '/travelapp/review/airline/report',
	      method: 'GET',
	      data: {
	        airlineRevno: revno,
	        airlineId: id
	      },
	      success: function(response) {
	      /*   var redirectUrl = "/travelapp/review/airline/list?airlineId=" + id;
	        window.location.href = redirectUrl; */
	        $('#reportConfirmationModal').modal('hide');
	        alert('신고가 완료되었습니다');
	        window.location.reload();
	      },
	      error: function() {
	        $('#reportConfirmaionModal').modal('hide');
	        alert('이미 신고된 게시물입니다.');
	        window.location.reload();
	      }
	    });
	  });
	});

 
	
	

	$(document).ready(function() {
	    // 수정 버튼 클릭 시
	    $('.edit-btn').on('click', function() {
	        var revNo = $(this).data('revno');
	        var revTitle = $(this).data('revtitle');
	        var revContents = $(this).data('revcontents');
	        var airlineStar = $(this).data('revstar');
	        var airlineId = $(this).data('revId');
	        
	        // 작성자 확인
			  var user = $(this).data('user');
			  if (user !== loginUser) {
			    alert("작성자가 아닙니다.");
			    return;
			  }
	
	        $('#revNoInput').val(revNo);
	        $('#revTitleInput').val(revTitle);
	        $('#revContentsInput').val(revContents);
	        $('#revAirlineStarInput').val(airlineStar);
	        $('#revAirlineIdInput').val(airlineId);
	
	        $('#editModal').modal('show');
	    });
	
	    // 수정 값
	    $('#editForm').on('submit', function(e) {
	        e.preventDefault();
	
	        var revNo = $('#revNoInput').val();
	        var revTitle = $('#revTitleInput').val();
	        var revContents = $('#revContentsInput').val();
	        var revStar = $('#revAirlineStarInput').val();
	        var revId = $('#revAirlineIdInput').val();
	        var airlineId = "${airlineId}";
	        $.ajax({
	            url: '/travelapp/review/airline/modi/' + revNo + '?airlineId=' + airlineId,
	            method: 'PUT',
	            contentType: 'application/json;charset=utf-8',
	            data: JSON.stringify({
	                airlineRevno: revNo,
	                airlineRevTitle: revTitle,
	                airlineRevContents: revContents,
	                airlineStar: revStar,
	                airlineId: revId
	            }),
	            success: function(response) {
	                if (response === 'ReplyModifySuccess') {
	                    alert('수정 성공');
	                    var redirectUrl = "/travelapp/review/airline/list?airlineId=" + airlineId;
	                    window.location.href = redirectUrl;
	                } else {
	                    alert('수정 실패');
	                }
	                $('#editModal').modal('hide');
	            },  error: function() {
		            alert("항공사를 입력하세요");
		        }
	
	        });
	    });
	});

 
 	/* 주소링크 가게 하기*/
	 function goToAirlineDetails(airlineId) {
	     var url = 'http://localhost:8080/travelapp/review/airline/list?airlineId=' + airlineId;
	     window.location.href = url;
	   }
	 
	 
	var frmSendValue = $("#frmSendValue");
	 /* 검색버튼 클릭 이벤트 처리   */
	   $("#btnSearch").on("click", function(){
	 	var scope = $("#revAirlineIdInput").find("option:selected").val();
	 	var scope = $("#selectScope").find("option:selected").val();
		if(!scope || scope == ""){
			alert("검색범위를 선택하세요.");
			return false;
		}
		var keyword = $("#keyword").val();
		if( !keyword || keyword == "") {
			alert("검색어를 입력하세요.");
			return;
		}
		
	 frmSendValue.find("input[name='pageNum']").val(1);
	 frmSendValue.submit();
	});  
 
	$(".pagination a").on("click", function(e){
	    e.preventDefault();
	    var airlineId = "${airlineId}";
	    var pageNum = $(this).attr("href");
	    
	    var frmSendValue = $("<form>").attr("method", "GET");
	    frmSendValue.append($("<input>").attr("type", "hidden").attr("name", "pageNum").val(pageNum));
	    frmSendValue.append($("<input>").attr("type", "hidden").attr("name", "airlineId").val(airlineId)); // airlineId 추가
	    
	    frmSendValue.attr("action", "${contextPath}/review/airline/list");
	    frmSendValue.appendTo("body").submit();
	});  


 
	/* 게시물 등록 */
	$("#btnMoveRegister").on("click", function(e){
	  var airlineId = "${airlineId}";
	  var newUrl = "${contextPath}/review/airline/register?airlineId=" + airlineId;
	  self.location.href = newUrl;
	});

 
	// 좋아요 버튼 클릭 이벤트 처리
	$(document).on("click", ".like-btn", function() {
		if(!loginUser) {
			alert("로그인 후, 좋아요가 가능합니다.") ;
			return ;
		}
		
	    var revNo = $(this).data('revno');
	    var likeCount = $(this).find('.like-count');
	    var airlineId = "${airlineId}";
	
	    // 좋아요 기능 요청
	    $.ajax({
	        url: '/travelapp/review/airline/like?airlineId=' + airlineId,
	        method: 'POST',
	        data: { revNo: revNo },
	        success: function(response) {
	            if (response.success) {
	            } else {
	            	 var updatedLikeCount = response.likeCount;
	                 likeCount.text(updatedLikeCount);
	                 window.location.reload();
	            }
	        },
	        error: function() {
	            alert("에러");
	        }
	    });
	});
	 
   /* 수정 모듈 제목 글자수 제한 */
   document.getElementById("revTitleInput").addEventListener("input", function() {
        var input = this.value;
        var byteCount = 0;
        var maxLength = 50;
        
        for (var i = 0; i < input.length; i++) {
            var charCode = input.charCodeAt(i);
            byteCount += (charCode < 128) ? 1 : 2;
            
            if (byteCount > maxLength) {
                this.value = input.substring(0, i);
                alert("입력 제한을 초과하였습니다. ");
                break;
            }
        }
    });
      /* 수정 모듈 내용글자수 제한 */
     document.getElementById("revContentsInput").addEventListener("input", function() {
         var input = this.value;
         var byteCount = 0;
         var maxLength = 1000;
         
         for (var i = 0; i < input.length; i++) {
             var charCode = input.charCodeAt(i);
             byteCount += (charCode < 128) ? 1 : 2;
             
             if (byteCount > maxLength) {
                 this.value = input.substring(0, i);
                 alert("입력 제한을 초과하였습니다.");
                 break;
             }
         }
     });
      
      /* fly.jsp 이미지 숨기기 */
   /*   document.addEventListener("DOMContentLoaded", function() {
       var flyJspImg = document.querySelector('img[src="${contextPath}/resources/img/main.jpg"]');
       if (flyJspImg) {
    	   flyJspImg.style.display = "none";
       }
     }); */

      

</script>



 
 
 
 


<%@include file="../../include/footer.jsp"%>