package com.booknow.travelapp.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class QNAQuestionPagingDTO {

	private int pageNum;
	private int rowAmountPerPage;
	private String qnaQwriter;
	// userid 
	
	public QNAQuestionPagingDTO() {
		this.pageNum=1;
		this.rowAmountPerPage =5;
	}
	
	
	
	public QNAQuestionPagingDTO(int pageNum, String qnaQwriter) {
		
		if(pageNum <=0) {
			this.pageNum = 1;
		}else {
			this.pageNum=pageNum;
		}
		this.rowAmountPerPage=5;
		
		this.qnaQwriter = qnaQwriter;
		
	}
}
