package com.booknow.travelapp.hotel.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HtSellTransVO {
    private Long htSellTranId;
    private String userId;
    private Timestamp htSellTranDate;
    private String htSellTranPayment;
    private String htSellStatus;
    private Long htSellPrice;
    private Long htNo;
    private String sellUuid;

    //추가
    private Long htResNo;
    private Integer htResStatus;
}
