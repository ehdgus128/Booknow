<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Management Home</h1>
        </div>
    </div>
    <!-- row -->

    <div class="row">
<!-- QnA -->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="" class="huge">${TotalDifference}</div> <!-- 이부분 수정 -->
                            <div>답변 대기</div>
                        </div>
                    </div>
                </div>
                <a href="${contextPath}/admin/qna">
                    <div class="panel-footer">
                        <span class="pull-left">QnA</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
<!-- QnA end -->
<!-- 결제 -->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-krw fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="" class="huge">2023년</div><!-- 이부분 수정 -->
                            <div id="totalSalesDiv"></div>
                        </div>
                    </div>
                </div>
                <!-- 이부분 수정 -->
                <a href="${contextPath}/admin/monthlySales">
                    <div class="panel-footer">
                        <span class="pull-left">월별 매출</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
<!-- 결제 end -->
<!-- 판매 -->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">항공</div>
                            <div>상품 입력</div>
                        </div>
                    </div>
                </div>
                <!-- 이부분 수정 -->
                <a href="${contextPath}/admin/monthlySales">
                    <div class="panel-footer">
                        <span class="pull-left">항공 상품 입력</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
<!-- 판매 end -->
<!-- 고객 관리 -->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-users fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">호텔</div>
                            <div>상품 입력</div>
                        </div>
                    </div>
                </div>
                <!-- 정지은 수정완료 -->
                <a href="${contextPath}/admin/hotel/list">
                    <div class="panel-footer">
                        <span class="pull-left">호텔 상품 입력</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
<!-- 고객 관리 end -->
    </div>
    <!-- row end -->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    관리자 공지 사항
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                        <!-- 테이블 -->
                        <div class="row">
                            <div class="col-sm-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline collapsed" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                            <!-- 공지사항 컬럼 -->
                                            <th>
                                                번호
                                            </th>
                                            <th>
                                                제목
                                            </th>
                                            <th>
                                                작성일
                                            </th>
                                            <th>
                                                타입
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- 실제 공지사항 -->
<c:forEach var="notice" items="${noticeList}">
<c:if test="${notice.tmBdelFlag != 1}">
                                        <tr class="gradeA odd" role="row">
                                            <td>${notice.tmBno}</td>
                                            <td><div class="moveDetail" data-tmbno="${notice.tmBno}">${notice.tmBtitle}</div></td>
                                            <td><fmt:formatDate value="${notice.tmBmodDate}" pattern="yyyy-MM-dd"/></td>
                                            <td>${notice.tmBtype}</td>
                                        </tr>
</c:if>
</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <!-- 페이징 -->
                        <div class="row">

                            <div class="col-lg-2">
                                <div class="pull-left">
                                    <br><button type="button" id="moveRegister" class="btn btn-primary" data-oper="register">공지 등록</button>
                                </div>
                            </div>
                            <!-- register button -->

                            <div class="col-lg-10">
                                <div class="pull-right">
                                    <ul class="pagination">
        <c:if test="${noticePaging.prev}">
                                      <li class="paginate_button">
                                        <a href="1" aria-label="Previous">
                                          <span aria-hidden="true">&laquo;</span>
                                        </a>
                                      </li>
                                      <li class="paginate_button">
                                        <a href="${noticePaging.startPagingNum-1}" aria-label="Previous">
                                          <span aria-hidden="true">이전</span>
                                        </a>
                                      </li>
        </c:if>
        <c:forEach var="pageNumFor" begin="${noticePaging.startPagingNum}" end="${noticePaging.endPagingNum}" step="1">
                                      <li class='paginate_button ${noticePaging.amBoardPaging.pageNum == pageNumFor ? "active":""}'><a href="${pageNumFor}">${pageNumFor}</a></li>
        </c:forEach>
        <c:if test="${noticePaging.next}">
                                      <li class="paginate_button">
                                        <a href="${noticePaging.endPagingNum+1}" aria-label="Next">
                                          <span aria-hidden="true">다음</span>
                                        </a>
                                      </li>
                                      <li class="paginate_button">
                                        <a href="${noticePaging.lastPageNum}" aria-label="Next">
                                          <span aria-hidden="true">&raquo;</span>
                                        </a>
                                      </li>
        </c:if>
                                    </ul><!-- pagination ul -->
                                </div><!-- pull right -->
                            </div><!-- paging div -->
                        </div>
                        <!-- 페이징 -->
                        
                    </div>
                    <!-- /.table-responsive -->

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- row end -->
</div>

<form id="frmSendValue" class="form-inline" role="form">
    <input id="hiddenPageNum" type='hidden' name='pageNum' value='${noticePaging.amBoardPaging.pageNum}'>
    <input type='hidden' name='tmBno' value=''/>
</form>

<script>
	
    var frmSendValue = $("#frmSendValue");
	
	//천 단위마다 콤마표시 함수
	function addCommas(number) {
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
    
	$(document).ready(function(){
		
		var totalSales = '${totalSales}';
		var tmp = new Number(totalSales);
		
		$("#totalSalesDiv").html(addCommas(tmp) + '원');
			
		
	});
	
	
	
    // 공지사항 페이징 이동
    $(".paginate_button a").on("click", function(event) {
        event.preventDefault();
        frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
        frmSendValue.attr("action", "${contextPath}/admin/home");
	    frmSendValue.attr("method", "get");
	    frmSendValue.submit();
    });


    // 공지사항 등록 페이지로 이동
    $("#moveRegister").on("click", function() {
	    location.href='${contextPath}/admin/register';
	});

    // 공지사항 상세 페이지로 이동
	$(".moveDetail").on("click", function() {
		frmSendValue.find("input[name='tmBno']").val($(this).data("tmbno")); 
	    frmSendValue.attr("action", "${contextPath}/admin/detail");
	    frmSendValue.attr("method", "get");
	    frmSendValue.submit();
	});

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>