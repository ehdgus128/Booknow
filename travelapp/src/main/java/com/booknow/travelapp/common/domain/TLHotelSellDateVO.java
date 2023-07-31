package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//정지은 hotel판매내역 
@Getter
@Setter
@ToString
public class TLHotelSellDateVO {

	private Long htRooSellDateId;
	private int htRooSellPrice;
	private String htRooSellDate;
	private Long htRooNo;
	private int htResNo;
	
}
