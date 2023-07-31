<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">관리자 공지사항 상세</h1>
        </div>
    </div>
    <!-- row -->
    <div class="row">
        <div class="col-lg-12">

    <div class="panel panel-primary"><!-- panel-->
        <div class="panel-heading">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 제목</label>
                    <input type="text" id="detailTitle" class="form-control" name="tmBtitle" value="${notice.tmBtitle}" placeholder="글제목을 입력해주세요" readonly>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-3">
                    <label>글쓴이</label>
                    <input type="text" id="detailWriter" class="form-control" name="tmBwriter" value="${loginUser}" readonly>
                </div>
                <div class="col-lg-3 col-lg-offset-6">
                    <label>공지사항 타입</label>
                    <input type="text" id="detailType" class="form-control" name="tmBtype" value="${notice.tmBtype}" placeholder="" readonly>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 내용</label>
                    <textarea id="detailContent" name="tmBcontent" class="form-control" rows="12" readonly>${notice.tmBcontent}</textarea>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-lg-4">
                    <button id="detailModifyBtn" type="button" class="btn btn-primary">수정으로</button>
                    <button id="detailHomeBtn" type="button" class="btn btn-info">관리 홈</button>
                </div>
            </div>
        </div>

    </div>
    <!-- panel end -->

<form id="frmSendValue" method="get" action="${contextPath}/admin/modify">
    <!-- csrf -->
    <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
    <input type='hidden' name='tmBno' value='${notice.tmBno}'/>
    <input id="hiddenPageNum" type='hidden' name='pageNum' value='${noticePaging.pageNum}'>
</form>
<!-- form end -->

        </div>
    </div>


</div>
<script>

    // form 선택
    var frmSendValue = $("#frmSendValue");

    // 공지사항 수정으로 버튼 선택
    var detailModifyBtn = $("#detailModifyBtn");

    // 관리홈 버튼 선택
    var detailHomeBtn = $("#detailHomeBtn");

    // 수정으로 버튼 클릭 이벤트 처리
    detailModifyBtn.on("click", function() {
	    frmSendValue.submit();
	}); // detailModifyBtn click event end

    // 관리 홈 버튼 클릭 이벤트 처리
    detailHomeBtn.on("click", function () {
        frmSendValue.find("input[name='tmBno']").remove();
	    frmSendValue.attr("action", "${contextPath}/admin/home");
        frmSendValue.submit();
    }); // detailHomeBtn click event end

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>