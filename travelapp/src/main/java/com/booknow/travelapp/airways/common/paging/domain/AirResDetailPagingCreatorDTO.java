package com.booknow.travelapp.airways.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class AirResDetailPagingCreatorDTO {
	
	//2023 06 27 세연 생성
	
 	private AirResDetailPagingDTO airResDetailPagingDTO;
 	
 	private int airResPagingStart;
 	private int airResPagingEnd;
 	private boolean airResprev;
 	private boolean airResnext;
	private long airResRowTotal;
 	private int airResPagingNumCnt;
 	private int airResPagingLast;
 
 	
 
 	
 	public AirResDetailPagingCreatorDTO(long airResRowTotal, AirResDetailPagingDTO airResDetailPagingDTO) {
 		
 		this.airResRowTotal = airResRowTotal ;
 		this.airResDetailPagingDTO = airResDetailPagingDTO ;
 		this.airResPagingNumCnt = 5;
 	
 		
	//계산된 표시된 맨 오른쪽 페이징 번호
 	 //5 ok	
	 	this.airResPagingEnd =  (int)Math.ceil((double)airResDetailPagingDTO.getAirResPageNum() /this.airResPagingNumCnt) * this.airResPagingNumCnt ;

 	 		
 		//계산된 표시된 맨 왼쪽 페이징 번호
 		this.airResPagingStart = this.airResPagingEnd - ( this.airResPagingNumCnt -1);
 		
 		this.airResPagingLast = (int)(Math.ceil(airResRowTotal/ (double) airResDetailPagingDTO.getAirResPerPage() ) );
// 		System.out.println("Math.ceil(airResRowTotal/airResDetailPagingDTO.getAirResPerPage() * 1.0): " + Math.ceil(airResRowTotal/airResDetailPagingDTO.getAirResPerPage() * 1.0));
//		ㄴ> 원인 찾고 수정 끝
 		// 		System.out.println("우리 airResRowTotal 값: " + airResRowTotal); //rowTotal문제없임, 찐원인은 Math.ceil
// 		
// 		System.out.println("우리 last값: " + airResPagingLast); // 원인 last값이 문제
 		  
 		if( this.airResPagingLast < this.airResPagingEnd) {
 			this.airResPagingEnd = this.airResPagingLast;
 		}
 		
 		
	 	System.out.println("우리 userAdmin에 대한 END값: " + this.airResPagingEnd); //
 		
 		// <- 인덱스 활성화
 		this.airResprev =   this.airResPagingStart > 1  ;
 			
 		
 		// -> 인덱스 활성화
 		this.airResnext = this.airResPagingEnd < this.airResPagingLast; 		
 		
 
 		
 		
 		
 	
 		
 	
 	
 	
 	}
 	
 	
 	
 	
 	
 	
	
	
	
	
	
	
}
