<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container-fluid" id="page-wrapper">
	<div class="row">
		<h1 class="page-header">항공상품목록</h1>
	</div>
	<div class="col-lg-12">
		<div>
			<form class="formAirlist" action="${contextPath}/admin/airways/list" method="get">
				<input type="hidden" id="airRouteno" name="airRouteno" value="0">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="pageNum" name="pageNum" value="${amFlightPurchasePagingDTO.pageNum}">
				<input type='hidden' id='lastPageNum' name='lastPageNum' value='${pagingCreator.lastPageNum }'>
				<input type="hidden" id="scope" name="scope" value="T">
			<div class="col-md-2 panel-heading">
				<select class="form-control" id="keyword" name="keyword">
					<option value="대한항공" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '대한항공' ? 'selected' : ''}>대한항공</option>
					<option value="아시아나항공" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '아시아나항공' ? 'selected' : ''}>아시아나항공</option>
					<option value="제주항공" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '제주항공' ? 'selected' : ''}>제주항공</option>
					<option value="진에어" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '진에어' ? 'selected' : ''}>진에어</option>
					<option value="에어부산" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '에어부산' ? 'selected' : ''}>에어부산</option>
					<option value="이스타항공" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '이스타항공' ? 'selected' : ''}>이스타항공</option>
					<option value="하이에어" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '하이에어' ? 'selected' : ''}>하이에어</option>
					<option value="에어서울" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '에어서울' ? 'selected' : ''}>에어서울</option>
					<option value="플라이강원" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '플라이강원' ? 'selected' : ''}>플라이강원</option>
					<option value="티웨이항공" ${pagingCreator.amFlightPurchasePagingDTO.keyword eq '티웨이항공' ? 'selected' : ''}>티웨이항공</option>
				</select>
			</div>
			
			<div class="col-xs-2 panel-heading">
				<select class="form-control" id="selectAmount" name="rowAmountPerPage">
					<option value="10" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 10 ? 'selected' : '' }>10개</option>
					<option value="20" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 20 ? 'selected' : '' }>20개</option>
					<option value="50" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 50 ? 'selected' : '' }>50개</option>
				</select>
			</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<th>노선번호</th>
			            <th>항공사</th>
			            <th>노선이름</th>
			            <th>출발공항</th>
			            <th>도착공항</th>
			            <th>출발시간</th>
			            <th>도착시간</th>
			            <th>이코노미가격</th>
			            <th>퍼스트가격</th>
			            <th>이코노미좌석수</th>
			            <th>퍼스트좌석수</th>
			            <th></th>
			            <th></th>

					</thead>
					<tbody>
						<c:forEach items="${RouteList}" var="Route">
							<tr class = "airRoute" data-airrouteno='<c:out value="${Route.airRouteno}"/>'>
								<td class="center" id="airRouten" name ="airRouten"><c:out value="${Route.airRouteno}"/></td>
							    <td class="center"><c:out value="${Route.airLinenm}"/></td>
							    <td class="center"><c:out value="${Route.vihicleId }"/></td>
							    <td class="center"><c:out value="${Route.depAirportnm }"/></td>
							    <td class="center"><c:out value="${Route.arrAirportnm }"/></td>
							    <td class="center"><fmt:formatDate value="${Route.depPlandTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							    <td class="center"><fmt:formatDate value="${Route.arrPlandTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							    <td class="center " ><c:out value="${Route.economyCharge }"/></td>
								<td class="center " ><c:out value="${Route.prestigeCharge }"/></td>
								<td class="center " ><c:out value="${Route.eSeatCnt }"/></td>
								<td class="center " ><c:out value="${Route.pSeatCnt }"/></td>
								<td class="center listModify">
								<button type="button" class="btnModify" id="btnModify">수정</button>
								<button type="button" class="btnCompletion" id="btnCompletion" style="display: none;">완료</button>
								</td>
								<td class="center listRemove">
								<button type="button" class="btnRemove" id="btnRemove">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<%-- 페이징 --%>
			<div style = "align-content: center; text-align:center;">
					<ul class="pagination pagination-sm" >
					<c:if test="${pagingCreator.prev }">
						<li class="pagination-button">
						    <a href="1" aria-label="Previous">
						      <span aria-hidden="true">&laquo;</span>
						    </a>
					  	</li>
					 </c:if>
					<c:if test="${pagingCreator.prev }">
						<li class="pagination-button">
						    <a href="${pagingCreator.startPagingNum - 1}" aria-label="Previous">
						      <span aria-hidden="true">Prev</span>
						    </a>
					  	</li>
					 </c:if>
					 
					 <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }" step="1">
					 	<li class='pagination-button ${pagingCreator.amFlightPurchasePagingDTO.pageNum == pageNum ? "active" : "" }'>
					 		<a href = "${pageNum }">${pageNum }</a>
					 	</li>
					 </c:forEach>
					 
					 <c:if test="${pagingCreator.next }" >
					 	<li class="pagination-button">
					 		<a href="${pagingCreator.endPagingNum + 1 }" aria-label="Next" >
					 			<span aria-hidden="ture">Next</span>
					 		</a>
					 	</li>
					 </c:if>
					 	 <c:if test="${pagingCreator.next }" >
					 	<li class="pagination-button">
					 		<a href="${pagingCreator.lastPageNum }" aria-label="Next" >
					 			<span aria-hidden="ture">&raquo;</span>
					 		</a>
					 	</li>
					 </c:if>
					</ul>
				
			
				</div> <!-- 페이징 end -->
			</form>

  </div>


</div>	
			
</div>			

<script>
let formAirlist = $(".formAirlist");
let airRouteno;
 
$("#keyword").on("change",function(){	
	let keyword = $("#keyword").find("option:selected").val();
	
	formAirlist.find("input[name='pageNum']").val(1)
	
	formAirlist.submit();
});



$("#selectAmount").on("change", function(){
	formAirlist.find("input[name='pageNum']").val(1)
	
	formAirlist.submit();
});

$(".pagination-button a").on("click",function(e){
	e.preventDefault();
	
	formAirlist.find("input[name='pageNum']").val($(this).attr("href"));
	formAirlist.attr("action", "${contextPath}/admin/airways/list")
	formAirlist.attr("method","get");
	
	formAirlist.submit();
});

//수정 버튼
$(".btnModify").on("click",function(){
	
	$(".btnModify").hide();
	$(".btnCompletion").show();
	airRouteno = $(this).closest("tr").data("airrouteno");
	
	let economyNum = $(this).closest('tr').find('td:eq(7)');
	let prestigeNum = $(this).closest('tr').find('td:eq(8)');
	let eSeat = $(this).closest('tr').find('td:eq(9)');
	let pSeat = $(this).closest('tr').find('td:eq(10)');
	
	let economy = economyNum.text();
	economyNum.text("");
	economyNum.append("<input type='number' id='economyCharge' name='economyCharge' style='width: 100px' value=0>");
	$("#economyCharge").val(economy);
	
	let prestige = prestigeNum.text();
	prestigeNum.text("");
	prestigeNum.append("<input type='number' id='prestigeCharge' name='prestigeCharge' style='width: 100px' value=0>");
	$("#prestigeCharge").val(prestige);
	
	let eSeatt = eSeat.text();
	eSeat.text("");
	eSeat.append("<input type='number' id='eSeatCnt' name='eSeatCnt' style='width: 100px' value=0>");
	$("#eSeatCnt").val(eSeatt);
	
	let pSeatt = pSeat.text();
	pSeat.text("");
	pSeat.append("<input type='number' id='pSeatCnt' name='pSeatCnt' style='width: 100px' value=0>");
	$("#pSeatCnt").val(pSeatt);
	
});

//삭제 버튼
$(".listRemove").on("click",function(){

	airRouteno = $(this).closest("tr").data("airrouteno");
	
	$("#airRouteno").val(airRouteno);
	
	formAirlist.attr("action", "${contextPath}/admin/airways/remove")
	formAirlist.attr("method","post");
	
	if(confirm("정말로 삭제하시겠습니까?")){
		formAirlist.submit();	
	}
	
});


//완료버튼
$(".btnCompletion").on("click",function(){
	
	airRouteno = $(this).closest("tr").data("airrouteno");
	let eSeatCnt = $("#eSeatCnt").val();
	let pSeatCnt = $("#pSeatCnt").val();
	let economyCharge = $("#economyCharge").val();
	let prestigeCharge = $("#prestigeCharge").val();
	
	let airTotalSeat = eSeatCnt * 1 + pSeatCnt * 1;
	let airRouteBuyPrice = ((economyCharge * 0.5) * eSeatCnt) + ((prestigeCharge * 0.5) * pSeatCnt);
	
	formAirlist.append("<input type='hidden' id='airTotalSeat' name='airTotalSeat' style='width: 100px' value=0>");
	formAirlist.append("<input type='hidden' id='airRouteBuyPrice' name='airRouteBuyPrice' style='width: 100px' value=0>");
	
	$("#airTotalSeat").val(airTotalSeat);
	$("#airRouteBuyPrice").val(airRouteBuyPrice);
	$("#airRouteno").val(airRouteno);
	
	alert("수정이 완료되었습니다.");
	
	formAirlist.find("input[name='pageNum']").val($(this).attr("href"));
	
	formAirlist.attr("action", "${contextPath}/admin/airways/modify")
	formAirlist.attr("method","post");
	
	formAirlist.submit();
	
}); 

//취소버튼
$(".btnReturn").on("click",function(){
	
	$(".btnCompletion").hide();
	$(".btnModify").show();
	
	
}); 

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>