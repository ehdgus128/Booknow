<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!-- container -->
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
                <div class="col-10">
                    <div class="row">
                        <h3 class="mx-2 my-2 px-2 py-2 text-light">나의 호텔 예약 상세</h3>
                    </div>
                    <div class="row">
                        <div class="card-body col-6">
                            <div class="card border-secondary col-auto my-1">
                                <img src="/travelapp/hotel/hotelFiles/${htResHotelRoom.htNo}" class="d-block user-select-none" width="100%"  aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
                                <rect width="100%" height="100%" fill="#868e96"></rect>
                            </div>
                        </div>
                        
                        <div class="card-body col-6">
                            <div class="card border-secondary my-3 mx-2">
                                <div class="card-text col-auto my-1 mx-2 text-danger-emphasis">
                                    호텔 성급 : ${htResHotelRoom.htRank}
                                </div>
                                <div class="card-text col-auto my-1 mx-2 text-danger-emphasis">
                                    호텔 주소 : ${htResHotelRoom.htAddress}
                                </div>
                                <div class="card-text col-auto my-1 mx-2 text-danger-emphasis">
                                    호텔 타입 : ${htResHotelRoom.htType}
                                </div>
                                <div class="card-text col-auto my-1 mx-2 text-danger-emphasis">
                                    호텔 연락처 : ${htResHotelRoom.htPhone}
                                </div>
                                <div class="card-text col-auto my-1 mx-2 text-danger-emphasis">
                                    호텔 이메일 : ${htResHotelRoom.htEmail}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-bordered table-striped table-minty">
                                <thead>
                                    <tr>
                                        <th style="width: 20%; font-weight: bold; color: black;">객실 첨부사진</th>
                                        <th style="font-weight: bold; color: black;">방 타입</th>
                                        <th style="font-weight: bold; color: black;">방 이름</th>
                                        <th style="font-weight: bold; color: black;">결제 금액</th>
                                        <th style="font-weight: bold; color: black;">결제 상태</th>
                                        <th style="font-weight: bold; color: black;">결제 변경</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="border-right: 2px solid #ddd; background-color: white; color: #555;">
                                           <img src="/travelapp/hotel/roomFiles/${htResHotelRoom.htRooNo}">
                                        </td>
                                        <td style= "font-weight: bold; color: black;">${htResHotelRoom.htRooType}</td>
                                        <td style= "font-weight: bold; color: black;">${htResHotelRoom.htRooName}</td>
                                        <td style= "font-weight: bold; color: black;">${htResDetail.htSellPrice}</td>
                                        <td style= "font-weight: bold; color: black;">${htResDetail.htSellStatus}</td>
                                        <td style= "font-weight: bold; color: black;">
                                            <button data-selid="${htResDetail.sellUuid}" id="idBtnCancelPay" class="btn btn-primary">결제취소</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>      
                        </div>
                    </div>
                    <div class="row">
                    	<button id="idBtnMoveResList" class="btn btn-primary">예약 목록으로</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- col end -->
    </div>
    <!-- row end -->
</div>
<!-- container end -->

<!-- htResPage.js class -->
<script src="${contextPath}/resources/js/hotel/htres/htResPage.js"></script>
<script>

//csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

const HtResModule = new HtResAjaxModule();

// 페이징 버튼 클릭 이벤트 처리
$("#idBtnMoveResList").on("click",function(e){
	document.location.href = "${contextPath }/hotel/htres/my";
}); // 페이징 버튼 클릭 이벤트 처리 end

// 예약 상세 버튼 이벤트 처리 
$("#idBtnCancelPay").on("click",function(e){
    var sellId = $(this).data("selid");

    var sendData = {
    	sellId : sellId
    };
    HtResModule.getAjaxPaymentCancel(
        sendData,
        function(data) {
            if(data.result) {
            	document.location.href = "${contextPath }/hotel/htres/my";
            	return;
            }
            alert("서버 장애로 결제취소를 실패 했습니다. 반복적으로 같은 메시지가 뜬다면 고객센터에 문의해주세요.");
            
        }
    ); // getAjaxPaymentCancel end
});// 예약 상세 버튼 이벤트 처리 end

</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>