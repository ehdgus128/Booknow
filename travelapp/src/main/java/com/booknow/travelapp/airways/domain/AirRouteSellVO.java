package com.booknow.travelapp.airways.domain;

import java.util.Date;

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
// 230626 임지혁 생성
public class AirRouteSellVO {
	private Long airSellno;
	private String userId;
	private Date airSellDate;
	private String airSellStatus;
	private String sellUuid ;
	private Long totalPrice ;
}
