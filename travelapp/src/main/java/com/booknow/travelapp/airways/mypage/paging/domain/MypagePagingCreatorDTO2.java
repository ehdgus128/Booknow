package com.booknow.travelapp.airways.mypage.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class MypagePagingCreatorDTO2 {
	
	
 	private MypagePagingDTO2 mypagePagingDTO;
 	
 	private int mypagePagingStart;
 	private int mypagePagingEnd;
 	private boolean mypageprev;
 	private boolean mypagenext;
	private long mypageRowTotal;
 	private int mypagePagingNumCnt;
 	private int mypagePagingLast;
 	
 
 	
 
 	
 	public MypagePagingCreatorDTO2(long mypageRowTotal, MypagePagingDTO2 mypagePagingDTO) {
 		
 		this.mypageRowTotal = mypageRowTotal ;
 		this.mypagePagingDTO = mypagePagingDTO ;
 		this.mypagePagingNumCnt = 5;
 	
 		
	//계산된 표시된 맨 오른쪽 페이징 번호
 	 //5 ok	
	 	this.mypagePagingEnd =  (int)Math.ceil((double)mypagePagingDTO.getMypagePageNum() /this.mypagePagingNumCnt) * this.mypagePagingNumCnt ;

 	 		
 		//계산된 표시된 맨 왼쪽 페이징 번호
 		this.mypagePagingStart = this.mypagePagingEnd - ( this.mypagePagingNumCnt -1);
 		
 		this.mypagePagingLast = (int)(Math.ceil(mypageRowTotal/ (double) mypagePagingDTO.getMypagePerPage() ) );
// 		System.out.println("Math.ceil(mypageRowTotal/mypageDetailPagingDTO.getMypagePerPage() * 1.0): " + Math.ceil(mypageRowTotal/mypageDetailPagingDTO.getMypagePerPage() * 1.0));
//		ㄴ> 원인 찾고 수정 끝
 		// 		System.out.println("우리 mypageRowTotal 값: " + mypageRowTotal); //rowTotal문제없임, 찐원인은 Math.ceil
// 		
// 		System.out.println("우리 last값: " + mypagePagingLast); // 원인 last값이 문제
 		  
 		if( this.mypagePagingLast < this.mypagePagingEnd) {
 			this.mypagePagingEnd = this.mypagePagingLast;
 		}
 		
 		
	 	System.out.println("우리 userAdmin에 대한 END값: " + this.mypagePagingEnd); //
 		
 		// <- 인덱스 활성화
 		this.mypageprev =   this.mypagePagingStart > 1  ;
 			
 		
 		// -> 인덱스 활성화
 		this.mypagenext = this.mypagePagingEnd < this.mypagePagingLast; 		
 		
 
 		
 	
 		
 	
 	
 	
 	}
 	
 	
 	
 	
 	
 	
	
	
	
	
	
	
}
