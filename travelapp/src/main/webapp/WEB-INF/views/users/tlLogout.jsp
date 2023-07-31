<%-- 임시 --%>
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
</style>


<div class="container position-relative">
	<div class="card bg-white mt-5">
		<div class="main">
			<div class="row">
				<div class="d-flex justify-content-center align-items-center">
					<div class="login-panel panel panel-default" style="margin-top: 10%;margin-bottom:10%">
						<div class="panel-heading mb-5">
							<h2 class="panel-title">로그아웃하시겠습니까?</h2>
						</div>
						<div class="panel-body"> 
							<form role="form" id="logoutFrm" method="post" action="${contextPath }/logout">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
								<fieldset>
									<div class="d-flex justify-content-center">
										<button type="button" id="logoutBtn" class="btn btn-lg btn-info btn-block">Log out</button>
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

var logoutFrm = $("#logoutFrm");

$("#logoutBtn").on("click", function(){
	
	logoutFrm.submit();
	alert("로그아웃 되었습니다.");
	
});




</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>