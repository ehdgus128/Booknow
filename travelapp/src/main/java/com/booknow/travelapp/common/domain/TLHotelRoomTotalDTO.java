package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

//작업자 정지은 2307131014 방dto
@Getter
@Setter
@ToString
public class TLHotelRoomTotalDTO {
	
	//방
	private Long htRooNo;
	private String htRooType;
	private int htRooPrice;
	private Long htNo;
	private String htRooName;
	
	//방거래내역
	private Long htRooBuyDateId;
	private int htRooBuyPrice;
	private String htRooBuyDate;
	
	//맵핑테이블용 
	private Long htBuyTranId;
	

}
