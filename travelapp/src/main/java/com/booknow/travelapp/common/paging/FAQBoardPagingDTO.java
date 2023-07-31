package com.booknow.travelapp.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode

public class FAQBoardPagingDTO {

	private int pageNum;
	private int rowAmountPerPage;
	
	public FAQBoardPagingDTO() {
		this.pageNum=1;
		this.rowAmountPerPage =5;
	}
	
	
	
	public FAQBoardPagingDTO(int pageNum) {
		if(pageNum <=0) {
			this.pageNum = 1;
		}else {
			this.pageNum=pageNum;
		}
		this.rowAmountPerPage=5;
	}




	
	
}
