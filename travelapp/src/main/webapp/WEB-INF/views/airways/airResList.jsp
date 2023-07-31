<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지-->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>


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
				   <div class="card border-light mb-3" style="width: 65%;margin: left ;" >
				<div class="col-10">
				 	<hr>
				 	<h3>나의 항공 예약 내역</h3>
				 	<hr>

					<div class ="card border-light"> <!-- 맨외곽 테두리 -->

					  	 <c:choose>
					  	  	<c:when test="${userResList eq 'ResNull'}"><!-- 해당 userId로 예약 내역이 없을때 -->
						
								<!-- 	<div class="card border-primary mb-3 inner-div"  style="max-width: 150%; margin: auto;">예약내역이 없습니다</div> -->
								<div class="card border-primary mb-3" style="max-width: 150%; margin: auto;"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">마이페이지>항공권 예약 내역</div>
								  <div class="card-body">
								    <h4 class="card-title"><p>예약내역이 없습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p></h4>
								    <p class="card-text">tlbook과 여행을 시작해볼까요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				 
				  
				  		<a href="${contextPath}/airways/"  class="btn btn-primary btn-lg button-link">항공메인페이지</a>&nbsp;&nbsp;&nbsp;<a href="${contextPath}/hotel/" class="btn btn-secondary btn-lg button-link">호텔메인페이지</a>
				  
								
								  </div>
								</div><!-- END/내역없다는 상자 테두리 -->
				 			
				 		
						 	</c:when>
						 	
						 	
						 		  
						    <c:otherwise><!-- 해당 userId로 예약 내역이 1개이상 있을때  -->
							 		<%-- 일단 보류 
							 		<c:forEach var="item" items="${userResList}" begin="0" step="1">
										<div  style="margin: auto;"> </div>
										
				  								  <div class="card border-primary mb-3" style="max-width: 20rem; margin: auto;">
												  <div class="card-header">예약번호: ${item.airResno} </div>
												  <div class="card-body">
												    <h4 class="card-title">Primary card title</h4>
												    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
												  </div>			
				  								</div>
				  	 
				  	
				  	
				  	
				  	
				  					</c:forEach>	<!-- foreach 끝 -->
										 --%>
								
					 <form class="form-inline" id="frmSendValue" action="${contextPath }/airways/airResList" method="get" name="frmSendValue">
					<div class="form-group">
						<label class="sr-only"></label>
					 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<select class="form-control" id="selectScope" name="scope">
							<option value="" ${pagingDTO.airResDetailPagingDTO.scope == null ? 'selected' : '' }>선택</option>
							<option value="T" ${pagingDTO.airResDetailPagingDTO.scope eq 'T' ? 'selected' : '' }>예약번호</option>
							<option value="C" ${pagingDTO.airResDetailPagingDTO.scope eq 'C' ? 'selected' : '' }>출발지</option>
							<option value="W" ${pagingDTO.airResDetailPagingDTO.scope eq 'W' ? 'selected' : '' }>도착지</option>
							<option value="TC" ${pagingDTO.airResDetailPagingDTO.scope eq 'TC' ? 'selected' : '' }>예약번호+출발지</option>
							<option value="TW" ${pagingDTO.airResDetailPagingDTO.scope eq 'TW' ? 'selected' : '' }>예약번호+도착지</option>
							<option value="CW" ${pagingDTO.airResDetailPagingDTO.scope eq 'CW' ? 'selected' : '' }>출발지+도착지</option>
							<option value="TCW" ${pagingDTO.airResDetailPagingDTO.scope eq 'TCW' ? 'selected' : '' }>예약번호+출발지+도착지</option>
						</select>
						
						<div class="input-group"><!-- 검색어 입력 -->
							<input class="form-control" id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요"
								   value='<c:out value="${pagingDTO.airResDetailPagingDTO.keyword}" />' />
							<span class="input-group-btn"><!-- 전송버튼 -->
								<!-- <button class="btn btn-warning" type="button" id="btnSearchGo"
										>검색 &nbsp;<i class="fa fa-search"></i>
								</button> -->
							</span>
						</div>
						<div class="input-group"><!-- 검색 초기화 버튼 -->
							<a href="${contextPath }/airways/airResList" ><button id="btnReset" class="btn btn-info" type="button">검색초기화</button></a>
						</div> 
						
					</div>
				
				  	<input type='hidden' id='pageNum' name='airResPageNum' value='${pagingDTO.airResDetailPagingDTO.airResPageNum}'>
					 <input type='hidden' id='airResPerPage' name='airResPerPage' value='${pagingDTO.airResDetailPagingDTO.airResPerPage}'>  
					<input type='hidden' id='airResPagingLast' name='airResPagingLast' value='${pagingDTO.airResPagingLast}'>
				 
					 <input  type="date" id="depPlandTime" name="depPlandTime"  value='${depPlandTime}' placeholder="출발시간" > ~
					 <input  type="date" id="arrPlandTime" name="arrPlandTime"   value='${arrPlandTime}' placeholder="도착시간" >
					 <br>  
					 
					 
				   <!--  <button class="calendar-button" onclick="setTimestamp()">달력에서 선택</button> -->
				   
				   <button class="btn btn-warning" type="button" id="btnSearchGo"
										>검색 &nbsp;<i class="fa fa-search"></i>
								</button>
				
				</form>
				<br>      
				  
									
				<table class="table table-hover" style="text-align: center; margin: auto;" >
				  
				  <thead  class="table-active">
				  	 <tr>
				      <th scope="col">예약번호</th>
				      <td scope="col">노선</td>
				      <td scope="col">일자</td>
				      <td scope="col">탑승인원</td>
				      <td scope="col">총 결제금액</td>
				      <td scope="col">판매상태</td>
				      <th scope="col">조회하기</td>
				      
				    </tr>
				  </thead>
				  
				  
				  
				  <tbody>
				    
				  
						  <c:forEach var = "item" items="${userResList}"> <!-- 예약번호 테이블 실질적인 화면 표시 foreach 시작  -->
						  
						    
						  <!--  <tr class="table-dark">
						    <tr class="table-active"> -->
						    <tr id="mySelect"> <!-- //추가한것 -->
						      <th scope="col" class="table-primary airResnoVal" style="width: 10%" value="${item.airResno}"><c:out value="${item.airResno}"/></th>
						      <td scope="col"  style="width: 20%"><c:out value="${item.depAirportNm}"/>-><c:out value="${item.arrAirportNm}"/></td>
						      <td scope="col"  style="width: 20%"><fmt:formatDate value="${item.depPlandTime}" pattern="yyyy/MM/dd HH:mm:ss" /> ~ <fmt:formatDate value="${item.arrPlandTime}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
						      
						<!--      <td scope="col"  style="width: 20%" id="peopleCnt-${item.airResno}"></td>  탑승인원 -->
						      <td scope="col"  style="width: 10%" id="${item.airResno}"></td> <!-- 탑승인원 -->
						      <td scope="col"  style="width: 15%" id="${item.airResno}-2"></td>  <!--총 결제금액 ajax -->
				<!-- 		  <td scope="col"  style="width: 20%"><span class="badge rounded-pill bg-success">상세내역</span></td>   -->
							  <td scope="col"  style="width: 10%">
							  <c:choose>
								  <c:when test="${item.airSellStatus eq '판매완료' }">
								  	<span style="color: green;"><c:out value="구매완료"/></span>
								  </c:when>
								  <c:otherwise>
								  	  <span><em><c:out value="${item.airSellStatus}"/></em></span>
								  </c:otherwise>
							  </c:choose>
							  </td>
						      <td scope="col"  style="width: 30%"><button type="button"  class="btn btn-success airResDetailBtn">상세내역</button></td>
						    </tr>
						    
<script>
 //총 인원수 & 가격 ajax
 
 
 		
var csrfHeaderName = "${_csrf.headerName}" ;
var csrfToken = "${_csrf.token}" ;
$(document).ajaxSend(function(e, xhr, options){
	   xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
	});
		



       function getTotal() {
		  	  var selectedOption4 = '${item.airResno}';
		
			 // console.log(selectedOption4) ;
			  
			  $.ajax({
			    url: "${contextPath}/airways/airResDetail" ,
			    method: "POST",
			    data: {airResno: selectedOption4} ,
			    success: function(response) {
			      // AJAX 요청 성공 시 실행할 동작
			      $("#" +selectedOption4).html(response.peopleCnt);
			      $("#" +selectedOption4+ "-2").html(response.totalPrice);
			      
			      var formattedPrice = new Intl.NumberFormat().format(response.totalPrice);
			        $("#" + selectedOption4+ "-2").html(formattedPrice + "원");
			    
			    },
			    error: function(xhr, status, error) {
			      // AJAX 요청 실패 시 실행할 동작
			      console.log(error);
			    }
			  });
			}
		
 
 
	   getTotal();    
	
 </script>
							  
							</c:forEach>	 
							  
								  </tbody>
								  
								</table>
								
								 
					
					<!--이건 이미 틀만 잡아놓음-->		
					<div style="margin: auto;"><!--페이징 포장 태그 시작 div -->
											
					 
											
										 <!-- 페이지 pagination 시작  -->
								   <ul class="pagination">
								   
										  <c:if test="${pagingDTO.airResprev}">   
								   			 <li class="page-item">
										      <a class="page-link" href="1">&laquo;&laquo;</a>
										    </li>
								   		  </c:if>
									   
									   
										  <c:if test="${pagingDTO.airResprev}">
										    <li class="page-item">
										      <a class="page-link" href="${pagingDTO.airResPagingStart - 1}">&laquo;</a>
										    </li>
										  </c:if>
										    
										    
										 <!-- 페이징 숫자 부분 -->
										  
										 <c:forEach var="pageNum" begin="${pagingDTO.airResPagingStart}" end="${pagingDTO.airResPagingEnd}" step="1">
										    <li class='page-item ${pagingDTO.airResDetailPagingDTO.airResPageNum == pageNum ? "active" : "" }'>
										      <a class="page-link" href="${pageNum}">${pageNum}</a>
										    </li>
										 </c:forEach> 
										 
										     
										   <c:if test="${pagingDTO.airResnext}">
										    <li class="page-item">
										      <a class="page-link" href="${pagingDTO.airResPagingEnd + 1}">&raquo;</a>
										    </li>
										  </c:if>
										  
										   <c:if test="${pagingDTO.airResnext}">   
								   			 <li class="page-item">
										      <a class="page-link" href="${pagingDTO.airResPagingLast}">&raquo;&raquo;</a>
										    </li>
								   		  </c:if>
										  
								  </ul>
							
							
							
							
				    	   <form id="airResDetailfrm">
								<input type="hidden" name="airResno" >
						   </form>
				  
							
							
							<form id="pagefrm">
								<input type='hidden' id='pageNum' name='airResPageNum' value='${pagingDTO.airResDetailPagingDTO.airResPageNum}'>
								<input type='hidden' id='airResPagingLast' name='airResPagingLast' value='${pagingDTO.airResPagingLast}'>
								<input type='hidden' id='scope' name='scope' value="${scope}" >
								<input type='hidden' id='keyword' name='keyword' value="${keyword}">
								<input type='hidden' id='depPlandTime11' name='depPlandTime' value="${depPlandTime}">
								<input type='hidden' id='arrPlandTime22' name='arrPlandTime' value="${arrPlandTime}">
								 
							 
							</form>	
							
								        
				</div><!--끝/ 페이징 포장 태그 끝 div -->
						 
							
							
							
							
							
							</c:otherwise>	
						 </c:choose><!-- choose 끝 -->

					
					</div><!-- 맨외곽테두리 끝 -->

				</div>
			</div>
		</div>
	</div>
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
	
	
	$(".airResDetailBtn").on("click", function() {
	    var airResno = $(this).closest("tr").find(".airResnoVal").attr("value");
	    $("#airResDetailfrm").find("input[name='airResno']").val(airResno);
	    $("#airResDetailfrm").attr("method", "get");
	    $("#airResDetailfrm").attr("action", "${contextPath}/airways/airResDetail");
	    $("#airResDetailfrm").submit();
	  });
	
	
	
	
	
	var frmSendValue = $("#frmSendValue");

	//검색버튼 누르면 초기화
	$("#btnSearchGo").on("click", function(){
		
		var scope = $("#selectScope").find("option:selected").val() ;
		/* if(!scope || scope == ""){
			alert("검색범위를 선택하세요.") ;
			return false ;
		}
		
		var keyword = $("#keyword").val() ;
		
		if( !keyword || keyword == "") {
			alert("검색어를 입력하세요.") ;
			return ;
		}
		 */
		 
		 var keyword = $("#keyword").val() ;
		 
		if((scope == "") && (keyword != "")){
			alert("검색 범위를 선택 하세요.") ;
			return false ;
		}
		
		
		
		if((scope != "") && (keyword == "")) {
			alert("검색어를 입력하세요.") ;
			return ;
		}
		
		  
	  
		
		frmSendValue.find("input[name='depPlandTime']").value;
		frmSendValue.find("input[name='arrPlandTime']").value;
		frmSendValue.find("input[name='airResPageNum']").val(1);
		frmSendValue.attr("action","${contextPath }/airways/airResList");
		frmSendValue.attr("mothod","get");
		frmSendValue.submit() ;
		
	});	
	 
	
 
	 
	$(".pagination a").on("click",function(e){
		e.preventDefault();
			$("#pagefrm").find("input[name='airResPageNum']").val($(this).attr("href"));
			$("#pagefrm").attr("action","${contextPath}/airways/airResList");
			$("#pagefrm").attr("method", "get") ;
			
			$("#pagefrm").submit();
			
		
	})
	  
	
	
	
	 
	</script>				
							


<%@include file="../include/footer.jsp" %>