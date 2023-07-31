<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지_0712 창훈응용   -->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<div class="container-fluid position-relative"> <!--큰틀-->
	<div class="row mx-2 my-2">
		<div class="col-12">
			<div class="row">
				<div class="col-2"><!-- div left-sidebar -->
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
			 	 </div>  <!-- /end div left-sidebar  -->
 	 	
				</div>
				<div class="col-10">
					 <div class="main"> <!-- 본문 시작   -->
						  <div class="row">
								<div class="card border-primary  col-12 mx-2 my-2"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">
								 	 <hr>
									 <h3>문의 내용</h3>
								 	 </div>
								  <div class="card-body"> 

				<div class="alert alert-dismissible alert-primary ">
					  <strong >아이디: </strong> ${qnaBoards.qnaQwriter}
					
					</div>
					
					<div class="alert alert-dismissible alert-success ">
					  <strong>카테고리: </strong> ${qnaBoards.qnaQcategory}
					</div>
			
					<div class="form-group has-success">
					  <label class="form-label mt-8 text-success" style="font-weight:bolder;">최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
 																												value="${qnaBoards.qnaQregDate}"/>]
					  <input  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaBoards.qnaQmodDate}"/>' class="alert alert-dismissible alert-primary mb-2"  style=" width: 100%;"name="qnaQmodDate" readonly="readonly">
					</div>
					
					
					<div class="form-group has-success my-6">
					  <label class="form-label mt-8 text-success" style="font-weight:bolder;">제목</label>
					  <input type="text" value='<c:out value="${qnaBoards.qnaQtitle}"/>' class="alert alert-dismissible alert-success" style=" width: 100%;" readonly="readonly">
					</div>
					
					 <label class="form-label mt-8 text-success "style="font-weight:bolder;">질문</label>
					<div class="alert alert-dismissible alert-secondary">
					    <label>내용:</label>
					  <strong>${qnaBoards.qnaQcontent}</strong> 
					</div>
					
					 <label class="form-label mt-8 text-success"style="font-weight:bolder;">관리자</label>
					<div class="alert alert-dismissible alert-secondary ">
					    <label>답변:</label>
					  <strong id="QNAAnswer"></strong> 
					</div>
					  <div>&nbsp;</div>
					
					<button type="button" class="btn btn-primary" id="BtnMovemodify" data-oper="modify">수정</button>
					<button type="button" class="btn btn-info" id="BtnMoveList" data-oper="list" style="float: right;" >나의문의내역</button>
								
					<form id="mypagefrm">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type="hidden" value="${userId}">
					</form>





								  </div>
								</div>
						  </div>
					</div><!-- .main 본문끝  -->
				</div>
			</div>
		</div><!-- page col end -->
	</div><!-- page row end -->
</div> <!-- container end -->

<script>
var frmSendValue =$("#frmSendValue");
//수정 페이지로
$("#BtnMovemodify").on("click",function(){
	location.href='${contextPath}/qna/modify?qnaQno=<c:out value="${qnaBoards.qnaQno}"/>';

});

//나의문의내역 페이지로
$("#BtnMoveList").on("click",function(){
	location.href='${contextPath}/qna/list';
//	frmSendValue.find("#qnaQno").remove();
//	frmSendValue.attr("action", "${contextPath}/qna/list");
//	frmSendValue.attr("method", "get");
//	frmSendValue.submit();
});

var csrfHeaderName = "${_csrf.headerName}" ;
var csrfToken = "${_csrf.token}" ;

$(document).ajaxSend(function(e, xhr, options){
   xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
});
  
$("#goDetail").on("click",function(){
	$("#mypagefrm").attr("action","${contextPath}/mypage/myDetail");
	$("#mypagefrm").attr("method","get");
	$("#mypagefrm").submit();
});


</script>

 <script>
var result ='<c:out value="${result}"/>';
function checkModifyOperation(result){
	if(result ===''|| history.state){
		return;
	}else if(result === 'successModify'){
		var myMsg = "글이 수정되었습니다.";
	}
	alert(myMsg);
	myMsg='';
}

$(document).ready(function(){
	checkModifyOperation(result);
});

 </script>
 <script>
 var QNAAnswer = $("#QNAAnswer") ;
 
	$(document).ready(function () {
		
		
		var qnaQno = "${qnaBoards.qnaQno}";

		$.ajax({
			type : 'get',
			url: '${contextPath}/answer/'+qnaQno,
			// travelapp/answer/pages/{qnaQno}/{page}
			dataType: 'json',
			success : function(data) {
				var aqnAnswerHtml = "" ;
			
				
				console.log(data.qnaAcontent);
			
				
			 
				QNAAnswer.html(data.qnaAcontent) ;

				
				
			}
		});




	});
 

 </script>

<%@include file="../include/footer.jsp" %>