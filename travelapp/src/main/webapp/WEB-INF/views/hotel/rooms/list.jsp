<%@ include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 2307111244 - 객실 상세 테이블 디자인 (장유정) -->
<style>
 .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
    font-weight: bold;
    color: black;
  }
 .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
    font-weight: bold;
    color: black;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 .active{
      background-color: #cdd5ec;
  }
 .checkInDate {
   display: flex;
    align-items: center;
    width: 300px;
    height: 40px;
    font-weight: bold;
    text-indent: 100px;
    color: black;
   } 
   
.checkOutDate {
   display: flex;
   align-items: center;
   width: 300px;
   height: 40px;
   font-weight: bold;
   text-indent: 100px;
    color: black;
  } 
   
.btn-toolbar{
   text-align: center;
   width:300px;
   margin:auto;      
 	font-weight: bold;
    color: black;
}


</style>


<!-- 2307111244 - 객실 상세 테이블 (장유정) -->
<div class="container position-relative">

	<div class="row">
		<div class="col-12 my-3 mx-2">
			<div class="card border-secondary">
				<h2 class="card-header" style="padding: 5px; font-weight: bold; text-align: center; font-size: x-large;">예약 가능한 객실 검색</h2>
					<div class="row my-3 mx-2">
						<div class="dateWrapper col-5" style="font-weight: bold; color: black; text-align: center;">
							<label for="startDateStr" class="form-label">체크인</label>
							<input type="date" class="form-control" id="startDateStr" name="htStartDateStr" <c:if test ="${not empty hotel.htStartDateStr}"> value="${hotel.htStartDateStr}"</c:if> autocomplete="off"/>
						</div>
						<div class="dateWrapper col-5" style="font-weight: bold; color: black; text-align: center;">
							<label for="endDateStr" class="form-label">체크아웃</label>
							<input type="date" class="form-control" id="endDateStr" name="htEndDateStr"  <c:if test ="${not empty hotel.htEndDateStr}"> value="${hotel.htEndDateStr}"</c:if> autocomplete="off" />
						</div>
						<div class="buttonWrapper col-2" style="margin: auto;"><%--검색버튼 --%>
							<button type="button" id="idBtnSearchRoom" class="btn btn-primary">검색</button>
							<button type="button" id="idBtnHotelList" class="btn btn-primary">호텔목록으로</button>
						</div>
					</div>
					<!-- row end -->

			</div>
			<!-- card end -->
		</div>
		<!-- col end -->
	</div>


    <div class="row" style="text-align: center;">
        <div class="col-lg-12">
            <h1 class="display-5 mt-4 mb-3 bg-pink text-center py-2 rounded" style="color: white; background-color: #ffb6c1; font-weight: bold;  font-size: xx-large;">예약 가능한 객실 목록</h1>
        </div>
    </div>
  <!-- 선택 호텔 정보 조회 -->
<div class="row" style="text-align: center;">
  <div class="col-lg-12">
    <table class="table table-bordered table-striped table-minty">
      <thead>
        <tr>
          <th style="width: 25%; font-weight: bold; color: black;">호텔 이름</th>
          <th style="width: 10%; font-weight: bold; color: black;">등급</th>
        </tr>
      </thead>
	  <tbody>
	  <tr>
	    <td style="border: 1px solid pink; font-weight: bold; color: black;">${hotel.htName}</td>
	    <td style="border: 1px solid pink; font-weight: bold; color: black;">
	      <c:forEach begin="1" end="${hotel.htRank}" var="i">
	        <span class="star" style="color: #FFC31E;">★</span>
	      </c:forEach>
	    </td>
	  </tr>
	  <tr>
	    <td colspan="2" style="border: 1px solid pink; font-weight: bold; color: black;">${hotel.htAddress}</td>
	  </tr>
	</tbody>
    </table>
  </div>
</div>

<!-- 객실 정보 목록 조회 -->    
<div class="row" style="text-align: center;">
	<div id="htRoomList" class="col-12" style="font-weight: bold; style="color:#000000" >
	<fmt:formatNumber value="${room.htRooSellPrice}" pattern="#,###"/>
	</div>
</div>
            

        


<!-- 2307111244 - 객실 목록 페이징 버튼 (장유정) -->
<div class="row" style="text-align: center;">
	<div class="d-none d-md-block" id="paginationRoomList">

	</div>		
</div>






<%---------################################################김가현 리뷰페이지 html#################################################--------%>

<div class="row">

	<!-- 유저의 리뷰 작성 페이지 -->
	<!-- 유저 정보 입력: 작성자인데 로그인한 유저에게서 알아서 정보를 추출해올 수있도록 구현하고싶습니다-->  
	<div class="col-12 mx-2 my-2">
		<div class="row">
		
			<div class="card border-secondary col-12 mb-3">
				<div class="card-header">
					리뷰 작성
				</div>
				
				<div class="card-body">
					<div class="row">
						<strong>[작성자]</strong>
						<div class="col-12">                      
							<input type="text" class="form-control" id="userId" value="${loginUser}" readonly>
						</div><!-- card border class end -->						
					</div>
					<div class="row">
						<!--유저의 별점 평가 입력-->			                      
						<strong>[호텔의 별점을 평가해 주세요]</strong>
						<div style="color: #f3969a;">                                                     		
							<input type="radio" name="reviewStar" value="5" id="rate1"><label
							for="rate1">★★★★★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
							for="rate2">★★★★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3">★★★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
							for="rate4">★★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
							for="rate5">★</label>									 
						</div>					
					</div>
					<div class="row">
						<!--유저의 리뷰 작성칸-->			                   
						<div class="card col-12 my-2">
							<strong>[리뷰 작성 칸]</strong>
							<textarea class="form-control mx-2 my-2" id="exampleTextarea" placeholder="100자 이내의 리뷰를 등록해 주세요" maxlength="100" style="width: 100%; height: 100px;"
							></textarea>
						</div> 						
					</div>

					<div class="row">
						<!-- 리뷰 등록 버튼 -->         
						<div class="regBtn">          
							<button type="button" class="btn btn-outline-secondary" id="registBtn">리뷰 등록</button> 
						</div>
					</div>
					
				</div>
				<!-- card body end -->
			</div>
			<!-- card end -->
			                          
		</div>
		
		<div class="row">
			<div id="commentList">
	
			</div>		
		</div>
		<!-- 리뷰 리스트 -->

		
		
		<div class="row">
			<div class="d-none d-md-block" id="paginationPlace">
	
			</div>		
		</div>
		<!-- 페이징처리 div -->

	</div>
	<!-- col-12 -->
</div>
<!-- row end -->

</div>
<%-- end-container --%>

<form id="idFormHtResData" action="/travelapp/hotel/htres/page" method="get">
	<input type="hidden" id="idInputHtRooNo" name="htRooNo">
	<input type="hidden" id="idCheckIn" name="htStartDateStr">
	<input type="hidden" id="idCheckOut" name="htEndDateStr">
</form>
<script src="${contextPath}/resources/js/hotel/htres/htResPage.js"></script>


<%---------################################################장유정 방상세 script#################################################--------%>
<script>

	var pageNumRoom = 1;
	var htNo = '${hotel.htNo}';
	var htStartDateStr = '${hotel.htStartDateStr}';
	var htEndDateStr = '${hotel.htEndDateStr}';
	var htRooSellPrice = '${room.htRooSellPrice}';


	// hotel rooms ajax
	const htRoomModule = new HtRoomAjaxModule();
	// 달력만들기 객체
	const hotelCal = new CalendarMakeModule(); 

	function number_format(htRooSellPrice){
	    return htRooSellPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	}
	

	// 방 검색 버튼
	$("#idBtnSearchRoom").on("click", function() {
		htStartDateStr = $("#startDateStr").val();
		htEndDateStr = $("#endDateStr").val();
		getRoomListAjax(pageNumRoom);
	});

	// 호텔 목록으로 버튼
	$("#idBtnHotelList").on("click", function() {
		location.href="/travelapp/hotel/list";
	});

	// 방 예약 버튼
	$("#htRoomList").on("click","div button.btnMoveRes",function() {
		var checkIn = $("#startDateStr").val();
		var checkOut = $("#endDateStr").val();
		
		
		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (checkIn == null || checkIn == undefined || checkIn.length <= 0) {
			checkIn = hotelCal.makeDateString(today);
		}// if end

		if (checkOut == null || checkOut == undefined || checkOut.length <= 0) {
			checkOut = hotelCal.makeDateString(nextday);
		}// if end
		
		checkIn = hotelCal.makeDateString(checkIn);
		checkOut = hotelCal.makeDateString(checkOut);
	
		
		//console.log(checkIn);
		//console.log(checkOut);

		$("#idCheckIn").val(checkIn);
		$("#idCheckOut").val(checkOut);
		$("#idInputHtRooNo").val($(this).data('htroono'));

		$('#idFormHtResData').submit();
	});

	//리스트 ajax
	function getRoomListAjax(pageNumRoom){
		
		var today = new Date();
		var nextday = new Date().setDate(today.getDate()+1);

		if (htStartDateStr == null || htStartDateStr == undefined || htStartDateStr.length <= 0) {
			htStartDateStr = hotelCal.makeDateListString(today);
		}// if end

		if (htEndDateStr == null || htEndDateStr == undefined || htEndDateStr.length <= 0) {
			htEndDateStr = hotelCal.makeDateListString(nextday);
		}// if end

		console.log(htStartDateStr);


		console.log(htEndDateStr);

		// ajax로 보낼 js 객체
		sendData = {
			htNo : htNo,
			pageNum : pageNumRoom,
			htStartDateStr : htStartDateStr,
			htEndDateStr : htEndDateStr
		};

		htRoomModule.getAjaxRoomListDate(
			sendData,
			function(data) {
				console.log(data);
				$("#htRoomList").html(htRoomModule.getAjaxRoomListStr(data.htRoomList));
				$("#paginationRoomList").html(htRoomModule.getARoomListPagingBtnStr(data.pagingCreator));
			}
		);
	} //end-getListAjax	

	// 페이징처리를 위한 목록표시 
	function goToPageRoomList(pageNumRoom){
		getRoomListAjax(pageNumRoom);
	}


	$(document).ready(function(){
		getRoomListAjax(pageNumRoom);
	});

</script>
<%---------################################################김가현 리뷰페이지 script#################################################--------%>
<script>
const htRevModule = new HtRevAjaxModule();

//htNo 저장 
var htNo = '<c:out value="${hotel.htNo}"/>';
var pageNumRev = 1;
     
 $('#registBtn').on("click",function() {
 		
 		var exampleTextarea = $('#exampleTextarea').val();
 		var mystar = $('input[name="reviewStar"]:checked').val();
		var userId = $('#userId').val();
		console.log(userId);

		if (userId == null || userId == undefined || userId.length <= 0) {
			alert("로그인해주세요");
			location.href = "/travelapp/login";
			return;
		}

		if (mystar == null || mystar == undefined || mystar.length <= 0) {
			alert("별점을 선택해주세요");
			return;
		}

		if (exampleTextarea == null || exampleTextarea == undefined || exampleTextarea.length <= 0) {
			alert("리뷰 내용을 선택해주세요");
			return;
		}
 		
		// ajax로 보낼 js 객체
 		var sendData = {
 			htRevContents: exampleTextarea,
 			htRevStar: mystar,
 			htNo: htNo,
 			userId: userId
 		};
 		
		htRevModule.registerHtRev(
			sendData,
			function(resultData) {
				if(resultData === '성공') {
 					alert('댓글 등록이 정상적으로 완료되었습니다.');
   					$('#htRevContents').val('');
   					$('#htRevStar').val('');
   					getListAjax(1);
 				} else {
 					alert('댓글 등록이 서버장애로 실패했습니다.');
 				}
			}// func end
		);// registerHtRev end
 		
 });// 댓글등록 이벤트 끝
 

 //리스트 ajax
 function getListAjax(pageNumRev){
	
	// ajax로 보낼 js 객체
	sendData = {
		htNo : htNo,
		pageNum : pageNumRev
	};

	htRevModule.getAjaxRevList(
		sendData,
		function(resultData) {
			console.log(resultData);
			$("#commentList").html(htRevModule.getRevListStr(resultData.htReviewList));
			$("#paginationPlace").html(htRevModule.getHtRevListPagingBtnStr(resultData.pageBean));
		}
	);
 	
 } //end-getListAjax
 
// 페이징처리를 위한 목록표시 
function goToPage(pageNumRev){
	getListAjax(pageNumRev);
}
 //리뷰리스트 처음 호출시 리뷰 전체 표시 
 $(document).ready(function(){
	 
	getListAjax(pageNumRev);

 })
 
 // csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});  
     
 </script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>