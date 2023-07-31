<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="/WEB-INF/views/include/mainheader.jsp" %>




<%-- 230705 임지혁 생성 --%>

<!-- <style>
div {border:1px solid grey}
</style> -->


<style>
.container {width:50%;}

.card {width:80%;margin:auto;}
.main {width:80%;margin:auto;}

.kakao {
	border:none;
	background:none;
}

</style>



<div class="container position-relative">
	<div class="card bg-white mt-5">
		<div class="main">
			<div class="row">
				<div class="d-flex fs-1 align-items-end justify-content-center mb-4" style="height:5rem;">
					<strong>로그인</strong>
				</div>
			</div>
			
			<form id="loginFrm" name="loginFrm" method="post" action="${contextPath }/login">	
				
				<div class="row"><%-- 로그인 오류 메시지 --%>
					<div class="d-flex align-items-center justify-content-center">
						<h6 class="text-muted"><c:out value="${error }"/></h6>
					</div>
				</div>
				
				<div class="row mt-3 mb-3"><%-- 아이디 --%>
					<div class="d-flex align-items-center justify-content-center">
						<div class="form-group" style="height:4rem">
							<input type="text" value="" class="form-control" 
								   name="username" id="userId" style="width:20rem" placeholder="아이디"
								   maxlength="15" autofocus>
							<small class="text-body-secondary" id="idc"></small>
						</div>
					</div>
				</div>
				
				<div class="row mt-3 mb-3"><%-- 비밀번호 --%>
					<div class="d-flex align-items-center justify-content-center">
						<div class="form-group" style="height:4rem">
							<input type="password" value="" class="form-control" 
								   name="password" id="password" style="width:20rem" placeholder="비밀번호"
								   maxlength="15">
							<small class="text-body-secondary" id="pwc"></small>
						</div>
					</div>
				</div>
				
				<div class="row mb-2"><%-- 아이디/비밀번호 찾기 / 회원가입 --%>
					<div class="d-flex justify-content-center mb-3">
						<button type="button" id="findPw" class="btn btn-primary btn-sm">비밀번호 찾기</button>&nbsp;&nbsp;&nbsp;
						<button type="button" id="findId" class="btn btn-primary btn-sm">아이디 찾기</button>&nbsp;&nbsp;&nbsp;
						<button type="button" id="joinMember" class="btn btn-primary btn-sm">회원 가입</button>
					</div>	
				</div>
				
				<div class="row mb-2"><%-- 로그인 버튼 --%>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<div class="d-flex align-items-center justify-content-center">
						<button type="submit" id="loginBtn" class="btn btn-info btn-lg" style="width:20rem"><strong>로그인</strong></button>
					</div>
				</div>
				
				<div class="row">
					<div class="d-flex justify-content-center mb-3">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
							<label class="form-check-label" for="rememberMe">로그인 상태 유지</label>
						</div>
					</div>
				</div>
				
			</form>
				
			<div class="row mb-5">
				<div class="text-center">
					<a href="${naver_url }"><img width=200 src="${contextPath }/resources/icons/naverLoginBtn.png" alt="네이버 로그인 버튼"></a>
				</div>
			</div>
	
		</div><%-- /.main end --%>
	</div><%-- /.card end --%>
</div><%-- /.container end --%>


<script>

let loginFrm = $("#loginFrm");

let csrfHeaderName = "${_csrf.headerName}";
let csrfToken = "${_csrf.token}";


$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken);
});



//230711 비밀번호 찾기
$("#findPw").on("click", function(){

	loginFrm.attr("method", "get");
	loginFrm.attr("action", "${contextPath}/users/findpw");
	
	loginFrm.submit();
	
});


//230712 아이디 찾기
$("#findId").on("click", function(){

	loginFrm.attr("method", "get");
	loginFrm.attr("action", "${contextPath}/users/findid");
	
	loginFrm.submit();
	
});



//회원가입 이동
$("#joinMember").on("click", function(){
	loginFrm.attr("method", "get");
	loginFrm.attr("action", "${contextPath}/join");
	
	loginFrm.submit();
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



// pw 실시간 validation
$("#password").keyup(function(){
	let msg = '';
	let password = this.value;
	
	//영어 대소문자, 숫자, !@#$% 사용가능, 영어 1글자 이상, 숫자 1글자 이상, 특수문자 0~n 글자 총 글자수 8~15
	let pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%]{8,15}$/g;
	
	if(password.length > 7) {
		
		if (pwRegExp.test(password)) {
			$("#password").removeClass("is-invalid");
			$("#password").addClass("is-valid");
			msg = "유효한 비밀번호입니다.";
		} else {
			$("#password").removeClass("is-valid");
			$("#password").addClass("is-invalid");
			msg = "비밀번호가 유효하지 않습니다.";
		}
		
	} else {
		msg = '비밀번호의 최소 길이는 8글자 입니다';
	}
	
	$("#pwc").text(msg);
	
	if(password.length <= 2) {
		$("#password").removeClass("is-invalid");
		$("#password").removeClass("is-valid");
		$("#pwc").text('');
	}
});


</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>