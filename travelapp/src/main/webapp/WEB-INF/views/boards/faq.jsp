
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../include/flyheader.jsp" %>
<div class="container-fluid position-relative"> <!--큰틀-->
	<div class="row mx-2 my-2">
		<div class="col-12">
			<div class="row">
				<div class="col-2">
					 		<!-- div left-sidebar -->
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
								<div class="card border-primary col-12 mx-2 my-2"><!-- 내역없다는 상자 테두리 -->
								 	 <div class="card-header">
								 	 <hr>
									 <h3>FAQ</h3>
									 </div>
								  <div class="card-body"> 

	<div class="row">
	<div class="card border-success col-12">
	
	  <div class="card-header " style="font-weight:bolder;" >
	 	<div class="text-primary-emphasis col-auto d-inline">카테고리를 선택해주세요</div>
		<button type="button" class="btn btn-info col-auto d-inline" id="BtnMoveAsk" data-oper="ask" style="float: right;" >질문하기</button>
	  </div>
	  
	  <div class="card-body">
	
	<div class="accordion accordion-flush" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" id="hotelbtn">
	        공통
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"  data-bs-parent="#accordionExample" >
	      <div class="accordion-body">
	        <table class="table table-hover"  >
	      		<tbody id="comDiv" >
					
			    </tbody>
		    </table> 
	        
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="hotelbtn">
	        호텔
	      </button>
	    </h2>
	    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	<table class="table table-hover"  >
	      		<tbody id="hotelDiv" >
					
			    </tbody>
		    </table> 
	       
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" id="airbtn">
	        항공
	      </button>
	    </h2>
	    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	      <div class="accordion-body" >
	  	<table class="table table-hover"  >
	      		<tbody id="airDiv" >
	
			    </tbody>
		</table> 
	
	      </div>
	    </div>
	  </div>
	</div>
	<!--  -->
	
		</div>
	
	  </div>
	  
	</div>
<!-- row end -->


	<div class="row">
		<div class="card border-secondary col-12 my-2" >
			<div class="card-header text-primary-emphasis">궁금증이 해결되시지 않으셨다면, 질문하기를 눌러주세요~ </div>
			<div class="card-body accordion card-header" id="accordionBoardList"></div>
		</div><%-- /.card --%>
	
	</div>
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

	</div>
	<!-- page col end -->
</div>
<!-- page row end -->


</div> <!-- container end -->




<script>
	var frmSendValue = $("#frmSendValue");

	$(".moveDetail").on( "click", function(e) {
    //console.log("test");
    //console.log($(this).data("faqno"));
	 frmSendValue.append("<input type='hidden' name='faqNo' value='" + $(this).data("faqno") + "'/>");
	 frmSendValue.attr("action", "${contextPath}/boards/faqdetail");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
	});
</script>

<script>
	$(".page-item a").on("click",function(e){
		e.preventDefault();
		frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
		//alert(frmSendValue.find("input[name='pageNum']").val());
		frmSendValue.attr("action","${contextPath}/boards/faq");
		frmSendValue.attr("method","get");
		frmSendValue.submit();
	});
	
	$("#goDetail").on("click",function(){
		$("#mypagefrm").attr("action","${contextPath}/mypage/myDetail");
		$("#mypagefrm").attr("method","get");
		$("#mypagefrm").submit();
	});
</script>



<script>

var hotelDiv = $("#hotelDiv") ;
var airDiv = $("#airDiv") ;
var comDiv = $("#comDiv") ;
var accordionBoardList = $("#accordionBoardList") ;




	$(document).ready(function () {

		$.ajax({
			type : 'get',
			url: '${contextPath}/boards/faq/list/'+1,
			// travelapp/boards/faq/list/3
			dataType: 'json',
			success : function(data) {
				var commonDivHtml = "" ;
				var hotelDivHtml = "" ;
				var airDivHtml = "" ;
				
				console.log(data.airCateId);
				//console.log(data.commonCateId);
				//console.log(data.hotelCateId);
				
			 	for(var i = 1; i < data.commonCateId.length; i++){
					commonDivHtml += "<tr class='table' >" +
						"<td class='cateBtn' data-cateid="+data.commonCateId[i].cateId+">"
							+ data.commonCateId[i].cateName +
						"<td>"+ "</tr>" ;
				} 
				
				
				
				//console.log("commonDivHtml: " + commonDivHtml);cateId
				comDiv.append(commonDivHtml) ;

				for(var i = 1; i < data.hotelCateId.length; i++){
					hotelDivHtml += "<tr class='table' >" +
						"<td class='cateBtn' data-cateid="+data.hotelCateId[i].cateId+">"
						+ data.hotelCateId[i].cateName +
						"<td>"+ "</tr>" ;
				}
				//console.log("hotelDivHtml: " + hotelDivHtml);
				hotelDiv.html(hotelDivHtml) ;
				
				for(var i = 1; i < data.airCateId.length; i++){
					airDivHtml += "<tr class='table' >" +
					"<td class='cateBtn' data-cateid="+data.airCateId[i].cateId+">"
					+ data.airCateId[i].cateName +
					"<td>"+ "</tr>" ;
				}
				
				//console.log("airDivHtml: " + airDivHtml);
				airDiv.html(airDivHtml) ;
				
			}
		});




	});
	
	$("#accordionExample").on("click","tr td.cateBtn ", function() {	
		//console.log($(this).data("cateid"));

		var cateIdData = $(this).data("cateid");

 		$.ajax({
			url: "/travelapp/boards/faq/"+cateIdData,
			type: "get",
			dataType: "json",
			success: function(data) {
				console.log(data);

				var tmpStr = "";
				var index = 0;
				for (const board of data) {
					console.log(board.faqQuestion);
					tmpStr += `
					<div class="accordion-item">
					<h2 class="accordion-header" id="heading`+index+`">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse`+index+`" aria-expanded="false" aria-controls="collapse`+index+`">
							`+board.faqQuestion+`
						</button>
					</h2>
					<div id="collapse`+index+`" class="accordion-collapse collapse" aria-labelledby="heading`+index+`" data-bs-parent="#accordionExample" >
						<div class="accordion-body">
							`+board.faqAnswer+`						
						</div>
					</div>
					</div>`;

					index++;
				}
				
				accordionBoardList.html(tmpStr);
			}
		}); 

	});

	// $("#accordionBoardList").on("click","tr td.faq", function() {	
	// 	console.log($(this).data("faqno"));
	// });



//QNA 페이지로 이동
	$("#BtnMoveAsk").on("click", function(){
	 location.href="${contextPath }/qna/reg";
	})

</script>




<%@include file="../include/footer.jsp" %>