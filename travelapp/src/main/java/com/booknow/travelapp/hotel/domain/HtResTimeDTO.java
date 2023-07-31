package com.booknow.travelapp.hotel.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HtResTimeDTO {
    // 작업자 김영환 기간 문자열 DTO

    // check in out str
    private String htResCheckInStr;
    private String htResCheckOutStr;

    // 추가
    private Long htRooNo;
    private Long htNo;
    private String htName;
    private String htRooName;

    private String sellId;
    private Long amount;
    
    // 추가 
    private String htResName;
    private String htResEmail;
    private String htResPhone;

    // 추가
    private Long htResNo;

    //미리추가
    private String userId;

    // 추가
    private boolean result;

}// HtResTimeDTO end
