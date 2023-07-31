package com.booknow.travelapp.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class FAQBoardPagingCreatorDTO {

	private FAQBoardPagingDTO faqBoardPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	public FAQBoardPagingCreatorDTO(long rowAmountTotal, FAQBoardPagingDTO faqBoardPagingDTO) {
	
		this.faqBoardPagingDTO = faqBoardPagingDTO;
		this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 5;
		
		this.endPagingNum=
			(int)(Math.ceil(faqBoardPagingDTO.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
	
		this.startPagingNum=this.endPagingNum-(this.pagingNumCnt-1);
		
		this.lastPageNum=(int)(Math.ceil((rowAmountTotal*1.0)/faqBoardPagingDTO.getRowAmountPerPage()));
	
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum ;
	}
}
