<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">
	<div class="row">
		<h1 class="page-header">항공상품상세</h1>
	</div>
	<div class="col-lg-12">
		<div>
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

					</thead>
					<tbody>
							<tr id = "airRoute" name = "airRoute" data-airrouteno='<c:out value="${Route.airRouteno}"/>'>
								<td class="center" id="airRouten" name ="airRouten"><c:out value="${Route.airRouteno}"/></td>
							    <td class="center"><c:out value="${Route.airLinenm}"/></td>
							    <td class="center"><c:out value="${Route.vihicleId }"/></td>
							    <td class="center"><c:out value="${Route.depAirportnm }"/></td>
							    <td class="center"><c:out value="${Route.arrAirportnm }"/></td>
							    <td class="center"><fmt:formatDate value="${Route.depPlandTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							    <td class="center"><fmt:formatDate value="${Route.arrPlandTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							    <td class="center economyCharge" ><c:out value="${Route.economyCharge }"/></td>
								<td class="center prestigeCharge" ><c:out value="${Route.prestigeCharge }"/></td>
								<td class="center eSeatCnt" ><c:out value="${Route.eSeatCnt }"/></td>
								<td class="center pSeatCnt" ><c:out value="${Route.pSeatCnt }"/></td>
							</tr>
					</tbody>
				</table>
		</div>	
		<div class="col-lg-12">
				<span>총 좌석수:<input type="text" id="totalSeat" name = "totalSeat" readonly="readonly" value=0></span>
				<span>구매가격:<input type="text" id="airRouteBuyPrice" name = "airRouteBuyPrice" readonly="readonly" value=0></span>
				<button type="button" class="pull-right" id="btnBack" name="btnBack">목록으로</button>
		</div>
			<form class="moveairmodify" action="${contextPath}/admin/airmodify" method="get">
				<input type="hidden" id="airRouteno" name="airRouteno" value="0">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="pageNum" name="pageNum" value="${amFlightPurchasePagingDTO.pageNum}">
				<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${amFlightPurchasePagingDTO.rowAmountPerPage}">
				
			</form>
</div>			
</div>
<script>
	let moveairmodify = $(".moveairmodify");
	
	let economyCharge = Number($(".economyCharge").text());
	let prestigeCharge = Number($(".prestigeCharge").text());
	let eSeatCnt = Number($(".eSeatCnt").text());
	let pSeatCnt = Number($(".pSeatCnt").text());
	
	$(window).on("load",function(){
	
	let cCount = eSeatCnt + pSeatCnt;
	let econmyTotal = (1 * economyCharge * 0.5) * eSeatCnt;
	let pconmyTotal = (1 * prestigeCharge * 0.5) * pSeatCnt;
	let airRouteBuyPrice = econmyTotal + pconmyTotal;
	
	$("#totalSeat").val(cCount);
	$("#airRouteBuyPrice").val(airRouteBuyPrice);


	});
	
	$("#btnBack").on("click",function(){
		
		moveairmodify.attr("action", "${contextPath}/admin/airways/airpurchas")
		moveairmodify.attr("method","get");
		
		moveairmodify.submit();
	});
	
</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>