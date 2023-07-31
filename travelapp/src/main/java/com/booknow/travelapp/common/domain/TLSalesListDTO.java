package com.booknow.travelapp.common.domain;

import java.util.HashMap;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
@NoArgsConstructor
public class TLSalesListDTO {

	
	private List<HashMap<String, Object>> airSalesList ;
	private List<HashMap<String, Object>> htSalesList ;
	
	public TLSalesListDTO(List<HashMap<String, Object>> airSalesList, List<HashMap<String, Object>> htSalesList) {
		
		this.airSalesList = airSalesList;
		this.htSalesList = htSalesList;
	}
	
}
