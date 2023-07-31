<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 <sec:authentication property="principal" var="principal"/>
 


<%@include file="../include/flyheader.jsp" %>

<!-- 230628 1446 동현 작성 -->
<div class="container-fluid position-relative">
	<div class="page-header">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="text-info text-light" id="pageHeader">예약상세페이지</h3>
			</div>
		</div>
	</div>
	
	<h5 class="text-info text-light">선택한 항공편 정보</h5>
	
	
	
	<table class="table table-hover">
		<thead style="text-align: center;">
			<tr class="table-info">
				<th>가는편 / 오는편</th>
				<th>항공사</th>
				<th>노선번호</th>
				<th>출발공항</th>
				<th>도착공항</th>
				<th>출발날짜 / 출발시간</th>
				<th>도착날짜 / 도착시간</th>
				<th>좌석등급</th>
				<th>요청 좌석</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:choose>
				<c:when test="${roundFlag}">
					<tr class="text-secondary-emphasis">
						<td>가는편</td>
						<td>${twowayRes1.get(0).airlineNm}</td>
						<td>${twowayRes1.get(0).vihicleId}</td>
						<td>${twowayRes1.get(0).depAirportNm}</td>
						<td>${twowayRes1.get(0).arrAirportNm}</td>
						<td><fmt:formatDate value="${twowayRes1.get(0).depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td><fmt:formatDate value="${twowayRes1.get(0).arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td>${airClass.get(0)}</td>
						<td>${peopleCnt}</td>
					</tr>
					
					<tr>
						<td>오는편</td>
						<td>${twowayRes2.get(0).airlineNm}</td>
						<td>${twowayRes2.get(0).vihicleId}</td>
						<td>${twowayRes2.get(0).depAirportNm}</td>
						<td>${twowayRes2.get(0).arrAirportNm}</td>
						<td><fmt:formatDate value="${twowayRes2.get(0).depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td><fmt:formatDate value="${twowayRes2.get(0).arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td>${airClass.get(1)}</td>
						<td>${peopleCnt}</td>
					</tr>
				
				</c:when>
				<c:otherwise>
					<tr>
						<td>편도</td>
						<td>${onewayRes.get(0).airlineNm}</td>
						<td>${onewayRes.get(0).vihicleId}</td>
						<td>${onewayRes.get(0).depAirportNm}</td>
						<td>${onewayRes.get(0).arrAirportNm}</td>
						<td><fmt:formatDate value="${onewayRes.get(0).depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td><fmt:formatDate value="${onewayRes.get(0).arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
						<td>${airClass.get(0)}</td>
						<td>${peopleCnt}</td>
					</tr>
				</c:otherwise>
			</c:choose>
		
		</tbody>
	</table>
	
	<div style="text-align: center;">
		<div class="card">
			<p class="text-danger">! 유의사항</p>
			
			<p class="text-info text-primary-emphasis">
				항공권 예약완료 후 즉시결제하지 않으시면 예약은 자동취소됩니다.<br>
				상단의 선택하신 항공 여정을 다시 한번 확인해주시기 바랍니다.<br>
				예약 후 이름/스케쥴/항공사/인원 변경은 불가하며 취소 후 재예약하셔야 합니다.<br>
				취소 후 재예약 시 좌석이 없을 수도 있으니, 가는편과 오는편의 시간을 정확히 확인해주시기 바랍니다.<br>
				왕복 예약시 카드정보를 한번만 입력하셔도 됩니다.<br>
				(승인은 가는편/오는편 각각 진행이 되므로 결제 후 정상승인여부를 꼭 확인해주시기 바랍니다.)<br>
				결제 시 여행사 발권업무 대행수수료 1인당 편도 1,000원이 항공권 금액과 별도로 추가 승인됩니다.<br>
				하단의 항공사 주의사항을 꼭 확인해주시기 바랍니다.<br>
				항공권 결제는 신용/체크카드로만 결제가 가능합니다. (현금결제 불가)<br>
				여행사 법인카드, 여행사 임직원카드는 사용불가하며, 문제발생 시 법적인 책임소지가 따릅니다.<br>
				항공권은 항공사 사정 및 천재지변으로 인하여 시간변경 또는 결항될 수 있습니다.<br>
				취소 시 여행사취소수수료 1인당 편도 1,000원이 부과될 수 있으며 취소수수료 추가결제 후 항공권 취소가 완료됩니다. (당일 취소시 취소수수료 면제)
			</p>
		</div>
	</div>
	
	<hr>
	<!-- 
	<h5 class="text-info text-light">예약자 정보</h5> -->
	<!-- 예약자 정보 표시(현재 로그인한 user의 정보) -->
	<table class="table table-hover">
	    <thead style="text-align: center;">
	        <tr class="table-info">
	            <th scope="row">예약자 이름</th>
	            <th>예약자 Email</th>
	            <th>예약자 전화번호</th>
	            <th>예약자 생년월일</th>
	        </tr>
	    </thead>
	    <tbody style="text-align: center;">
	    	<tr>
	    		<td>${userInfo.get(0).userName}</td>
	    		<td>${userInfo.get(0).userEmail}</td>
	    		<td>${userInfo.get(0).userPhoneNumber}</td>
	    		<td><fmt:formatDate value="${userInfo.get(0).userBday}" pattern="yyyy/MM/dd"/></td>
	    	</tr>
	    </tbody>
	</table>
	
	<hr>
	
	<div class="card px-2 py-2">
	
		<h5 class="text-info text-primary-emphasis my-2">탑승자 정보 입력</h5>
		<hr>
		
		
		<!-- 탑승객 정보 입력칸 -->
		
		<div style="text-align: center;">
			
			<form id="frmSendValue" method="post" action="${contextPath}/airways/payment">
				<input type="hidden" name="airResno1" value="${airResno1}">
				<input type="hidden" name="airResno2" value="${airResno2}">
				<input type="hidden" name="roundFlag" value="${roundFlag}">
				<input type="hidden" name="peopleCnt" value="${peopleCnt}">
				<input type="hidden" name="airClass1" value="${airClass.get(0)}">
				<input type="hidden" name="airClass2" value="${airClass.get(1)}">
				<input type="hidden" name="userId" value="${principal.username}">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<c:forEach var="i" begin="0" end="${peopleCnt-1}">
					<div>
						<div style="display: inline-block;">
							<p class="text-info text-primary-emphasis">탑승객 이름 : <input type="text" id="airPasName${i}" name="airPassengersList[${i}].airPasName"></p>
						</div>
						<div style="display: inline-block;">
							<p class="text-info text-primary-emphasis">탑승객 성별 : 
								<select id="airPasGender" name="airPassengersList[${i}].airPasGender">
									<option value="male" >남자</option>
									<option value="female">여자</option>
								</select>
							</p>
						</div >
						<div style="display: inline-block;">
							<p class="text-info text-primary-emphasis">탑승객 생년월일 : 
								<input type="date" id="airPasBdate${i}" name="airPassengersList[${i}].airPasBDate"></p>
						</div>
						<div style="display: inline-block;">
							<p class="text-info text-primary-emphasis">탑승객 국적 : 
								<select id="airPasNation" name="airPassengersList[${i}].airPasNation">
									<option value="KOR">대한민국</option>
									<option value="USA">미국</option>
									<option value="JAP">일본</option>
									<option value="CHN">중국</option>
									<option value="AUT">호주</option>
									<option value="RUS">러시아</option>
									<option value="GAN">가나</option>
									<option value="GRS">그리스</option>
									<option value="NAJ">나이지리아</option>
									<option value="NAM">남아프리카 공화국</option>
									<option value="NEP">네팔</option>
									<option value="NOR">노르웨이</option>
									<option value="NUL">뉴질랜드</option>
									<option value="DEN">덴마크</option>
									<option value="GER">독일</option>
									<option value="RAO">라오스</option>
									<option value="MEX">멕시코</option>
									<option value="MOR">모로코</option>
									<option value="VET">베트남</option>
									<option value="BEL">벨기에</option>
									<option value="BRZ">브라질</option>
									<option value="SWS">스위스</option>
									<option value="ARG">아르헨티나</option>
									<option value="ENG">영국</option>
									<option value="EGT">이집트</option>
									<option value="IND">인도</option>
									<option value="IDN">인도네시아</option>
									<option value="CBD">캄보디아</option>
									<option value="TAL">태국</option>
									<option value="POL">폴란드</option>
									<option value="POR">포르투갈</option>
									<option value="FRC">프랑스</option>
									<option value="PHP">필리핀</option>
									<option value="HNG">헝가리</option>
								</select>
							</p>
						</div>
						<div style="display: inline-block;">
							<p class="text-info text-primary-emphasis">할인조건 : 
								<select id="airDiscntRate" name="airPassengersList[${i}].airDisCntRate">
									<option value="1">해당 없음</option>
									<option value="0.9">(10%할인)-65세 이상 노인</option>
									<option value="0.9">(10%할인)-13~22세 청소년</option>
									<option value="0.5">(50%할인)-기초생활수급자</option>
									<option value="0.6">(40%할인)-1~4급 장애인, 장애의 정도가 심한 장애인(중증)</option>
									<option value="0.6">(40%할인)-1~3급 장애인의 동반자 1인, 장애의 정도가 심한 장애인(중증)의 동반 보호자 1인</option>
									<option value="0.6">(40%할인)-5.18민주유공 부상자 본인</option>
									<option value="0.6">(40%할인)-국가유공상이자</option>
									<option value="0.6">(40%할인)-국가유공자 본인 및 유족</option>
									<option value="0.6">(40%할인)-독립유공자 본인</option>
									<option value="0.6">(40%할인)-독립유공자 동반 1인</option>
									<option value="0.7">(30%할인)-5~6급 장애인 본인</option>
								</select>
							</p>
						</div>
					</div>
					<br>
					<hr>
				</c:forEach>
				
				<div style="text-align: center;">
					<p class="text-danger text-danger">!! 탑승자 입력 시 유의사항</p>
					
					<p class="text-info text-primary-emphasis">
						탑승자명 기입 시 실제 탑승하는 사람의 신분증상 이름,국적, 생년월일을 정확하게 기입하셔야 합니다.<br>
						(시민권자/외국인 : 여권상의 영문성함, 내국인 : 한글성함)<br>
						탑승자 이름과 신분증상의 이름이 다를경우 탑승이 거절될 수 있습니다.<br>
						항공권은 타인에게 양도가 불가하며, 탑승자 이름 오기입시 수정이 불가하오니 작성 후 다시한번 확인하시기 바랍니다.<br>
						모든 항공사는 정상운임을 기준으로 한 할인운임이 일부 제공되며, 신분할인과 이중으로 적용한 중복할인은 불가합니다.
					</p>
				</div>
			
			</form>
		</div>
		
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary" id="paymentPageBtn" onclick="sendValueTest();">
				결제페이지로 이동
			</button>
		</div>
	</div>

</div>



<script>

	var peopleCnt = ${peopleCnt} ;
	
	//탑승객 이름 / 생년월일 유효성검사
	function checkPasInput() {
		
		var regex = /^[가-힣]{2,4}$/;
		
		for(var i = 0; i < peopleCnt; i++){
			
			var airPasNameInput = document.getElementById("airPasName"+i);
			var airPasName = airPasNameInput.value;
			
			var airPasBdateInput = document.getElementById("airPasBdate"+i);
			var airPasBdate = airPasBdateInput.value;
			
			if (!regex.test(airPasName) || airPasBdate == null || airPasBdate == "") {
				  
				alert("탑승객 정보를 정확히 입력하세요");
				return false;
			}
		}
		return true;
	}

	var frmSendValue = $("#frmSendValue") ;
	
	function sendValueTest() {
		
		  if (checkPasInput()) {
			  
		    frmSendValue.submit();
		  }
		}
</script>


<%@include file="../include/footer.jsp" %>

