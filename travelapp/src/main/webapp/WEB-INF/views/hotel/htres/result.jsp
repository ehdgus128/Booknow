<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-lg position-relative">
    <div class="row my-2 mx-2">
        <div class="card border-secondary d-flex justify-content-center" style="min-width: 20rem;">
            <div class="card-header"><h1>결제 결과</h1></div>
            <div class="card-body d-flex justify-content-center">
                <div class="col-12 my-2 mx-2">
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <div class="card-header"><h3 id="payresultTitle">예약 성공</h3></div>
                        <div class="card-body">
                            <div class="row d-flex justify-content-center ">
                                <div id="payresultbody" class="col-auto mx-2 my-3 px-3 py-3">
                                    <div class="card-text text-wrap">
                                        Boooknow에서 <div class="fw-bold d-inline text-danger">호텔 예약</div>을 <div class="fw-bold d-inline text-danger">성공</div>했습니다. 
                                    </div>
                                    <div class="card-text text-wrap">
                                        호텔 예약 내역을 확인 하시려면 버튼을 눌러서 이동해주세요. 
                                    </div>
                                    <div class="card-text text-wrap">
                                        결제 취소 및 내역 변경은 마이페이지를 확인해주세요 
                                    </div>
                                </div>
                            </div>
                            <!-- row end -->
                            <div class="row d-flex justify-content-center">
                                <div class="col-auto mx-2">
                                    <button type="button" id="idBtnHotelHome" class="btn btn-secondary">호텔 홈</button>
                                </div>
                                <div class="col-auto mx-2">
                                    <button type="button" id="idBtnHotelReshistory" class="btn btn-secondary">예약 내역</button>
                                </div>
                            </div>
                            <!-- row end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- card end -->
    </div>
    <!-- row end -->
</div>
<!-- container end -->

<!-- payResultpage.js class PayResultStr -->
<script src="${contextPath}/resources/js/hotel/htres/payResultpage.js"></script>

<script>

// 호텔 홈으로 버튼 이벤트 처리
$("#idBtnHotelHome").on("click", function() {
    location.href = "/travelapp/hotel/";
}); // event end

// 예약 내역 버튼 이벤트 처리
$("#idBtnHotelReshistory").on("click", function() {
    location.href = "/travelapp/hotel/htres/my";
}); // event end

// 예약 결과 처리 
$(document).ready(function() {
    var payresultTitle = $("#payresultTitle");
    var payresultbody = $("#payresultbody");

    const payResultObj = new PayResultStr();

    var result = '${result}';

    if (result == 'true') {
        payresultTitle.text("예약 성공");
        payresultbody.html(payResultObj.getResSuccessStr());
        return;
    }  

    payresultTitle.text("예약 실패");
    payresultbody.html(payResultObj.getResFailStr());
    return;
}); // ready end
</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>