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
public class AirReservationsVO {
	//230628 1243 동현 수정
	
	private long airResno ;
	private long airRouteno ;
	private String airlineId ;
	private long airSellno ;
	private String airClass ;
	private String userId ;
	
	//동현추가 0627 1531
	private String airlineNm;
	private String vihicleId;
	private String depAirportNm;
	private String arrAirportNm;
	private Date depPlandTime;
	private Date arrPlandTime;
	private String sellUuid ;
	
	//동현추가 0629 1144 
	
	private long airPasno ;
	private String airPasName ;
	private String airPasGender ;
	private double airDisCntRate ;
	private long economyCharge;
	private long prestigeCharge;
	private long totalPrice ;
	
	
	

 
	public AirReservationsVO(String airlineNm, String vihicleId,
			 String depAirportNm, String arrAirportNm, 
			 Date depPlandTime, Date arrPlandTime, 
			 String airClass) {
		
		this.airClass = airClass;
		this.airlineNm = airlineNm;
		this.vihicleId = vihicleId;
		this.depAirportNm = depAirportNm;
		this.arrAirportNm = arrAirportNm;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
}


}
