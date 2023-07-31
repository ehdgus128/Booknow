/**
 * 달력 만들기 class 선언
 * prototype
 * class 형태로 구현
 * 
 * ajax 통신 class 선언
 */
class CalendarMakeModule { // 달력 만들기 class 선언

    #calDateStr = ""; // 일자 str 
    #calMonthStr = ""; // 년월 str
    #calDicData = {}; // 예약가능일 사전형태

    // make된 일 반환
    getCalDate() {return this.#calDateStr;}

    // make된 년월 반환
    getCalMonth() {return this.#calMonthStr;}

    // ajax로 받아와서 넣을 함수
    // 객체 배열형태로 받아서 사전형태로 변환
    setCalDicData(calData) {
        this.#calDicData = calData.reduce(
            (acc, v) => 
                ({ ...acc, [v.date]: [...(acc[v.date] || []), v.content] })
            , {}
        );
    }

    // 생성자 
    // prototype에 추가 메소드 선언과 데이터 사전형태로 변환
    constructor() {
        // this.#calDicData = calData.reduce(
        //     (acc, v) => 
        //         ({ ...acc, [v.date]: [...(acc[v.date] || []), v.content] })
        //     , {}
        // );

        Date.prototype.getInterval = function (otherDate) {
            var interval;

            if (this > otherDate)
                interval = this.getTime() - otherDate.getTime();

            else
                interval = otherDate.getTime() - this.getTime();

            return Math.floor(interval / (1000 * 60 * 60 * 24));
        };

        // pad method
        Number.prototype.pad = function() {
            return this > 9 ? this : '0' + this;
        }

    }// constructor end

    // get cal make
    makeHotelCalendar(makeDate) {

        //console.log(this.#calDicData);

        if (this.#calDicData == null || this.#calDicData == undefined) {
            console.log("데이터가 없어요");
            return;
        }

        const calendarList = this.#calDicData;
        // 사전 형태로 변환

        // 현재의 년도와 월 받아오기
        const currentYear = new Date(makeDate).getFullYear();
        const currentMonth = new Date(makeDate).getMonth() + 1;

        // 한달전의 마지막 요일
        const firstDay = new Date(makeDate.setDate(1)).getDay();
        // 현재 월의 마지막 날 구하기
        const lastDay = new Date(currentYear, currentMonth, 0).getDate();

        // 남은 박스만큼 다음달 날짜 표시
        const limitDay = firstDay + lastDay;
        const nextDay = Math.ceil(limitDay / 7) * 7;

        let htmlDummy = '';

        // 한달전 날짜 표시하기
        for (let i = 0; i < firstDay; i++) {
            htmlDummy += `<div class="noColor"></div>`;
        }

        // 이번달 날짜 표시하기 문자열 생성
        for (let i = 1; i <= lastDay; i++) {

            // 날짜 문자열 만들기
            const currentDate = `${currentYear}/${currentMonth.pad()}/${i.pad()}`

            var dateClassAdd = "";

            // if 문으로 예약 가능한 날짜 class 추가
            if (calendarList[currentDate] != undefined) {
                dateClassAdd = "revColor revAble";
            }

            htmlDummy += `
                <div class="divDate `+dateClassAdd+`" data-date="`+currentDate+`">
                ${i}
                <p class="calP">
                    ${calendarList[currentDate]?.join('</p><p>') || ''}
                </p>
                </div>`;
        }// for end

        // 다음달 날짜 표시하기
        for (let i = limitDay; i < nextDay; i++) {
            htmlDummy += `<div class="noColor"></div>`;
        } // for end

        // 일 
        this.#calDateStr = htmlDummy;

        // 년 월
        this.#calMonthStr = `${currentYear}년 ${currentMonth}월`;

    }// makeHotelCalendar end

    // date를 yyyy/MM/dd 형태 str로 변환
    makeDateString(date) { // date str

        const currentYear = new Date(date).getFullYear();
        const currentMonth = new Date(date).getMonth() + 1;
        const currentDay = new Date(date).getDate();
    
        const currentDate = `${currentYear}/${currentMonth.pad()}/${currentDay.pad()}`
    
        return currentDate;
    }

    // date를 yyyy-MM-dd 형태 str로 변환
    makeDateListString(date) { // date str

        const currentYear = new Date(date).getFullYear();
        const currentMonth = new Date(date).getMonth() + 1;
        const currentDay = new Date(date).getDate();
    
        const currentDate = `${currentYear}-${currentMonth.pad()}-${currentDay.pad()}`
    
        return currentDate;
    }
    
    // 선택한 checkIn checkOut이 예약가능일인지 답하는 method
    isRevPeriod(checkIn, checkOut) {

        if (this.#calDicData[checkIn] == undefined || 
            this.#calDicData[checkOut] == undefined) {
            alert("예약이 불가능한 날짜가 포함되었습니다.");
            return false;
        }

        var checkInDate = new Date(checkIn);
        var checkOutDate = new Date(checkOut);

        var revPeriod = checkInDate.getInterval(checkOutDate);
    
        var tmpInOutDate = new Date(checkInDate);
        for (let i = 0; i < revPeriod; i++) {
            tmpInOutDate.setDate(tmpInOutDate.getDate()+1);
    
            var tmpInOutDateStr = this.makeDateString(tmpInOutDate);
    
            if (this.#calDicData[tmpInOutDateStr] == undefined) {
                alert("예약이 불가능한 날짜가 포함되었습니다.");
                return false;
            }
        }// for end
        return true;
    }// isRevPeriod end
    

}; // CalendarMakeModule class end

class HtResAjaxModule { // 예약관련 ajax 통신 모듈

    #resAbleDate = [];

    getResAbleDate() {
        return this.#resAbleDate;
    }

    setResAbleDate(resAbleDate) { // 필요 없는거 같음.
        this.#resAbleDate = resAbleDate;
    }

    constructor() {}

    // ajax 통신 함수
    // 예약 가능한 일자 받는 함수
    getAjaxResAbleDate(htRooNo, callback, error) {
        $.ajax({
            type : 'get',
            url : '/travelapp/hotel/htresr/date/'+htRooNo,
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// getAjaxResAbleDate end

    // 유저입장 구매 총액 
    getAjaxResTotalPrice(ablePeriod, callback, error) {
        $.ajax({
            type : 'post',
            url : '/travelapp/hotel/htresr/totalpay',
            data : JSON.stringify(ablePeriod),
            contentType: "application/json; charset=utf-8",
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// getAjaxResAbleDate end

    // 유저 정보
    getAjaxUserData(sendData, callback, error) {
        $.ajax({
            type : 'get',
            url : '/travelapp/hotel/htresr/user/'+sendData.userId,
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    } // getAjaxUserData end

    // 결제 취소
    getAjaxPaymentCancel(sendData, callback, error) {
        $.ajax({
            type : 'post',
            url : '/travelapp/hotel/htresr/pay/cancel',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(sendData),
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    } // getAjaxPaymentCancelend

    // ajax를 통해 받은 데이터 가공 함수
    getProcessJsonConvertArray(data) {

        // 중복데이터 입력을 막기 위해서 초기화
        this.#resAbleDate = [];

        for (const sellDate of data.htRoomSellDateList) { // 받은 데이터를 사전 타입 배열로 변환

            const calDate = new CalendarMakeModule();

            // 정수 형태의 시간을 js Date 선언
            var tmpDate = new Date(sellDate.htRooSellDate);

            // Date객체를 기반으로 입력 받은 date yyyy/MM/dd 형태로 가공
            tmpDate = calDate.makeDateString(tmpDate);

            // array에 push
            this.#resAbleDate.push({ date: tmpDate, content: `${sellDate.htRooSellPrice}` });
        }// for end
    } // getProcessJsonConvertArray end

}; // HtResAjaxModule

// 호텔 리스트 관련 ajax 통신 모듈
class HtListAjaxModule{

    constructor() {}

    // list 받오는 ajax
    getAjaxListDate(sendData, callback, error) {

        //var htAreaCode = encodeURI(sendData.htAreaCode);
        
        $.ajax({
            type : 'get',
            url:"/travelapp/hotel/"+sendData.flag+"/"+sendData.sqlFlag+"/"+sendData.pageNum,
            data: sendData,
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// getAjaxListDate end

    // 호텔 list div str
    getHotelListStr(hotelList) {
        var tmp = '';
        for (const hotel of hotelList) {
            tmp += `
                <div class="card border-secondary my-3 mx-2">
                <div class="row">
                    <div class="col-12">
                        <div class="card-header"><div class="fw-bold d-inline text-danger">${hotel.htName}</div></div>
                    </div>
                </div>
                <div class="row">
                    <div class="card-body col-6">
                        <div class="card-text col-auto my-1">
                            <img src="/travelapp/hotel/hotelFiles/${hotel.htNo}" class="d-block user-select-none" width="100%"  aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
                            <rect width="100%" height="100%" fill="#868e96"></rect>
                        </div>
                    </div>
                    
                    <div class="card-body col-6">
                        <div class="card border-secondary my-3 mx-2">
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 성급 : ${hotel.htRank}
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 주소 : ${hotel.htAddress}
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 타입 : ${hotel.htType}
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 연락처 : ${hotel.htPhone}
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 이메일 : ${hotel.htEmail}
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                호텔 방 가격 : <div class="fw-bold d-inline text-danger">${hotel.minPrice}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-auto my-3 mx-2">
                        <button class="moveHtRoomList btn btn-info" data-htno="${hotel.htNo}">호텔 방목록으로</button>
                    </div>
                </div>                       				
            </div>
            `;
            // <button class="btn btn-info" onclick="location.href='/travelapp/hotel/rooms/list?htNo=${hotel.htNo}'">호텔 방목록으로</button>
        }// for end

        return tmp;
    }// getHotelListStr end

    // hotel list paging btn str
    getHotelListPagingBtnStr(pageBean) {
		console.log(pageBean);
        var paginationStr = "";
				
        paginationStr += '<ul class="pagination justify-content-center">';
    
        if(!pageBean.prev){
            paginationStr += '<li class="page-item disabled">';
            paginationStr +=  '<a class="page-link">이전</a>';
            paginationStr += '</li>';
        }else {
            var tmp = pageBean.min-1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="displayHighRank(' + tmp + ')" class="page-link">이전</a>';
            paginationStr += '</li>';
        }
        
        //페이지 번호 
        for(var idx = pageBean.min; idx <= pageBean.max; idx++){
            
            var active = ((idx == pageBean.currentPage) ? "active" : "" );

            paginationStr += '<li class="page-item '+active+'">';
            paginationStr += '<a onclick="displayHighRank(' + idx + ')" class="page-link">' + idx + '</a>';
            paginationStr += '</li>';
        }//end-for
        
        //다음페이지 
        if(!pageBean.next){
            paginationStr += '<li class="page-item disabled">';
                paginationStr += '<a class="page-link">다음</a>';
                paginationStr += '</li>';
        }else{
            var tmp = pageBean.max+1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="displayHighRank(' + tmp + ')" class="page-link">다음</a>';
            paginationStr += '</li>';
        }
        
        paginationStr += '</ul>';
			
        return paginationStr;
    }// getHotelListStr end
   
}; // HtResAjaxModule end


class HtRevAjaxModule {

    constructor() {
    	// pad method
        Number.prototype.pad = function() {
            return this > 9 ? this : '0' + this;
        }
    }

    // list 받오는 ajax
    getAjaxRevList(sendData, callback, error) {

        //var htAreaCode = encodeURI(sendData.htAreaCode);
        
        $.ajax({
            type : 'get',
            url:"/travelapp/hotel/rev/list/"+sendData.htNo+"/"+sendData.pageNum,
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// getAjaxListDate end

    // 리뷰 댓글 작성 ajax
    registerHtRev(sendData, callback, error) {

        $.ajax({
            type : 'post',
            url:"/travelapp/hotel/rev/reg",
            data: JSON.stringify(sendData),
 			contentType : 'application/json; charset=utf-8',
            dataType : 'text',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// registerHtRev end

    // 호텔 rev div str
    getRevListStr(htReviewList) {
        var tmp = '';
        for (const rev of htReviewList) {
        
        	if(rev.htRevDelFlag == 1) {
        		continue;
        	}

            var dateCreate = new Date(rev.htRevRegDate);

            const currentYear = dateCreate.getFullYear();
            const currentMonth = dateCreate.getMonth() + 1;
            const currentDay = dateCreate.getDate();
        
            const currentDate = `${currentYear}/${currentMonth.pad()}/${currentDay.pad()}`;
        
            tmp += `
                <div class="card border-secondary my-3 mx-2">
                <div class="row">
                    <div class="col-12">
                        <div class="card-header"><div class="fw-bold d-inline text-danger">${rev.userId}</div></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="card-text col-auto my-1 mx-2">
                                리뷰 별점: <div class="fw-bold d-inline text-danger">★ X ${rev.htRevStar}</div>
                            </div>
                            <div class="card-text col-auto my-1 mx-2">
                                <div class="fw-bold d-inline">리뷰 등록일 : ${currentDate}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card-body col-12">
                        <div class="card border-secondary my-3 mx-2">
                            <div class="card-text col-auto my-1 mx-2">
                                리뷰 내용 : ${rev.htRevContents}
                            </div>
                        </div>
                    </div>
                </div>                     				
            </div>
            `;
        }// for end

        return tmp;
    }// getRevListStr end

    // hotel rev paging btn str
    getHtRevListPagingBtnStr(pageBean) {
        var paginationStr = "";
				
        paginationStr += '<ul class="pagination justify-content-center">';
    
        if(!pageBean.prev){
            paginationStr += '<li class="page-item disabled">';
            paginationStr +=  '<a class="page-link">이전</a>';
            paginationStr += '</li>';
        }else {
            var tmp = pageBean.min-1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="goToPage(' + tmp + ')" class="page-link">이전</a>';
            paginationStr += '</li>';
        }
        
        //페이지 번호 
        for(var idx = pageBean.min; idx <= pageBean.max; idx++){
            
            var active = ((idx == pageBean.currentPage) ? "active" : "" );

            paginationStr += '<li class="page-item '+active+'">';
            paginationStr += '<a onclick="goToPage(' + idx + ')" class="page-link">' + idx + '</a>';
            paginationStr += '</li>';
        }//end-for
        
        //다음페이지 
        if(!pageBean.next){
            paginationStr += '<li class="page-item disabled">';
                paginationStr += '<a class="page-link">다음</a>';
                paginationStr += '</li>';
        }else{
            var tmp = pageBean.max+1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="goToPage(' + tmp + ')" class="page-link">다음</a>';
            paginationStr += '</li>';
        }
        
        paginationStr += '</ul>';

        return paginationStr;
    }// getHtRevListPagingBtnStr end
};

// 방 ajax 모듈
class HtRoomAjaxModule {
    constructor() {
    	// pad method
        Number.prototype.pad = function() {
            return this > 9 ? this : '0' + this;
        }
    }// constructor end

    // list 받오는 ajax
    getAjaxRoomListDate(sendData, callback, error) {

        //var htAreaCode = encodeURI(sendData.htAreaCode);

        $.ajax({
            type : 'get',
            url:"/travelapp/hotel/rooms/list/re/"+sendData.pageNum,
            data: sendData,
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// getAjaxRoomListDate end

    // 호텔 list div str
    getAjaxRoomListStr(htRoomList) {
        var tmp = '';
        
            
        
        for (const room of htRoomList) {
            tmp += `
            <div class="row mt-5">
                <div class="col-12">
                    <table class="table table-bordered table-striped table-minty">
                        <thead>
                            <tr>
                                <th style="width: 20%; font-weight: bold; color: black;">객실 첨부사진</th>
                                <th style="width: 15%; font-weight: bold; color: black;">방 타입</th>
                                <th style="width: 20%; font-weight: bold; color: black;">방 이름</th>
                                <th style="width: 15%; font-weight: bold; color: black;">오늘의 요금</th>
                                <th style="width: 15%; font-weight: bold; color: black;">예약</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="border-right: 2px solid #ddd; background-color: white; color: #555;">
                                   <img src="/travelapp/hotel/roomFiles/${room.htRooNo} " width="100%">
                               
                                </td>
                                <td style= "font-weight: bold; color: black;">${room.htRooType}</td>
                                <td style= "font-weight: bold; color: black;">${room.htRooName}</td>
                              
                                <td><div class="fw-bold d-inline text-danger">${room.htRooSellPrice}원</div></td>
                                <td style= "font-weight: bold; color: black;">
                                    <button data-htroono="${room.htRooNo}" class="btnMoveRes btn btn-primary btn-custom-pink">예약</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>      
                </div>
            </div>
            `;
        }// for end

        return tmp;
    }// getHotelListStr end

    // hotel list paging btn str
    getARoomListPagingBtnStr(pageBean) {

        var paginationStr = "";
				
        paginationStr += '<ul class="pagination justify-content-center">';
    
        if(!pageBean.prev){
            paginationStr += '<li class="page-item disabled">';
            paginationStr +=  '<a class="page-link">이전</a>';
            paginationStr += '</li>';
        }else {
            var tmp = pageBean.min-1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="goToPageRoomList(' + tmp + ')" class="page-link">이전</a>';
            paginationStr += '</li>';
        }
        
        //페이지 번호 
        for(var idx = pageBean.min; idx <= pageBean.max; idx++){
            
            var active = ((idx == pageBean.currentPage) ? "active" : "" );

            paginationStr += '<li class="page-item '+active+'">';
            paginationStr += '<a onclick="goToPageRoomList(' + idx + ')" class="page-link">' + idx + '</a>';
            paginationStr += '</li>';
        }//end-for
        
        //다음페이지 
        if(!pageBean.next){
            paginationStr += '<li class="page-item disabled">';
                paginationStr += '<a class="page-link">다음</a>';
                paginationStr += '</li>';
        }else{
            var tmp = pageBean.max+1;
            paginationStr += '<li class="page-item">';
            paginationStr += '<a onclick="goToPageRoomList(' + tmp + ')" class="page-link">다음</a>';
            paginationStr += '</li>';
        }
        
        paginationStr += '</ul>';

        return paginationStr;
    }// getHotelListStr end


}; // HtRoomAjaxModule end