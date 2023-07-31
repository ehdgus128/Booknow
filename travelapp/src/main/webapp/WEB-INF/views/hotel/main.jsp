<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/htheader.jsp" %>
<!-- 2307061103 김영환 메인페이지 생성 -->
<div class="container-lg position-relative">
	<div class="row mx-2" >
		<div class="col-12 mt-3">
			<img class="rounded mx-auto d-block" alt="로고어디감" src="${contextPath}/resources/img/hotellogo.png" style="width: 100px; height: 100px;">
			<h2 class="text-center text-light mt-3">Booknow에서 머무를 숙소를 찾아보세요!</h2>
		</div>
	</div>

    <div class="row" style="padding: 20px;">
        <div class="card border-secondary col-12">
            <div class="card-header"><h3>호텔 검색</h3></div>
            <div class="card-body">
                <!-- <h4 class="card-title">Secondary card title</h4> -->
                <form id="idFormSendData" method="get" action="${contextPath}/hotel/list">	
                    <div class="row">
                        <div class="hotel-search-box col-4">
            
                            <select class="form-select" aria-label="Default select example" name="htAreaCode" id="htAreaCode"><%-- 지역 select --%>
								<option value="서울">서울</option>
								<option value="제주도">제주도</option>
								<option value="부산">부산</option>
								<option value="강릉">강릉</option>
								<option value="속초">속초</option>
								<option value="인천">인천</option>
								<option value="수원">수원</option>
								<option value="대구">대구</option>
								<option value="여주">여주</option>
								<option value="전주">전주</option>
								<option value="양양">양양</option>
								<option value="고성">고성</option>
								<option value="보령">보령</option>
								<option value="태안">태안</option>
								<option value="포항">포항</option>
								<option value="울산">울산</option>
								<option value="거제">거제</option>
                            </select>	
                        </div>
                        <div class="dateWrapper col-3">
                            <label>체크인</label>
                            <input type="date" id="htStartDateStr" name="htStartDateStr" autocomplete="off"/>
                        </div>
                        <div class="dateWrapper col-3">
                            <label>체크아웃</label>
                            <input type="date" id="htEndDateStr" name="htEndDateStr" autocomplete="off" />
                        </div>
                        <div class="buttonWrapper col-2"><%--검색버튼 --%>
                                <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </div>
                    <input type="hidden" id="idInputHtNo" name="htNo" value="">
                </form>
            </div>
        </div>
        <!-- hotel search card end -->
    </div>
    <!-- row end -->
    <div class="row" style="padding: 20px;">
        <div class="card border-secondary col-6 me-auto">
            <div class="card-header"><h3>호텔 판매 랭킹 TOP 5</h3></div>
            <div class="card-body">
<c:forEach items="${hotelSellRankList}" var="hotelSell">
            <div class="hotel card border-secondary col-auto my-2" data-htno="${hotelSell.htNo}" style="cursor: pointer;">
                <div class="card-header">
                    <h3>${hotelSell.htName}</h3>
                </div>
                <div class="card-body">
                    <p class="card-text">호텔등급 : ${hotelSell.htRank}</p>
                    <p class="card-text">호텔판매순위 : ${hotelSell.hotelSellRank}</p>
                </div>
            </div>
</c:forEach>
            </div>
        </div>
        <!-- hotel 판매순 card end -->
        <div class="card border-secondary col-6 ms-auto">
            <div class="card-header"><h3>호텔 평점 랭킹 TOP 5</h3></div>
            <div class="card-body">
<c:forEach items="${hotelGradeRankList}" var="hotelGrade">
            <div class="hotel card border-secondary col-auto my-2" data-htno="${hotelGrade.htNo}" style="cursor: pointer;">
                <div class="card-header">
                    <h3>${hotelGrade.htName}</h3>
                </div>
                <div class="card-body">
                    <p class="card-text">호텔등급 : ${hotelGrade.htRank}</p>
                    <p class="card-text">호텔평점 : ${hotelGrade.htAvgGrade}</p>
                </div>
            </div>
</c:forEach>
            </div>
        </div>
        <!-- hotel 별점순 card end -->
    </div>
</div>

<script>

var idFormSendData = $("#idFormSendData");

// top5 호텔 클릭하면 상세로 이동
$(".hotel").on("click", function() {
    idFormSendData.find("#idInputHtNo").val($(this).data("htno"));
    idFormSendData.attr("action", "${contextPath}/hotel/rooms/list");
    idFormSendData.submit();
}); // click event end

</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>