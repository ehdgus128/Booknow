package com.booknow.travelapp.common.domain.paging;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class AmFlightPurchasePagingCreateDTO {
	//0704_박효준
	private AmFlightPurchasePagingDTO amFlightPurchasePagingDTO;
	private int startPagingNum ;
	private int endPagingNum ;
	private boolean prev ;
	private boolean next ;
	private long rowTotal ;
	private int pagingNumCnt ;
	private int lastPageNum ;
	
	public AmFlightPurchasePagingCreateDTO(long rowTotal, AmFlightPurchasePagingDTO amFlightPurchasePagingDTO) {
				
		this.amFlightPurchasePagingDTO = amFlightPurchasePagingDTO ;
		this.rowTotal = rowTotal ;
		this.pagingNumCnt = 10 ;
		
		//계산된 끝 페이징 번호:
this.endPagingNum = (int) Math.ceil((double) amFlightPurchasePagingDTO.getPageNum() / this.pagingNumCnt ) * this.pagingNumCnt ;
		
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1) ;	
		
		//총 페이지 수 = 맨 마지막 페이지번호
		this.lastPageNum = (int) Math.ceil( (this.rowTotal * 1.0) /this.amFlightPurchasePagingDTO.getRowAmountPerPage()) ;
		
		//맨 마지막 페이지번호를 endPagingNum에 대입
		if(this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum ;
		}
		
		//이전 버튼 표시(true) 여부
		this.prev = this.startPagingNum > 1 ;
		
		//다음 버튼 표시(true) 여부
		this.next = this.endPagingNum < this.lastPageNum ;
		
		
		System.out.println("전달된 페이징 기본데이터-amFlightPurchaseDTO: " + this.amFlightPurchasePagingDTO.toString());
		System.out.println("시작 페이징번호: " + this.startPagingNum);
		System.out.println("끝 페이징번호: " + this.endPagingNum);
		System.out.println("이전버튼 표시 여부: " + this.prev);
		System.out.println("다음버튼 표시 여부: " + this.next);
		System.out.println("마지막 페이지 번호: " + this.lastPageNum);
		System.out.println(pagingNumCnt);
		
				
	}

}
