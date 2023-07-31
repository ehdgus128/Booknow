package com.booknow.travelapp.airways.domain;

import java.sql.Timestamp;

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
public class AirRouteBuyVO {
	private long airBuyno;
	private long airRouteno;
	private long airRouteBuyPrice;
	private Timestamp airBuyDate;
}
