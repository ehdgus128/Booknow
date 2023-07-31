package com.booknow.travelapp.common.mapper;

import java.util.HashMap;
import java.util.List;

import com.booknow.travelapp.common.domain.TLSalesVO;

public interface TLSalesMapper {

	//230705 0021 동현 작성

    // 한달 단위 항공 매출순이익 조회
    public List<HashMap<String, Object>> selectAirMonthlySales(TLSalesVO selectedYear);
    

    // 한달 단위 호텔 매출순이익 조회
    public List<HashMap<String, Object>> selectHtMonthlySales(TLSalesVO selectedYear);
}
