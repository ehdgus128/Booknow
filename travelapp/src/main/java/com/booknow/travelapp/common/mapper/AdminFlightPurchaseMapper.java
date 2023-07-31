package com.booknow.travelapp.common.mapper;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;

public interface AdminFlightPurchaseMapper {
// 0704박효준 생성	
	
//	구매한항공노선리스트
	public List<AdminFlightBuyRouteVO> airSelectRouteBuy(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);
	
//	구매한 항공노선 갯수	
	public long selectBuyRouteTotal();
	
//	특정 노선 정보
	public AdminFlightPurchaseVO selectRoute(long airRouteno);
	
//	항공노선등록  
	public Long insertAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO);
	
//	노선구매 테이블 입력
	public long insertAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO);

	
}
