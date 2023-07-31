<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지-->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>

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
				<div class="card border-light mb-3" style="width: 70%;margin: auto;" >
				<div class="col-10">
					<hr>
					<h3>나의 항공 리뷰 내역 </h3>
					<hr>
					<c:choose>
					<c:when test="${myAirRevList eq 'resNull'}">
						<div class ="card border-light mb-3 outer-div" style=" margin: auto; width: 100%;" >
							<div class="card border-primary mb-3"  inner-div"  style="max-width: 150%; margin: auto;"><!-- 내역없다는 상자 테두리 -->
								<div class="card-header">나의리뷰>호텔 리뷰 내역</div>
								<div class="card-body">
									<h4 class="card-title"><p>'항공' 리뷰내역이 없습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p></h4>
									<p class="card-text">tlbook과 여행을 시작해볼까요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
									<a href="${contextPath}/airways/"  class="btn btn-primary btn-lg button-link">항공메인페이지</a>&nbsp;&nbsp;&nbsp;
									<a href="${contextPath}/hotel/" class="btn btn-secondary btn-lg button-link">호텔메인페이지</a>
								</div>
							</div><!-- END/내역없다는 상자 테두리 -->
						</div>
					</c:when>

					<c:otherwise>
					
					
					<form  class="form-inline" id="frmSendValue"  name="frmSendValue">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						
						<select class="form-control" id="selectScope" name="scope"  style="width: 20%">
							<option value="" ${scope == null ? 'selected' : '' }>분류</option>
							<option value="T" ${scope eq 'T' ? 'selected' : '' }>제목</option>
							<option value="C" ${scope eq 'C' ? 'selected' : '' }>내용</option>
							<option value="W" ${scope eq 'W' ? 'selected' : '' }>항공사</option>
							<option value="TC" ${scope eq 'TC' ? 'selected' : '' }>제목+내용</option>
							<option value="TW" ${scope eq 'TW' ? 'selected' : '' }>제목+항공사</option>
							<option value="CW" ${scope eq 'CW' ? 'selected' : '' }>내용+항공사</option>
							<option value="TCW" ${scope eq 'TCW' ? 'selected' : '' }>제목+내용+항공사</option>
						</select>
						
						<div class="input-group"><!-- 검색어 입력 -->
							<input class="form-control" id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요">
							<span class="input-group-btn"><!-- 전송버튼 -->
								<button class="btn btn-warning" type="button" id="btnSearchGo">검색 &nbsp;<i class="fa fa-search"></i></button>
							</span>
						</div>

						<div class="input-group"><!-- 검색 초기화 버튼 -->
							<button id="btnReset" class="btn btn-info" type="button">검색초기화</button>
						</div> 
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type='hidden' id='pageNum' name='mypagePageNum' value='${mypagePagingCreatorDTO.mypagePagingDTO. mypagePageNum}'><%-- 
						<input type='hidden' id='rowAmountPerPage' name='rowAmountPerPage' value='${pagingCreator.myBoardPaging.rowAmountPerPage}'> --%>
						<input type='hidden' id='lastPageNum' name='mypagePagingLast' value='${mypagePagingCreatorDTO. mypagePagingLast}'>
					</form>


					<table class="table table-hover" style="text-align: center; margin: auto;">

						<thead  class="table-active">
							<tr>
								<td scope="col" style="width: 8%">리뷰번호</td>
								<td scope="col"  style="width: 5%">별점</td>
								<td scope="col" style="width:  8%">항공사</th>
								<td scope="col"  style="width: 20%">리뷰제목</td>
								<td scope="col"  style="width: 20%">등록일</td>
								<td scope="col"  style="width: 20%">추천수</td>
							</tr>
						</thead>
						<tbody> 

						<c:forEach var = "item" items="${myAirRevList}"> <!-- 예약번호 테이블 실질적인 화면 표시 foreach 시작  -->
							<tr id="mySelect"> <!-- //추가한것 -->
								<th scope="col" class="table-primary airResnoVal" style="width: 10%" value="${item.airlineRevno}"><c:out value="${item.airlineRevno}"/></th>
								<td scope="col"  style="width: 20%" value="${item.airlineStar}">
								<c:choose>
									<c:when test="${item.airlineStar == 1}">
										<p><small>⭐</small>  </small><p>
									</c:when>
									<c:when test="${item.airlineStar == 2}">
										<p><small>⭐⭐</small><p>
									</c:when>
									<c:when test="${item.airlineStar == 3}">
										<p><small>⭐⭐⭐</small><p> 
									</c:when>
									<c:when test="${item.airlineStar == 4 }">
										<p><small>⭐⭐⭐⭐</small></p>
									</c:when>
									<c:when test="${item.airlineStar == 5 }">
										<p><small>⭐⭐⭐⭐⭐</small></p>
									</c:when>
								</c:choose>					
								</td> <!-- 탑승인원 -->
								<td scope="col"  style="width: 20%"><c:out value="(${item.airlineId})"/>
								<c:choose>
									<c:when test="${item.airlineId == 'KAL'}">
										<p><small>대한 항공</small> <img src="../resources/img/airlinelogo/KAL.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small><p>
									</c:when>
									<c:when test="${item.airlineId == 'AAR'}">
										<p><small>아시아나 항공 <img src="../resources/img/airlinelogo/AAR.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small><p>
									</c:when>
									<c:when test="${item.airlineId == 'JJA'}">
										<p><small>제주 항공 <img src="../resources/img/airlinelogo/JJA.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small><p> 
									</c:when>
									<c:when test="${item.airlineId == 'JNA' }">
										<p><small>진에어 <img src="../resources/img/airlinelogo/JNA.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:when test="${item.airlineId == 'ABL' }">
										<p><small>에어부산 <img src="../resources/img/airlinelogo/ABL.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:when test="${item.airlineId == 'ESR' }">
										<p><small>이스터 항공 <img src="../resources/img/airlinelogo/ESR.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:when test="${item.airlineId == 'AIH' }">
										<p><small>에어인천 <img src="../resources/img/airlinelogo/AIH.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:when test="${item.airlineId == 'ASV' }">
										<p><small>에어서울 <img src="../resources/img/airlinelogo/ASV.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:when test="${item.airlineId == 'TWB' }">
										<p><small>티웨이항공 <img src="../resources/img/airlinelogo/TWB.png" alt="진에어 로고"  style="width: 100px; height: auto;"></small></p>
									</c:when>
									<c:otherwise>
										<p>${item.airlineId}</p>
									</c:otherwise>
								</c:choose>
								</td>
								<td scope="col"  style="width: 20%" value="${item.airlineRevTitle}">${item.airlineRevTitle}</td> <!-- 총 결제금액 -->
								<td scope="col"  style="width: 20%" value="${item.airlineRevRegDate}">${item.airlineRevRegDate}</td> <!-- 총 결제금액 -->
								<td scope="col"  style="width: 20%" value="${item.airlineLike}">${item.airlineLike}</td> <!-- 총 결제금액 -->
							</tr>
						</c:forEach>
						</tbody>
					</table>




					<div style="text-align: center;"><!--페이징 포장 태그 시작 div -->
						<!-- 페이지 pagination 시작  -->
						<!--    <ul class="pagination"> -->
						<ul class="pagination justify-content-center">
							<c:if test="${mypagePagingCreatorDTO.mypageprev}">   
								<li class="page-item">
									<a class="page-link" href="1">&laquo;&laquo;</a>
								</li>
							</c:if>
							<c:if test="${mypagePagingCreatorDTO.mypageprev}">
								<li class="page-item">
									<a class="page-link" href="${mypagePagingCreatorDTO.mypagePagingStart - 1}">&laquo;</a>
								</li>
							</c:if>
							<!-- 페이징 숫자 부분 -->
							<c:forEach var="pageNum" begin="${mypagePagingCreatorDTO.mypagePagingStart}" end="${mypagePagingCreatorDTO.mypagePagingEnd}" step="1">
								<li class='page-item ${mypagePagingCreatorDTO.mypagePagingDTO.mypagePageNum == pageNum ? "active" : "" }'>
									<a class="page-link" href="${pageNum}">${pageNum}</a>
								</li>
							</c:forEach> 
							<c:if test="${mypagePagingCreatorDTO.mypagenext}">
								<li class="page-item">
									<a class="page-link" href="${mypagePagingCreatorDTO.mypagePagingEnd + 1}">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${mypagePagingCreatorDTO.mypagenext}">   
								<li class="page-item">
									<a class="page-link" href="${mypagePagingCreatorDTO.mypagePagingLast}">&raquo;&raquo;</a>
								</li>
							</c:if>
						</ul>
						<form id="pagefrm" action="${contextPath}/mypage/myAirRev" method="get">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<input type='hidden' id='pageNum' name='mypagePageNum' value='${mypagePagingCreatorDTO.mypagePagingDTO.mypagePageNum}'><%-- 
							<input type='hidden' id='rowAmountPerPage' name='rowAmountPerPage' value='${pagingCreator.myBoardPaging.rowAmountPerPage}'> --%>
							<input type='hidden' id='lastPageNum' name='mypagePagingLast' value='${mypagePagingCreatorDTO.mypagePagingLast}'>
							<input type='hidden' id='scope' name='scope' value="${scope}" >
							<input type='hidden' id='keyword' name='keyword' value="${keyword}">
						</form>	
					</div>			

					</c:otherwise>



					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
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
})


 
var frmSendValue = $("#frmSendValue");

$("#btnSearchGo").on("click", function(){
	
	var scope = $("#selectScope").find("option:selected").val() ;
	
	if(!scope || scope == ""){
		alert("검색범위를 선택하세요.") ;
		return false ;
	}
	
	var keyword = $("#keyword").val() ;
	
	if( !keyword || keyword == "") {
		alert("검색어를 입력하세요.") ;
		return ;
	}
	 
	frmSendValue.find("input[name='pageNum']").val(1);
	frmSendValue.attr("action","${contextPath }/mypage/myAirRev");
	frmSendValue.attr("mothod","get");
	frmSendValue.submit() ;
	
});

$("#btnReset").on("click", function(){
	$("#selectAmount").val(10) ;
	$("#selectScope").val("") ;
	$("#keyword").val("") ;
	$("#pageNum").val(1) ;
	$("#rowAmountPerPage").val(10) ;
	$("#lastPageNum").val("");
	
	frmSendValue.submit() ;
});

/* $("#selectScope").on("change", function(){
	//  array= $("#arrayScope").find("option:selected").val() ;
	frmSendValue.find("input[name='pageNum']").val(1) ;
//	frmSendValue.attr("action", "${contextPath}/mypage/myAirRev").attr("method", "get") ;
	frmSendValue.attr("action","${contextPath }/mypage/myAirRev").attr("method", "get") ;
	frmSendValue.submit() ;
}); */



$(".pagination a").on("click",function(e){
	e.preventDefault();
	$("#pagefrm").find("input[name='mypagePageNum']").val($(this).attr("href"));
	$("#pagefrm").attr("action","${contextPath }/mypage/myAirRev");
	$("#pagefrm").attr("method", "get") ;
	$("#pagefrm").submit();
})


	$("#btnReset").on("click", function(){
	$("#selectAmount").val(10) ;
	$("#selectScope").val("") ;
	$("#keyword").val("") ;
	$("#pageNum").val(1) ;
	$("#rowAmountPerPage").val(10) ;
	$("#lastPageNum").val("");
	
	frmSendValue.submit() ;
});
	
  


</script>

 


<%@include file="../include/footer.jsp" %>