<%-- 임시 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="/WEB-INF/views/include/mainheader.jsp" %>

<%-- 230711 임지혁 생성 --%>

<!-- <style>
div {border:1px solid grey}
</style> -->


<style>

.container {width:50%;}

.main {width:80%;margin:auto;}


</style>


<div class="container position-relative">
	<div class="main">
		<div class="row">
			<div class="d-flex fs-1 align-items-end justify-content-center mb-4" style="height:10rem;">
				<strong>비밀번호 찾기</strong>
			</div>
		</div>
		
		<div class="row"><%-- 이메일 발송 메시지 --%>
			<div class="d-flex align-items-center justify-content-center">
				<span id="msg" class="text-muted fs-6"></span>
			</div>
		</div>
			
		<div class="row mt-3 mb-3"><%-- 아이디 --%>
			<div class="d-flex align-items-center justify-content-center">
				<div class="form-group" style="height:4rem">
					<input type="text" value="" class="form-control" 
						   name="userId" id="userId" style="width:20rem" placeholder="아이디"
						   maxlength="15" required autofocus>
					<small class="text-body-secondary" id="idc"></small>
				</div>
			</div>
		</div>
			
		<div class="row mt-3 mb-3"><%-- 이메일 --%>
			<div class="d-flex align-items-center justify-content-center">
				<div class="form-group" style="height:4rem">
					<input type="text" class="form-control" 
						   name="userEmail" id="userEmail" style="width:20rem" placeholder="이메일"
						   required>
					<small class="text-body-secondary" id="emc"></small>	   
				</div>
			</div>
		</div>
		
		<div class="row mb-4"><%-- 이메일 발송 --%>
			<div class="d-flex align-items-center justify-content-center">
				<button type="button" id="findPwBtn" class="btn btn-primary btn-lg" style="width:20rem">
					<strong>임시 비밀번호 발급</strong>
				</button>
			</div>
		</div>
		
		
		<form id="loginFrm" method="get" action="${contextPath }/login">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<div class="row mb-2"><%-- 로그인창으로 돌아가기 --%>
				<div class="d-flex align-items-center justify-content-center">
					<button type="submit" id="loginBtn" class="btn btn-info btn-lg" style="width:20rem">
						<strong>로그인하기</strong>
					</button>
				</div>
			</div>
		</form>
		
		<div class="row" style="height:8rem">
		</div>
	
	</div>
</div><%-- /.container end --%>

<script>

let csrfHeaderName = "${_csrf.headerName}";
let csrfToken = "${_csrf.token}";


$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken);
});



// id 실시간 validation
$("#userId").keyup(function(){
	let msg = '';
	let userId = this.value;
	
	//영어 대소문자, 숫자만 사용가능, 시작문자 영어 대소문자, 총 글자 수 6~15
	let idRegExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,14}$/;
	
//	let result = idRegExp.test(userId) ? "유효한 아이디입니다."
//						  			   : "아이디가 유효하지 않습니다.";
	
	if(userId.length > 5) {
		
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
		msg = '아이디의 최소 길이는 6글자 입니다';
	}
	
	$("#idc").text(msg);
	
	if(userId.length <= 2) {
		$("#userId").removeClass("is-invalid");
		$("#userId").removeClass("is-valid");
		$("#idc").text('');
	}
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



//아이디 이메일 검증 ajax
// 임시비밀번호 발급 이메일 발송
$("#findPwBtn").on("click", function(){
	if (!emailRegCheck()) {
		return;
	}
	
	let userId = document.getElementById("userId").value;
	let userEmail = document.getElementById("userEmail").value;
	
	let userIdAndEmail = {
							"userId" : userId,
							"userEmail" : userEmail
					  	 };
	
	console.log(userIdAndEmail);
	
	$.ajax({
		type:'post',
		url: '${contextPath}/users/findpw',
//		async: false,
		data : JSON.stringify(userIdAndEmail),
		contentType: "application/json; charset=utf-8",
		dataType: "text",
		success: function (result) {
			if (result == 'success') {
				console.log(result);
				$("#msg").html("임시 비밀번호가 이메일로 발송되었습니다.");
			} else {
				console.log(result);
				$("#msg").html("임시 비밀번호 발송에 실패했습니다.");
				
			}
		}
	});
});




</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>