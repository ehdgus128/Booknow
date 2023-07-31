package com.booknow.travelapp.common.domain.paging;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AmFlightPurchasePagingDTO {
	//0704_박효준
    private Integer pageNum;
    private Integer rowAmountPerPage;
    private String scope="T";
    private String keyword;
    
	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("") ;
	}

    public AmFlightPurchasePagingDTO() {
        this.pageNum = 1;
        this.rowAmountPerPage = 10;
        this.keyword = "대한항공";

    }
    
    public AmFlightPurchasePagingDTO(Integer pageNum, Integer rowAmountPerPage,String keyword) {
    	
    	
    	if (pageNum == null || pageNum <= 0) {
			this.pageNum = 1 ;
			
		} else {
			this.pageNum = pageNum;	
			
		}
		
		if (rowAmountPerPage == null ) {
			this.rowAmountPerPage = 10 ;
			
		} else {
			this.rowAmountPerPage = rowAmountPerPage;	
			
		}
		
		if(keyword.equals("")) {
			this.keyword = "대한항공";
		} else {
			this.keyword = keyword;
		}
		
    
    }
}
