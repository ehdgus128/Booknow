package com.booknow.travelapp.common.service;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;

//0712 박효준 항공 상품목록
public interface AdminFlightPurchaseListService {
	
// 구매한상품리스트
	public List<AdminFlightPurchaseVO> getAirRouteList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);
	
//	구매한 상품 갯수	
	public long getAirRouteListTotal(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);
	
//	항공노선수정	
	public boolean modifyAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO);
	
//	노선구매수정	
	public boolean modifyAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO);
	
//	항공노선삭제
	public boolean removeAirRoute(long airRouteno);
	
//	노선구매삭제
	public boolean removeAirRouteBuy(long airRouteno);
	

	
}
