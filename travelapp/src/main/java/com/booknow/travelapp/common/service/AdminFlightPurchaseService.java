package com.booknow.travelapp.common.service;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;

public interface AdminFlightPurchaseService {
	
// 구매한항공노선리스트
	public List<AdminFlightBuyRouteVO> getAirRouteBuyList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);
	
//	구매한 항공노선 갯수	
	public long getBuyRouteTotal();
	
//	특정 노선 정보
	public AdminFlightPurchaseVO getRoute(long airRouteno);

//	항공노선등록
	public Long registerAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO);
	
//	노선구매 테이블 입력	
	public long registerAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO);

	
}
