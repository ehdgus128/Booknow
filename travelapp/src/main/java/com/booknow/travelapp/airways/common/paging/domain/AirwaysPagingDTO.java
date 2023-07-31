package com.booknow.travelapp.airways.common.paging.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
// 230701 임지혁: list 페이지 페이지네이션
public class AirwaysPagingDTO {
	private int pageNum;
	private int numOfRows;
	private String depAirportNmStr;
	private String arrAirportNmStr;
	private String depPlandTimeStr;
	private String depMin;
	private String depMax;
	private String boundFlag;
	private String total;
	private String seatFlag;
	private String sortFlag;
	private String[] airlineIdArr;
	
	
	public AirwaysPagingDTO(Integer pageNum, String depAirportNmStr, String arrAirportNmStr, 
							String depPlandTimeStr, String depMin, String depMax, 
							String boundFlag, String total, String seatFlag, String sortFlag, String[] airlineIdArr) {
		
		if (pageNum == null || pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		
		this.numOfRows = 5;
		
		this.depAirportNmStr = depAirportNmStr;
		this.arrAirportNmStr = arrAirportNmStr;
		
		if (depPlandTimeStr == null || depPlandTimeStr.length() == 0 ) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			this.depPlandTimeStr = sdf.format(new Date());
			System.out.println("depPlandTimeStr 기본값 생성됨: " + this.depPlandTimeStr);
			
		} else {
			
			this.depPlandTimeStr = depPlandTimeStr;
			System.out.println("depPlandTimeStr: " + this.depPlandTimeStr);
			
		}
		
		if (depMin == null || depMin.length() == 0) {
			this.depMin = "06";
		} else {
			this.depMin = depMin;
		}
		
		if (depMax == null || depMax.length() == 0) {
			this.depMax = "23";
		} else {
			this.depMax = depMax;
		}
		
		this.boundFlag = boundFlag;
		this.total = total;
		this.seatFlag = seatFlag;

		if (sortFlag == null || sortFlag.length() == 0) {
			this.sortFlag = "earlier";
		} else {
			this.sortFlag = sortFlag;
		}
		
		if (airlineIdArr == null || airlineIdArr.length == 0) {
			this.airlineIdArr = new String[] {};
		} else {
			this.airlineIdArr = airlineIdArr;
		}
	}	

}
