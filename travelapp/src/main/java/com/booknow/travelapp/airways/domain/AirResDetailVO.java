package com.booknow.travelapp.airways.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AirResDetailVO {
 
	 
	// test 주석추가
	//2023.06.27 세연 개인 VO만듬 10:51 이 VO는 테이블 3개만 합친 것입니다 (항공노선빼고) 
	
	//내역에 필요한 정보들이 테이블 여러개에 분산되어 있어서 수월하게(한꺼번에) 
	// 수집되도록 여러 테이블의 필드를 합쳐서 VO로 만들었습니다. 
	 
		//--> AIR_RESERVATIONS의 #{airResno}로 도출
	 
	
	//1) 3개테이블을 조인(예약자, 승객 좌석, 예약 정보) 
	
		//TBL_AIR_RESERVATIONS
			private long airResno;
			private int airRouteno;
			private String airlineId;
			private int airSellno;
			private String airClass;
			private String userId;
			private long totalprice;  //20230703 총가격 구하기위해 추가 
			
			//230628 세연 추가 
	
		//TBL_AIR_PASSENGERS
			private long airPasno;
		  //private long airResno; 중복
			private String airPasName;
			private String airPasGender;
			private Date airPasBdate;
			private String airPasNation;
			private int airDisCntRate;
		
		//TBL_AIR_RESERVATION_OPTION
		  //private long airResno; 중복
			private int optWheelFlag; //default 0 
			private int optPetFlag;   //default 0 
			private int optRugFlag;    //default 0 
		
	////2) (승객이 탄 비행기의 항공 노선테이블) 	: --> 이건 테이블 한개짜리라 굳이 여기에 있을 필요가 없어서 주석처리함 
			
//	//TBL_AIR_ROUTE(항공노선번호, 이거는 디테일 누르기 전에 title처럼 & 상세페이지에도 쓰이는 정보)
		//--> AIR_RESERVATIONS의 #{airRouteno}를알았을때 select 

		  //private long airRouteno;  //중복
		  //private String airlineId; //중복
			private String depAirportNm;//private String depAirportNm;
			private String arrAirportNm; //private String arrAirportNm;
			private Timestamp depPlandTime;//private Timestamp depPlandTime;
			private Timestamp arrPlandTime;//private Timestamp depPlandTime;
			private long economyCharge;
			private long prestigeCharge;
			private String vihicleId; //private String vehicleId;
			private int seatCnt ; 
			private String airModel;
			
			
			
			private Date airSellDate;
			private String airSellStatus;
			private String sellUuid ;
			private Long totalPrice ;
			

//		
			
			
	
}
