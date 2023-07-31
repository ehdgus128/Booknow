<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="/WEB-INF/views/include/mainheader.jsp" %>

<%-- 230714 임지혁 생성 --%>

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
					<div class="login-panel panel mb-5" >
						<div class="panel-heading mb-5"><br>
							<h2 class="panel-title text-center">
								<c:out value="${result }"/>
							</h2>
						</div>
						<form role="form" id="resultFrm">
							<div class="panel-body">
								<div class="text-center">
									<c:if test='${not empty naverUser}'>
										<h2>
											<c:out value="${result2 }"/>
										</h2><br><br>
										<input type="hidden" id="naverId" name="naverId" value="${naverUser.naverId }">
										<input type="hidden" id="naverName" name="naverName" value="${naverUser.naverName }">
										<input type="hidden" id="naverEmail" name="naverEmail" value="${naverUser.naverEmail }">
										<input type="hidden" id="naverMobile" name="naverMobile" value="${naverUser.naverMobile }">
										<input type="hidden" id="naverBday" name="naverBday" value='<fmt:formatDate value="${naverUser.naverBday }" pattern="yyyy-MM-dd"/>'>
										<button type="button" id="joinBtn" class="btn btn-lg btn-warning">회원가입</button>
									</c:if>
								</div><br>
							
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
								<div class="d-flex justify-content-center">
									<button type="button" id="homeBtn" class="btn btn-lg btn-info">홈으로 이동</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

var resultFrm = $("#resultFrm");

$("#joinBtn").on("click", function(){
	
	resultFrm.attr("method", "get");
	resultFrm.attr("action", "${contextPath}/join");
	
	
	resultFrm.submit();
});





$("#homeBtn").on("click", function(){
	
	resultFrm.attr("method", "get");
	resultFrm.attr("action", "${contextPath}/");
	
	resultFrm.submit();
	
});


</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>