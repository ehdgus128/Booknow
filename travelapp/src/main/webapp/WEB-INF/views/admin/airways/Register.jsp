<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">
	<div class="row">
		<h1 class="page-header">항공상품입력</h1>
	</div>
	<form class= "frmSubmitValue" method="post" action="${contextPath }/admin/airways/Register" >
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		 <input type="hidden" name="airLinenm" id="airLinenm" value="" >
		 <input type="hidden" name="buyflag" id="buyflag" value=1>
	<!-- 	 <input type="hidden" name="airRouteno" id="airRouteno" value="0"> -->
	<div>
		<div>
				<table class="table table-striped table-bordered table-hover" id="tableN" name="tableN">
					<thead>
			            <th>항공사</th>
			            <th>출발공항</th>
			            <th>도착공항</th>
			            <th>출발시간</th>
			            <th>도착시간</th>
			            <th>노선이름</th>
			            <th>이코노미가격</th>
			            <th>퍼스트가격</th>
			            <th>이코노미좌석수</th>
			            <th>퍼스트좌석수</th>
					</thead>
					<tbody>
					<tr>
						<td>
							<select class="form-control" id="airLineId" name="airLineId">
								<option value="KAL">대한항공</option>
								<option value="AAR">아시아나항공</option>
								<option value="JJA">제주항공</option>
								<option value="JNA">진에어</option>
								<option value="ABL">에어부산</option>
								<option value="ESR">이스타항공</option>
								<option value="HGG">하이에어</option>
								<option value="ASV">에어서울</option>
								<option value="FGW">플라이강원</option>
								<option value="TWB">티웨이항공</option>
							</select>
						</td>
						<td>
							<select class="form-control" id ="depAirportnm" name="depAirportnm">
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
						</td>
						<td>
							<select class="form-control" id="arrAirportnm" name="arrAirportnm">
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
						</td>
						<td>
							<input type="datetime-local" id="depPland" name="depPland">
							<input type='hidden' name='depPlandTime' id='depPlandTime' value="">
						</td>
						<td>
							<input type="datetime-local" id="arrPland" name="arrPland">
							<input type='hidden' name='arrPlandTime' id='arrPlandTime' value="">
						</td>
						<td>
							<input type="text" id="vihicleId" name="vihicleId" style="width: 100px">
						</td>
						<td>
							<input type="number" id="economyCharge" name="economyCharge" style="width: 150px" value=0>
						</td>
						<td>
							<input type="number" id="prestigeCharge" name="prestigeCharge" style="width: 150px" value=0>
						</td>
						<td>
							<input type="number" id="eSeatCnt" name="eSeatCnt" style="width: 50px" value=0>
						</td>
						<td>
							<input type="number" id="pSeatCnt" name="pSeatCnt" style="width: 50px" value=0>
						</td>
					</tr>
					</tbody>
				</table>
				<input type="hidden" id="airTotalSeat" name="airTotalSeat" value="">
				<input type="hidden" id="airRouteBuyPrice" name="airRouteBuyPrice" value="">
				
			</div>
			
			<!-- 	<span>총 좌석수:<input type="text" id="totalSeat" name = "totalSeat" readonly="readonly" value=0></span>
				<span>구매가격:<input type="text" id="airRouteBuyPrice" name = "airRouteBuyPrice" readonly="readonly" value=0></span> -->
				<button type="button" class="pull-right airpurchasSubmit">등록</button>
				<button type="button" class="movePurcha">취소</button>
				
		</div>	
	</form>
</div>
<script>
let frmSubmitValue = $(".frmSubmitValue");

$(".airpurchasSubmit").on("click",function(){
	let depAirportnm = $("#depAirportnm").val();
	let arrAirportnm = $("#arrAirportnm").val();
	let vihicleId = $("#vihicleId").val();
	let economyCharge = $("#economyCharge").val();
	let prestigeCharge = $("#prestigeCharge").val();
	let eSeatCnt = $("#eSeatCnt").val();
	let pSeatCnt = $("#pSeatCnt").val();
	
	let depPland = new Date($("#depPland").val()).toISOString().replace("T"," ").slice(0, -5);
	let arrPland = new Date($("#arrPland").val()).toISOString().replace("T"," ").slice(0, -5);
	
	let depPlandTime = $("#depPlandTime").val(depPland);
	let arrPlandTime = $("#arrPlandTime").val(arrPland);

	let airTotalSeat = (1*eSeatCnt) + (1*pSeatCnt) ;
	let airRouteBuyPrice = (economyCharge * 0.5) * eSeatCnt + (prestigeCharge * 0.5) * pSeatCnt;
	
	$("#airTotalSeat").val(airTotalSeat);
	$("#airRouteBuyPrice").val(airRouteBuyPrice);

	if(depAirportnm == arrAirportnm){
		alert("출발공항과 도착공항이 같습니다.");
		return;
	}
	
	if(vihicleId == "" || vihicleId == null || vihicleId.length == 0 ){
		alert("노선이름을 입력해주세요.");
		return;
	}
	
	if(economyCharge <= 0 ){
		alert("이코노미가격을 입력해 주세요.");
		return;
	}
	
	if(eSeatCnt <= 0){
		alert("이코노미 좌석수를 입력해 주세요.");
		return;
	}
	
	if(prestigeCharge > 0){
		if(prestigeCharge > economyCharge){
			if(pSeatCnt <= 0 ){
				alert("퍼스트 좌석수를 입력해주세요.");
				return;
			}
		}else{
			alert("이코노미 가격보다 작습니다");
		}
	}
	
	frmSubmitValue.submit(); 

});

$(".movePurcha").on("click",function(){
	
	frmSubmitValue.attr("action","${contextPath}/admin/airways/airpurchas");
	frmSubmitValue.attr("method","get");
	
	frmSubmitValue.submit(); 
	
});







</script>



<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>