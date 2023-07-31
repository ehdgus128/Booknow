<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container-fluid" id="page-wrapper">
	<div class="row">
		<h1 class="page-header">항공구매내역</h1>
	</div>
	<div class="col-lg-12">
		<div class="panel panel-default">
                    <form name="frm-submitValue" id="frm-submitValue" method="get" action="${contextPath }/admin/airways/airpurchas" >
                        <div class="col-xs-2 panel-heading">
	                        <select class="form-control" id="selectAmount" name="rowAmountPerPage">
								<option value="10" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 10 ? 'selected' : '' }>10개</option>
								<option value="20" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 20 ? 'selected' : '' }>20개</option>
								<option value="50" ${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage eq 50 ? 'selected' : '' }>50개</option>
							</select>
                        </div><!-- /.panel-heading -->
						<input type='hidden' id='pageNum' name='pageNum' value='${pagingCreator.amFlightPurchasePagingDTO.pageNum }'>
						<%-- <input type='hidden' id='rowAmountPerPage' name='rowAmountPerPage' value='${pagingCreator.amFlightPurchasePagingDTO.rowAmountPerPage }'> --%>
						<input type='hidden' id='lastPageNum' name='lastPageNum' value='${pagingCreator.lastPageNum }'>
                    </form>
                        <div class="panel-body">
<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
 	<thead>
    	<tr>
      		<th>노선구매번호</th>
            <th>노선번호</th>
            <th>노선구매가격</th>
            <th>구입일시</th>
            <th>총좌석수</th>
           
        </tr>
    </thead>
    <tbody>
		<c:forEach items="${airRouteBuyList}" var="Buylist" >
					<tr class="moveairdetail" data-airRouteno='<c:out value="${Buylist.airRouteno}"/>'>
						<td class="center" id="airBuyno" name ="airBuyno"><c:out value="${Buylist.airBuyno}"/></td>
					    <td class="center" id="airRoute" name ="airRoute"><c:out value="${Buylist.airRouteno}"/></td>
					    <td class="center" id="airRouteBuyPrice" name ="airRouteBuyPrice"><c:out value="${Buylist.airRouteBuyPrice}"/></td>
					    <td class="center" id="airBuyDate" name ="airBuyDate"><fmt:formatDate value="${Buylist.airBuyDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="center" id="airTotalSeat" name ="airTotalSeat"><c:out value="${Buylist.airTotalSeat}"/></td>
					</tr>
		</c:forEach>                                      
    </tbody>
</table>
<!-- /.table-responsive -->
                            
<%-- 페이징 --%>
<div style = "align-content: center; text-align:center;">
	<div class="col-lg-12">
			<button class="pull-right" type="button" id="registerMove" name ="registerMove">등록</button>	
	</div>
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

                     
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-12 -->
</div>

<script>
let frmSubmitValue = $("#frm-submitValue");

$("#selectAmount").on("change", function(){
	frmSubmitValue.find("input[name='pageNum']").val(1)
	
	frmSubmitValue.submit();
});

$(".moveairdetail").on("click",function(){
	
	frmSubmitValue.append("<input type='hidden' name='airRouteno' id='airRouteno' value='" + $(this).data("airrouteno") +"'>");
	frmSubmitValue.attr("action", "${contextPath}/admin/airways/detail")
	frmSubmitValue.attr("method","get");
	
	
	
	frmSubmitValue.submit();
	
});

$("#registerMove").on("click",function(){
	frmSubmitValue.attr("action", "${contextPath}/admin/airways/Register")
	frmSubmitValue.attr("method","get");
	
	frmSubmitValue.submit();
	
});
$(".pagination-button a").on("click",function(e){
	e.preventDefault();
	
	frmSubmitValue.find("input[name='pageNum']").val($(this).attr("href"));
	frmSubmitValue.attr("action", "${contextPath}/admin/airways/airpurchas")
	frmSubmitValue.attr("method","get");
	
	frmSubmitValue.submit();
	
});
</script>

<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>