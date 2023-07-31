package com.booknow.travelapp.hotel.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
//작업자 정지은 2023070311:09
public class HtHotelListRoomVO {

	private Long htRooNo;
	private String htRooType;
	private int htRooPrice;
	private Long htNo;
	
}
