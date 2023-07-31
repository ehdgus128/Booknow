<%@include file="/WEB-INF/views/include/mainheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- container -->
<div class="container-lg position-relative">

	<div class="row" >
		<div class="col-12">
			<img class="rounded mx-auto d-block" alt="로고어디감" src="${contextPath}/resources/img/logo.png" style="width: 150px; height: 150px;">
			<img class="rounded mx-auto d-block" alt="로고어디감" src="${contextPath}/resources/img/booknow.png" style="width: 400px; height: 100px;">

			<h2 class="text-center text-light">여행은 지금바로 Booknow</h2>
		</div>
	</div>

    <div class="row mx-2 my-1">
        <div class="col-12">

            <!-- 검색 카드 -->
            <div class="card border-info mx-2 my-2">
                <!-- <div class="card-header"><h2 class="text-danger">검색</h2></div> -->
                <div class="card-body">
                    <!-- tab -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                        <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab" tabindex="-1">
                        	<div class="fw-bold d-inline text-secondary">
                        		항공 예약
                        	</div>
                        </a>
                        </li>
                        <li class="nav-item" role="presentation">
                        <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false">
                        	<div class="fw-bold d-inline text-secondary">
                        		호텔 예약
                        	</div>
                        </a>
                        </li>
                    </ul>
                    <!-- tab end -->

                    <!-- tab items -->
                    <div id="myTabContent" class="tab-content">
                        <!-- tab item1 -->
                        <div class="tab-pane fade active show" id="home" role="tabpanel">
                            <div class="row mx-2 my-2">
                                <div class="card border-primary col-12">
                                    <div class="card-header">
                                        <h2>항공편 예약 검색</h2>
                                    </div>
                                    <div class="card-body">
                                        <form id = "selectForm" action="${contextPath }/airways/tickets" method="get" >
                                            <input class= "pageNum" type="hidden" name = "pageNum" value = 1>
                                            <div class="row" style = "height: 50px; margin-top: 20px " >
                                                    <div class="col">
                                                        <input class= "boundFlag" type="hidden" name = "boundFlag" value = "onewayFlag">
                                                        <button type="button" class="btn btn-primary one-way" style=" width: 60px; height: 37px;">편도</button>
                                                        <button type="button" class="btn btn-primary round-trip" style=" width: 60px; height: 37px;">왕복</button>
                                                    </div>
                                                    <div class="col" style = "position: static;">
                                                        <div>
                                                            <button type="button" class="btn btn-primary totalNumPeople" ><span id = AtotalNum>인원:1</span>
                                                            <span style="display: none;" id = CtotalNum>어린이:0</span>
                                                            <span style="display: none;" id = OtotalNum>노약자:0</span></button> 
                                                            <input type = "hidden" id = "total" name = "total" value = 0>
                                                        </div>	
                            
                                                        <div class="row inwon" style="border: 3px solid black; display: none; position: absolute;  background-color : white; width: 200px" >
                                                            <ul style="list-style: none;">
                                                                <li class ="list-group-item" style="text-align: center; margin-top: 5px"><div><div style ="float: left;"><span>인원</span></div>
                                                                <div style = "text-align: right;"><button class="aBtnPlus" type="button">+</button><span id = "aCount">1</span><button class="aBtnMinus" type="button">-</button></div></div></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="btn-group col" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="form-group">
                                                            <select class="form-select selected" id="exampleSelect1" name="seatFlag" style="border: 1px solid blcak;">
                                                                <option value="economy" >일반석</option>
                                                                <option value="prestige">일등석</option>
                                                                <option value="both" selected>일반석/일등석</option>
                            
                                                            <input type="hidden" name="sortFlag" value="earlier">
                                                        </div>				
                                                    </div>
                                            </div>

                                            <div class="row align-items-center d-flex" style = "margin-top: 3px;">
                                                <div class="col" style = "position : static;">
                                                    <label for="idDepAirportNmStr" class="form-label mt-2">출발지</label>
                                                    <input id="idDepAirportNmStr" class="depAirportNmStr form-control" value="" type="text" name="depAirportNmStr" readonly style ="width : 335px;">
                                                    <div style="z-index: 1; border: 2px solid black; display: none; position: absolute; background-color : white; width: 335px; margin-top: 5px;" id="depAirUl">
                                                        <ul class="list-group list-group-horizontal Dep-City">
                                                            <li class="list-group-item" value=0>김포</li>
                                                            <li class="list-group-item" value=1>제주</li>
                                                            <li class="list-group-item" value=2>인천</li>
                                                            <li class="list-group-item" value=3>김해</li>
                                                            <li class="list-group-item" value=4>양양</li>
                                                        </ul>
                                                        <ul class="list-group list-group-horizontal Dep-City">	
                                                            <li class="list-group-item" value=5>광주</li>
                                                            <li class="list-group-item" value=6>원주</li>
                                                            <li class="list-group-item" value=7>사천</li>
                                                            <li class="list-group-item" value=8>울산</li>
                                                            <li class="list-group-item" value=9>여수</li>
                                                        </ul>
                                                        <ul class="list-group list-group-horizontal Dep-City">		
                                                            <li class="list-group-item" value=10>군산</li>
                                                            <li class="list-group-item" value=11>포항</li>
                                                            <li class="list-group-item" value=12>대구</li>
                                                            <li class="list-group-item" value=13>청주</li>
                                                            <li class="list-group-item" value=14>무안</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                
                                                <div class = "col change" style=" text-align: center; position: static;"><i class="bi bi-arrow-right" style="font-size: 2rem;"></i></div>
                                                
                                                <div class="col" style = "position : static;">
                                                    <label for="idArrAirportNmStr" class="form-label mt-2">도착지</label>
                                                    <input id="idArrAirportNmStr" class="arrAirportNmStr form-control" value="" type="text" name="arrAirportNmStr" readonly style ="width : 335px; margin-right : 50px; " >
                                                    <div style="z-index: 1; border: 2px solid black; display: none; position: absolute; background-color : white; width: 335px; margin-top: 5px;" id="arrAirUl">
                                                        <ul class="list-group list-group-horizontal Arr-City" >
                                                            <li class="list-group-item" value=0>김포</li>
                                                            <li class="list-group-item" value=1>제주</li>
                                                            <li class="list-group-item" value=2>인천</li>
                                                            <li class="list-group-item" value=3>김해</li>
                                                            <li class="list-group-item" value=4>양양</li>
                                                        </ul>
                                                        <ul class="list-group list-group-horizontal Arr-City">	
                                                            <li class="list-group-item" value=5>광주</li>
                                                            <li class="list-group-item" value=6>원주</li>
                                                            <li class="list-group-item" value=7>사천</li>
                                                            <li class="list-group-item" value=8>울산</li>
                                                            <li class="list-group-item" value=9>여수</li>
                                                        </ul>
                                                        <ul class="list-group list-group-horizontal Arr-City">		
                                                            <li class="list-group-item" value=10>군산</li>
                                                            <li class="list-group-item" value=11>포항</li>
                                                            <li class="list-group-item" value=12>대구</li>
                                                            <li class="list-group-item" value=13>청주</li>
                                                            <li class="list-group-item" value=14>무안</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style = "margin-top: 3px ">
                                                <div class = "col-5 depPland" style = "margin-top: 3px ">
                                                    <a>출발날짜</a><input class = "depPlandTimeStr form-control" id = "depPlandTimeStr" name="depPlandTimeStr" type="date">
                                                </div>
                                                
                                                <div class = "col-5 position-absolute end-0 arrPland" style="margin-top: 3px; display: none;">
                                                    <a>돌아올날짜</a><input class = "depPlandTimeStrInbound form-control" id = "depPlandTimeStrInbound" name="depPlandTimeStrInbound" type="date" >
                                                </div>
                                            </div>
                                                
                                            <div style = "text-align:right; margin-top: 3px ">
                                                <button id="submitDate" type="button" class="btn btn-primary">전송</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab item1 end -->
                    
                        <!-- tab item2 -->
                        <div class="tab-pane fade" id="profile" role="tabpanel">
                            <!-- 호텔 홈 -->
                            <div class="row" style="padding: 20px;">
                                <div class="card border-secondary col-12">
                                    <div class="card-header"><h3>호텔 예약 검색</h3></div>
                                    <div class="card-body">
                                        <!-- <h4 class="card-title">Secondary card title</h4> -->
                                        <form id="idFormSendData" method="get" action="${contextPath}/hotel/list">	
                                            <div class="row">
                                                <div class="hotel-search-box col-4">
                                    
                                                    <select class="form-select" aria-label="Default select example" name="htAreaCode" id="htAreaCode">
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
                                                    <input type="date" class="form-control" id="htStartDateStr" name="htStartDateStr" autocomplete="off"/>
                                                </div>
                                                <div class="dateWrapper col-3">
                                                    <label>체크아웃</label>
                                                    <input type="date" class="form-control" id="htEndDateStr" name="htEndDateStr" autocomplete="off" />
                                                </div>
                                                <div class="buttonWrapper col-2">
                                                        <button type="submit" class="btn btn-secondary">검색</button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="idInputHtNo" name="htNo" value="">
                                            <input type="hidden" id="idInputAirlineId" name="airlineId" value="">
                                        </form>
                                    </div>
                                </div>
                                <!-- hotel search card end -->
                            </div>
                            <!-- 호텔 end -->
                        </div>
                        <!-- tab item2 end -->
                    
                    </div>
                    <!-- tab items end -->
                </div>
            </div>
            <!-- 검색 카드 end -->
        </div>
        <!-- col end -->
    </div>
    <!-- row end -->

    <!-- 커뮤니티 -->
    <div class="row mx-2 my-2">
        <div class="col-12">
            <div class="card border-info mx-2 my-2">
                <div class="card-header">
                    <h2>커뮤니티 최신글</h2>
                </div>
                <div class="card-body">
                  <div class="">
                    <table class="table table-hover" id='board_list'>
                        <thead>
                            <tr>
                                <th class="text-center d-none d-md-table-cell">글번호</th>
                                <th class="w-50">제목</th>
                                <th class="text-center d-none d-md-table-cell">작성자</th>
                                <th class="text-center d-none d-md-table-cell">작성날짜</th>
                                <th class="text-center d-none d-md-table-cell">조회수</th>
                            </tr>
                        </thead>
                        <!-- 게시판 -->
                        <tbody>
                            <c:forEach var="board" items="${comBoardList}">	
                                <tr>
                                    <td class="text-center d-none d-md-table-cell">${board.tvcBno }</td>
                                    <td><a href='${contextPath }/community/detail?tvcCatId=${board.tvcCatId}&tvcBno=${board.tvcBno}'>${board.tvcBtitle }</a></td>
                                    <td class="text-center d-none d-md-table-cell">${board.tvcBwriter }</td>
                                    <td class="text-center d-none d-md-table-cell"><fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${board.tvcBregDate }'/></td>	
                                    <td class="text-center d-none d-md-table-cell">${board.tvcBviewsCnt }</td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                  </div>
                </div>
            </div>
        </div>
        <!-- col end -->
    </div>
    <!-- row end -->
    <!-- 커뮤니티 end -->


    <div class="row mx-2 my-2">
        <div class="col-12">
            <div class="row mx-2 my-2">
                <div class="card text-white bg-primary col mx-1 my-2">
                    <div class="card-header"><h3>항공사 평점 랭킹 TOP 5</h3></div>
                    <div class="card-body">
        <c:forEach items="${airGradeRankList}" var="airGrade">
                        <div class="row">
                            <div class="air card border-primary col-12 my-2" data-airlineid="${airGrade.airlineId}" style="cursor: pointer;">
                                <div class="card-header">
                                    <h3>${airGrade.airlineNm}</h3>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">항공사 평점 : ${airGrade.airAvgGrade}</p>
                                </div>
                            </div>
                        </div>
        </c:forEach>
                    </div>
                </div>
                <!-- hotel 판매순 card end -->
                <div class="card text-white bg-secondary col mx-1 my-2">
                    <div class="card-header"><h3>호텔 평점 랭킹 TOP 5</h3></div>
                    <div class="card-body">
        <c:forEach items="${hotelGradeRankList}" var="hotelGrade">
                        <div class="row">
                            <div class="hotel card border-secondary col-12 my-2" data-htno="${hotelGrade.htNo}" style="cursor: pointer;">
                                <div class="card-header">
                                    <h3>${hotelGrade.htName}</h3>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">호텔 평점 : ${hotelGrade.htAvgGrade} 호텔 등급 : ${hotelGrade.htRank}</p>
                                </div>
                            </div>
                        </div>
        </c:forEach>
                    </div>
                </div>
                <!-- hotel 별점순 card end -->
            </div>
        </div>
    </div>


</div>
<!-- container end -->







<!-- 항공 script -->
<script>
let depAirportNmStr ;
let arrAirportNmStr ;

//전송버튼을 누를시

$("#submitDate").on("click",function(){

	$("#total").val(parseInt($("#aCount").text()));
	
	depAirportNmStr = $(".depAirportNmStr").val();
	arrAirportNmStr = $(".arrAirportNmStr").val();
	
	if(depAirportNmStr == arrAirportNmStr){
		alert("출발위치와 도착위치를 지정해 주세요.");
		return ;
	} else if(depAirportNmStr == "" || arrAirportNmStr == ""){
		alert("출발위치와 도착위치를 지정해 주세요1.");
		return ;
	} else {
		 $('#submitDate').prop("type", "submit");
	}
	
});
	
//	편도
	$(".one-way").on("click",function(){
		$(".arrPland").hide();
		$(".boundFlag").val("onewayFlag");
	});
//	왕복
	$(".round-trip").on("click",function(){
		$(".arrPland").show();
		$(".boundFlag").val("roundFlag");
	});
	
	$(".totalNumPeople").on("click",function(){
		if($(".inwon").css("display") == "none"){
			$(".inwon").show();
		} else{
			$(".inwon").hide();
		}
	});
	
	//성인
	var aCount = 1;
	$(".aBtnPlus").on("click",function(){
	
		$("#aCount").text(++aCount);
		$("#AtotalNum").text("인원:" +$("#aCount").text());
		$("#total").val(aCount);
	});
	
	$(".aBtnMinus").on("click",function(){
		if( aCount > 1){						
			$("#aCount").text(--aCount);
			$("#AtotalNum").text("인원:" +$("#aCount").text());
			$("#total").val(aCount);
		}
	});
	
	
	$(".oBtnMinus").on("click",function(){
		if( oCount > 0){
			if(oCount == 1){
				$("#OtotalNum").hide();
			}
			$("#oCount").text(--oCount);	
			$("#OtotalNum").text(",노약자:" + $("#oCount").text());
		}
	}); 
	

	//출발도시
	$(".depAirportNmStr").on("click",function(){
		if($("#depAirUl").css("display") == "none"){
			$("#depAirUl").show();
		} else{
			$("#depAirUl").hide();
		}
		
	});
	//출발도시 선택
	$(".Dep-City li").on("click",function(){
		if($(this).val() == 0){
			$(".depAirportNmStr").val("김포");
		} else if($(this).val() == 1){
			$(".depAirportNmStr").val("제주");
		} else if($(this).val() == 2){
			$(".depAirportNmStr").val("인천");
		} else if($(this).val() == 3){
			$(".depAirportNmStr").val("김해");
		} else if($(this).val() == 4){
			$(".depAirportNmStr").val("양양");
		} else if($(this).val() == 5){
			$(".depAirportNmStr").val("광주");
		} else if($(this).val() == 6){
			$(".depAirportNmStr").val("원주");
		} else if($(this).val() == 7){
			$(".depAirportNmStr").val("사천");
		} else if($(this).val() == 8){
			$(".depAirportNmStr").val("울산");
		} else if($(this).val() == 9){
			$(".depAirportNmStr").val("여수");
		} else if($(this).val() == 10){
			$(".depAirportNmStr").val("군산");
		} else if($(this).val() == 11){
			$(".depAirportNmStr").val("포항");
		} else if($(this).val() == 12){
			$(".depAirportNmStr").val("대구");
		} else if($(this).val() == 13){
			$(".depAirportNmStr").val("청주");
		} else if($(this).val() == 14){
			$(".depAirportNmStr").val("무안");
		}
		$("#depAirUl").hide();
	});
	
	//도착도시
	$(".arrAirportNmStr").on("click",function(){
		if($("#arrAirUl").css("display") == "none"){
			$("#arrAirUl").show();
		} else{
			$("#arrAirUl").hide();
		}
	});
	
	//도착도시 선택
	$(".Arr-City li").on("click",function(){
		if($(this).val() == 0){
			$(".arrAirportNmStr").val("김포");
		} else if($(this).val() == 1){
			$(".arrAirportNmStr").val("제주");
		} else if($(this).val() == 2){
			$(".arrAirportNmStr").val("인천");
		} else if($(this).val() == 3){
			$(".arrAirportNmStr").val("김해");
		} else if($(this).val() == 4){
			$(".arrAirportNmStr").val("양양");
		} else if($(this).val() == 5){
			$(".arrAirportNmStr").val("광주");
		} else if($(this).val() == 6){
			$(".arrAirportNmStr").val("원주");
		} else if($(this).val() == 7){
			$(".arrAirportNmStr").val("사천");
		} else if($(this).val() == 8){
			$(".arrAirportNmStr").val("울산");
		} else if($(this).val() == 9){
			$(".arrAirportNmStr").val("여수");
		} else if($(this).val() == 10){
			$(".arrAirportNmStr").val("군산");
		} else if($(this).val() == 11){
			$(".arrAirportNmStr").val("포항");
		} else if($(this).val() == 12){
			$(".arrAirportNmStr").val("대구");
		} else if($(this).val() == 13){
			$(".arrAirportNmStr").val("청주");
		} else if($(this).val() == 14){
			$(".arrAirportNmStr").val("무안");
		}
		$("#arrAirUl").hide();

	});
	
//	변경을 누를시 출발도시와 도착도시가 변경
	$(".change").on("click",function(){
		
		arrAirportNmStr = $(".depAirportNmStr").val();
		depAirportNmStr = $(".arrAirportNmStr").val();
		
		$(".depAirportNmStr").val(depAirportNmStr);
		$(".arrAirportNmStr").val(arrAirportNmStr);
		
	});
</script>
<!-- 항공 script end -->

<!-- 호텔 script -->
<script>

var idFormSendData = $("#idFormSendData");

// top5 호텔 클릭하면 상세로 이동
$(".hotel").on("click", function() {
    idFormSendData.find("#idInputHtNo").val($(this).data("htno"));
    idFormSendData.attr("action", "${contextPath}/hotel/rooms/list");
    idFormSendData.submit();
}); // click event end


$(".air").on("click", function() {
    idFormSendData.find("#idInputAirlineId").val($(this).data("airlineid"));
    idFormSendData.attr("action", "${contextPath}/review/airline/list");
    idFormSendData.submit();
}); // click event end

</script>
<!-- 호텔 script end -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
