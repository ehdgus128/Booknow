<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../include/flyheader.jsp" %>
<%-- 박효준 작성 --%>

<!-- page container -->
<div class="container-lg position-relative">
	<div class="row mx-2" >
		<div class="col-12 mt-3">
			<img class="rounded mx-auto d-block " alt="로고어디감" src="${contextPath}/resources/img/airplane.png" style="width: 100px; height: 100px;">
			<h2 class="text-center text-light mt-3">Booknow에서 한번에 비교하여 최고의 예약을!</h2>
		</div>
	</div>

	<div class="row mx-2 my-2">
		<div class="col-12">
			<form id = "selectForm" action="${contextPath }/airways/tickets" method="get" >
				<div class="row mx-2 my-2">
					<div class="card border-primary col-12">
						<div class="card-header">
							<h2>항공예매</h2>
						</div>
						<div class="card-body">
							<form id = "selectForm" action="#" method="get" >
								<input class= "pageNum" type="hidden" name = "pageNum" value = 1>
								<input id="idInputAirlineId" type="hidden" name= "airlineId" value="">
								<input id="idInputAirlineNm" type="hidden" name= "airlineNm" value="">
								<div class="row" style = "height: 50px; margin-top: 20px " >
										<div class="col">
											<input class= "boundFlag" type="hidden" name = "boundFlag" value = "onewayFlag">
											<button type="button" class="btn btn-primary one-way" style=" width: 60px; height: 37px;">편도</button>
											<button type="button" class="btn btn-primary round-trip" style=" width: 60px; height: 37px;">왕복</button>
										</div>
										<div class="col" style = "position: static;">
											<div>
												<button type="button" class="btn btn-primary totalNumPeople" ><span id = AtotalNum>인원:1</span></button>
												
												<input type = "hidden" id = "total" name = "total" value = 1>
											</div>	
				
											<div class="row personnel" style="border: 3px solid black; display: none; position: absolute;  background-color : white; width: 200px" >
												<ul style="list-style: none;">
													<li class ="list-group-item" style="text-align: center; margin-top: 5px">
														<div class="row">
															<div class="align-self-center col col-sm-4"><span>인원</span></div>
															<div class="col col-lg-8" style = "text-align: right;"><button class="btn btn-info aBtnPlus" type="button">+</button>
																<span id = "aCount">1&nbsp;</span><button class="btn btn-info aBtnMinus" type="button">-</button>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<div class="btn-group col" role="group" aria-label="Button group with nested dropdown">
											<div class="form-group">
												<select class="form-select selected" id="exampleSelect1" name="seatFlag" style="border: 1px solid blcak;">
													<option value="economy" >일반석</option>
													<option value="prestige">일등석</option>
													<option value="both" selected>일반석/일등석</option>
												</select>
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
			</form>

			<div class="row mx-2 my-2">
				<div class="col-12">
					<div class="row mx-2 my-2">
						<div class="card border-primary col mx-1 my-2">
							<div class="card-header"><h3>항공편 최저가</h3></div>
							<div class="card-body">
				<c:forEach items="${airLowPrice}" var="airLowPrice" step="2">
								<div class="row">
									<div class="airLow card border-primary col-12 my-2" data-airlinenm="${airLowPrice.airlineNm}" style="cursor: pointer;">
										<div class="row card-header">
											<div class="col" ><c:out value="${airLowPrice.depAirportNm}"/></div>
											<div class="col"><i class="bi bi-arrow-right-circle-fill"></i></div>
											<div class="col"><c:out value="${airLowPrice.arrAirportNm}"/></div>
										</div>
										<div class="row">
											<div class="depAir card-body col-md-4">
												출발공항 :<span id="depAirportNm">${airLowPrice.depAirportNm}</span>
											</div>
											<div class="card-body col-md-4">
												도착공항 :<span id="arrAirportNm">${airLowPrice.arrAirportNm}</span>
											</div>
										</div>
										<div class="row">
											<div class="card-body col-md-4">
												출발일 :<span id ="depPlandTime"><fmt:formatDate value="${airLowPrice.depPlandTime }" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="card-body col-md-4">
												<span>가격 :${airLowPrice.economyCharge}원</span>
											</div>
										</div>
									</div>
								</div>
				</c:forEach>
							</div>
						</div>
						
				<div class="card border-primary col mx-1 my-2">
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
						<!-- hotel 별점순 card end -->
					</div>
				</div>
			</div>
			<!-- row end -->



		</div>
		<!-- page col end -->
	</div>
	<!-- page row end -->


</div>
<!-- page container end -->


	

			

<script>

var idFormSendData = $("#selectForm");

let depAirportNmStr ;
let arrAirportNmStr ;

//전송버튼을 누를시

$("#submitDate").on("click",function(){

//	$("#total").val(parseInt($("#aCount").text()) + parseInt($("#cCount").text()) + parseInt($("#oCount").text()));
	$("#total").val(parseInt($("#aCount").text()));
	//$("#coTotal").val(parseInt($("#cCount").text()) + parseInt($("#oCount").text()));
	
	depAirportNmStr = $(".depAirportNmStr").val();
	arrAirportNmStr = $(".arrAirportNmStr").val();
	
	if(depAirportNmStr == arrAirportNmStr){
		alert("출발위치와 도착위치를 지정해 주세요.");
		return ;
	} else if(depAirportNmStr == "" || arrAirportNmStr == ""){
		alert("출발위치와 도착위치를 지정해 주세요.");
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
		if($(".personnel").css("display") == "none"){
			$(".personnel").show();
			if(aCount == 1){
				$(".aBtnMinus").attr("disabled",true);
			}
		} else{
			$(".personnel").hide();
		}
	});
	
	//성인
	var aCount = 1;
	$(".aBtnPlus").on("click",function(){
		
		if(aCount < 10){
			$("#aCount").text(++aCount);
			$("#AtotalNum").text("인원:" +$("#aCount").text());
			$("#total").val(aCount);
			
			if(aCount > 1){
				$(".aBtnMinus").attr("disabled",false);
			}
			
			
		}
		
		if(aCount == 10){
			$(".aBtnPlus").attr("disabled",true);
		}
		
		
		
	});
	
	$(".aBtnMinus").on("click",function(){
		
		if(aCount == 10){
			$(".aBtnPlus").attr("disabled",false);
		}
		
		if(aCount == 2){
			$(".aBtnMinus").attr("disabled",true);
		}
		
		if(aCount > 1){						

			$("#aCount").text(--aCount);
			$("#AtotalNum").text("인원:" +$("#aCount").text());
			$("#total").val(aCount);
			
			
			
		}
		
		
		
	});

/* 	$(".oBtnMinus").on("click",function(){
		if( oCount > 0){
			if(oCount == 1){
				$("#OtotalNum").hide();
			}
			$("#oCount").text(--oCount);	
			$("#OtotalNum").text(",노약자:" + $("#oCount").text());
		}
	});  */
	

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
	
	//항공사 리뷰 평점
	$(".air").on("click", function() {
		idFormSendData.find("#idInputAirlineId").val($(this).data("airlineid"));
		idFormSendData.attr("action", "${contextPath}/review/airline/list");
		idFormSendData.submit();
	});
	
	//항공편 최저가
	$(".airLow").on("click",function(){
		
		$(".depAirportNmStr").val($(this).find("#depAirportNm").text());
		
		$(".arrAirportNmStr").val($(this).find("#arrAirportNm").text());
		
		$(".depPlandTimeStr").val($(this).find("#depPlandTime").text());

		idFormSendData.attr("action", "${contextPath}/airways/tickets");
		idFormSendData.submit();
		
	});
	
</script>

<%@include file="../include/footer.jsp" %>    
