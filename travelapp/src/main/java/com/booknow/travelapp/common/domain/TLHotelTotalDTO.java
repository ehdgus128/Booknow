package com.booknow.travelapp.common.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 관리자 호텔등록용 dto 
@Getter
@Setter
@ToString
public class TLHotelTotalDTO {
	
	//사업자 
	private String busName; 
	private String busRegNum;
	private int busCertified;

	//호텔
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
	
	//거래내역 
	private Long htBuyTranId;
	private Timestamp htBuyTranDate;
	private String htBuyTranType;
	private int htBuyCost;
	

	
}
