package com.booknow.travelapp.common.paging;

import java.util.List;

import com.booknow.travelapp.domain.FAQCategoryVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class FAQCategoryPagingCreatorDTO {

	private FAQCategoryPagingDTO faqCategoryPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long categoryTotalByBno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<FAQCategoryVO> categoryList;
	
	public FAQCategoryPagingCreatorDTO(long categoryTotalByBno,
						FAQCategoryPagingDTO faqCategoryPaging,
						List<FAQCategoryVO> categoryList) {
		//계산된 끝,시작 페이징
		this.endPagingNum=
				(int)(Math.ceil(faqCategoryPaging.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
		this.startPagingNum = this.endPagingNum-(this.pagingNumCnt-1);
		
		this.lastPageNum = (int)(Math.ceil((categoryTotalByBno*1.0)/faqCategoryPaging.getRowAmountPerPage()));
		
		if(lastPageNum<this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		
		}
	
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum ;
	}



}
