package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은  방등록 
@Getter
@Setter
@ToString
public class TLHotelRoomVO {
	
	private Long htRooNo;
	private String htRooType;
	private int htRooPrice;
	private Long htNo;
	private String htRooName;
	
}
