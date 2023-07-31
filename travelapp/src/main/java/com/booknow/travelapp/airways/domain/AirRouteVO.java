package com.booknow.travelapp.airways.domain;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class AirRouteVO {
	//230626박효준 항공노선 VO 230629박효준 depPlandTime,arrPlandTime 타입 String 변경
	//230719박효준 airlineNm 추가
	private long airRouteno;
	private String airlineId;
	private String depAirportNm;
	private String arrAirportNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date depPlandTime; 
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date arrPlandTime;
	private long economyCharge;
	private long prestigeCharge;
	private String vihicleId;
	private long eseatCnt;
	private long pseatCnt;
	private String buyFlag;
	private String hh;
	private String mm;
	private String airlineNm;
	
	public AirRouteVO(String depAirportNm, String arrAirportNm, Date depPlandTime) {
		this.depAirportNm = depAirportNm;
		this.arrAirportNm = arrAirportNm;
		this.depPlandTime = depPlandTime;
	}

}
