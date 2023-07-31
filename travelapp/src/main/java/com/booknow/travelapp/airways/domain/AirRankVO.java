package com.booknow.travelapp.airways.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AirRankVO {
    // 20230717 김영환 항공사 평점 VO
    private String airlineId;
	private String airlineNm;
    private Double airAvgGrade;
    private Integer rank;
}
