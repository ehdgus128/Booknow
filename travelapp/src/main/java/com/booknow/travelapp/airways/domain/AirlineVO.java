package com.booknow.travelapp.airways.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//230701 임지혁: VO생성
public class AirlineVO {
	private String airlineId;
	private String airlineNm;
	private String airlineRegno;
	private String airlinePersonNm;
	private long airlinePersonNumber;
	private String airlinePersonEmail;
}
