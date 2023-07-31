/*airroute.js: 노선 데이터 처리용 Ajax Closer Module
*/

let airRouteClsr = (function(){

	function getAirRouteList(airwaysPaging, callback, error) {
//		console.log(airwaysPaging);
		$.ajax({
			type: "post",
			url: "/travelapp/airways/tickets/ajax",
			data: JSON.stringify(airwaysPaging),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			//async: false,
			success: function(airwaysPagingCreatorAjax, status, xhr) {
				if (callback) {
					callback(airwaysPagingCreatorAjax);
				}
			},
			error: function(xhr, status, err) {
				if(error) {
					console.log(err);
				}
			}
		});
	}
	
	
	// 날짜 시간 표시형식 설정
    function showDatetime(datetimeValue) {
        var dateObj = new Date(datetimeValue);
//      console.log("dateObj: " + dateObj.toString());
        var str = "";

//        var yyyy = dateObj.getFullYear();
        var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
        var dd = dateObj.getDate();
        var hh = dateObj.getHours();
        var mi = dateObj.getMinutes();

        str = [ 
//        		yyyy, '/',
               (mm > 9 ? '' : '0') + mm, '/',
               (dd > 9 ? '' : '0') + dd, ' ',
               (hh > 9 ? '' : '0') + hh, ':',
               (mi > 9 ? '' : '0') + mi ].join('');
        
        return str;
    }
    
    
	// 시간표시
    function showTime(datetimeValue) {
        var dateObj = new Date(datetimeValue);
//      console.log("dateObj: " + dateObj.toString());
        var strArr = {};

//        var yyyy = dateObj.getFullYear();
//        var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
//        var dd = dateObj.getDate();
        var hh = dateObj.getHours();
        var mi = dateObj.getMinutes();
		
		str = [ 
//        		yyyy, '/',
//               (mm > 9 ? '' : '0') + mm, '/',
//               (dd > 9 ? '' : '0') + dd, ' ',
               (hh > 9 ? '' : '0') + hh, ':',
               (mi > 9 ? '' : '0') + mi ].join('');
        
        return str;
       
    }
    

	//항공사 코드 -> 항공사 이름 변환
	
	function airlineIdtoNm(airlineId) {
		let airlineNm = '';	
			
		if (airlineId == "KAL") {
			airlineNm = "대한항공";
		} else if (airlineId == "AAR") {
			airlineNm = "아시아나항공";
		} else if (airlineId == "JJA") {
			airlineNm = "제주항공";
		} else if (airlineId == "JNA") {
			airlineNm = "진에어";
		} else if (airlineId == "ABL") {
			airlineNm = "에어부산";
		} else if (airlineId == "ESR") {
			airlineNm = "이스타항공";
		} else if (airlineId == "HGG") {
			airlineNm = "하이에어";
		} else if (airlineId == "ASV") {
			airlineNm = "에어서울";
		} else if (airlineId == "TWB") {
			airlineNm = "티웨이항공";
		} else if (airlineId == "FGW") {
			airlineNm = "플라이강원";
		}
		
		return airlineNm;
	}
	
	
	
	

	
	//airRouteClsr
	return {
		getAirRouteList: getAirRouteList,
		showDatetime: showDatetime,
		showTime: showTime,
		airlineIdtoNm: airlineIdtoNm
	};


})();