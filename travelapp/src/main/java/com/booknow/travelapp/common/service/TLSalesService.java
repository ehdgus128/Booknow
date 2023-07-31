package com.booknow.travelapp.common.service;

import com.booknow.travelapp.common.domain.TLSalesListDTO;
import com.booknow.travelapp.common.domain.TLSalesVO;

public interface TLSalesService {

	//230705 0031 동현 작성
	
    // 한달 단위 항공/호텔 매출순이익 조회
    public TLSalesListDTO getMonthlySales(TLSalesVO selectedYear);
    
}
