package com.booknow.travelapp.common.domain.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QNAAnswerPagingDTO {
    private int pageNum;
    private int rowAmountPerPage;
    private String scope;
    private String keyword; //키워드
    
     public String[] getScopeArray() {
        return scope == null ? new String[]{} : scope.split("");
    }
    public QNAAnswerPagingDTO() {
        this.pageNum = 1;
        this.rowAmountPerPage = 4;
    }

    public QNAAnswerPagingDTO(Integer pageNum, Integer rowAmountPerPage) {
        if (pageNum == null || pageNum <= 0) {
            this.pageNum = 1;
        } else {
            this.pageNum = pageNum;
        }

        if (rowAmountPerPage == null) {
            this.rowAmountPerPage = 10;
        } else {
            this.rowAmountPerPage = rowAmountPerPage;
        }
    }
    
    
}
