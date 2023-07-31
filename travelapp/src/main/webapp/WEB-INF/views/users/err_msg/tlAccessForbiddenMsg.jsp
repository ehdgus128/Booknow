<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@include file="/WEB-INF/views/include/mainheader.jsp" %>

<style>
	.container {
		width:50%}
		
	.card {width:80%;margin:auto;}
	.main {width:80%;margin:auto;}
	

</style>


	
	<div class="container text-center">
		<div class="card bg-white mt-5">
			<div class="main">
				<div class="row mt-5 mb-5">
					<h2>해당 페이지에 접근이 제한됨</h2><br>
				</div>

				<div class="row mt-5 mb-5">
					<h4><c:out value="${tlAccessDeniedMsg}"/></h4>
					<h4><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h4>
					<h4>5초 후 메인페이지로 이동합니다</h4>
				</div>	
			</div>
		</div>
	</div>

<script>


function go_main(){

    location.href="${contextPath}/";
}

$(function(){
	
    setTimeout('go_main()',5000);
	
});

</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>