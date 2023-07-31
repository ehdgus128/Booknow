package com.booknow.travelapp.common.domain.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString    
public class  QNAAnswerPagingCreatorDTO {
    private QNAAnswerPagingDTO qnaAnswerPaging;
    private int startPagingNum;
    private int endPagingNum;
    private boolean prev;
    private boolean next;
    private long rowTotal;
    private int pagingNumCnt;
    private int lastPageNum;
//    private String keyword;
//    private String airlineId;
    
    
    public QNAAnswerPagingCreatorDTO(long rowTotal, QNAAnswerPagingDTO  qnaAnswerPaging) {
        this.qnaAnswerPaging = qnaAnswerPaging;
        this.rowTotal = rowTotal;
        this.pagingNumCnt =4 ;
        
        this.endPagingNum = (int) Math.ceil((double) qnaAnswerPaging.getPageNum() / this.pagingNumCnt) * this.pagingNumCnt;
        this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
        
        this.lastPageNum = (int) Math.ceil((this.rowTotal * 1.0) / this.qnaAnswerPaging.getRowAmountPerPage());
        
        if (this.lastPageNum < this.endPagingNum) {
            this.endPagingNum = this.lastPageNum;
        }
        
        this.prev = this.startPagingNum > 1;
        this.next = this.endPagingNum < this.lastPageNum;
        
    	System.out.println("airwaysPaging: " + this.qnaAnswerPaging.toString());
		System.out.println("endPagingNum: " + this.endPagingNum);
		System.out.println("startPagingNum: " + this.startPagingNum);
		System.out.println("prev: " + this.prev);
		System.out.println("next: " + this.next);
		System.out.println("lastPageNum: " + this.lastPageNum);
//        this.keyword = airlineRevPaging.getKeyword();
//    	System.out.println("검색어: " + this.keyword);
    }
    
}
