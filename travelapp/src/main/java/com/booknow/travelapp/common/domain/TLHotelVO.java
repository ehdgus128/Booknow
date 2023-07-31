package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 관리자 호텔등록용 VO 230711
@Getter
@Setter
@ToString
public class TLHotelVO {
	
	private Long htNo;
	private String htName;
	private int htRank;
	private String htAreaCode;
	private String htType;
	private String htPhone;
	private String htEmail;
	private Long busId;
	private String htStartDate;
	private String htEndDate;
	private String htAddress;
	
	//busId 전달용 regNum 
	private String busRegNum;
	
}
