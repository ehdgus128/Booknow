package com.booknow.travelapp.common.domain.paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class AmBoardPagingDTO {

    // paging
    private Integer pageNum;
    private Integer rowAmountPerPage;
    
    @Autowired
    public AmBoardPagingDTO(Integer pageNum, Integer rowAmountPerPage) {    
        if (pageNum == null || pageNum <= 0) {
            pageNum = 1;
        }
        if (rowAmountPerPage == null || rowAmountPerPage <= 0) {
        	rowAmountPerPage = 5;
		}

        this.pageNum = pageNum;
        this.rowAmountPerPage = rowAmountPerPage;
    }
    

    public String addPagingParmsToURI() {
        
        UriComponentsBuilder uriBuilder = UriComponentsBuilder
        .fromPath("")
        .queryParam("pageNum", this.pageNum)
        .queryParam("rowAmountPerPage", this.rowAmountPerPage);
        
        return uriBuilder.toUriString();
    }
}
