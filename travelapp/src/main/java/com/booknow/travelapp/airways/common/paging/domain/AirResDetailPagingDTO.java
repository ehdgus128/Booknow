package com.booknow.travelapp.airways.common.paging.domain;

 
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

//import java.util.Calendar;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class AirResDetailPagingDTO {
	
	//2023 06 27 세연 생성
	private Integer airResPageNum;
	private Integer airResPerPage;
	
	//테스트 list 검색기능 private String scope ; 
	
//	
//	
//	public AirResDetailPagingDTO() {
//			this.airResPageNum = 1;
//			this.airResPerPage = 5;
//		
//	} 
	

	
	//0710 추가
	
	private String scope ;
	private String keyword;

//	String dateTime = "2020-12-12 01:24:23";
//
//    Timestamp timestamp = Timestamp.valueOf(dateTime);
//	
	
	//0711 추가
	private String depPlandTime;
	private String  arrPlandTime;
	
	
	
	
	
	
	 
	

	public String[] getScopeArray() {
		return scope ==  null  ? new String[] {} : scope.split("");
		
		
	}
	///////////
	
	public AirResDetailPagingDTO(Integer airResPageNum, Integer airResPerPage, String  depPlandTime,String  arrPlandTime) {
		
		
		 // format 객체
        DateFormat tmpFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 달력 객체
        Calendar past = Calendar.getInstance();
        Calendar today = Calendar.getInstance();

        // DTO에서 일자가 null이거나 공백이면 오늘일자 set
        if (depPlandTime == null || depPlandTime.equals("")) {
     	   past.add(Calendar.DATE, -14); //20230718 수정 -7 -> -14
            this.depPlandTime= tmpFormat.format(past.getTime());
        }

        // DTO에서 일자가 null이거나 공백이면 내일 일자 set
        if (arrPlandTime == null || arrPlandTime.equals("")) {
            today.add(Calendar.DATE, +14); // 1 -> + 14 로 수정 
     	   this.arrPlandTime = tmpFormat.format(today.getTime());
        }

		
		
		
		
		
		if(airResPageNum == null || airResPageNum <= 0) {
			this.airResPageNum = 1;
			
		}else {
			
			this.airResPageNum = airResPageNum;
		}
		
		
		if(airResPerPage == null || airResPerPage < 1) {
			 
			this.airResPerPage= 5;
		}else {
			this.airResPerPage = airResPerPage ;
		}
		
		 
	 
 	
	
	
	
	
	}
	
}
