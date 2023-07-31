<%-- 임시 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="/WEB-INF/views/include/mainheader.jsp" %>

<%-- 230708 임지혁 생성 --%>

<!-- <style>
div {border:1px solid grey}
</style> -->

<style>

.container {width:50%;}

.card {width:80%;margin:auto;}

.main {width:80%;margin:auto;}
</style>


<div class="container position-relative">
	<div class="card mt-5">
		<div class="main">
			<div class="row">
				<div class="d-flex justify-content-center align-items-center">
					<div class="login-panel panel panel-default" style="margin-top: 10%;margin-bottom:35%">
						<div class="panel-heading mb-5">
							<h2 class="panel-title">
								<c:out value="${userId }"/>님
							</h2>
							<h2>
								회원가입을 환영합니다!
							</h2>
						</div>
						<div class="panel-body"> 
							<form role="form" id="loginFrm" method="get" action="${contextPath }/login">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
								<fieldset>
									<div class="d-flex justify-content-center">
										<button type="button" id="loginBtn" class="btn btn-lg btn-info btn-block">로그인하기</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

var loginFrm = $("#loginFrm");

$("#loginBtn").on("click", function(){
	
	loginFrm.submit();
	
});


</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>