package com.booknow.travelapp.common.paging;

import java.util.List;

import com.booknow.travelapp.domain.QnaBoardsVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QNAAnswerPagingCreatorDTO {

	private QNAAnswerPagingDTO qnaAnswerPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long AnswerTotalbyQno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<QnaBoardsVO> qnaAnswerList;

	public QNAAnswerPagingCreatorDTO(long AnswerTotalbyQno,
									 QNAAnswerPagingDTO qnaAnswerPaging,
									 List<QnaBoardsVO> qnaAnswerList) {
		this.qnaAnswerPaging=qnaAnswerPaging;
		this.AnswerTotalbyQno=AnswerTotalbyQno;
		this.qnaAnswerList=qnaAnswerList;
		this.pagingNumCnt = 5;
	
		this.endPagingNum =
				 (int)( Math.ceil(qnaAnswerPaging.getPageNum() / (this.pagingNumCnt * 1.0) ) ) * this.pagingNumCnt ;
	
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
		
		this.lastPageNum = (int)( Math.ceil( (AnswerTotalbyQno * 1.0) / qnaAnswerPaging.getRowAmountPerPage() ) );
		
		if (lastPageNum < this.endPagingNum) {
			 this.endPagingNum = lastPageNum ;
			 }

			 this.prev = this.startPagingNum > 1 ;
			 this.next = this.endPagingNum < lastPageNum ;
 
	}
	
}
