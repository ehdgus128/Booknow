<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-lg position-relative">
    <div class="row my-2 mx-2">
        <div class="card border-secondary d-flex justify-content-center" style="min-width: 20rem;">
            <div class="card-header"><h1>결제</h1></div>
            <div class="card-body d-flex justify-content-center">

                <div class="col-8 my-2 mx-2">
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <div class="card-header"><h3>결제 타입 : 카드</h3></div>
                        <div class="card-body d-flex justify-content-center">
                            <div class="form-group d-flex flex-column">
                                <div class="card-text col-12 mx-2 my-3">
                                    <div class="text-wrap">
                                        Boooknow에서 예약을 완료하려고 합니다. 
                                    </div>
                                    <div class="text-wrap">
                                        예약이 확정되지 않으면 <div class="fw-bold d-inline text-danger">전액 환불</div>됩니다. 
                                    </div>
                                    <div class="text-wrap">
                                        취소 또는 변경이 불가한 예약입니다.예약 호텔에 체크인하지 않는 경우,
                                    </div>
                                    <div class="text-wrap">
                                        사전 결제 금액이 부과됩니다. 
                                    </div>
                                    <br>
                                    <div class="text-wrap">
                                        결제는 <div class="fw-bold d-inline text-danger">카드</div>로만 진행이 가능합니다.
                                    </div>
                                    <br>
                                </div>
                                <button type="button" id="idBtnPayment" class="btn btn-secondary">금액 결제</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-4 my-2 mx-2">
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <div class="row">
                            <div class="col-12">
                                <div class="card-header"><h3>결제 내역</h3></div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card row">
                                <div class="card-header col-12 my-1"><h4>예약 내역</h4></div>
                                <div class="card-text col-12 my-1">
                                    호텔명 :
                                    <input type="text" id="idInputHtName" class="form-control" value="${htResTime.htName}" readonly> 
                                </div>
                                <div class="card-text col-12 my-1">
                                    방 이름 : 
                                    <input type="text" id="idInputHtRoomName" class="form-control" value="${htResTime.htRooName}" readonly>
                                </div>
                                <div class="card-text col-12 my-1">
                                    호텔 체크인:
                                    <input type="text" id="idInputHtResCheckIn" name="htResCheckIn" class="form-control" value='${htResTime.htResCheckInStr}' readonly>
                                </div>
                                <div class="card-text col-12 my-1">
                                    호텔 체크아웃:
                                    <input type="text" id="idInputHtResCheckOut" name="htResCheckOut" class="form-control" value='${htResTime.htResCheckOutStr}' readonly>
                                </div>
                            </div>
                            <div class="card row my-2">
                                <div class="form-group col-12">
                                    <label class="form-label col-12 my-2"><h4>총 금액</h4></label>
                                    <div class="col-auto my-2">
                                        <input type="text" id="idInputTotalPrice" class="form-control" value="${htResTime.amount}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- htResPage.js class -->
<script src="${contextPath}/resources/js/hotel/htres/payAjax.js"></script>
<script>

// csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

var idBtnPayment = $("#idBtnPayment");

var htNo = '${htResTime.htNo}';
var htRooNo = '${htResTime.htRooNo}';
var htResCheckIn = '${htResTime.htResCheckInStr}';
var htResCheckOut = '${htResTime.htResCheckOutStr}';

var htResName = '${htResTime.htName}';
var htResEmail = '${htResTime.htResEmail}';
var htResPhone = '${htResTime.htResName}';

var sellId = '${htResTime.sellId}';
var amount = '${htResTime.amount}';

var htResNo = '${htResTime.htResNo}';
var userId = '${htResTime.userId}';

console.log(sellId);

const payTmp = new PaymenntAjaxModule();

var sellData = {
    sellId : sellId,
    sellName : htResName,
    amount : amount,
    buyerEmail : htResEmail,
    buyerName : htResPhone
};

// 결제 버튼 클릭 이벤트
idBtnPayment.on("click", function() {
    // 결제 api
    payTmp.requestPayment(
        sellData,
        function(rsp) {
        	console.log(rsp);
            if(rsp.success){

                var payData = {
                    sellId : rsp.merchant_uid,
                    amount : rsp.paid_amount,
                    htNo : htNo,
                    htRooNo : htRooNo,
                    htResCheckInStr : htResCheckIn,
                    htResCheckOutStr : htResCheckOut,
                    htResName : htResName,
                    htResEmail : htResEmail,
                    htResPhone : htResPhone,
                    htResNo : htResNo,
                    userId : userId
                };

                // 결제 성공 로직
                payTmp.paymentSuccess(
                    payData,
                    function(data) {
                        console.log(data);
                        console.log(data.result);
                        location.href = "/travelapp/hotel/htres/result?result="+data.result;
                    },// success callback end
                    function(data) {
                        console.log(data);
                        console.log(data.result);
                        location.href = "/travelapp/hotel/htres/result?result="+data.result;
                    }// error callback end
                );// paymentSuccess end
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                location.href = "/travelapp/hotel/htres/result?result=cancel";
            } // if else end 
        } // callback end
    );// requestPayment end
});// 결제 버튼 클릭 end

</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>