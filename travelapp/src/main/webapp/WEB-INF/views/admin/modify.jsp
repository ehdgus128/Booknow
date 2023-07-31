<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">공지사항 수정</h1>
        </div>
    </div>
    <!-- row -->
    <div class="row">
        <div class="col-lg-12">
<form id="frmSendValue" method="post" action="${contextPath}/admin/modify">
    <div class="panel panel-primary"><!-- panel-->
        <div class="panel-heading">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 제목</label>
                    <input type="text" id="modifyTitle" class="form-control" name="tmBtitle" value="${notice.tmBtitle}" placeholder="글제목을 입력해주세요">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-3">
                    <label>글쓴이</label>
                    <input type="text" id="modifyWriter" class="form-control" name="tmBwriter" value="${loginUser}" disabled>
                </div>
                <div class="col-lg-3 col-lg-offset-6">
                    <label>공지사항 타입</label>
                    <select id="modifyType" name="tmBtype" class="form-control">
                        <option value="일반">--타입 선택--</option>
                        <option value="긴급" ${notice.tmBtype == "긴급" ? "selected" : ""}>긴급</option>
                        <option value="공지" ${notice.tmBtype == "공지" ? "selected" : ""}>공지</option>
                        <option value="일반" ${notice.tmBtype == "일반" ? "selected" : ""}>일반</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 내용</label>
                    <textarea id="modifyContent" name="tmBcontent" class="form-control" rows="12">${notice.tmBcontent}</textarea>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-lg-4">
                    <button id="modifyNoticeBtn" type="button" class="btn btn-primary">수정</button>
                    <button id="modifyHomeBtn" type="button" class="btn btn-danger">수정 취소</button>
                </div>
            </div>
        </div>

    </div>
    <!-- panel end -->
    <!-- csrf -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type='hidden' name='tmBno' value='${notice.tmBno}'/>
    <input id="hiddenPageNum" type='hidden' name='pageNum' value='${noticePaging.pageNum}'>
</form>
<!-- form end -->

        </div>
    </div>

</div>
<!-- page end -->


<script>

    // form 선택
    var frmSendValue = $("#frmSendValue");

    // 수정 선택
    var modifyNoticeBtn = $("#modifyNoticeBtn");

    // 수정 취소 선택
    var modifyHomeBtn = $("#modifyHomeBtn");

    // 공지사항 수정 체크
    function isInputCheck() {

        var title = $("#modifyTitle").val();
        var writer = $("#modifyWriter").val();
        var type = $("#modifyType").val();
        var content = $("#modifyContent").val();

        // 제목 공백 체크
        if (title == null || title == undefined || title == "") {return true;}

        // 제목 최대 글자 체크
        if (title.length >= 100) {
            alert("공지사항 제목은 100글자를 넘을수 없습니다.");
            return true;
        }

        // 글쓴이 공백 체크
        if (writer == null || writer == undefined || writer == "") {return true;}

        // 공지사항 타입 공백 체크
        if (type == null || type == undefined || type == "") {return true;}

        // 공지사항 내용 공백 체크
        if (content == null || content == undefined || content == "") {return true;}

        if (content.length >= 1000) {
            alert("공지사항 내용은 1000글자를 넘을수 없습니다.");
            return false;
        }

        return false;
    } // isInputCheck end

    // 수정 버튼 클릭 이벤트 처리
    modifyNoticeBtn.on("click", function() {

        // 공백 체크
        if (isInputCheck()) {
            alert("제목 내용을 입력해주세요");
            return;
        }

	    frmSendValue.submit();
	}); // modifyNoticeBtn click event end

    // 수정 취소 버튼 클릭 이벤트 처리
    modifyHomeBtn.on("click", function () {

        var tmpTmBno = frmSendValue.find("input[name='tmBno']").clone();
        var tmpPageNum = frmSendValue.find("input[name='pageNum']").clone();

        frmSendValue.empty();

        frmSendValue.append(tmpTmBno);
        frmSendValue.append(tmpPageNum);

	    frmSendValue.attr("method", "get");
	    frmSendValue.attr("action", "${contextPath}/admin/detail");
        frmSendValue.submit();
    }); // modifyHomeBtn click event end

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>