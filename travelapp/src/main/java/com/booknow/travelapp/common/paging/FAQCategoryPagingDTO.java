package com.booknow.travelapp.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class FAQCategoryPagingDTO {

	private long bno;
	private Integer pageNum;
	private int rowAmountPerPage;
	
	public FAQCategoryPagingDTO(long bno, Integer pageNum) {
		this.bno = bno;
		
		if(pageNum == null) {
			this.pageNum =1;
		}else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage=7;
	}
}
