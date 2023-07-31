<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 0628 세연 생성 / 예약 내역 상세 페이지-->
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/flyheader.jsp" %>
 
<style>
 	#div1,#div2{
 		padding: 100px;
 	}
</style>

 
<div class="container-fluid position-relative">
<!-- <div class= "page-wrapper" style="text-align: center;">  -->
<div class= "page-wrapper" style="margin: auto;"><!-- text-wrapper -->
<div>
<h3>

<c:choose>
<c:when test="${peopleCnt == 0 || checkUser == 404}">
<div class ="card border-primary mb-3 outer-div" style=" margin: auto; width: 75%;" >
	<div class="card border-primary mb-3" style="max-width: 150%; margin: auto;"><!-- 내역없다는 상자 테두리 -->
				 	 <div class="card-header"><h6>Invalid page</h6></div>
				  <div class="card-body">
				    <h6 class="card-title"><p>잘못된 접근입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p></h4>
				    <p class="card-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				    </div>
				    </div>
</c:when>
	<c:otherwise>
	
	<span style="background-color: buttonshadow;;">	예약번호 :  <small>${airResno}</small> </span>
		
	</c:otherwise>





</c:choose>

</h3>
</div>


<%-- 예약번호 1개당 노선(왕복이면 2개) 표시--%>  	   
								 
<%-- p44 foreach 시작 --%>
<c:forEach var="item" items="${airResDetail}" begin="0" step="1" end="0">			
						   <span style="background-color: buttonshadow;">노선번호 :${item.airRouteno} </span><br>
						    <c:choose>
								    <c:when test="${item.airlineId == 'KAL'}">
								         <span style="background-color: buttonshadow;">대한 항공 <img src="../resources/img/airlinelogo/KAL.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span>
								    </c:when>
								    <c:when test="${item.airlineId == 'AAR'}">
								          <span style="background-color: buttonshadow;">아시아나 항공 <img src="../resources/img/airlinelogo/AAR.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								    <c:when test="${item.airlineId == 'JJA'}">
								          <span style="background-color: buttonshadow;">제주 항공 <img src="../resources/img/airlinelogo/JJA.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								    <c:when test="${item.airlineId == 'JNA' }">
								    	  <span style="background-color: buttonshadow;">진에어 <img src="../resources/img/airlinelogo/JNA.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span>
								    </c:when>
								     <c:when test="${item.airlineId == 'ABL' }">
								    	  <span style="background-color: buttonshadow;">에어부산 <img src="../resources/img/airlinelogo/ABL.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								     <c:when test="${item.airlineId == 'ESR' }">
								    	  <span style="background-color: buttonshadow;">이스터 항공 <img src="../resources/img/airlinelogo/ESR.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								     <c:when test="${item.airlineId == 'AIH' }">
								    	  <span style="background-color: buttonshadow;">에어인천 <img src="../resources/img/airlinelogo/AIH.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								     <c:when test="${item.airlineId == 'ASV' }">
								    	  <span style="background-color: buttonshadow;">에어서울 <img src="../resources/img/airlinelogo/ASV.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								     <c:when test="${item.airlineId == 'TWB' }">
								    	  <span style="background-color: buttonshadow;">티웨이항공 <img src="../resources/img/airlinelogo/TWB.png" alt="진에어 로고"  style="width: 120px; height: auto;"></span> 
								    </c:when>
								    <c:otherwise>
								          <span style="background-color: buttonshadow;">${item.airlineId}</span>
								    </c:otherwise>
								</c:choose>
							 <table  class="table table-hover"> <!-- 그림 테이블1 -->
							  
							 <thead>	
							 	
							 			  	<tr  class="table-active">
							 				
							 					      <th scope="row">출발정보  </th>
												  <%--    출발지:
												      ${item. depAirportId}
												      <br>
												      출발시간:
												      ${item. depPlandTime} --%>
												    
												      
												      
												      
												      <th scope="row">도착정보    </th>
												   <%--    도착지:
												      ${item. arrAirportId}
												      <br>
												      도착시간:
												      ${item. arrPlandTime} --%>
												   
												      
										 </tr>     
												    
									</thead>			      
												      
												      
												      
							  <tbody>		
							
							   
							<tr>		<!-- 그림나오는 칸 시작 -->			      
												    
						<td colspan="1" style="margin: auto;">
												      <!-- <div id="div2" class="card mb-3" style="width: 600px;margin: auto;"> -->
						  <h3 class="card-header">${item.depAirportNm}</h3>
						 <!--  <div class="card-body"> -->
						    <h5 class="card-title">${item.depPlandTime}</h5>
						    <h6 class="card-subtitle text-muted">출발시간</h6>
					<!-- 	  </div> -->
						 <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
						    <rect width="100%" height="100%" fill="#868e96"></rect>
						    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
						  </svg> -->
						  <!-- <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle"> -->
						   <!--  <img src="../resources/img/airlinelogo/TWB.png" alt="진에어 로고"  style="width: 40%; height: auto;margin: auto;"> -->
						   <!-- 지도 api시작 -->
						   <div id="map" style="width:800px;height:400px;margin: auto;" ></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f6bfd4866cf1f0aff201aa0549a5a79"></script>
							<script>
							//위도: lat, 경도: longt
								var lat ; 
								var longt ;
								
								var thisPlace = "${item.depAirportNm}" ;
								switch (thisPlace) {
								  case "김포":
								 	lat = 	37.5583333;
							 		longt = 126.790556;
								    break;
								  case "제주":
									lat = 33.5113889;
									longt = 126.493056;
								    break;
								   case "인천":
									lat = 37.4691667;
									longt = 126.450556;
								    break;
								  case "김해":
								  lat = 35.1766667;
								    longt = 128.9425;
								    break;
								  case "양양":
									 lat = 38.0613889;
									 longt = 128.669167;
								    break;
								  case "광주":
									 lat = 35.1263889;
									 longt = 126.808889 ;
								    break;
								  case "원주":
									 lat = 37.4380556;
									 longt = 127.960278  ;
								    break;
								  case "사천":
									 lat = 35.0886111 ;
									 longt = 128.070278;
									    break;
								  case "울산":
									 lat =  35.5936111;
									 longt = 129.351667;
									    break;
								  case "여수":
									 lat =  34.8422222;
									 longt = 127.616944;
									    break;
								  case "군산":
									 lat = 35.9038889;
									 longt = 126.615833;
									    break;
								  case "포항":
									 lat = 35.9877778;
									 longt = 129.420556;
									    break;
								  case "대구":
									 lat =  35.8941667;
									 longt = 128.658889;
									    break;
								  case "청주":
									 lat = 36.7166667;
									 longt = 127.499167 ;
									    break;
								  case "무안":
									 lat = 35.0910557;
									 longt = 126.6156465 ;
									    break;  
								     
								  default:
									 lat = 1;
								     longt = 1;
								    break;
								}
								
								if(lat != 1 && longt != 1 ){
									
									
								/* 	var container = document.getElementById('map');
									var options = {
										center: new kakao.maps.LatLng(lat, longt),
										level: 7
									};
							
									var map = new kakao.maps.Map(container, options); */
									
									var markerPosition  = new kakao.maps.LatLng(lat, longt); 

									 
									var marker = {
									    position: markerPosition
									};

									var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
									    staticMapOption = { 
									        center: new kakao.maps.LatLng(lat, longt), // 이미지 지도의 중심좌표
									        level: 7, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									
									
								}else{
									
									
									
									document.getElementById("map").innerHTML = " <img src='../resources/img/airResDetail/flight.png' alt='즐거운 비행 되세요!'  style='width: 500px; height: auto;'>";
									
									
								}
								
								 
							
								
							</script>
												   
						    
						   
						   <!--  -->
						    <rect width="300px" height="100%" fill="#868e96"></rect>
						<!--     <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text> -->
						  <!-- </svg> -->
						  <div class="card-body">
						    <p class="card-text"> </p>
						  </div>
						  
						  
						  
						 <!--  <ul class="list-group list-group-flush">
						    <li class="list-group-item">Cras justo odio</li>
						    <li class="list-group-item">Dapibus ac facilisis in</li>
						    <li class="list-group-item">Vestibulum at eros</li>
						  </ul>
						  <div class="card-body">
						    <a href="#" class="card-link">Card link</a>
						    <a href="#" class="card-link">Another link</a>
						  </div>
						  <div class="card-footer text-muted">
						    2 days ago
						  </div> -->
						<!-- </div> -->
						 
						</td>
												      
						<td>				      
							 				      
						<!--  <div id="div2" class="card mb-3" style="width: 600px;margin: auto;"> -->
						  <h3 class="card-header">${item.arrAirportNm}</h3>
						 <!--  <div class="card-body"> -->
						    <h5 class="card-title">${item.arrPlandTime}</h5>
						    <h6 class="card-subtitle text-muted">도착시간</h6>
						  <!-- </div> -->
						  <!-- <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle"> -->
						     <!-- 지도 api시작 -->
						   <div id="map2" style="width:800px;height:400px;margin: auto;"  ></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f6bfd4866cf1f0aff201aa0549a5a79"></script>
							<script>
							//위도: lat, 경도: longt
								var lat ; 
								var longt ;
								
								var thisPlace = "${item.arrAirportNm}" ;
								switch (thisPlace) {
								  case "김포":
								    lat = 37.5583333;
								    longt = 126.790556;
								    break;
								  case "제주":
									lat = 33.5113889;
									longt = 126.493056;
								    break;
								   case "인천":
									lat = 37.4691667;
									longt = 126.450556;
								    break;
								  case "김해":
								  lat = 35.1766667;
								    longt = 128.9425;
								    break;
								  case "양양":
									lat = 38.0613889;
									longt = 128.669167;
								    break;
								  case "광주":
								    lat = 35.1263889;
									longt = 126.808889 ;
								    break;
								  case "원주":
									lat = 37.4380556;
									longt = 127.960278  ;
								    break;
								  case "사천":
									lat = 35.0886111 ;
									longt = 128.070278;
									    break;
								  case "울산":
									lat =  35.5936111;
									longt = 129.351667;
									    break;
								  case "여수":
									lat =  34.8422222;
									longt = 127.616944;
									    break;
								  case "군산":
									lat = 35.9038889;
									longt = 126.615833;
									    break;
								  case "포항":
									lat = 35.9877778;
									longt = 129.420556;
									    break;
								  case "대구":
									lat =  35.8941667;
									longt = 128.658889;
									    break;
								  case "청주":
									lat = 36.7166667;
									longt = 127.499167 ;
									    break;
								  case "무안":
									lat = 35.0910557;
									longt = 126.6156465 ;
									    break;  
								     
								  default:
									lat = 1;
								    longt = 1;
								    break;
								}
								
								if(lat != 1 && longt != 1 ){
									
									
									/* var container = document.getElementById('map2');
									var options = {
										center: new kakao.maps.LatLng(lat, longt),
										level: 7
									};
							
									var map2 = new kakao.maps.Map(container, options); */
									
									var markerPosition  = new kakao.maps.LatLng(lat, longt); 

									 
									var marker = {
									    position: markerPosition
									};

									var staticMapContainer  = document.getElementById('map2'), // 이미지 지도를 표시할 div  
									    staticMapOption = { 
									        center: new kakao.maps.LatLng(lat, longt), // 이미지 지도의 중심좌표
									        level: 7, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									
									
									
								}else{
									
									
									
									document.getElementById("map2").innerHTML = " <img src='../resources/img/airResDetail/flight.png' alt='즐거운 비행 되세요!'  style='width: 500px; height: auto;'>";
									
									
								}
								
								
							</script>
											 
						   <!--  -->
						    <rect width="" height="100%" fill="#868e96"></rect>
						   <!--  <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text> -->
						  <!-- </svg> -->
						  <div class="card-body">
						    <p class="card-text"> </p>
						  </div>
						  <!-- <ul class="list-group list-group-flush">
						    <li class="list-group-item">Cras justo odio</li>
						    <li class="list-group-item">Dapibus ac facilisis in</li>
						    <li class="list-group-item">Vestibulum at eros</li>
						  </ul>
						  <div class="card-body">
						    <a href="#" class="card-link">Card link</a>
						    <a href="#" class="card-link">Another link</a>
						  </div>
						  <div class="card-footer text-muted">
						    2 days ago -->
						  </div>
						<!-- </div> -->
						 	      
												      
						
						</td>
						  
						  <tr>  <!--그림나오는 칸끝  -->
						   
						   
						    </div>     
						    </tbody>	 
						 
						</table> <!-- //그림 들어간 테이블 1 끝 -->  
						
						
						
						  <table class="table table-hover"> <!-- 테이블 2  -->
								  <thead>
								     <tr class="table-active table-primary" style="text-align: center;"> 
								      <th scope="row" style="width: 18%;"></th>
								      <td style="width: 20%;">내역 정보</td>
								      <td style="width: 20%;">${item.airSellStatus}</td>
								   
								    </tr>
								  
								  </thead>
								  
									  <!--반복문시작-->
									  	 
										  
											  <tbody>
											      <tr>
												      <th scope="row"  style="width: 18%;">예약 정보</th>
												      <%-- <td>${airResno}</td> --%>
												      <td style="text-align: center;">
												      항공사ID: ${item.airlineId}<br>
												      항공기번: ${item.vihicleId}<br>
												      출발 정보: ${item.depAirportNm}/
												      ${item.depPlandTime}<br>
												      도착 정보: ${item.arrAirportNm}/
												      ${item.arrPlandTime}<br>
												      좌석 유형:${item.airClass}<br>
												      
												      
												      </td><!--작업할때 테이블 틀만들때 참고하려 넣음  -->												      
											     	  <td rowspan="2" style="text-align: center;" >
						 <!-- 노란색1 시작 -->
						 <div class="list-group-item list-group-item-action flex-column align-items-start active"  >
						  	 <br><div class="card-header"><h4>총 지불액(total price)</h4></div>
						    <h4 class="card-title"></h4>
						  <div class="card-body">
						   <!--  <h4 class="card-title">Warning card title</h4> -->
				  	    <h2><p class="card-text">₩ <fmt:formatNumber value="${item.totalprice}" pattern="#,###" />원</p></h2>  
								 
						  </div> <!--노란색1 끝 -->
						  </div><br>
						  
						  
						  
						  <!--  -->
						  
						   
			<div class="card-body" style="margin: auto;">
			    <h4 class="card-title">결제 취소</h4>
			    <h6 class="card-subtitle mb-2 text-muted"> </h6>
			  <p class="card-text">예약 취소 시 <span style="color: red;">일부의 수수료</span>가 발생될 수 있습니다.</p> 
			  
			  
<%-- 			  uuId = ${uuId}
			  <c:if test="${uuId == null}">
			  	null입니다.
			  </c:if> --%>
			  
			  <button type="button" class="btn btn-primary" id="cancelPayment">
					<font style="vertical-align: inherit;">
					<font style="vertical-align: inherit;">결제 취소</font></font>
				</button>
			<!--     <a href="#" class="card-link">Another link</a> -->
			  </div>				     	  
																	     	  
											     	  
											     	  </td>
											      </tr>
											      
											       <tr>
												      <th scope="row"  style="width: 18%;">탑승객 정보 (총 ${peopleCnt}명)</th>
												      <%-- <td>${airResno}</td> --%>
												      <td style="text-align: center;">  
												      <c:forEach var="item" items="${airResDetail}" >			
												      	${item.airPasName}<br>
												      
												      </c:forEach>
													      </td><!--작업할때 테이블 틀만들때 참고하려 넣음  -->
												      </tr>
											      
											     
											  </tbody>
											  
									 <!-- 반복문 끝 -->
									  
						  </table> <!--  테이블 2  끝 -->
			
						 

 
  <!--여기까지가 반복문 마지막부분  -->
</c:forEach>			
 
  <div class="card border-light mb-3" style="width: 100%;margin: auto;" >
 <div class="wrapper">						    
	<div style="text-align: center;">		
	<br><h4> ※ 항공권수령/탑승안내 ※ </h4> 
		<div>
			<strong style="color: red;">준비사항: 주민등록증, 운전면허증, 여권 중 택1(외국인의 경우 여권지참), 항공사 예약번호</strong><br>
			소아/유아 증빙서류: 주민등록등본, 건강보험증, 여권중 택1<br>
			[신분할인 적용대상은 증빙서류 또는 복지카드 지참]<br>
			사전 체크인: 각 항공사의 사이트/어플로 체크인 이용(출발 1시간전 마감)<br>
			공항 체크인: 출발당일 공항 무인발권기 이용 필수 (출발 30분전 마감)<br>
			수하물 위탁: 공항 수하물 전용 카운터에서 위탁<br>
			<strong style="color:teal;">(항공권에 입력된 이름과 신분증상의 이름이 다를경우 티켓발권 및 탑승 불가)</strong><br>
			좌석배정은 각 항공사 또는 출발당일 무인발권기에서 받으시길 바랍니다.<br>
		</div>						    
<!-- 	</div>	
	<div style="float: right;">
	<img src='../resources/img/airResDetail/TLBOOK__.jpg' alt='즐거운 비행 되세요!'  style='width: 320px; height: auto;'>
	
	
	
	
	
	</div>  -->
</div>			


</div> <!--END/ text-wrapper -->
<br>
<br>

</div>
<!-- page container end -->


</div>
<script>

// csrf token
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// csrf send
$(document).ajaxSend(function(event, xhr, option) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

//결제 취소 요청
$("#cancelPayment").on("click", function(){
	

	var sellUuid = "${uuId}";
	var airResno = "${airResno}";
	var airRouteno = "${airResDetail.get(0).airRouteno}";
	var airClass = "${airResDetail.get(0).airClass}";
	
	
	console.log("sellUuid: " + sellUuid);
	console.log("airResno: " + airResno);
	console.log("airRouteno: " + airRouteno);
	console.log("airClass: " + airClass);
	
	$.ajax({
		type: "post",
		url: "${contextPath}/airways/pay/cancel",
		data:JSON.stringify({
			sellUuid: sellUuid,
			airResno: airResno,
			airRouteno: airRouteno,
			airClass: airClass
		}),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success: function(data){
			console.log(data);

			alert("결제가 취소되었습니다.");
			location.href='/travelapp/airways/airResList';
		},
		error: function(){
			alert("error");
			location.href='/travelapp/airways/airResList';
		}

	});

	
});

</script>

<%@include file="../include/footer.jsp" %>