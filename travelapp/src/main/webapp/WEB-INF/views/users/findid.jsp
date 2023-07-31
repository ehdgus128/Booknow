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
				<strong>아이디 찾기</strong>
			</div>
		</div>
		
		<div class="row"><%-- 이메일 발송 메시지 --%>
			<div class="d-flex align-items-center justify-content-center">
				<span id="msg" class="text-muted fs-6"></span>
			</div>
		</div>
			
		<div class="row mt-3 mb-3"><%-- 이름 --%>
			<div class="d-flex align-items-center justify-content-center">
				<div class="form-group" style="height:4rem">
					<input type="text" value="" class="form-control" 
						   name="userName" id="userName" style="width:20rem" placeholder="아이디"
						   maxlength="15" required autofocus>
					<small class="text-body-secondary" id="nmc"></small>
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
				<button type="button" id="findIdBtn" class="btn btn-primary btn-lg" style="width:20rem">
					<strong>아이디 찾기</strong>
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



//이름 이메일 검증 ajax
// 임시비밀번호 발급 이메일 발송
$("#findIdBtn").on("click", function(){
	if (!emailRegCheck()) {
		return;
	}
	
	let userName = document.getElementById("userName").value;
	let userEmail = document.getElementById("userEmail").value;
	
	let userNameAndEmail = {
							"userName" : userName,
							"userEmail" : userEmail
					  	 };
	
	console.log(userNameAndEmail);
	
	$.ajax({
		type:'post',
		url: '${contextPath}/users/findid',
//		async: false,
		data : JSON.stringify(userNameAndEmail),
		contentType: "application/json; charset=utf-8",
		dataType: "text",
		success: function (userId) {
			if (userId != 'failed') {
				$("#msg").text('가입하신 아이디는 ' + userId + ' 입니다.');
			} else {
				$('#msg').text('아이디를 찾을 수 없습니다.\n이름과 이메일을 다시 확인해주세요');
			}
			
		}
	});
});




</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>