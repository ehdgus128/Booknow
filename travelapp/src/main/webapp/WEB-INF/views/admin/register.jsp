<%@include file="/WEB-INF/views/include/adminheader.jsp" %> <%-- 왠만하면 위에 올리자 이거 위에 body에 있어야 할 값이 있으면 doc 생성시 오류가 생길수도 있음 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">공지사항 등록</h1>
        </div>
    </div>
    <!-- row -->
    <div class="row">
        <div class="col-lg-12">
<form id="frmSendValue" method="post" action="${contextPath}/admin/register">
    <div class="panel panel-primary"><!-- panel-->
        <div class="panel-heading">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 제목</label>
                    <input type="text" id="registerTitle" class="form-control" name="tmBtitle" value="" placeholder="글제목을 입력해주세요">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-3">
                    <label>글쓴이</label>
                    <input type="text" id="registerWriter" class="form-control" name="tmBwriter" value="${loginUser}" readonly>
                </div>
                <div class="col-lg-3 col-lg-offset-6">
                    <label>공지사항 타입</label>
                    <select id="registerType" name="tmBtype" class="form-control">
                        <option value="일반">--타입 선택--</option>
                        <option value="긴급">긴급</option>
                        <option value="공지">공지</option>
                        <option value="일반">일반</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>공지사항 내용</label>
                    <textarea id="registerContent" name="tmBcontent" class="form-control" rows="12"></textarea>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-lg-4">
                    <button id="registerNoticeBtn" type="button" class="btn btn-primary">공지사항 등록</button>
                    <button id="registerHomeBtn" type="button" class="btn btn-info">등록 취소</button>
                </div>
            </div>
        </div>

    </div>
    <!-- panel end -->
    <!-- csrf -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- form end -->

        </div>
    </div>

</div>
<!-- page end -->

<!-- <form id="frmSendValue" class="form-inline" role="form">
    <input id="hiddenPageNum" type='hidden' name='pageNum' value='${noticePaging.amBoardPaging.pageNum}'>
</form> -->

<script>

    // form 선택
    var frmSendValue = $("#frmSendValue");

    // 공지사항 등록 버튼
    var registerNoticeBtn = $("#registerNoticeBtn");

    // 공지사항 등록 버튼
    var registerHomeBtn = $("#registerHomeBtn");

    // 공지사항 입력 체크
    function isInputCheck() {

        var title = $("#registerTitle").val();
        var writer = $("#registerWriter").val();
        var type = $("#registerType").val();
        var content = $("#registerContent").val();

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

    // 등록 버튼 클릭 이벤트 처리
    registerNoticeBtn.on("click", function () {

        // 공백 체크
        if (isInputCheck()) {
            alert("제목 내용을 입력해주세요");
            return;
        }

        frmSendValue.submit();
    }); // registerNoticeBtn click event end

    // 등록 취소 버튼 클릭 이벤트 처리
    registerHomeBtn.on("click", function () {
        location.href='${contextPath}/admin/home';
    }); // registerHomeBtn click event end
    

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>