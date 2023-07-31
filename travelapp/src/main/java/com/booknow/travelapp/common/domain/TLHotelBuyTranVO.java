package com.booknow.travelapp.common.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 230712 거래내역등록 
@Getter
@Setter
@ToString
public class TLHotelBuyTranVO {
	
	private Long htBuyTranId;
	private Timestamp htBuyTranDate;
	private String htBuyTranType;
	private int htBuyCost;
	
	private Long htNo;
	
}
