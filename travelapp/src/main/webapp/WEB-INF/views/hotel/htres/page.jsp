<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container-lg position-relative">
    <div class="row"><br></div>
    <div class="row">
        <div class="card border-secondary d-flex justify-content-center" style="min-width: 20rem;">
            <div class="card-header"><h1>예약페이지</h1></div>
<form id="formResData" method="post" action="/travelapp/hotel/htres/pay"><!-- form -->
            <div class="card-body d-flex justify-content-center">
                <!-- 결제페이지에서 보여주기 위한 변수 -->
                <input type="hidden" name="htName" value="${room.htName}">
                <input type="hidden" name="htRooName" value="${room.htRooName}">
                <input type="hidden" name="htRooNo" value="${room.htRooNo}">
                <input type="hidden" name="htNo" value="${room.htNo}">
                <input type="hidden" name="userId" value='<sec:authentication property="principal.username"/>'>

                <div class="col-8 my-2 mx-2">
                    <input type="hidden" name="htRooNo" value="${room.htRooNo}">
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <h2 class="card-header" style="padding: 5px;">${room.htName}</h2>
                        <span class="card-text">호텔등급 : ${room.htRank} 성</span>
                        <span class="card-text">방이름 : ${room.htRooName}</span>
                        <span class="card-text">방정보 : ${room.htRooType}</span>
                        <br>
                    </div>
                    <br>
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <h2 class="card-header" style="padding: 5px;">숙박 기간</h2>
                        <div class="form-group row">
                            <div class="form-group col-auto">
                                <label>체크인</label>
                                <input type="text" id="modalInCalInput" name="htResCheckInStr" class="form-control" placeholder="yyyy/mm/dd" value="${htResRoom.htStartDateStr}" readonly>
                            </div>
                            <div class="form-group col-auto">
                                <br>
                                &nbsp;~&nbsp;
                            </div>
                            <div class="form-group col-auto">
                                <label>체크아웃</label>
                                <input type="text" id="modalOutCalInput" name="htResCheckOutStr" class="form-control" placeholder="yyyy/mm/dd" value="${htResRoom.htEndDateStr}" readonly>
                            </div>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="card border-secondary d-flex flex-column">
    
                        <div class="d-flex flex-column">
                            <fieldset>
                                <legend class="card-header">
                                    투숙객 정보
                                </legend>
                
                                <div class="d-flex flex-column">
                                    <div class="d-flex justify-content-start mx-2 my-2">
                                        <input type="checkbox" id="inputCheckBoxUser" class="form-check-input">
                                        <label class="form-check-label">예약자 본인 체크</label>
                                    </div>
                                    <div class="divAddGuest d-flex justify-content-end mx-2" style="padding: 5px;">
                                        <span><i class="bi bi-plus-circle"></i>&nbsp;투숙객 추가</span>
                                    </div>
                                </div>
                
                                <div class="divAddGroup d-flex flex-column">
                
                                </div>
                
                                <div id="idDivAddInputGroupGuest" class="divAddInputGroupGuest">
                                    <div class="form-group d-flex flex-row" style="padding: 5px;">
                                        <div class="form-group d-flex flex-column" style="padding: 5px;">
                                            <label for="inputFirstName" class="form-label col-auto">성 함</label>
                                            <div class="col-auto">
                                                <input type="text"  class="form-control" id="inputFirstName" name="htResName" placeholder="성함을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="divMinusGuest col-auto visually-hidden">
                                            <i class="bi bi-dash-circle"></i>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                
                
                                <div class="form-group d-flex flex-row" style="padding: 5px;">
                                    <div class="form-group d-flex flex-column">
                                        <label for="inputEmail" class="form-label col-auto" style="padding: 5px;">이메일</label>
                                        <div class="col-auto">
                                            <input type="text"  class="form-control is-invalid" id="inputEmail" name="htResEmail" placeholder="이메일을 입력해주세요">
                                            <div class="valid-feedback">유효한 이메일입니다.</div>
                                            <div class="invalid-feedback">이메일이 유효하지 않습니다.</div>
                                        </div>
                                    </div>
                                    <div class="form-group d-flex flex-column" style="padding: 5px;">
                                        <label for="inputPhone" class="form-label col-auto">전화번호</label>
                                        <div class="col-auto">
                                            <input type="text"  class="form-control is-invalid" id="inputPhone" name="htResPhone" placeholder="번호를 입력해주세요">
                                            <div class="valid-feedback">유효한 전화번호입니다.</div>
                                            <div class="invalid-feedback">전화 번호가 유효하지 않습니다.</div>
                                        </div>
                                    </div>
                                </div>
                                
                
                            </fieldset>
                        </div>
                    </div>
                    <!-- flex-column end -->
                </div>
                <!-- col--auto end -->

                <div class="col-4 my-3 mx-2">
                    <div class="card border-secondary d-flex flex-column" style="padding: 5px;">
                        <h2 class="card-header my-1" style="padding: 5px;">가격</h2>
                        <label class="card-text my-1">총액</label><input type="text" id="idInputTotalPrice" class="form-control" readonly style="color: #ff7851;">
                    </div>

                    <div class="d-flex flex-column my-3" style="max-width: 100px;">
                        <button type="button" id="btnSubmitPayment" class="btn btn-secondary">최종 확정</button>
                    </div>
                </div>
                <!-- col--auto end -->


            </div>
            <!-- card body end -->
            <!-- security -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form><!-- form end -->
        </div>
        <!-- card end -->
    </div>
    <!-- row end -->
    <br>
    <div class="d-flex flex-column"><br></div>
<br>
</div>
<!-- container end -->

<div id="divAppendTest">
    <div class="row">
        <div id="divCardTest" class="card border-secondary col-auto" style="display: none; position: absolute; z-index: 1;">
            <div class="card-header">
                <h5 class="card-title" style="display: inline-block;">여행 일자</h5>
                <button type="button" class="cardCloseTest btn-close" style="float: right;" aria-label="Close"></button>
            </div>
            <div class="card-body">
                <div class='daterap'>
                    <div class="dateheader">
                        <div class="calbtn prevDay"></div>
                        <h4 class='dateTitle'></h4>
                        <div class="calbtn nextDay"></div>
                    </div>
                    
                    <div class="dategrid dateHead">
                        <div>일</div>
                        <div>월</div>
                        <div>화</div>
                        <div>수</div>
                        <div>목</div>
                        <div>금</div>
                        <div>토</div>
                    </div>
                    <div class="dategrid dateBoard"></div>
                </div>
                <!-- cal end -->
            </div>
        </div>
        <!-- col end -->
    </div>
    <!-- row end -->
</div>


<!-- htResPage.js class -->
<script src="${contextPath}/resources/js/hotel/htres/htResPage.js"></script>
<script>

var loginUser = '${loginUser}';

// isRevPeriod 예약 가능일 체크 변수
var isPeriod = false;

// 이메일 정규표현식 체크
var isResEmail = false;

// 전화번호 정규표현식 체크
var isResPhoneNumber = false;

// idInputTotalPrice 선택자
var idInputTotalPrice = $("#idInputTotalPrice");

// csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

// 방번호
var htRooNo = '${room.htRooNo}';

// 투숙객 정보 추가를 위한 선택자
var addGuest = $(".divAddGuest");

// 투숙객 추가를 클릭 이벤트 처리
addGuest.on("click",function() {

    var nameInput = $(".divAddGroup");

    // input을 복사함.
    var copyInput =  `
    <div id="idDivAddInputGroupGuest" class="divAddInputGroupGuest">
        <div class="form-group d-flex flex-row" style="padding: 5px;">
            <div class="form-group d-flex flex-column" style="padding: 5px;">
                <label for="inputFirstName" class="form-label col-auto">성함</label>
                <div class="col-auto">
                    <input type="text"  class="form-control" id="inputFirstName" name="htResNameAdd" placeholder="성함을 입력해주세요">
                </div>
            </div>
            <div class="divMinusGuest col-auto visually-hidden">
                <i class="bi bi-dash-circle"></i>
            </div>
        </div>
        <br>
    </div>
    `;


    // input 추가
    nameInput.append(copyInput);

    // input 제거 버튼 화면에 활성화
    $(".divAddGroup div.divMinusGuest").removeClass("visually-hidden");
}); // click event end

// input 제거 버튼 이벤트 처리
$(".divAddGroup").on("click", "div div.divMinusGuest i", function () {
    $(this).closest(".divAddInputGroupGuest").remove(); // input 제거
}); // click event end

// checkin input 선택
var modalInCalInput = $("#modalInCalInput"); // 달력을 출력할 input
// checkout input 선택
var modalOutCalInput = $("#modalOutCalInput"); // 달력을 출력할 input

// 달력 div 선택
var divCardTest = $("#divCardTest"); // 실제 달력 div

// 달력 만들기 객체 생성
const makeDate = new Date(); // js date
var hotelCal = new CalendarMakeModule(); // 달력만들기 객체

// ajax 통신 모듈 객체 생성
var htResAjax = new HtResAjaxModule(); // ajax 통신 객체

// 로딩후 체크
htResAjax.getAjaxResAbleDate(
    htRooNo, // 방번호를 입력
    function(data) { // success 함수
        htResAjax.getProcessJsonConvertArray(data); // 받아온 데이터를 가공
        hotelCal.setCalDicData(htResAjax.getResAbleDate()); // 데이터를 달력만들기 객체에 set
        hotelCal.makeHotelCalendar(makeDate); // 달력 생성
        $('.dateBoard').html(hotelCal.getCalDate()); // 생성된 달력 str div에 입력
        $('.dateTitle').text(hotelCal.getCalMonth());
        loadCheck();
    }// success end
); // getAjaxResAbleDate end

// 화면 로딩 될때 받아온 checkin checkout 체크해야함
function loadCheck() {
    if (!hotelCal.isRevPeriod(modalInCalInput.val(), modalOutCalInput.val())) {
        modalInCalInput.val("");
        modalOutCalInput.val("");
        isPeriod = false;
        return;
    } // if end
    
    isPeriod = true;

    // 총액을 위한 ajax
    var ablePeriod = {
        htRooNo : htRooNo,
        htResCheckInStr : modalInCalInput.val(),
        htResCheckOutStr : modalOutCalInput.val()
    };

    htResAjax.getAjaxResTotalPrice(
        ablePeriod,
        function(data) {
            idInputTotalPrice.val(data.htSellPrice);
        }
     );// ajax end
}// onload end

// 달력이 없어질때 위치 초기화 및 클래스 초기화
function calDisplayPrc() {
    if (divCardTest.hasClass("checkIn")) {
        divCardTest.removeClass("checkIn");
    }

    if (divCardTest.hasClass("checkOut")) {
        divCardTest.removeClass("checkOut");
    }

    divCardTest.offset({left: 0, top: 0}); // 달력의 위치를 초기화 함.
    divCardTest.hide(); // 달력을 숨김
} // calDisplayPrc end


// checkIn input 클릭
modalInCalInput.on("click" ,function (e) {

    // ajax 통신
    htResAjax.getAjaxResAbleDate(
        htRooNo, // 방번호를 입력
        function(data) { // success 함수
            htResAjax.getProcessJsonConvertArray(data); // 받아온 데이터를 가공
            hotelCal.setCalDicData(htResAjax.getResAbleDate()); // 데이터를 달력만들기 객체에 set
            hotelCal.makeHotelCalendar(makeDate); // 달력 생성
            $('.dateBoard').html(hotelCal.getCalDate()); // 생성된 달력 str div에 입력
            $('.dateTitle').text(hotelCal.getCalMonth());
        }// success end
    ); // getAjaxResAbleDate end

    // 달력이름 '체크인'으로 변환
    divCardTest.children().children(".card-title").text("체크인");
    divCardTest.addClass("checkIn"); // 

    divCardTest.offset({ //달력의 위치를 input 아래로
        left: modalInCalInput.offset().left, 
        top: modalInCalInput.offset().top + modalInCalInput.height()+10
    });

    divCardTest.show(); // display show
});

// checkOut input 클릭
modalOutCalInput.on("click" ,function (e) {

    // ajax 통신
    htResAjax.getAjaxResAbleDate(
        htRooNo, // 방번호를 입력
        function(data) { // success 함수
            htResAjax.getProcessJsonConvertArray(data); // 받아온 데이터를 가공
            hotelCal.setCalDicData(htResAjax.getResAbleDate()); // 데이터를 달력만들기 객체에 set
            hotelCal.makeHotelCalendar(makeDate); // 달력 생성
            $('.dateBoard').html(hotelCal.getCalDate()); // 생성된 달력 str div에 입력
            $('.dateTitle').text(hotelCal.getCalMonth());
        }// success end
    ); // getAjaxResAbleDate end

    // 달력이름 '체크인'으로 변환
    divCardTest.children().children(".card-title").text("체크아웃");
    divCardTest.addClass("checkOut");

    divCardTest.offset({ //달력의 위치를 input 아래로
        left: modalOutCalInput.offset().left, 
        top: modalOutCalInput.offset().top + modalOutCalInput.height()+10
    });

    divCardTest.show(); // display show
});

// 달력 x 버튼 클릭
$("#divAppendTest").on("click", "div button.cardCloseTest",function() {
    calDisplayPrc();
});

// 다음달 클릭
$('.prevDay').on("click",function() {
    hotelCal.makeHotelCalendar(new Date(makeDate.setMonth(makeDate.getMonth() - 1)));
    $('.dateBoard').html(hotelCal.getCalDate());
    $('.dateTitle').text(hotelCal.getCalMonth());
});

// 이전달 클릭
$('.nextDay').on("click",function() {
    hotelCal.makeHotelCalendar(new Date(makeDate.setMonth(makeDate.getMonth() + 1)));
    $('.dateBoard').html(hotelCal.getCalDate());
    $('.dateTitle').text(hotelCal.getCalMonth());
});


// 나눠야할듯
// 달력 날짜 클릭
$("#divAppendTest").on("click", "div .revAble",function() {

    if (divCardTest.hasClass("checkIn")) { // 생성된 달력이 체크인 일때

        // check out 공백이면 검사 없이 입력
        if (modalOutCalInput.val() == null || modalOutCalInput.val() == "") {
            modalInCalInput.val($(this).data("date")); // checkIn input value에 입력
            calDisplayPrc();
            return;
        }

        var checkInDateStr = $(this).data("date");
        var checkOutDateStr = modalOutCalInput.val();

        // input의 값을 js Date 객체로 변환
        var checkInDate = new Date(checkInDateStr);
        var checkOutDate = new Date(checkOutDateStr);

        // js Date를 통해 대소 비교
        // checkin이 checkoout 다음에 올수 없음.
        if (checkInDate >= checkOutDate) {
            alert("날짜 선택이 잘못되었습니다.");
            return;
        }

        // 선택한 기간중에 예약 불가능한 일자를 체크
        if (!hotelCal.isRevPeriod(checkInDateStr, checkOutDateStr)) {
            isPeriod = false;
            return;
        }

        // input에 에약 가능한 일자를 입력
        modalInCalInput.val($(this).data("date"));
        calDisplayPrc();
        isPeriod = true;
        
        // 총액을 위한 ajax
        var ablePeriod = {
            htRooNo : htRooNo,
            htResCheckInStr : checkInDateStr,
            htResCheckOutStr : checkOutDateStr
        };

        htResAjax.getAjaxResTotalPrice(
            ablePeriod,
            function(data) {
                idInputTotalPrice.val(data.htSellPrice);
            }
        );// ajax end
        return;
    }// if end

    if (divCardTest.hasClass("checkOut")) { // 생성된 달력이 체크아웃 일때

        // check in 공백이면 검사 없이 입력
        if (modalInCalInput.val() == null || modalInCalInput.val() == "") {
            modalOutCalInput.val($(this).data("date")); // checkOut input value에 입력
            calDisplayPrc();
            return;
        }
    
    	

        var checkInDateStr = modalInCalInput.val();
        var checkOutDateStr = $(this).data("date");

        // input의 값을 js Date 객체로 변환
        var checkInDate = new Date(checkInDateStr);
        var checkOutDate = new Date(checkOutDateStr);

        // js Date를 통해 대소 비교
        // checkin이 checkoout 다음에 올수 없음.
        if (checkInDate >= checkOutDate) {
            alert("날짜 선택이 잘못되었습니다.");
            return;
        }

        // 선택한 기간중에 예약 불가능한 일자를 체크
        if (!hotelCal.isRevPeriod(checkInDateStr, checkOutDateStr)) {
            isPeriod = false;
            return;
        }

        // input에 에약 가능한 일자를 입력
        modalOutCalInput.val(checkOutDateStr);
        calDisplayPrc();
        isPeriod = true;

        // 총액을 위한 ajax
        var ablePeriod = {
            htRooNo : htRooNo,
            htResCheckInStr : checkInDateStr,
            htResCheckOutStr : checkOutDateStr
        };

        // 총액을 받는 ajax
        htResAjax.getAjaxResTotalPrice(
            ablePeriod,
            function(data) {
                idInputTotalPrice.val(data.htSellPrice);
            }
        );// ajax end
        return;
    } // if end

}); // 날짜 클릭 이벤트 end

// 결제페이지로
$("#btnSubmitPayment").on("click", function () {

    var tmpName = $("#inputFirstName").val();

    if (tmpName == null || tmpName == undefined || tmpName.length <= 0) {
        alert("이름을 입력해주세요.");
        return;
    }// is name check end

    if (!isResEmail) {
        alert("이메일이 형식에 맞지 않습니다.");
        return;
    }// is Email check end

    if (!isResPhoneNumber) {
        alert("전화번호가 형식에 맞지 않습니다.");
        return;
    }// is phone check end

    if (!isPeriod) {
        alert("예약 가능한 기간을 선택해주세요.");
        return;
    }// is period check end
    
    $("#formResData").submit();
});

function isEmailCheckFunc() {
    let emailRegExp = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;

    if (emailRegExp.test($("#inputEmail").val())) {
        $("#inputEmail").removeClass("is-invalid");
        $("#inputEmail").addClass("is-valid");
        isResEmail = true;
        return;
    }

    $("#inputEmail").removeClass("is-valid");
    $("#inputEmail").addClass("is-invalid");
    isResEmail = false;
} // 이메일 형식 체크 func end

function isPhoneCheckFunc() {
    var regPhone= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

    if (regPhone.test($("#inputPhone").val())) {
        $("#inputPhone").removeClass("is-invalid");
        $("#inputPhone").addClass("is-valid");
        isResPhoneNumber = true;
        return;
    }

    $("#inputPhone").removeClass("is-valid");
    $("#inputPhone").addClass("is-invalid");
    isResPhoneNumber = false;
} // 전화번호 형식 체크 func end

// 이메일 형식 체크
$("#inputEmail").on("change", function() {
	isEmailCheckFunc();
});

// 전화번호 형식 체크
$("#inputPhone").on("change", function() {
	isPhoneCheckFunc();
});

// checkbox 
$("#inputCheckBoxUser").on("click", function () {
	
    var sendData = {
        userId : loginUser
    };

    if (!$(this).is(":checked")) {
        $("#inputFirstName").val("");
        $("#inputEmail").val("");
        $("#inputPhone").val("");
        return;
    } // if end

    htResAjax.getAjaxUserData(
        sendData,
        function(data) {
            $("#inputFirstName").val(data.userName);
            $("#inputEmail").val(data.userEmail);
            $("#inputPhone").val(data.userPhoneNumber);
            
            isEmailCheckFunc();
            isPhoneCheckFunc();
        }
    ); // getAjaxUserData end
}); // inputCheckBoxUser end

</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>