package com.booknow.travelapp.hotel.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class HtRoomSellDateVO {
    // 작업자 김영환 방 일자 판매 테이블 VO

    private Long htRooSellDateId;
    private Long htRooSellPrice;
    private Timestamp htRooSellDate;
    private Long htRooNo;
    private Long htResNo;

    // 에약 총액
    private Long htSellPrice;
    
    //2307111241 추가
    // 호텔 번호
    private Long htNo;

    // 호텔 방 타입
    private String htRooType;

    // 호텔 방 이름
    private String htRooName;

}// HtRoomSellDateVO end
