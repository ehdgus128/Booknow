package com.booknow.travelapp.airways.domain;

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
public class AirPassengersVO {

	//동현 작성 1809
	//지혁 작성 06261909
	private long airPasno ;
	private long airResno ;
	private String airPasName ;
	private String airPasGender ;
	private String airPasBDate ;
	private String airPasNation ;
	private double airDisCntRate ;
}
