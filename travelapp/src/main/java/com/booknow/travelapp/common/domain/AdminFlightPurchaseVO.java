package com.booknow.travelapp.common.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AdminFlightPurchaseVO {
	
		private long airRouteno;
		private String airLineId;
		private String depAirportnm;
		private String arrAirportnm;
		@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
		private Date depPlandTime;
		@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
		private Date arrPlandTime;
		private Long economyCharge;
		private Long prestigeCharge;
		private String vihicleId;
		private String buyflag = "0";	
		private String airLinenm;
		private long eSeatCnt;
		private long pSeatCnt;
		
		public long geteSeatCnt() {
			return eSeatCnt;
		}
		public void seteSeatCnt(long eSeatCnt) {
			this.eSeatCnt = eSeatCnt;
		}
		public long getpSeatCnt() {
			return pSeatCnt;
		}
		public void setpSeatCnt(long pSeatCnt) {
			this.pSeatCnt = pSeatCnt;
		}
		
		
	

		
		
		
		
		
		
	}
