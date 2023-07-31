package com.booknow.travelapp.hotel.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HtReservationVO {
    // 2307021802_김영환_예약VO
    
    private Long htResNo;
    private String htResName;
    private Integer htResStatus;
    private Integer htResPeopleCount;
    private Timestamp htResCheckIn;
    private Timestamp htResCheckOut;
    private String htResEmail;
    private String htResPhone;
    private Long htSellTranId;

    // 추가
    private String htSellStatus;
    private Long htSellPrice;
    private String sellUuid;

}// class end
