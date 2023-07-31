package com.booknow.travelapp.airways.mypage.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypagePagingDTO {
	
	private int mypagePageNum;
	private int mypagePerPage;
	
	private String scope ;   //검색범위(scope - T:btitle, C:bcontent, W:bwriter)
	private String keyword ; //검색어
	
	
	
	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("") ;
	}
	
	
	public MypagePagingDTO() {
		this.mypagePageNum = 1 ;
		this.mypagePerPage = 10 ;
	}
	
	
	//테스트 list 검색기능 private String scope ; 
	
//	
 
	
	public MypagePagingDTO(Integer mypagePageNum, Integer mypagePerPage) {
		
		if(mypagePageNum == null || mypagePageNum <= 0) {
			this.mypagePageNum = 1;
			
		}else {
			
			this.mypagePageNum = mypagePageNum;
		}
		
		
		if(mypagePerPage == null || mypagePerPage < 1) {
			 
			this.mypagePerPage= 10;
		}else {
			this.mypagePerPage = mypagePerPage ;
		}
		
	 
 	
	
	
	
	
	}
	
}
