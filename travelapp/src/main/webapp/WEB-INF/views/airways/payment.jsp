<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../include/flyheader.jsp" %>
<br>
<!-- 230629 1052 동현 작성 -->
<div class="container-fluid position-relative">
	<div class="page-header">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="text-info text-light" id="pageHeader">결제페이지</h3>
		</div>
	</div>
</div>

<hr>

<div class="card">
	<div style="text-align: center;">
		<p class="text-danger">! 결제 전 주의사항</p>
		
		<p class="text-info text-primary-emphasis">
			항공권 예약완료 후 즉시결제하지 않으시면 예약은 자동취소됩니다.<br>
			항공권 결제는 신용/체크카드로만 결제 가능합니다. (현금결제 불가)<br>
			왕복 예약시 카드정보를 한번만 입력하셔도 됩니다.<br>
			예약 후 이름/스케쥴/항공사/인원 변경은 불가하며 취소 후 재예약하셔야 합니다.<br>
			여행사 법인카드, 여행사 임직원카드는 사용불가하며, 문제발생 시 법적인 책임소지가 따릅니다.<br>
			일부 항공사 결제 진행시 결제하는 진행버튼을 이중클릭 시 카드승인이 중복승인 될 수 있으니 로딩시간을 양해 부탁드립니다.<br>
			항공권 결제 후 여행사측의 결제완료 안내메시지와 사용한 카드승인내역을 반드시 확인하여 주시기 바랍니다.<br>
			매일 23시 50분 ~ 00시 10분까지는 항공사 및 카드사별 점검시간이므로 결제가 정상진행 되지 않을 수도 있습니다.<br>
			카드사 할부 무이자는 이용하시는 카드사 혹은 탑승하시는 항공사측으로 문의하시기 바랍니다.
		</p>
	</div>
</div>
<h5 class="text-info text-light">예약내역정보</h5>

<!-- 최종 예약정보 확인 -->
<table class="table table-striped table-bordered table-hover" style="width:100%;text-align: center;">
    <thead style="text-align: center;">
        <tr class="table-info">
            <th scope="row">가는편/오는편</th>
            <th scope="col">항공사</th>
            <th scope="col">노선번호</th>
            <th scope="col">출발공항</th>
            <th scope="col">도착공항</th>
            <th scope="col">출발시간</th>
            <th scope="col">도착시간</th>
            <th scope="col">탑승자 목록</th>
            <th scope="col">총 결제요금</th>
        </tr>
    </thead>

    <tbody style="text-align: center;">
    
    	<c:choose>
    		<c:when test="${airPass.roundFlag}">
		    	<tr>
		    		<td>가는편</td>
		    		<td>${airPass.finalReservation1[0].airlineNm}</td>
		    		<td>${airPass.finalReservation1[0].vihicleId}</td>
		    		<td>${airPass.finalReservation1[0].depAirportNm}</td>
		    		<td>${airPass.finalReservation1[0].arrAirportNm}</td>
					<td><fmt:formatDate value="${airPass.finalReservation1[0].depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
					<td><fmt:formatDate value="${airPass.finalReservation1[0].arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
		    		<td>
			    		<c:forEach var="i" begin="0" end="${airPass.total-1}">
			    			${airPass.passengersList[i]}
			    		</c:forEach></td>
		    		<td>${airPass.upwayPrice}원</td>
		    	</tr>
		    	
		    	<tr>
		    		<td>오는편</td>
		    		<td>${airPass.finalReservation2[0].airlineNm}</td>
		    		<td>${airPass.finalReservation2[0].vihicleId}</td>
		    		<td>${airPass.finalReservation2[0].depAirportNm}</td>
		    		<td>${airPass.finalReservation2[0].arrAirportNm}</td>
					<td><fmt:formatDate value="${airPass.finalReservation2[0].depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
					<td><fmt:formatDate value="${airPass.finalReservation2[0].arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
		    		<td>
			    		<c:forEach var="i" begin="0" end="${airPass.total-1}">
			    			${airPass.passengersList[i]}
			    		</c:forEach></td>
		    		<td>${airPass.downwayPrice}원</td>
		    	</tr>
    		</c:when>
    		<c:otherwise>
    			<tr>
		    		<td>가는편</td>
		    		<td>${airPass.finalReservation1[0].airlineNm}</td>
		    		<td>${airPass.finalReservation1[0].vihicleId}</td>
		    		<td>${airPass.finalReservation1[0].depAirportNm}</td>
		    		<td>${airPass.finalReservation1[0].arrAirportNm}</td>
					<td><fmt:formatDate value="${airPass.finalReservation1[0].depPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
					<td><fmt:formatDate value="${airPass.finalReservation1[0].arrPlandTime}" pattern="yyyy-MM-dd / HH:mm"/></td>
		    		<td>
			    		<c:forEach var="i" begin="0" end="${airPass.total-1}">
			    			${airPass.passengersList[i]}
			    		</c:forEach></td>
		    		<td>${airPass.upwayPrice}원</td>
		    	</tr>
    		</c:otherwise>
    	</c:choose>
	</tbody>
</table>

<hr>
<form id="frmSendSellInfo">
	
	<input type="hidden" name="total" value="${total}">
	<input type="hidden" name="airRouteno1" value="${airRouteno1}">
	<input type="hidden" name="airRouteno2" value="${airRouteno2}">
	<input type="hidden" name="totalPrice" value="${totalPrice}">
	<input type="hidden" name="upwayPrice" value="${upwayPrice}">
	<input type="hidden" name="downwayPrice" value="${downwayPrice}">
	<input type="hidden" name="roundFlag" value="${roundFlag}">
	<input type="hidden" name="airClass" value="${airClass}">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	
	<div style="text-align: center;">
		<button type="button" class="btn btn-primary" id="payPageBtn" onclick="sendValue();">
			<font style="vertical-align: inherit;">
			<font style="vertical-align: inherit;">결제하기
		</button>
	</div>
</form>
	
</div>



<!-- htResPage.js class -->
<script src="${contextPath}/resources/js/airways/payAjax.js"></script>

<script>

// csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

var upwayResNo = '${airPass.getFinalReservation1().get(0).getAirResno()}';
var downwayResNo = '${airPass.getFinalReservation2().get(0).getAirResno()}';


var sellUuid = '${airPass.sellUuid}';
var amount = '${airPass.totalPrice}';
var sellName = '항공권';
var airRouteno1 = '${airPass.airRouteno1}';
var airRouteno2 = '${airPass.airRouteno2}';
var airResno1 = '${airPass.airResno1}';
var airResno2 = '${airPass.airResno2}';
var airClass1 = '${airPass.airClass1}';
var airClass2 = '${airPass.airClass2}';
var userId = '${airPass.userId}';
var total = '${airPass.total}';

console.log("sellUuid: " + sellUuid);
console.log("amount: " + amount);
console.log("airRouteno1: " + airRouteno1);
console.log("airRouteno2: " + airRouteno2);
console.log("upwayResNo: " + upwayResNo);
console.log("downwayResNo: " + downwayResNo);
console.log("airClass1: " + airClass1);
console.log("airClass2: " + airClass2);
console.log("userId: " + userId);
console.log("total: " + total);

var frmSendSellInfo = $("#frmSendSellInfo") ;

const payTmp = new PaymenntAjaxModule();

//팔때 필요한 데이터
var sellData = {
    sellId : sellUuid, //uuid
    sellName : sellName, //결제 상품 이름
    amount : amount, // 가격
    buyerEmail : '', //결제자 이메일
    buyerName : '' // 결제자 이름
};


function sendValue(){

	    // 결제 api
		payTmp.requestPayment(
        sellData,
        function(rsp) {
        	console.log(rsp);
            if(rsp.success){
                 //결제완료 디비작업에 필요한 데이터
                 var payData = {
                	 sellUuid : sellUuid,
                     amount : amount,
                     airRouteno1 : airRouteno1,
                     airRouteno2 : airRouteno2,
                     airResno1 : upwayResNo,
                     airResno2 : downwayResNo,
                     airClass1 : airClass1,
                     airClass2 : airClass2,
                     userId : userId,
                	 total : total
                 };

                // 결제 성공 로직
                 payTmp.paymentSuccess(
                     payData,
                     function(data) {
                         console.log(data);
                         if (data) {
                            
                         }
                        
                         location.href = "${contextPath}/airways/airResList" ;
                         // 화면이동
                         // 예약 성공실패 
                         //실제 예약 성공
                     },// success callback end
                     function(data) {
                         console.log(data);
                     }// error callback end
                 );// paymentSuccess end

            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                location.href = "/travelapp/airways/";
            }
        } // callback end
    );// requestPayment end
}//sendValue() end

</script>

<%@include file="../include/footer.jsp" %>

