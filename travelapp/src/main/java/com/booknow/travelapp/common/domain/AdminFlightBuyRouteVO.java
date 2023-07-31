package com.booknow.travelapp.common.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AdminFlightBuyRouteVO {
	
	private long airBuyno;
	private long airRouteno;
	private long airRouteBuyPrice;
	private Timestamp airBuyDate;
	private long airTotalSeat;

}
