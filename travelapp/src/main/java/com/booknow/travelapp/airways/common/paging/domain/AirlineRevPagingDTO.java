package com.booknow.travelapp.airways.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AirlineRevPagingDTO {
    private int pageNum;
    private int rowAmountPerPage;
    private String scope;
    private String keyword; //키워드
    private String airlineId ;
    
     public String[] getScopeArray() {
        return scope == null ? new String[]{} : scope.split("");
    }
    public AirlineRevPagingDTO() {
        this.pageNum = 1;
        this.rowAmountPerPage = 5;
    }

    public AirlineRevPagingDTO(Integer pageNum, Integer rowAmountPerPage) {
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
