package com.booknow.travelapp.hotel.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// 작업자 정지은 호텔리스트 페이징처리 (rowbounds)
public class TLHotelListPageDTO {

    // 최소 페이지 번호
    private int min;
    
    // 최대 페이지 번호
    private int max;
    
    private boolean prev; // 이전 버튼 표시 유무
    private boolean next; // 다음 버튼 표시 유무
    
    // 전체 페이지 개수
    private int pageCnt;
    
    // 현재 페이지 번호
    private int currentPage;
    // 전체 게시글 수
    private int contentCnt;

    // contentCnt : 전체글 개수, currentPage : 현재 글 번호, contentPageCnt : 페이지당 글의 개수, paginationCnt : 페이지 버튼의 개수
    public TLHotelListPageDTO(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {

        // 현재 페이지 번호
        this.currentPage = currentPage;
        
        this.max = ((int) Math.ceil((currentPage*1.0)/paginationCnt)*paginationCnt);
        this.min = this.max - (paginationCnt - 1);
        
        // 전체 페이지 개수
        this.pageCnt = (int) Math.ceil((contentCnt*1.0)/contentPageCnt);

        if (this.pageCnt < this.max) {
        	this.max = this.pageCnt;
        }

        this.prev = this.min > 1;
        this.next = this.max < this.pageCnt;

        this.contentCnt = contentCnt;
    }
    
      
}


