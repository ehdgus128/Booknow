<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../include/flyheader.jsp" %>

<%-- 
	230628 임지혁: 노선검색리스트 페이지 레이아웃
	230630: 노선 insert기능(admin으로 이동 예정)
	230706: 예약페이지 연결
	230708: 항공사 리뷰페이지연결
	230709: 노선검색방식 ajax로 전환, 편도/왕복
	230710: 검색scope 시간대
	230712: 항공사마크, 검색scope 좌석등급, 항공사별, 인원수
	230713: 검색scope 가격순 포함, 일반석 특별석 따로 예약
	230715: 메인 병합
--%>

<!-- <style>
	div {border: 1px solid grey;}
</style> -->


<style>
	.pagination {
		margin-top: 20px;
		margin-bottom: 0;
		justify-content: center;
	}
	
	.airlineNm {
		cursor : pointer;
	}
	
	.airlineList div {
		margin-top:5px;
		margin-bottom:5px;
	}
	
	#container {
		text-align:center;
	}

</style>


<div class="container-fluid position-relative">
	<form id="frmSendValue" name="frmSendValue">
		<div class="row">
			<%-- 초기 input,paging 표시 필요 값 --%>
			<input type="hidden" id="pageNum" name="pageNum" value="${airwaysPaging.pageNum }">
			<input type='hidden' id='lastPageNum' name='lastPageNum' value='${airwaysPagingCreator.lastPageNum}'>
			<input type="hidden" id="depAirportNmStr" name="depAirportNmStr" value="${airwaysPaging.depAirportNmStr }"> 
			<input type="hidden" id="arrAirportNmStr" name="arrAirportNmStr" value="${airwaysPaging.arrAirportNmStr }">
			<input type="hidden" id="boundFlag" name="boundFlag" value="${airwaysPaging.boundFlag }">
			<input type="hidden" id="seatFlag" name="seatFlag" value="${airwaysPaging.seatFlag }">
			<input type="hidden" id="sortFlag" name="sortFlag" value="${airwaysPaging.sortFlag }">
			
			<%-- reservation, review로 넘길 값 --%>
			<input type="hidden" id="routeno1" name="routeno1" value="">
			<input type="hidden" id="routeno2" name="routeno2" value="">
			<input type="hidden" id="onewaySeatFlag" name="res_seatFlag" value="">
			<input type="hidden" id="roundSeatFlag" name="res_seatFlag" value="">
			<input type='hidden' id='airlineId' name='airlineId' value=''> <!-- 항공 리뷰페이지 연결URL수정  권태욱 20230707 1423 -->
			
			<div class="tickets-nav d-flex justify-content-center">
				<div class="bg-white col-lg-12 mt-0 mb-0">
					<div class="row">
						
						<div class="col-lg-2 d-flex align-items-center justify-content-center">
							<span class="form-check">
								<input class="form-check-input" type="radio" name="boundOpt" id="onewayOpt" value="onewayFlag">
								<label class="form-check-label" for="onewayOpt">편도&nbsp;&nbsp;</label>
							</span>
							<span class="form-check">
								<input class="form-check-input" type="radio" name="boundOpt" id="roundOpt" value="roundFlag">
								<label class="form-check-label" for="roundOpt">왕복</label>
							</span>
						</div>
					
						<div class="col-lg-10 d-flex align-items-center">
							<div class="form-group d-flex col-lg-2 align-items-center justify-content-left">
								<label for="depAirportSelect" class="form-label mt-2">이륙&nbsp;</label>
								<select class="form-select" id="depAirportSelect" name="depAirportSelect" style="max-width:100px">
									<option value="김포">김포</option>
									<option value="제주">제주</option>
									<option value="인천">인천</option>
									<option value="김해">김해</option>
									<option value="양양">양양</option>
									<option value="광주">광주</option>
									<option value="원주">원주</option>
									<option value="사천">사천</option>
									<option value="울산">울산</option>
									<option value="여수">여수</option>
									<option value="군산">군산</option>
									<option value="포항">포항</option>
									<option value="대구">대구</option>
									<option value="청주">청주</option>
									<option value="무안">무안</option>
								</select>
							</div>
						
							<div class="form-group d-flex col-lg-2 align-items-center justify-content-left">
								<label for="arrAirportSelect" class="form-label mt-2">착륙&nbsp;</label>
								<select class="form-select" id="arrAirportSelect" name="arrAirportSelect" style="max-width:100px">
									<option value="김포">김포</option>
									<option value="제주">제주</option>
									<option value="인천">인천</option>
									<option value="김해">김해</option>
									<option value="양양">양양</option>
									<option value="광주">광주</option>
									<option value="원주">원주</option>
									<option value="사천">사천</option>
									<option value="울산">울산</option>
									<option value="여수">여수</option>
									<option value="군산">군산</option>
									<option value="포항">포항</option>
									<option value="대구">대구</option>
									<option value="청주">청주</option>
									<option value="무안">무안</option>
								</select>
							</div>
								
							<div class="form-group col-lg-3 align-items-center" id="onewayTime">
								<label for="depDate" class="form-label mt-2">출발일&nbsp;</label>
								<input class="form-control" type="hidden" name="depStr" id="depStr"
									   value='<fmt:parseDate value="${airwaysPaging.depPlandTimeStr }" var="depDate" pattern ="yyyy-MM-dd"/>'/>
								<input class="form-control" type="date" name="depDate" id="depDate" style="display:inline;max-width:10rem;"
									   value='<fmt:formatDate value="${depDate }" pattern="yyyy-MM-dd"/>'/>
							</div>
						
							<div class="form-group col-lg-3 align-items-center" id="roundTime" style="display:none">
								<label for="depDateInbound"  class="form-label mt-2">복귀일&nbsp;</label>
								<input class="form-control" type="hidden" name="depStrInbound" id="depStrInbound"
									   value='<fmt:parseDate value="${depPlandTimeStrInbound }" var="depDateInbound" pattern ="yyyy-MM-dd"/>'/>
								<input class="form-control" type="date" name="depDateInbound" id="depDateInbound" style="display:inline;max-width: 10rem;"
									   value='<fmt:formatDate value="${depDateInbound }" pattern="yyyy-MM-dd"/>'/>
							</div>
						
							<div class="form-group d-flex col-lg-2 align-items-center justify-content-center">
								<button type="button" class="btn btn-warning" id="sendDetailBtn">예약하기</button>
							</div>
					
						</div><%-- /.card body end --%>
					</div><%-- /.row end --%>	
				</div><%-- /.card end --%>	
			</div><%-- /.tickets nav end --%>
			
			<div class="leftDiv col-lg-2">
				<div class="accordion" id="airlineChoice">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								항공사 선택
							</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#airlineChoice" style="">
							<div class="accordion-body airlineList">
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="KAL">
									<span class="airlineNm">대한항공</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="AAR">
									<span class="airlineNm">아시아나항공</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="JJA">
									<span class="airlineNm">제주항공</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="JNA">
									<span class="airlineNm">진에어</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="ABL">
									<span class="airlineNm">에어부산</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="ESR">
									<span class="airlineNm">이스타항공</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="HGG">
									<span class="airlineNm">하이에어</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="ASV">
									<span class="airlineNm">에어서울</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="TWB">
									<span class="airlineNm">티웨이항공</span>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" name="airlineCode" value="FGW">
									<span class="airlineNm">플라이강원</span>
								</div>
							</div><%-- /.accordion body end --%>
						</div>
					</div><%-- /.accordion item end --%>
					 
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								좌석 등급
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#airlineChoice" style="">
							<div class="accordion-body">
								<div>
									<span class="form-check">
										<input class="form-check-input" type="radio" name="seatOpt" id="both" value="both">
										<label class="form-check-label" for="prestige">모든 등급</label>
									</span>
									<span class="form-check">
										<input class="form-check-input" type="radio" name="seatOpt" id="economy" value="economy">
										<label class="form-check-label" for="economy">일반석</label>
									</span>
									<span class="form-check">
										<input class="form-check-input" type="radio" name="seatOpt" id="prestige" value="prestige">
										<label class="form-check-label" for="prestige">프리미엄석</label>
									</span>
								</div>
							</div><%-- /.accordion body end --%>
						</div>
					</div><%-- /.accordion item end --%>
					
					<div class="accordion-item"><%-- 인원수 선택 --%>
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="#collapseThree">
								인원 수
							</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#airlineChoice" style="">
							<div class="accordion-body">
								<div id="container">
									<button type="button" class="btn btn-primary btn-sm" id="minus" onclick="cal(-1)">빼기</button>
									<input type="text" id="total" name="total" value="${airwaysPaging.total }" readonly style="width:2rem;height:2rem;">
									<button type="button" class="btn btn-primary btn-sm" id="plus" onclick="cal(1)">더하기</button>
								</div>
							</div><%-- /.accordion body end --%>
						</div>
					</div> <%-- /.accordion item end --%>
					
					<div class="accordion-item"><%-- 정렬 순서 --%>
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="#collapseFour">
								정렬 순서
							</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#airlineChoice" style="">
							<div class="accordion-body">
								<div>
									<span class="form-check">
										<input class="form-check-input" type="radio" name="sortOpt" id="earlier" value="earlier" checked>
										<label class="form-check-label" for="earlier">시간순</label>
									</span>
									<span class="form-check">
										<input class="form-check-input" type="radio" name="sortOpt" id="cheaper" value="cheaper">
										<label class="form-check-label" for="cheaper">가격순</label>
									</span>
								
								</div>
							</div><%-- /.accordion body end --%>
						</div>
					</div> <%-- /.accordion item end --%>
				</div><%-- /.accordion end --%>
				
				<div class="card border-primary mb-3" >
					<div class="card-header bg-primary text-white fs-5">
						출발 시각
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="depMin" class="form-label"><span id="minVal"></span>시 부터</label>
							<input type="range" class="form-range" id="depMin" name="depMin" min="0" max="23" step="1" value="" 
								   oninput="document.getElementById('minVal').innerHTML=this.value;">
								   
							<label for="depMax" class="form-label"><span id="maxVal"></span>시 까지</label>
							<input type="range" class="form-range" id="depMax" name="depMax" min="0" max="23" step="1" value=""
								   oninput="document.getElementById('maxVal').innerHTML=this.value;">
						</div>
					</div>
				</div><%-- /.card border end --%>
				
				<%-- 
				<div class="card border-primary mb-3" >
					<div class="card-header bg-primary text-white fs-5">
						항공노선 Insert
					</div>
					<div class="card-body">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type="text" class="form-control" name="depAirportNmInput" id="depAirportNmInput" placeholder="출발지"><br>
						<input type="text" class="form-control" name="arrAirportNmInput" id="arrAirportNmInput" placeholder="도착지"><br>
						<input type="date" class="form-control" name="depPlandTimeInput" id="depPlandTimeInput"><br>
						<select name="numOfRows" class="form-select" id="numOfRows">
							<option value="10">10</option>
							<option value="50">50</option>
							<option value="100">100</option>
							<option value="150">150</option>
						</select><br>
						<div class="text-end">
							<button type="button" class="btn btn-primary" id="airRouteInsertBtn">Insert!</button><br>
						</div>
					</div>
				</div> --%><%-- /.card border end --%>
				
				
			</div><%-- /.col-lg-2 end --%>
	
			<div class="onewayDiv col-lg-10">	
				<div class="airRouteDiv">	
					<ul class="list-group" id="onewayUl">
						<%-- 편도 노선리스트 --%>
					</ul>
				</div>
				<div id="showOnewayPagingNums">
					<%-- 편도 페이지네이션 --%>
				</div>
			</div>
			
			<div class="roundDiv col-lg-5" style="display:none;">	
				<div class="airRouteDiv">	
					<ul class="list-group" id="roundUl">
						<%-- 왕복 노선리스트 --%>
					</ul>
				</div>
				<div id="showRoundPagingNums">
					<%-- 왕복 페이지네이션 --%>
				</div>
			</div>	
			
		</div><%-- /.row end --%>
	</form>	
</div>


<script type="text/javascript" src="${contextPath }/resources/js/airways/airRouteClsr.js"></script>
<script>

let frmSendValue = $("#frmSendValue");
let boundFlag = $('input[name="boundFlag"]').val(); //onewayFlag or roundFlag
let airlineIdArr = []; //체크된 항공사 담을 배열



let csrfHeaderName = "${_csrf.headerName}";
let csrfToken = "${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken);
});


//230711 인원수 계산
//230712 검색 scope에 인원수 포함해서 ajax 함수 실행
function cal(n) {
	let total = document.getElementById("total");
	let totalVal = parseInt(total.value);
	totalVal += n;
	total.value = totalVal;
	
	if (totalVal < 1) {
		total.value = 1;
	}
	
	if (totalVal > 10) {
		total.value = 10;
	}
	

	showAirRouteList(1);
	
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
}


//항공번호 insert
$("#airRouteInsertBtn").on("click",function(){
	
	frmSendValue.attr("method", "post");
	frmSendValue.attr("action", "${contextPath}/airways/register");
	
	frmSendValue.submit();
	
});



// 검색창 출발/도착지 선택
$('select[name=depAirportSelect]').on("change", function(){
	let depAirportSelect = $(this).val();
	$("#depAirportNmStr").val(depAirportSelect);
	console.log(depAirportSelect);
	
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
});

$('select[name=arrAirportSelect]').on("change", function(){
	let arrAirportSelect = $(this).val();
	$("#arrAirportNmStr").val(arrAirportSelect);
	console.log(arrAirportSelect);
	
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
});



//상세검색조건 변경시 ajax함수 요청
$("#depDate").on("change", function(){
	showAirRouteList(1);
});


$("#depDateInbound").on("change", function(){
	showAirRouteRoundList(1);
});


$("#depMin").on("change", function(){
	
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
});


$("#depMax").on("change", function(){
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
});



//230712 체크된 항공사 검색 scope로 ajax함수 실행

$('input[name="airlineCode"]').on("change", function(){
	airlineIdArr = [];
	let airlineVals = document.getElementsByName("airlineCode");

	airlineVals.forEach(airCode => {
    	if(airCode.checked == true) {
    		airlineIdArr.push(airCode.value);
    	}
    });
    
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
});




//230710 편도노선 ajax
function showAirRouteList(pageNum){
	if (boundFlag == 'onewayFlag') {
		$(".roundDiv").hide();
		$("#roundTime").hide();
		$(".onewayDiv").removeClass("col-lg-5").addClass("col-lg-10");
	}
	
	
	let airwaysPaging = {
							pageNum: pageNum || 1,
							depAirportNmStr: document.getElementById("depAirportNmStr").value,
							arrAirportNmStr: document.getElementById("arrAirportNmStr").value,
							depPlandTimeStr: document.getElementById("depDate").value,
							depMin: document.getElementById("depMin").value,
							depMax: document.getElementById("depMax").value,
							boundFlag: document.getElementById("boundFlag").value,
							total: document.getElementById("total").value,
							seatFlag: document.getElementById("seatFlag").value,
							sortFlag: document.getElementById("sortFlag").value,
							airlineIdArr: airlineIdArr
						};
	
	airRouteClsr.getAirRouteList(
		airwaysPaging,
				
		function(airwaysPagingCreatorAjax) {
	
			let str = '';

				str += '<li class="list-group-item">'
					+  '	<div class="alert alert-dismissible alert-success d-flex justify-content-center mb-0">'
					+  '		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>'
					+  '		<em><strong>' + airwaysPagingCreatorAjax.rowTotal + '</strong>개의 노선이 검색되었습니다</em>'
					+  '	</div>'
					+  '</li>';
			for (let i = 0, len = airwaysPagingCreatorAjax.airRouteList.length; i < len; i++) {
				
				str += '<li class="list-group-item mb-0" data-routeno="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
					+  '	<div class="card bg-light border-success mb-0">';
				str	+= '		<div class="card-header bg-success text-white fs-6 pt-0 pb-0">';
				str += '			<strong><em>' + airwaysPagingCreatorAjax.airRouteList[i].depAirportNm + '&nbsp;</em></strong>출발&nbsp;&nbsp;'
				str	+= '			<strong><em>' + airwaysPagingCreatorAjax.airRouteList[i].arrAirportNm + '&nbsp;</em></strong>도착'
					+  '		</div>'
					+  '		<div class="card-body pt-1 pb-1">'
					+  '			<div class="row mb-1">'
					+  '				<div class="col-lg-2 d-flex align-items-center justify-content-center">'
					+  '					<img src="${contextPath}/resources/img/airlinelogo/' + airwaysPagingCreatorAjax.airRouteList[i].airlineId + '.png"'
					+  '						 style="width:80px;height:20px">'
					+  '				</div>'	
					+  '				<div class="col-lg-4 d-flex align-items-center justify-content-center">';
				str	+= '					<small>' + airRouteClsr.airlineIdtoNm(airwaysPagingCreatorAjax.airRouteList[i].airlineId) + '&nbsp;'
					+  '						   ' + airwaysPagingCreatorAjax.airRouteList[i].vihicleId
					+  '					</small>'
					+  '				</div>'
					+  '				<div class="col-lg-6 d-flex align-items-center justify-content-center">'
					+  '					<strong>';
				str	+= '						' + airwaysPagingCreatorAjax.airRouteList[i].depAirportNm 
					+  '					 	' + airRouteClsr.showTime(airwaysPagingCreatorAjax.airRouteList[i].depPlandTime)
					+  '					</strong>&nbsp;';
				if (airwaysPagingCreatorAjax.airRouteList[i].hh != 0) {
				str	+= '					<small>'
					+  '						' + airwaysPagingCreatorAjax.airRouteList[i].hh + ':'
					+  '					</small>';
				}	
				if (airwaysPagingCreatorAjax.airRouteList[i].mm != 0) {
				str	+= '					<small>'
					+  '						' + airwaysPagingCreatorAjax.airRouteList[i].mm
					+  '					</small>';
				}	
				str	+= '					&nbsp;<strong>';
				str	+= '						' +  airwaysPagingCreatorAjax.airRouteList[i].arrAirportNm
					+  '					 	' + airRouteClsr.showTime(airwaysPagingCreatorAjax.airRouteList[i].arrPlandTime)
					+  '					</strong>'
					+  '				</div>';
				str	+= '			</div>';
				str += '			<div class="row">';
				if (airwaysPagingCreatorAjax.airRouteList[i].eseatCnt != 0) {
				str	+= '				<div class="col-lg-6 d-flex align-items-center justify-content-left">';
				str += '					일반석: ' + airwaysPagingCreatorAjax.airRouteList[i].economyCharge + '원';
				str += '					&nbsp;잔여: ' + airwaysPagingCreatorAjax.airRouteList[i].eseatCnt + '석';
				str += '					<span>&nbsp;'
					+  '						<input class="form-check-input" type="radio" name="onewayno" data-onewayseat="economy" id="e_onewayno' + i + '"'
					+  '							   value="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
					+  '					</span>'; 
				str	+= '				</div>';
				}
				if (airwaysPagingCreatorAjax.airRouteList[i].pseatCnt != 0) {
				str	+= '				<div class="col-lg-6 d-flex align-items-center justify-content-left">';
				str += '					특별석: ' + airwaysPagingCreatorAjax.airRouteList[i].prestigeCharge + '원';	
				str += '					&nbsp;잔여: ' + airwaysPagingCreatorAjax.airRouteList[i].pseatCnt + '석';	
				str += '					<span>&nbsp;'
					+  '						<input class="form-check-input" type="radio" name="onewayno" data-onewayseat="prestige" id="p_onewayno' + i + '"'
					+  '							   value="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
					+  '					</span>'; 
				str	+= '				</div>';
				}
				str	+= '			</div>'
					+  '		</div>'
					+  '	</div>'	
					+  '</li>';
				
				
			}
		
			$("#onewayUl").html(str);
			
			$("#showOnewayPagingNums").html(
									  		showPagingNums(airwaysPagingCreatorAjax.rowTotal,
						   				 				   airwaysPagingCreatorAjax.airwaysPaging.pageNum,
								 				 	 	   airwaysPagingCreatorAjax.airwaysPaging.numOfRows)
								 		   );
					
		});	
}


//230710 왕복노선 ajax
function showAirRouteRoundList(pageNum){
	if (boundFlag == 'roundFlag') {
		$(".roundDiv").show();
		$("#roundTime").show();
		$(".onewayDiv").removeClass("col-lg-10").addClass("col-lg-5");
	}	
	
		
	let airwaysPaging = {
							pageNum: pageNum || 1,
							depAirportNmStr: document.getElementById("arrAirportNmStr").value,
							arrAirportNmStr: document.getElementById("depAirportNmStr").value,
							depPlandTimeStr: document.getElementById("depDateInbound").value,
							depMin: document.getElementById("depMin").value,
							depMax: document.getElementById("depMax").value,
							boundFlag: document.getElementById("boundFlag").value,
							total: document.getElementById("total").value,
							seatFlag: document.getElementById("seatFlag").value,
							sortFlag: document.getElementById("sortFlag").value,
							airlineIdArr: airlineIdArr
						};
    
	airRouteClsr.getAirRouteList(
		airwaysPaging,
		
		function(airwaysPagingCreatorAjax) {
	
			let str = '';
			
			str += '<li class="list-group-item">'
				+  '	<div class="alert alert-dismissible alert-info d-flex justify-content-center mb-0">'
				+  '		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>'
				+  '		<em><strong>' + airwaysPagingCreatorAjax.rowTotal + '</strong>개의 노선이 검색되었습니다</em>'
				+  '	</div>'
				+  '</li>';
		for (let i = 0, len = airwaysPagingCreatorAjax.airRouteList.length; i < len; i++) {
						
			str += '<li class="list-group-item mb-0" data-routeno="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
			+  '	<div class="card bg-light border-info mb-0">';
			str	+= '		<div class="card-header bg-info text-white fs-6 pt-0 pb-0">';
			str += '			<strong><em>' + airwaysPagingCreatorAjax.airRouteList[i].depAirportNm + '&nbsp;</em></strong>출발&nbsp;&nbsp;'
			str	+= '			<strong><em>' + airwaysPagingCreatorAjax.airRouteList[i].arrAirportNm + '&nbsp;</em></strong>도착'
				+  '		</div>'
				+  '		<div class="card-body pt-1 pb-1">'
				+  '			<div class="row mb-1">'
				+  '				<div class="col-lg-2 d-flex align-items-center justify-content-center">'
				+  '					<img src="${contextPath}/resources/img/airlinelogo/' + airwaysPagingCreatorAjax.airRouteList[i].airlineId + '.png"'
				+  '						 style="width:80px;height:20px">'
				+  '				</div>'	
				+  '				<div class="col-lg-4 d-flex align-items-center justify-content-center">';
			str	+= '					<small>' + airRouteClsr.airlineIdtoNm(airwaysPagingCreatorAjax.airRouteList[i].airlineId) + '&nbsp;'
				+  '						   ' + airwaysPagingCreatorAjax.airRouteList[i].vihicleId
				+  '					</small>'
				+  '				</div>'
				+  '				<div class="col-lg-6 d-flex align-items-center justify-content-center">'
				+  '					<strong>';
			str	+= '						' + airwaysPagingCreatorAjax.airRouteList[i].depAirportNm 
				+  '					 	' + airRouteClsr.showTime(airwaysPagingCreatorAjax.airRouteList[i].depPlandTime)
				+  '					</strong>&nbsp;';
			if (airwaysPagingCreatorAjax.airRouteList[i].hh != 0) {
			str	+= '					<small>'
				+  '						' + airwaysPagingCreatorAjax.airRouteList[i].hh + ':'
				+  '					</small>';
			}	
			if (airwaysPagingCreatorAjax.airRouteList[i].mm != 0) {
			str	+= '					<small>'
				+  '						' + airwaysPagingCreatorAjax.airRouteList[i].mm
				+  '					</small>';
			}	
			str	+= '					&nbsp;<strong>';
			str	+= '						' +  airwaysPagingCreatorAjax.airRouteList[i].arrAirportNm
				+  '					 	' + airRouteClsr.showTime(airwaysPagingCreatorAjax.airRouteList[i].arrPlandTime)
				+  '					</strong>'
				+  '				</div>';
			str	+= '			</div>';
			str += '			<div class="row">';
			if (airwaysPagingCreatorAjax.airRouteList[i].eseatCnt != 0) {
			str	+= '				<div class="col-lg-6 d-flex align-items-center justify-content-left">';
			str += '					일반석: ' + airwaysPagingCreatorAjax.airRouteList[i].economyCharge + '원';
			str += '					&nbsp;잔여: ' + airwaysPagingCreatorAjax.airRouteList[i].eseatCnt + '석';
			str += '					<span>&nbsp;'
				+  '						<input class="form-check-input" type="radio" name="roundno" data-roundseat="economy" id="e_roundno' + i + '"'
				+  '							   value="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
				+  '					</span>';  
			str	+= '				</div>';
			}
			if (airwaysPagingCreatorAjax.airRouteList[i].pseatCnt != 0) {
			str	+= '				<div class="col-lg-6 d-flex align-items-center justify-content-left">';
			str += '					특별석: ' + airwaysPagingCreatorAjax.airRouteList[i].prestigeCharge + '원';	
			str += '					&nbsp;잔여: ' + airwaysPagingCreatorAjax.airRouteList[i].pseatCnt + '석';	
			str += '					<span>&nbsp;'
				+  '						<input class="form-check-input" type="radio" name="roundno" data-roundseat="prestige" id="p_roundno' + i + '"'
				+  '							   value="' + airwaysPagingCreatorAjax.airRouteList[i].airRouteno + '">'
				+  '					</span>'; 
			str	+= '				</div>';
			}
			str	+= '			</div>'
				+  '		</div>'
				+  '	</div>'	
				+  '</li>';
			
		}
				
			$("#roundUl").html(str);
				
			$("#showRoundPagingNums").html(
											showPagingNums(airwaysPagingCreatorAjax.rowTotal,
														   airwaysPagingCreatorAjax.airwaysPaging.pageNum,
														   airwaysPagingCreatorAjax.airwaysPaging.numOfRows)
					   				 	  );
				
		
		});	
	
}


function showPagingNums(rowTotal, pageNum, numOfRows) {
	let pagingNumCnt = 10;
	let endPagingNum = Math.ceil(pageNum / pagingNumCnt * 1.0) * pagingNumCnt; 
	let startPagingNum = endPagingNum - (pagingNumCnt - 1);
	
	let lastPageNum = Math.ceil(rowTotal * 1.0 / numOfRows);
	
	if(lastPageNum < endPagingNum) {
		endPagingNum = lastPageNum;
	}
	
	let prev = startPagingNum > 1;
	let next = endPagingNum < lastPageNum;
	
	var str  = '<ul class="pagination pagination-md" >' ;
	
	if(prev) {
	   //맨 앞으로
	   str += '    <li class="page-item" >'
	       +  '         <a class="page-link" href="1" >'
	       +  '             <span aria-hidden="true" >&laquo;</span>'
	       +  '         </a>'
	       +  '    </li>' ;
	   //이전 페이지    
	   str += '    <li class="page-item" >'
	       +  '         <a class="page-link" href="' + (startPagingNum - 1) + '" >'
	       +  '             <span aria-hidden="true" >이전</span>'
	       +  '         </a>'
	       +  '    </li>' ;
	}
	       
	for(let i = startPagingNum ; i <= endPagingNum ; i++){
		
		let active = ((pageNum == i) ? "active" : "" );
	      
		str +='     <li class="page-item ' + active + '">'
			+ '         <a class="page-link" href="' + i + '" >'
	        + '             <span aria-hidden="true" >' + i + '</span>'
	        + '         </a>'
	        + '     </li>' ;
	}
	   
	if(next) {
	   //다음 페이지
	   str += '    <li class="page-item" >'
	       +  '         <a class="page-link" href="' + (endPagingNum + 1) + '" >'
	       +  '             <span aria-hidden="true" >다음</span>'
	       +  '         </a>'
	       +  '    </li>' ;
	   //맨마지막으로     
	   str += '    <li class="page-item" >'
	       +  '         <a class="page-link" href="' + lastPageNum + '" >'
	       +  '             <span aria-hidden="true" >&raquo;</span>'
	       +  '         </a>'
	       +  '    </li>' ;
	       
	   str += '</ul>' ;
	   
	}
	
	return str;
	
} 


<%-- 선택된 페이징 번호의 게시물 목록 가져오는 함수: 이벤트 전파 이용 --%>
$("#showOnewayPagingNums").on("click", "ul li a", function(e){
	e.preventDefault();
	
	let targetPageNum = $(this).attr("href");
	showAirRouteList(targetPageNum);
});



<%-- 선택된 페이징 번호의 게시물 목록 가져오는 함수: 이벤트 전파 이용 --%>
$("#showRoundPagingNums").on("click", "ul li a", function(e){
	e.preventDefault();
	
	let targetPageNum = $(this).attr("href");
	showAirRouteRoundList(targetPageNum);
});



//230707 항공사 리뷰페이지 연결
//항공 리뷰페이지 연결URL수정  권태욱 20230707 1423
$('.airlineNm').on("click",function(){
	let airlineId = $(this).prev("input").val();
	console.log("airlineId:" + airlineId);
	
	$('input[name="airlineId"]').val(airlineId);
	frmSendValue.attr("method", "get");
	frmSendValue.attr("action", "${contextPath}/review/airline/list");
	frmSendValue.submit();
	
});



//230715 편도/왕복 change
$('input[name="boundOpt"]').on("change", function(){
	
	boundFlag = $(this).val();
	
	$('input[name="boundFlag"]').val(boundFlag);
	console.log(boundFlag);
	
	showAirRouteList(1);
	
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
	
	
});



//230712 좌석등급 체크
$('input[name="seatOpt"]').on("change", function(){
	let seatOpt = $(this).val();
	
	$('input[name="seatFlag"]').val(seatOpt);
	console.log(seatOpt);
	
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}

	
});



//230713 정렬순서 체크
$('input[name="sortOpt"]').on("change", function(){
	let sortOpt = $(this).val();
	
	$('input[name="sortFlag"]').val(sortOpt);
	console.log(sortOpt);
	
	
	showAirRouteList(1);
	if (boundFlag == 'roundFlag') {
		showAirRouteRoundList(1);
	}
	
});


// 230713: 편도/왕복 좌석등급 배열에 담기
let seatFlagArr = new Array(2);
$(document).on('click', 'input[name="onewayno"]', function(){
	
	let onewaySeat = $(this).data('onewayseat');
	console.log(onewaySeat);
	seatFlagArr.splice(0, 1, onewaySeat);
	
	console.log(seatFlagArr);
});


$(document).on('click', 'input[name="roundno"]', function(){
	
	let roundSeat = $(this).data('roundseat');
	console.log(roundSeat);
	seatFlagArr.splice(1, 1, roundSeat);
	
	console.log(seatFlagArr);
});


//230630 노선번호 detail로 보내기
//230703 왕복 노선번호 /airways/book으로 보내기
$(document).on("click", "#sendDetailBtn", function(){
	
	let onewaySeatFlag = seatFlagArr[0];
	$("#onewaySeatFlag").val(onewaySeatFlag);
	
	let roundSeatFlag = seatFlagArr[1];
	$("#roundSeatFlag").val(roundSeatFlag);
	
	
	 if (boundFlag == 'onewayFlag') {
		
		if (!$('input[name="onewayno"]').is(":checked")) {
			alert('예약하실 항공 노선을 선택해주세요');
			return;
		} else {
			
			let routeno1 = $('input[name="onewayno"]:checked').val();
			$('input[name="routeno1"]').val(routeno1);

		}
	
	} else {
		
		if (!$('input[name="onewayno"]').is(":checked") || !$('input[name="roundno"]').is(":checked")) {
			alert('예약하실 항공 노선을 선택해주세요');
			return;
			
		} else {
			
			let routeno1 = $('input[name="onewayno"]:checked').val();
			let routeno2 = $('input[name="roundno"]:checked').val();
			$('input[name="routeno1"]').val(routeno1);
			$('input[name="routeno2"]').val(routeno2); 
			
		}	
	} 
	 
   
	frmSendValue.attr("method", "get");
	frmSendValue.attr("action", "${contextPath}/airways/book");
   
	frmSendValue.submit();

   
});   



$(function() {
	
	console.log(boundFlag);
	let seatFlag = document.getElementById("seatFlag").value;
	
	
	if (seatFlag == 'both') {
		$("#both").attr("checked", true);
	} else if (seatFlag == 'economy') {
		$("#economy").attr("checked", true);
	} else {
		$("#prestige").attr("checked", true);
	}
	
	
	//출발지 검색창 표시
	let depAirportSelect = document.getElementById("depAirportNmStr").value;
	$("#depAirportSelect").val(depAirportSelect);
	
	//도착지 검색창 표시
	let arrAirportSelect = document.getElementById("arrAirportNmStr").value;
	$("#arrAirportSelect").val(arrAirportSelect);
	
	$("#depMin").val("06");
	$("#minVal").text("06");
	$("#depMax").val("23");
	$("#maxVal").text("23");
	
	$("#onewayOpt").prop('checked', true);
	showAirRouteList(1);
	
	
	if (boundFlag == 'roundFlag') {
		$(".onewayDiv").removeClass("col-lg-10").addClass("col-lg-5");
		$("#roundOpt").prop('checked', true);
		$("#roundTime").show();
		
		showAirRouteRoundList(1);
	}
	
});


</script>


<%@include file="../include/footer.jsp" %>