package com.booknow.travelapp.hotel.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class HtHotelRankVO {
    // 작업자 김영환 2307051842
    private Long htNo;
    private String htName;
    private Integer htRank;
    private Double htAvgGrade;
    private Integer rank;
    private Integer hotelSellRank;
}
