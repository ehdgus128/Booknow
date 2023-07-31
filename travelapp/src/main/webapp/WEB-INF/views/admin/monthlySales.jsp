<%@include file="/WEB-INF/views/include/adminheader.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- 230705 0014 동현 작성 -->
<div id="page-wrapper">
	
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Booknow 월별 매출(순이익) 현황</h1>
        </div>
    </div>
    
    <div class="row">
    	
    	<div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
	            <div class="panel-footer">
	                <span class="pull-left">(2023) 총 매출: <span id="totalSales"></span>원</span>
	                <div class="clearfix"></div>
	            </div>
            </div>
        </div>
    	
    	<div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
	            <div class="panel-footer">
	                <span class="pull-left">이번달 총 매출: <span id="monthTotalSales"></span>원</span>
	                <div class="clearfix"></div>
	            </div>
            </div>
        </div>
        
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
	            <div class="panel-footer">
	                <span class="pull-left">이번달 항공 매출현황: <span id="monthAirSales"></span>원</span>
	                <div class="clearfix"></div>
	            </div>
            </div>
        </div>
        
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
	            <div class="panel-footer">
	                <span class="pull-left">이번달 호텔 매출현황: <span id="monthHtSales"></span>원</span>
	                <div class="clearfix"></div>
	            </div>
            </div>
        </div>
    </div> <!-- row-end -->

	<!-- chart start -->
	<div class="row">
		<div class="col-lg-6">
			<canvas id="monthlySalesChart" style="height: 300px;"></canvas>
		</div>
		<div class="col-lg-6">
			<canvas id="monthlySalesPieChart" style="height: 300px;"></canvas>
		</div>	
	</div><!-- chart end -->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <button type="button" class="btn btn-primary" id="beforeBtn">이전</button>
                    <span id="curYear"></span>
                    <button type="button" class="btn btn-primary" id="nextBtn">다음</button>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                        <!-- 테이블 -->
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline collapsed col-sm-12" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" >
                                    <thead>
                                        <tr role="row">
                                            <th id="topTr"></th>
                                            <th>01월</th>
                                            <th>02월</th>
                                            <th>03월</th>
                                            <th>04월</th>
                                            <th>05월</th>
                                            <th>06월</th>
                                            <th>07월</th>
                                            <th>08월</th>
                                            <th>09월</th>
                                            <th>10월</th>
                                            <th>11월</th>
                                            <th>12월</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr id="totalTr" class="gradeA odd" role="row">
                                        </tr>
                                        <tr id="airTr" class="gradeA odd" role="row">
                                        </tr>
                                        <tr id="hotelTr" class="gradeA odd" role="row">
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- /.table-responsive -->
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- row end -->
    
    

</div><!-- page-wrapper-end -->

<script>
var csrfHeaderName = "${_csrf.headerName}" ;
var csrfToken = "${_csrf.token}" ;

//차트
var barCtx = $("#monthlySalesChart")[0].getContext('2d');
var barCtx2 = $("#monthlySalesPieChart")[0].getContext('2d');
//전역
var tlChart = null;

var tlPieChart = null;

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
});

//천 단위마다 콤마표시 함수
function addCommas(number) {
	  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

//차트 함수
function createChart(){

    var tmp = new Chart(barCtx, 

            {
                type: 'bar',
                data: {
                    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    datasets: [
                        {
                            label: '총 매출액',
                            backgroundColor: '#0b62a4',
                            borderColor: '#0b62a4',
                            borderWidth: 1
                        },
                        {
                            label: '항공 매출액',
                            backgroundColor: 'rgba(0, 255, 0, 0.5)',
                            borderColor: '#00ff00',
                            borderWidth: 1
                        },
                        {
                            label: '호텔 매출액',
                            backgroundColor: '#ff69b4',
                            borderColor: '#ff69b4',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    aspectRatio: 2,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            }
        );

        return tmp;
     
}

//파이차트 함수
function createPieChart(){

var tmp2 = new Chart(barCtx2, 

        {
            type: 'pie',
            data: {
            labels: [
                '항공',
                '호텔'
            ],
            datasets: [{
                label: ['항공', '호텔'],
                data: [],
                backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)'
                ],
                hoverOffset: 4
            }]
            },
            options: {
                aspectRatio: 2,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        }
    );

    return tmp2;
 
}

function updateChart(monthlySales, airSales, hotelSales) {

    tlChart.data.datasets[0].data = monthlySales;
    tlChart.data.datasets[1].data = airSales;
    tlChart.data.datasets[2].data = hotelSales;

    tlChart.update();
}

function updatePieChart(airSales, hotelSales) {

    var airTotal = 0 ;
    var htTotal = 0 ;

    for(var i = 0 ; i < 12; i++){
        airTotal += airSales[i] ;
        htTotal += hotelSales[i] ;
    }

    if(htTotal < 0){
        htTotal = 0 ;
    }

    if(airTotal < 0){
        airTotal = 0 ;
    }

    
    tlPieChart.data.datasets[0].data[0] = airTotal;
    tlPieChart.data.datasets[0].data[1] = htTotal;

    tlPieChart.update();
}

//현재 날짜
var nowYear = new Date();
//현재날짜(고정으로 씀)
var staticYear = new Date();


$(document).ready(function() {

    tlChart = createChart();
    tlPieChart = createPieChart();

    var getMonth = nowYear.getMonth()+1;

    var curYear = $("#curYear");
    curYear.html(nowYear.getFullYear());
    $("#topTr").html(nowYear.getFullYear());

    var totalTr = $("#totalTr");
    var airTr = $("#airTr") ;
    var hotelTr = $("#hotelTr");
    var totalSales = $("#totalSales");
    var monthTotalSales = $("#monthTotalSales");
    var monthAirSales = $("#monthAirSales");
    var monthHtSales = $("#monthHtSales");

    totalTr.empty();
    airTr.empty();
    hotelTr.empty();

    var totalHtml = "<td>총 매출</td>" ;
    var airHtml = "<td>항공</td>" ;
    var hotelHtml = "<td>호텔</td>" ;

    var totalMoney = 0;

    $.ajax({
        type: 'post',
        url: '/travelapp/admin/monthlySales2/',
        data: JSON.stringify({
            selectedYear: nowYear.getFullYear()
        }),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(data, status, xhr) {
        	
        	console.log(data) ;
           
        	
            var monthlySales = [];
            var airSales = [];
            var hotelSales = [];

            var a = 0 ;
            var b = 0 ;

            for (var i = 0; i < 12; i++) {

                a = data.airSalesList[i].MONTHLYSALES;
                b = data.htSalesList[i].MONTHLYSALES;

                monthlySales.push(a + b);
                airSales.push(a);
                hotelSales.push(b);

                totalMoney += (a+b) ;

                totalHtml += "<td class='center'>" + addCommas(a+b) +  "원</td>" ;
                airHtml += "<td class='center'>" + addCommas(a) + "원</td>" ;
                hotelHtml += "<td class='center'>" + addCommas(b) + "원</td>" ;
            }

            var monthAirSalesNo = data.airSalesList[getMonth-1].MONTHLYSALES;
            var monthHtSalesNo = data.htSalesList[getMonth-1].MONTHLYSALES;

            var monthTotalSalesNo = monthAirSalesNo + monthHtSalesNo ;

            totalTr.append(totalHtml) ;
            airTr.append(airHtml) ;
            hotelTr.append(hotelHtml);
            totalSales.html(addCommas(totalMoney));

            monthTotalSales.html(addCommas(monthTotalSalesNo));
            monthAirSales.html(addCommas(monthAirSalesNo));
            monthHtSales.html(addCommas(monthHtSalesNo));
            
            updateChart(monthlySales, airSales, hotelSales) ;
            updatePieChart(airSales, hotelSales) ;
        },
        error: function(xhr, status, err) {
            console.log(err);
        }
    }); //ajax - end

    $("#nextBtn").addClass("disabled") ;
    $("#nextBtn").attr('disabled', true);
});

//이전 버튼 클릭 시
$("#beforeBtn").on("click", function(){
	
    var nowYear = $("#curYear").html() ;

    $("#nextBtn").removeClass("disabled") ;
    $("#nextBtn").attr('disabled', false);
    
    var selectedYear = Number(nowYear)-1 ;

    if(selectedYear < (staticYear.getFullYear()-1)){

        $(this).addClass("disabled") ;
    }
    
    if(selectedYear < (staticYear.getFullYear()-2)){
        $(this).attr('disabled', true);
        
        return ;
    }
    
    
	var totalTr = $("#totalTr");
	var airTr = $("#airTr") ;
    var hotelTr = $("#hotelTr");
    
    var curYear = $("#curYear");
    curYear.html(selectedYear);
    
    $("#topTr").html(selectedYear);
    
    totalTr.empty();
    airTr.empty();
    hotelTr.empty();
    
    var totalHtml = "<td>총 매출</td>" ;
    var airHtml = "<td>항공</td>" ;
    var hotelHtml = "<td>호텔</td>" ;
	
    $.ajax({
        type : 'post',
        url : '/travelapp/admin/monthlySales2/',
        data : JSON.stringify({
        	selectedYear : selectedYear
        }),
        contentType: "application/json; charset=utf-8",
        dataType : 'json',
        success : function (data, status, xhr) {
        	
        		console.log(data) ;
            
                var monthlySales = [];
                var airSales = [];
                var hotelSales = [];
        	
				for(var i = 0; i < 12; i++){
                var a = data.airSalesList[i].MONTHLYSALES;
                var b = data.htSalesList[i].MONTHLYSALES;

                monthlySales.push(a + b);
                airSales.push(a);
                hotelSales.push(b);

                totalHtml += "<td class='center'>" + addCommas(a+b) +  "원</td>" ;
                airHtml += "<td class='center'>" + addCommas(a) + "원</td>" ;
                hotelHtml += "<td class='center'>" + addCommas(b) + "원</td>" ;
            	}
            
	            totalTr.append(totalHtml) ;
	            airTr.append(airHtml) ;
	            hotelTr.append(hotelHtml);
            
                updateChart(monthlySales, airSales, hotelSales) ;
	            updatePieChart(airSales, hotelSales) ;
	            
        	},
        error : function (xhr, status, err) {
        	console.log(err);
        }
    });// ajax end


});// event end

//다음 버튼 클릭 시
$("#nextBtn").on("click", function(){
    


	var nowYear = $("#curYear").html() ;

    $("#beforeBtn").removeClass("disabled") ;
    $("#beforeBtn").attr('disabled', false);
    
    var selectedYear = Number(nowYear)+1 ;


    if(selectedYear >= (staticYear.getFullYear())){
        $(this).addClass("disabled") ;
    }
    

    if(selectedYear > (staticYear.getFullYear())){
        $(this).attr('disabled', true);
        
        return;
    }

    
	var totalTr = $("#totalTr");
	var airTr = $("#airTr") ;
    var hotelTr = $("#hotelTr");
    
    
    var curYear = $("#curYear");
 
    curYear.html(selectedYear);
    
    $("#topTr").html(selectedYear);
    
    totalTr.empty();
    airTr.empty();
    hotelTr.empty();
    

    var totalHtml = "<td>총 매출</td>" ;
    var airHtml = "<td>항공</td>" ;
    var hotelHtml = "<td>호텔</td>" ;
	
    $.ajax({
        type : 'post',
        url : '/travelapp/admin/monthlySales2/',
        data : JSON.stringify({
        	selectedYear : selectedYear
        }),
        contentType: "application/json; charset=utf-8",
        dataType : 'json',
        success : function (data, status, xhr) {
        	
        	console.log(data) ;
            
            var monthlySales = [];
            var airSales = [];
            var hotelSales = [];
        	
            for(var i = 0; i < 12; i++){
                var a = data.airSalesList[i].MONTHLYSALES;
                var b = data.htSalesList[i].MONTHLYSALES;

                monthlySales.push(a + b);
                airSales.push(a);
                hotelSales.push(b);

                totalHtml += "<td class='center'>" + addCommas(a+b) +  "원</td>" ;
                airHtml += "<td class='center'>" + addCommas(a) + "원</td>" ;
                hotelHtml += "<td class='center'>" + addCommas(b) + "원</td>" ;
            }
            
            totalTr.append(totalHtml) ;
            airTr.append(airHtml) ;
            hotelTr.append(hotelHtml);
            
            updateChart(monthlySales, airSales, hotelSales) ;
	        updatePieChart(airSales, hotelSales) ;
            
        },
        error : function (xhr, status, err) {
        	console.log(err);
        }
    });// ajax end
    
});// event end
	


</script>

<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>