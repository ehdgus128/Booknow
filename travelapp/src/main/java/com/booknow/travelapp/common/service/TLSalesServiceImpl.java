package com.booknow.travelapp.common.service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.domain.TLSalesListDTO;
import com.booknow.travelapp.common.domain.TLSalesVO;
import com.booknow.travelapp.common.mapper.TLSalesMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Primary
@Service
public class TLSalesServiceImpl implements TLSalesService{
    
	//230705 0034 동현 작성
	
    private TLSalesMapper salesMapper;
    
    // 한달 단위 항공/호텔 매출순이익 조회
    public TLSalesListDTO getMonthlySales(TLSalesVO selectedYear) {

    
    	List<HashMap<String, Object>> airSalesList = salesMapper.selectAirMonthlySales(selectedYear);
    	List<HashMap<String, Object>> htSalesList = salesMapper.selectHtMonthlySales(selectedYear);
    	

    	// 항공 매출 없는 달 0 처리
    	for (int i = 0; i <= 11; i++) {
    		
    		//선택한 연도의 1~12월을 형식에 맞게 month에 저장(ex. 1월 = 01, 12월 = 12)
    		String month = selectedYear.getSelectedYear()
    					   + "/" + String.format("%02d", (i + 1));
    		
    	    boolean found = false;
    	    
    	    //airSalesList 전체를 돌면서
    	    //airSales.get("MONTH") 와 일치하는 month가 있는지 체크
    	    for (HashMap<String, Object> airSales : airSalesList) {
    	        
    	    	
    	        if (airSales.get("MONTH").equals(month)) {
    	            found = true;
    	            break;
    	        }
    	    }
    	    
    	    //일치하는 airSales.get("MONTH")가 없으면
    	    //mapReceiver에 month 값과 0을 담아서 add
    	    if (!found) {
    	    	
    	        HashMap<String, Object> mapReceiver = new HashMap<String, Object>();
    	        
    	        mapReceiver.put("MONTH", month);
    	        mapReceiver.put("MONTHLYSALES", 0);
    	        
    	        airSalesList.add(mapReceiver);
    	    }
    	}

    	// 호텔 매출 없는 달 0 처리
    	for (int i = 0; i <= 11; i++) {
    		
    		String month = selectedYear.getSelectedYear() 
    					   + "/" + String.format("%02d", (i + 1));
    		
    	    boolean found = false;
    	    
    	    for (HashMap<String, Object> htSales : htSalesList) {
    	        if (htSales.get("MONTH").equals(month)) {
    	            found = true;
    	            break;
    	        }
    	    }
    	    
    	    if (!found) {
    	    	
    	        HashMap<String, Object> mapReceiver = new HashMap<String, Object>();
    	        
    	        mapReceiver.put("MONTH", month);
    	        mapReceiver.put("MONTHLYSALES", 0);
    	        htSalesList.add(mapReceiver);
    	        
    	    }
    	}
    	
    	
    	// 항공 매출 리스트 정렬                    
    	// o -> (String) : {MONTH=2023/01, MONTHLYSALES=158568}
    	// o.get("MONTH") : 2023/01
    	airSalesList.sort(Comparator.comparing(o -> (String) o.get("MONTH")));

    	// 호텔 매출 리스트 정렬
    	htSalesList.sort(Comparator.comparing(o -> (String) o.get("MONTH")));
    	
    	TLSalesListDTO listDTO = new TLSalesListDTO(airSalesList, htSalesList) ;
    	
    	return listDTO ;
    }
    
    

    

}
