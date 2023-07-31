package com.booknow.travelapp.hotel.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HtRoomVO { // hotel join 가능
    // 방정보, 호텔 정보를 가지는 VO
    // 2306271050 김영환

    // 방정보
    private Long htRooNo;
    private String htRooName;
    private String htRooType;
    private Long htRooPrice;
    
    // 호텔 정보 join
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
    private String htAddress;

}



