<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 


<%@include file="../include/flyheader.jsp" %>  

 
 <!-- 20230703 세연 생성
 회원정보/수정 페이지 -->

 <!--큰틀-->
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
				<!-- col-2 -->
				
<div class="card border-light mb-3" style="width: 65%;margin: left ;" >
				<div class="col-10" style="width: 100%;">
				 <hr>
				 <h3>회원정보/수정</h3>
				 <hr>
	<div class ="card border-light"> <!-- 맨외곽 테두리 -->
			<div class="card border-primary mb-3" style="max-width: 150%; margin: auto;"><!-- 내역없다는 상자 테두리 -->
			 <div class="card-header">비밀 번호를 다시 입력해주세요</div>
				<div class="card-body">
						<form id="checkUserfrm" >
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							
							&nbsp&nbsp&nbsp&nbsp&nbsp
							이름: <c:out value='${user.userName}'/>
							<br><br>
							&nbsp&nbsp&nbsp아이디: <input type="text"  readonly="readonly" id="inputUserIdVal" value="${user.userId}">
							<br><br>
							비밀번호: <input type="password" id="inputPasswordVal">
							 
							<button id="checkUserBtn" type="button" class="btn btn-primary" style="display: inline;">확인</button>
							<br><br>

						</form>
								
								  </div>
								</div><!-- END/내역없다는 상자 테두리 -->	


						

					
					</div><!-- 맨외곽테두리 끝 -->

				</div>
			</div>				
				
				

				
	

					<div id="checkSuccessDiv" style="display: none;"> 
						무야호
					</div>
	

<form id="mypagefrm">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="hidden" value="${userId}">

</form>

<script>

$("#goDetail").on("click",function(){
	$("#mypagefrm").attr("action","${contextPath}/mypage/myDetail");
	$("#mypagefrm").attr("method","get");
	$("#mypagefrm").submit();
})

var csrfHeaderName = "${_csrf.headerName}" ;
var csrfToken = "${_csrf.token}" ;

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
});
	

$("#checkUserBtn").on("click", function() {
	var userId = $("#inputUserIdVal").val();
	var userPassword = $("#inputPasswordVal").val();

	var requestData = JSON.stringify({ userId: userId, userPassword: userPassword });

	$.ajax({
		
		
		
	url: "${contextPath}/mypage/myDetail",
	method: "POST",
	data: requestData,
	contentType: "application/json;charset=UTF-8",
	success: function(response) {
	// AJAX 요청 성공 시 실행할 동작
		if (!response) {
			
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		const checkUserfrm = document.querySelector("#checkUserfrm");
		checkUserfrm.method = "POST";
		checkUserfrm.action = "${contextPath}/mypage/myModify";
		checkUserfrm.submit();
		
			
			// var form = document.createElement("form");
			//   form.method = "POST";
			//   form.action = "${contextPath}/mypage/myModify";
			//   document.body.appendChild(form);
			//   form.submit();


	},
	error: function(xhr, status, error) {
		
		console.error(error);
	}
	});
});



</script>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  















 
























 <%@include file="../include/footer.jsp" %>