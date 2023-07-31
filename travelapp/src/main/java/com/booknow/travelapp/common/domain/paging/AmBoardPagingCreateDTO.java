package com.booknow.travelapp.common.domain.paging;

import lombok.Getter;

@Getter
public class AmBoardPagingCreateDTO {
    private AmBoardPagingDTO amBoardPaging; //
    private int startPagingNum; // 
    private int endPagingNum; // 화면에 표시 되는 마지막 페이지 번호
    private boolean prev; // 이전 버튼 표시 유무
    private boolean next; // 다음 버튼 표시 유무
    private long rowTotal; // 전체 행 개수
    private int pagingNumCnt; // 페이지 번호 버튼 갯수 (사용자에 의해서 정해지는 값)
    private int lastPageNum; // 실제 마지막 페이지 번호

    public AmBoardPagingCreateDTO(AmBoardPagingDTO amBoardPaging, long rowTotal) {
        this.amBoardPaging = amBoardPaging;
        this.rowTotal = rowTotal;
        
        // 화면에 표시할 페이지 번호 버튼 갯수
        this.pagingNumCnt = 3;

        // 현재 페이지 번호를 기준으로 표시할 페이지 번호를 시작과 끝을 계산
        this.endPagingNum = (int) Math.ceil((this.amBoardPaging.getPageNum()*1.0)/this.pagingNumCnt)*this.pagingNumCnt;
        this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);

        // 실제 total last 페이지 번호
        this.lastPageNum = (int) Math.ceil((this.rowTotal*1.0)/this.amBoardPaging.getRowAmountPerPage());

        if (this.lastPageNum < this.endPagingNum) {
            this.endPagingNum = this.lastPageNum;
        }

        this.prev = this.startPagingNum > 1;
        this.next = this.endPagingNum < this.lastPageNum;
    }

}
