package com.booknow.travelapp.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class QNAAnswerPagingDTO {
	
	private long qnaQno;
	private Integer pageNum;
	private int rowAmountPerPage;
	
	public QNAAnswerPagingDTO(long qnaQno,Integer pageNum) {
		this.qnaQno=qnaQno;
		
		if(pageNum == null) {
			this.pageNum = 1;
			
		}else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage =5;
	}
}
