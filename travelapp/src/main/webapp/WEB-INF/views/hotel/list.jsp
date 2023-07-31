<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/htheader.jsp" %>


<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div class="container position-relative" style="margin-top:20px">
	<%-- 검색창 --%>
	<form method="get" action="${contextPath}/hotel/list">	
		 <div class="row">
			<div class="col-12 my-3 mx-2">
				<div class="card border-secondary" style="padding: 5px;">
					<h2 class="card-header" style="padding: 5px;">호텔 목록</h2>
						<div class="row my-3 mx-2">
							<div class="hotel-search-box col-4">
								<select class="form-select" aria-label="Default select example" name="htAreaCode" id="htAreaCode"><%-- 지역 select --%>
								<option value="서울" <c:if test ="${search.htAreaCode == '서울'}">selected="selected"</c:if>>서울</option>
								<option value="제주도" <c:if test ="${search.htAreaCode == '제주도'}">selected="selected"</c:if>>제주도</option>
								<option value="부산" <c:if test ="${search.htAreaCode == '부산'}">selected="selected"</c:if>>부산</option>
								<option value="강릉" <c:if test ="${search.htAreaCode == '강릉'}">selected="selected"</c:if>>강릉</option>
								<option value="속초" <c:if test ="${search.htAreaCode == '속초'}">selected="selected"</c:if>>속초</option>
								<option value="인천" <c:if test ="${search.htAreaCode == '인천'}">selected="selected"</c:if>>인천</option>
								<option value="수원" <c:if test ="${search.htAreaCode == '수원'}">selected="selected"</c:if>>수원</option>
								<option value="대구" <c:if test ="${search.htAreaCode == '대구'}">selected="selected"</c:if>>대구</option>
								<option value="여주" <c:if test ="${search.htAreaCode == '여주'}">selected="selected"</c:if>>여주</option>
								<option value="전주" <c:if test ="${search.htAreaCode == '전주'}">selected="selected"</c:if>>전주</option>
								<option value="양양" <c:if test ="${search.htAreaCode == '양양'}">selected="selected"</c:if>>양양</option>
								<option value="고성" <c:if test ="${search.htAreaCode == '고성'}">selected="selected"</c:if>>고성</option>
								<option value="보령" <c:if test ="${search.htAreaCode == '보령'}">selected="selected"</c:if>>보령</option>
								<option value="태안" <c:if test ="${search.htAreaCode == '태안'}">selected="selected"</c:if>>태안</option>
								<option value="포항" <c:if test ="${search.htAreaCode == '포항'}">selected="selected"</c:if>>포항</option>
								<option value="울산" <c:if test ="${search.htAreaCode == '울산'}">selected="selected"</c:if>>울산</option>
								<option value="거제" <c:if test ="${search.htAreaCode == '거제'}">selected="selected"</c:if>>거제</option>
								</select>	
							</div>
							<div class="dateWrapper col-3">
								<label for="startDateStr" class="form-label">체크인</label>
								<input type="date" class="form-control" id="startDateStr" name="htStartDateStr" <c:if test ="${not empty search.htStartDateStr}"> value="${search.htStartDateStr}"</c:if> autocomplete="off"/>
							</div>
							<div class="dateWrapper col-3">
								<label for="endDateStr" class="form-label">체크아웃</label>
								<input type="date" class="form-control" id="endDateStr" name="htEndDateStr"  <c:if test ="${not empty search.htEndDateStr}"> value="${search.htEndDateStr}"</c:if> autocomplete="off" />			</div>
							<div class="buttonWrapper col-2"><%--검색버튼 --%>
								<button id="idBtnSearchHotelList" type="button" class="btn btn-primary">검색</button>
							</div>
						</div>
						<!-- row end -->

				</div>
				<!-- card end -->
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
		<div class="row">
			<div class="col-12 my-3 mx-2">
				<div class="btn-group" style="margin-top:20px " role="group" aria-label="Basic radio toggle button group"><%-- 카테고리 선택 --%>
				  <label class="btn btn-primary" id="displayHighRank" for="btnradio2" style="border: 1px solid #FFFFFF">높은 성급순</label>
				  <label class="btn btn-primary" id="displayLowRank" for="btnradio2" style="border: 1px solid #FFFFFF">낮은 성급순</label>
				  <label class="btn btn-primary" id="displayHighPrice" for="btnradio2" style="border: 1px solid #FFFFFF">높은 가격순</label>
				  <label class="btn btn-primary" id="displayLowPrice" for="btnradio2" style="border: 1px solid #FFFFFF">낮은 가격순</label>
				</div>			
			</div>		
		</div>


	</form>
	
	<div class="row">
		<div class="col-12 my-3 mx-2">
			<%-- 호텔 리스트 화면 --%>
			<div id="hotelList">

				

			</div>
			<!-- hotelList end -->
		</div>
	</div>
	<!-- row end -->

 

 	<!-- 페이징처리 -->
 	<div id="paginationPlace" >
		<div class="d-none d-md-block">
	
		</div>
	</div>
	<!-- 페이징 처리 끝 -->

	<!-- 호텔방목록 이동을 위한 form -->
	<form id="idFormMoveHtRooms" action="/travelapp/hotel/rooms/list" method="get">
		<input type="hidden" id="idHtNo" name="htNo">
	</form>
		
<%-- end-container --%>			
</div>
<!-- 배경화면채우기 -->
<script>
 

</script>
<script src="${contextPath}/resources/js/hotel/htres/htResPage.js"></script>
<script type="text/javascript">

	const hotelCal = new CalendarMakeModule(); // 달력만들기 객체
	// hotel list ajax
	const hotelListAjax = new HtListAjaxModule(); 
	
	
	var pageNum = '<c:out value="${pageNum}"/>';
	
	// 화면 시작할때 높은 성급으로 출력
	$(document).ready(function(){
		var pageNum = '<c:out value="${pageNum}"/>';
		displayHighRank(pageNum);
	})

	// 호텔 방목록으로 이동
	$("#hotelList").on("click", "div button.moveHtRoomList", function() {

		//console.log($(this).data('htno'));
		//startDateStr
		//endDateStr
		var htStartDateStr = $("#startDateStr").clone();
		var htEndDateStr = $("#endDateStr").clone();

		$("#idFormMoveHtRooms").append(htStartDateStr);
		$("#idFormMoveHtRooms").append(htEndDateStr);

		$("#idHtNo").val($(this).data('htno'));
		$("#idFormMoveHtRooms").submit();
	});// 이동 버튼 클릭 이벤트

	$("#idBtnSearchHotelList").on("click",function() {
		displayHighRank(pageNum);
	});

	//호텔 등급 높은 순 버튼 클릭 
	$("#displayHighRank").on("click",function(){
		displayHighRank(pageNum);
	}) // end-displayHighRank

	
	

	//호텔 등급 높은 순 	
	function displayHighRank(pageNum){	
		var htAreaCode = $("#htAreaCode").val();
		var htStartDate = $("#startDateStr").val();
		var htEndDate = $("#endDateStr").val();
		var HighRank = 1;

		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (htAreaCode == null || htAreaCode == undefined || htAreaCode.length <= 0) {
			htAreaCode = '서울';
		}// if end

		if (htStartDate == null || htStartDate == undefined || htStartDate.length <= 0) {
			htStartDate = hotelCal.makeDateListString(today);
		}// if end

		if (htEndDate == null || htEndDate == undefined || htEndDate.length <= 0) {
			htEndDate = hotelCal.makeDateListString(nextday);
		}// if end

		$("#startDateStr").val(htStartDate);
		$("#endDateStr").val(htEndDate);

		var sendData = {
			flag : 'desc',
			htAreaCode : htAreaCode,
			htStartDateStr : htStartDate,
			htEndDateStr : htEndDate,
			sqlFlag : HighRank,
			pageNum : pageNum
		};

		// list ajax 
		hotelListAjax.getAjaxListDate(
			sendData,
			function(data) {
				var hotelList = data.hotelList;
				var pageBean = data.pagingCreator;
				
				// list 출력
				$("#hotelList").html(hotelListAjax.getHotelListStr(hotelList));
				$("#paginationPlace").html(hotelListAjax.getHotelListPagingBtnStr(pageBean));
			}// fun end
		)// getAjaxListDate end

		
	}//end - displayHighRank
	
	
	//호텔 등급 낮은 순 버튼 클릭 
	$("#displayLowRank").on("click",function(){

		<%-- 현재 페이징번호 저장 --%>	
		var pageNum = '<c:out value="${pageNum}"/>';	
		displayLowRank(pageNum);		
	})//end - displayLowRank
	
	
	//호텔 등급 낮은 순 버튼 클릭 
	
	function displayLowRank(pageNum){
		

		htAreaCode = $("#htAreaCode").val();
		htStartDate = $("#startDateStr").val();
		htEndDate = $("#endDateStr").val();
		var LowRank = 2;

		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (htAreaCode == null || htAreaCode == undefined || htAreaCode.length <= 0) {
			htAreaCode = '서울';
		}// if end

		if (htStartDate == null || htStartDate == undefined || htStartDate.length <= 0) {
			htStartDate = hotelCal.makeDateListString(today);
		}// if end

		if (htEndDate == null || htEndDate == undefined || htEndDate.length <= 0) {
			htEndDate = hotelCal.makeDateListString(nextday);
		}// if end

		$("#startDateStr").val(htStartDate);
		$("#endDateStr").val(htEndDate);

		var sendData = {
			flag : 'asc',
			htAreaCode : htAreaCode,
			htStartDateStr : htStartDate,
			htEndDateStr : htEndDate,
			sqlFlag : LowRank,
			pageNum : pageNum
		};

		// list ajax 
		hotelListAjax.getAjaxListDate(
			sendData,
			function(data) {
				var hotelList = data.hotelList;
				var pageBean = data.pagingCreator;
				
				// list 출력
				$("#hotelList").html(hotelListAjax.getHotelListStr(hotelList));
				$("#paginationPlace").html(hotelListAjax.getHotelListPagingBtnStr(pageBean));
			}// fun end
		)// getAjaxListDate end
		
		
	}// displayLowRank end
	
	
	
	//호텔 가격 높은 순 버튼 클릭 
	$("#displayHighPrice").on("click",function(){
		<%-- 현재 페이징번호 저장 --%>	
		var pageNum = '<c:out value="${pageNum}"/>';	
		displayHighPrice(pageNum);
	})//end-displayHighPrice
	
	
	function displayHighPrice(pageNum){
		

		htAreaCode = $("#htAreaCode").val();
		htStartDate = $("#startDateStr").val();
		htEndDate = $("#endDateStr").val();
		var highPrice = 1;

		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (htAreaCode == null || htAreaCode == undefined || htAreaCode.length <= 0) {
			htAreaCode = '서울';
		}// if end

		if (htStartDate == null || htStartDate == undefined || htStartDate.length <= 0) {
			htStartDate = hotelCal.makeDateListString(today);
		}// if end

		if (htEndDate == null || htEndDate == undefined || htEndDate.length <= 0) {
			htEndDate = hotelCal.makeDateListString(nextday);
		}// if end

		$("#startDateStr").val(htStartDate);
		$("#endDateStr").val(htEndDate);

		var sendData = {
			flag : 'high',
			htAreaCode : htAreaCode,
			htStartDateStr : htStartDate,
			htEndDateStr : htEndDate,
			sqlFlag : highPrice,
			pageNum : pageNum
		};

		// list ajax 
		hotelListAjax.getAjaxListDate(
			sendData,
			function(data) {
				var hotelList = data.hotelList;
				var pageBean = data.pagingCreator;
				
				// list 출력
				$("#hotelList").html(hotelListAjax.getHotelListStr(hotelList));
				$("#paginationPlace").html(hotelListAjax.getHotelListPagingBtnStr(pageBean));
			}// fun end
		)// getAjaxListDate end
			
	}//end-displayHighPrice
	
	
	//호텔 가격 낮은 순 버튼 클릭 
	$("#displayLowPrice").on("click",function(){

		<%-- 현재 페이징번호 저장 --%>	
		var pageNum = '<c:out value="${pageNum}"/>';
		displayLowPrice(pageNum);
		
	})//end-displayHighPrice
	

	function displayLowPrice(pageNum){
		
		htAreaCode = $("#htAreaCode").val();
		htStartDate = $("#startDateStr").val();
		htEndDate = $("#endDateStr").val();
		var lowPrice = 3;

		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (htAreaCode == null || htAreaCode == undefined || htAreaCode.length <= 0) {
			htAreaCode = '서울';
		}// if end

		if (htStartDate == null || htStartDate == undefined || htStartDate.length <= 0) {
			htStartDate = hotelCal.makeDateListString(today);
		}// if end

		if (htEndDate == null || htEndDate == undefined || htEndDate.length <= 0) {
			htEndDate = hotelCal.makeDateListString(nextday);
		}// if end

		$("#startDateStr").val(htStartDate);
		$("#endDateStr").val(htEndDate);

		var sendData = {
			flag : 'low',
			htAreaCode : htAreaCode,
			htStartDateStr : htStartDate,
			htEndDateStr : htEndDate,
			sqlFlag : lowPrice,
			pageNum : pageNum
		};


		// list ajax 
		hotelListAjax.getAjaxListDate(
			sendData,
			function(data) {
				var hotelList = data.hotelList;
				var pageBean = data.pagingCreator;
				
				// list 출력
				$("#hotelList").html(hotelListAjax.getHotelListStr(hotelList));
				$("#paginationPlace").html(hotelListAjax.getHotelListPagingBtnStr(pageBean));
			}// fun end
		)// getAjaxListDate end
		
	}// displayLowPrice end
	

</script>
	
<%@include file="/WEB-INF/views/include/footer.jsp" %>
    
    
    
    