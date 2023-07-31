<%-- 임시 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="/WEB-INF/views/include/mainheader.jsp" %>

<%-- 
230705 임지혁: 회원가입 페이지 생성 
230716 main push버전
--%>

<!-- <style>
div {border: 1px solid grey;}
</style> -->

   
<style>

.container {width:50%;}

.card {width:80%;margin:auto;}

.main {width:80%;margin:auto;}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {-webkit-appearance: none;
												 margin: 0;}
												 
.ui-datepicker{ z-index: 9999 !important;}

.hasDatepicker { position: relative; z-index: 9999; }

</style>


<div class="container position-relative">

	<div class="card bg-white mt-5">
		<div class="main" >
			<form id="joinFrm" name="joinFrm" method="post" action="${contextPath }/join">
				
				<div class="row fs-2 mt-4 mb-4">
					<div class="d-flex justify-content-left">
						<strong>회원 가입</strong>
					</div>	
				</div>
				
				<%-- 아이디 --%>
				<div class="input-group">
					<span class="input-group-text bg-light">아이디</span>
					<input type="text" class="form-control" id="userId" name="userId"
						   maxlength="15" required>
					<button type="button" id="userIdBtn" class="btn btn-info">중복 확인</button>
				</div>
				<div class="row align-items-center text-end" style="height:2rem">
					<small class="text-body-secondary" id="idc"></small>
				</div>
				
				<%-- 비밀번호 --%>
				<div class="form-group">
					<div class="input-group mb-2">
						<span class="input-group-text bg-light">비밀번호</span>
						<input type="password" class="form-control" 
							   id="userPassword" name="userPassword" placeholder="8자 이상 입력해주세요">
					</div>
					<div class="input-group">	   
						<span class="input-group-text bg-light">비밀번호</span>
						<input type="password" class="form-control"
							   id="userPassword2" name="userPassword2" placeholder="재입력">
					</div>	   
				</div>
				<div class="row align-items-center text-end" style="height:2rem">
					<small class="text-body-secondary" id="pwc"></small>
				</div>
				
				<%-- 이메일 --%>
				<div class="form-group">
					<div class="input-group mb-2">
						<c:choose>
							<c:when test="${not empty naverUser }">
								<span class="input-group-text bg-light">이메일</span>
								<input type="text" class="form-control"
									   id="userEmail" name="userEmail" value="${naverUser.naverEmail }" readonly="readonly">
							</c:when>
							<c:otherwise>
								<span class="input-group-text bg-light">이메일</span>
								<input type="text" class="form-control"
									   id="userEmail" name="userEmail">
								<button type="button" id="emailBtn" class="btn btn-info">인증메일 발송</button>	   
							</c:otherwise>
						</c:choose>
					</div>
					<div class="input-group" id="ecodeGroup" style="display:none">
						<span class="input-group-text bg-light">인증번호</span>
						<input class="form-control" id="ecode"
							   placeholder="5자리를 입력해주세요" readonly="readonly" maxlength="5">
						<button type="button" id="ecodeBtn" class="btn btn-info">인증하기</button>
					</div>
				</div>
				<div class="row align-items-center text-end" style="height:2rem">
					<small class="text-body-secondary" id="emc"></small>
				</div>
				
				<%-- 이름 --%>
				<div class="input-group mb-4">
					<c:choose>
						<c:when test="${not empty naverUser }">
							<span class="input-group-text bg-light">이름</span>
							<input type="text" class="form-control"
								   id="userName" name="userName" maxlength="10" value="${naverUser.naverName }" readonly="readonly">
						</c:when>
						<c:otherwise>	   
							<span class="input-group-text bg-light">이름</span>
							<input type="text" class="form-control"
								   id="userName" name="userName" maxlength="10">
						</c:otherwise>	   
					</c:choose>	   
				</div>
				
				<%-- 생일 --%>
				<div class="input-group mb-4">
					<c:choose>
						<c:when test="${not empty naverUser }">
							<span class="input-group-text bg-light">생년월일</span>
							<input type="text" class="form-control" readonly="readonly" 
								   id="userBday" name="userBday" value='<fmt:formatDate value="${naverUser.naverBday }" pattern="yyyy-MM-dd"/>' readonly="readonly">
						</c:when>
						<c:otherwise>
							<span class="input-group-text bg-light">생년월일</span>
							<input type="text" class="form-control" readonly="readonly" 
								   id="userBday" name="userBday">
						</c:otherwise>	   
					</c:choose>	   
				</div>
				
				<%-- 전화번호 --%>
				<div class="input-group align-items-center mb-4">
					<input type="text" class="form-control text-center bg-light" value="010"
						   id="phone1" name="phone1" placeholder="010" readonly="readonly">&nbsp;-&nbsp;
					<c:choose>
						<c:when test="${not empty naverUser }">
							<input type="number" class="form-control text-center"
								   id="phone2" name="phone2" value='${naverUser.naverMobile.substring(4,8) }' readonly="readonly">&nbsp;-&nbsp;
							<input type="number" class="form-control text-center"
								   id="phone3" name="phone3" value='${naverUser.naverMobile.substring(9,13) }' readonly="readonly">
						</c:when>
						<c:otherwise>
							<input type="number" class="form-control text-center"
								   id="phone2" name="phone2" placeholder="0000" maxlength="4">&nbsp;-&nbsp;
							<input type="number" class="form-control text-center"
								   id="phone3" name="phone3" placeholder="0000" maxlength="4">
						</c:otherwise>	   
					</c:choose>
					<input type="hidden" id="userPhoneNumber" name="userPhoneNumber"> 
				</div>
				
				<%-- 주소 --%>
				<div class="form-group mb-4">
					<div class="input-group mb-2">
						<span class="input-group-text bg-light">우편번호</span>
						<input type="text" class="form-control"
							   id="zipcode" name="zipcode" readonly="readonly">
						<button type="button" onclick="searchAddressKakao()" class="btn btn-info">주소 검색</button>	   
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text bg-light">주소</span>
						<input type="text" class="form-control"
								   id="address" name="address" readonly="readonly">
					</div>	
					<div class="input-group mb-2">	   
						<span class="input-group-text bg-light">상세주소</span>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control"
							   id="addressDetail" name="addressDetail" readonly="readonly">
					</div>	   
					<input type="hidden" id="userAddress" name="userAddress">
				</div>
				
				<div class="row fs-2 mt-4 mb-4">
					<div class="d-flex justify-content-center">
						<c:choose>
							<c:when test="${not empty naverUser }">
								<input type="hidden" id="naverId" name="naverId" value="${naverUser.naverId }">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="naverId" name="naverId" value="연동없음">
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<button type="reset" id="resetBtn" style="width:50%" 
								class="btn btn-warning btn-lg">재입력</button>&nbsp;&nbsp;
						<button type="button" id="joinRequest" style="width:50%" 
								class="btn btn-primary btn-lg">가입하기</button>
					</div>	
				</div>
		
			</form>	
		</div><%-- /.main end --%>
	</div><%-- /.card end --%>

</div><%-- /.container end --%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

let joinFrm = $("#joinFrm");

let csrfHeaderName = "${_csrf.headerName}";
let csrfToken = "${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken);
});

$("#joinRequest").on("click", function(){
	$("input").attr("disabled", false);
	
	let joinFlag = true;
	let phone1 = $("#phone1").val();
	let phone2 = $("#phone2").val();
	let phone3 = $("#phone3").val();
	$('input[name=userPhoneNumber]').val(phone1 + "-" + phone2 + "-" + phone3);
	
	let address = $("#address").val();
	let addressDetail = $("#addressDetail").val();
	$('input[name=userAddress]').val(address + " " + addressDetail);
	
	let inputVals = 
		{
			"아이디" : document.getElementById("userId").value,
			"비밀번호" : document.getElementById("userPassword").value,
			"이메일" : document.getElementById("userEmail").value,
			"이름" : document.getElementById("userName").value,
			"생일" : document.getElementById("userBday").value,
			"전화번호" : document.getElementById("userPhoneNumber").value,
			"주소" : document.getElementById("userAddress").value,
			"네이버아이디" : document.getElementById("naverId").value
		}
	

	$.each(inputVals, (key, value) => {
		if(value.length == 0) {
			alert(key + " 항목을 입력해주세요.");
			joinFlag = false;
			return;
		}
	}); 
	
	if (joinFlag) {
		joinFrm. submit();
	}
	
});

$("#resetBtn").on("click", function(){
	$("input").removeClass("is-valid");
	$("input").removeClass("is-invalid");
	$("input").attr("disabled", false);
	$("input").attr("readonly", false);
	$("#phone1").attr("readonly", true);
	$("#idc").text("");
	$("#pwc").text("");
	$("#emc").text("");
	$("#ecodeGroup").hide();
});


//id 실시간 validation
$("#userId").keyup(function(){
	let msg = '';
	let userId = this.value;
	
	//영어 대소문자, 숫자만 사용가능, 시작문자 영어 대소문자, 총 글자 수 6~15
	let idRegExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,14}$/;
	
	if(userId.length <= 2) {
		$("#userId").removeClass("is-invalid");
		$("#userId").removeClass("is-valid");
		msg = '';
		
	} else if (userId.length > 5) {
		
		if (idRegExp.test(userId)) {
			$("#userId").removeClass("is-invalid");
			$("#userId").addClass("is-valid");
			msg = "유효한 아이디입니다.";
		} else {
			$("#userId").removeClass("is-valid");
			$("#userId").addClass("is-invalid");
			msg = "아이디가 유효하지 않습니다.";
		}
		
	} else {
		$("#userId").removeClass("is-valid");
		msg = '아이디의 최소 길이는 6글자 입니다';
	}
	
	$("#idc").text(msg);
	
});



//230706 임지혁: 아이디 중복 체크(회원가입용)
//let checkAjaxSetTimeout;

$("#userIdBtn").on("click", function(){
	let userId = $("#userId").val();
//	clearTimeout(checkAjaxSetTimeout);
//	checkAjaxSetTimeout = setTimeout(function(){
		if (userId.length > 5) {
			let msg = '';
			
			$.ajax({
				type: "post",
				url: "${contextPath}/users/idcheck",
				data: {userId: userId},
				success: function (result) {
					if (result == '0') {
						$("#userId").removeClass("is-invalid");
						$("#userId").addClass("is-valid");
						msg = '사용하실 수 있는 아이디입니다.';
						$("#userId").attr("disabled", true);
						
					} else {
						$("#userId").removeClass("is-valid");
						$("#userId").addClass("is-invalid");
						msg = '이미 가입된 아이디입니다.';
					}
					$("#idc").text(msg);
				}
			});
		}
//	});
	
});



//pw 실시간 validation
$("#userPassword").keyup(function(){
	let msg = '';
	let password = this.value;
	
	//영어 대소문자, 숫자, !@#$% 사용가능, 영어 1글자 이상, 숫자 1글자 이상, 특수문자 0~n 글자 총 글자수 8~15
	let pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%]{8,15}$/g;
	
	if (password.length <= 2) {
		$("#userPassword").removeClass("is-invalid");
		$("#userPassword").removeClass("is-valid");
		msg = '';
		
	} else if (password.length > 7) {
		
		if (pwRegExp.test(password)) {
			$("#userPassword").removeClass("is-invalid");
			$("#userPassword").addClass("is-valid");
			msg = "유효한 비밀번호입니다.";
			
		} else {
			$("#userPassword").removeClass("is-valid");
			$("#userPassword").addClass("is-invalid");
			msg = "비밀번호가 유효하지 않습니다.";
		}
		
	} else {
		$("#userPassword").removeClass("is-valid");
		msg = '비밀번호의 최소 길이는 8글자 입니다';
	}
	
	$("#pwc").text(msg);
	
});

/* $("#password2").on("focus",function(){
	$("#pwc").text('');
});
 */
//pw 재입력 검증

$("#userPassword2").keyup(function(){
	let msg = '';
	let password2 = this.value;
	let password = $("#userPassword").val();
	
	if(password2.length <= 2) {
		$("#userPassword2").removeClass("is-invalid");
		$("#userPassword2").removeClass("is-valid");
		msg = '';
		
	} else if ((password2.length > 0) && (password2.length == password.length)) {
		
		if (password == password2) {
			$("#userPassword2").removeClass("is-invalid");
			$("#userPassword2").addClass("is-valid");
			msg = "비밀번호가 일치합니다.";
			$("#userPassword").attr("disabled", true);
			$("#userPassword2").attr("disabled", true);
			
		} else {
			$("#userPassword2").removeClass("is-valid");
			$("#userPassword2").addClass("is-invalid");
			msg = "비밀번호가 일치하지 않습니다.";
		}
		
	} else {
		$("#userPassword2").removeClass("is-valid");
	}
		
	$("#pwc").text(msg);
	
});

//이메일 정규식 검증
function emailRegCheck() {

	let msg = '';
	let userEmail = document.getElementById("userEmail").value;
	
	let emailRegExp = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
		
	if (emailRegExp.test(userEmail)) {
		$("#userEmail").removeClass("is-invalid");
		$("#userEmail").addClass("is-valid");
		msg = "유효한 이메일입니다.";
		$("#emc").text(msg);
		return true;
		
	} else {
		$("#userEmail").removeClass("is-valid");
		$("#userEmail").addClass("is-invalid");
		msg = "이메일이 유효하지 않습니다.";
		$("#emc").text(msg);
		return false;
	}
	
	
}
 
 
 
let code ='';
let runFlag = false;
let timer = null;


//인증메일 전송 ajax
$("#emailBtn").on("click", function(){
	
	if (!emailRegCheck()) {
		return;
	}
	
	$("#ecodeGroup").show();
	
	let email = $("#userEmail").val();
	let ecode = $("#ecode");
	
	let emc = $("#emc");
	let count = 180;
	
	
	if (runFlag) {
		clearInterval(timer);
		emc.html("");
		startTimer(count, emc);
	} else {
		startTimer(count, emc);
	}
	
	$.ajax({
		type:'get',
		url: '${contextPath}/users/emailcheck?email=' + email,
//		async: false,
		success: function (data) {
			$('#userEmail').attr('disabled', true);
			ecode.attr('readonly', false);
			code = data;
			alert('인증번호가 전송되었습니다.');
		}
	});
});



$('#ecodeBtn').on("click", function(){
	let eCode = $("#ecode").val();
	
	
	$.ajax({
		type: 'post',
		url: '${contextPath}/users/ecodecheck',
		data: {eCode: eCode},
		dataType: "text",
		success: function (result) {
			console.log(result);
			
			if(result == 'correct') {
				clearInterval(timer);
				$('#emc').html('인증번호가 일치합니다.');
				$('#ecode').removeClass('is-invalid');
				$('#ecode').addClass('is-valid');
				$('#userEmail').attr('readonly', true);
				$('#ecode').attr('readonly', true);
			} else {
				$('#emc').html('인증번호가 불일치합니다. 다시 확인해주세요');
				$('#emc').removeClass('is-valid');
				$('#emc').addClass('is-invalid');
			}
		}
		
	});

	
});


//이메일인증 타이머
function startTimer(count, emc) {
	let minutes = '';
	let seconds = '';
	
	timer = setInterval(function(){
		minutes = parseInt(count / 60, 10);
		seconds = parseInt(count % 60, 10);
		
		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;
		
		$("#emc").html(minutes + " : " + seconds);
		
		if (--count < 0) {
			clearInterval(timer);
			$("#emc").html("시간 초과");
			runFlag = false;
		}
	}, 1000);
	runFlag = true;
}


// 이름 Regexp
$("#userName").blur(function(){
	
	let name = $("#userName").val();
	let nameRegExp = /^[가-힣]{2,5}$/;
	
 	if (name == '' || name.length == 0) {
		$("#userName").removeClass("is-invalid");
		$("#userName").removeClass("is-valid");
		$("#userName").attr("placeholder", "이름");
	
		return
	} 
	
	if (!nameRegExp.test(name)) {
		$("#userName").removeClass("is-valid");
		$("#userName").addClass("is-invalid");
		$("#userName").val("");
		$("#userName").attr("placeholder", "이름은 한글 2~5글자만 가능합니다.");
	} else {
		$("#userName").removeClass("is-invalid");
		$("#userName").addClass("is-valid");
	}
});

$("#userName").on("focus", function(){
	$("#userName").removeClass("is-invalid");
	$("#userName").removeClass("is-valid");
	$("#userName").attr("placeholder", "이름");
});



let themeObj = {
		   searchBgColor: "#54B4D3", //검색창 배경색
		   queryTextColor: "#FFFFFF" //검색창 글자색
		};

//주소찾기 카카오 api
function searchAddressKakao() {
	let width = 500;
	let height = 500;
	new daum.Postcode({
		width: width,
		height: height,
		themeObj: themeObj,
	    oncomplete: function(data) {
	    	$("#addressDetail").attr("readonly", false);
	    	let roadAddr = data.roadAddress; // 도로명 주소 변수
	    	let extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
            }
             // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
	    	
	    	
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = roadAddr + extraRoadAddr;
           
            let guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                let expRoadAddr = data.autoRoadAddress;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
	    	
	    }
	}).open({
		left: (window.screen.width / 2) - (width / 2),
		top: (window.screen.height / 2) - (height / 2),
		popupTitle: '주소 찾기',
		popupKey: 'addressPopup1'
	});
	
}

//전화번호
$("#phone2").blur(function(){
	let phone2 = $("#phone2").val();
	
	if (phone2.length != 4) {
		$("#phone2").removeClass("is-valid");
		$("#phone2").addClass("is-invalid");
	
	} else {
		$("#phone2").removeClass("is-invalid");
		$("#phone2").addClass("is-valid");
		
	}
	
});

$("#phone3").blur(function(){
	let phone3 = $("#phone3").val();
	
	if (phone3.length < 4) {
		$("#phone3").removeClass("is-valid");
		$("#phone3").addClass("is-invalid");
	
	} else {
		$("#phone3").removeClass("is-invalid");
		$("#phone3").addClass("is-valid");
		
	}
	
});



//생년월일 datepicker

$(function(){
	
	$("#userBday").datepicker({
		showOn: "button",
		buttonImage:"${contextPath}/resources/icons/calendar.png",
		buttonImageOnly: true,
		yearSuffix: "년",
		changeMonth: true,
		changeYear: true,
		nextText: "다음 달",
		prevText: "이전 달",
		showOtherMonths: true,
		showMonthAfterYear: true,
//		showButtonPanel: true,
		yearRange: 'c-50:c+50',
		closeText: "닫기",
		dateFormat: "yy-mm-dd",
		dayNamesMin: ["월", "화", "수", "목", "금", "토", "일"],
		dayNames: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		minDate: "-100Y",
		maxDate: "-15Y"
	});
	

});

 
</script>
  
   


<%@include file="/WEB-INF/views/include/footer.jsp" %>
