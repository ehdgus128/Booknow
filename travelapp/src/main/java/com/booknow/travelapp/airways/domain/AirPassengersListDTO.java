package com.booknow.travelapp.airways.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AirPassengersListDTO {
	
	private List<AirPassengersVO> airPassengersList ;
	// airPasname
	
	private String airResno1;
	private String airResno2;
	private String roundFlag;
	private String peopleCnt;
	private String airClass1;
	private String airClass2;
	
	
	// 추가
	private List<AirReservationsVO> finalReservation1;
	private List<AirReservationsVO> finalReservation2;
	private List<AirReservationsVO> finalReservation;
	private int onewayPrice;
	private long airRouteno1;
	private long airRouteno2;
	private int upwayPrice;
	private int downwayPrice;
	private long total;
	private long totalPrice;
	private List<String> passengersList;
	
	// 추가
	private String sellUuid;
	private String amount;
	
	// jsp 에서 넣으셈
	private String userId;
	
	private String result;
	
	//추가====
	private String airResno;
	private long airRouteno;
	private String airClass;

}// AirPassengersListDTO end;
