package com.booknow.travelapp.hotel.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class HotelVO { 
    private Long htNo;
    private String htName;
    private int htRank;
    private String htAreaCode;
    private String htType;
    private String htPhone;
    private String htEmail;
    private String busId;
    private Timestamp htStartDate;
    private Timestamp htEndDate;
    private Timestamp htAvailDate; // 추가 2303272015 정지은
    private String htAddress;

    // 2307052152 장유정 코드 수정
    private List<HtRoomsDetailVO> roomList; 
    
    //작업자 : 정지은 230703 가격 (방가격 평균, 가격 높은 순, 호텔 성급순을 위한 값)
    private int minPrice; 
    private int htrankflg;
    private int htpriceFlg;
    
    // 추가
    private String htStartDateStr;
    private String htEndDateStr;
    
}
