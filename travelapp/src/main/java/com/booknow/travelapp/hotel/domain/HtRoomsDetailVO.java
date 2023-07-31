package com.booknow.travelapp.hotel.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
//230703 장유정 - 호텔 정보 불러오는 VO 추가
//202307052154 장유정 - 코드 수정
public class HtRoomsDetailVO {

	//230703 장유정 - 호텔 정보 불러오는 VO 추가

	//객실 정보 불러오는 VO
	private long htRooNo ;
	private String htRooType;
	private int htRooPrice; //객실 가격
	private int htNo;
	private String htRooName;
	private int htRooSellPrice; // 객실 실제 판매 가격 - 2307061148 장유정 추가
	
}
