package com.booknow.travelapp.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QNAQuestionPagingCreatorDTO {

	private QNAQuestionPagingDTO qnaQuestionPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	public QNAQuestionPagingCreatorDTO(long rowAmountTotal, QNAQuestionPagingDTO qnaQuestionPagingDTO) {
		this.qnaQuestionPagingDTO = qnaQuestionPagingDTO;
		this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 2;
		
		//끝-시작 페이징 계산식
		this.endPagingNum=
			(int)(Math.ceil(qnaQuestionPagingDTO.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
		this.startPagingNum = this.endPagingNum -(this.pagingNumCnt-1);
		
		//마지막 페이지 번호 저장
		this.lastPageNum = (int)(Math.ceil((rowAmountTotal * 1.0)/qnaQuestionPagingDTO.getRowAmountPerPage()));
		
		//계산된 페이징 번호가 진짜마지막페이지 번호보다 크면, lastPageNum으로 대체
		if (lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		this.prev = this.startPagingNum>1;
		this.next = this.endPagingNum<lastPageNum;
	}
	
	
	
}
