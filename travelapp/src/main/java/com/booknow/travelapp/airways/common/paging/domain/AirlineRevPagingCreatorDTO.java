package com.booknow.travelapp.airways.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AirlineRevPagingCreatorDTO {
    private AirlineRevPagingDTO airlineRevPaging;
    private int startPagingNum;
    private int endPagingNum;
    private boolean prev;
    private boolean next;
    private long rowTotal;
    private int pagingNumCnt;
    private int lastPageNum;
//    private String keyword;
//    private String airlineId;
    
    
    public AirlineRevPagingCreatorDTO(long rowTotal, AirlineRevPagingDTO airlineRevPaging) {
        this.airlineRevPaging = airlineRevPaging;
        this.rowTotal = rowTotal;
        this.pagingNumCnt = 5;
        
        this.endPagingNum = (int) Math.ceil((double) airlineRevPaging.getPageNum() / this.pagingNumCnt) * this.pagingNumCnt;
        this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
        
        this.lastPageNum = (int) Math.ceil((this.rowTotal * 1.0) / this.airlineRevPaging.getRowAmountPerPage());
        
        if (this.lastPageNum < this.endPagingNum) {
            this.endPagingNum = this.lastPageNum;
        }
        
        this.prev = this.startPagingNum > 1;
        this.next = this.endPagingNum < this.lastPageNum;
        
//        this.keyword = airlineRevPaging.getKeyword();
//    	System.out.println("검색어: " + this.keyword);
    }
    
}
