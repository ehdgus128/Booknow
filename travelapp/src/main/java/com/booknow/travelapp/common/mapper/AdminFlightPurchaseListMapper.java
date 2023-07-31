package com.booknow.travelapp.common.mapper;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;


//0712 박효준 항공 상품목록
public interface AdminFlightPurchaseListMapper {
	

//	구매한 상품 리스트	
	public List<AdminFlightPurchaseVO> selectAirRouteList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);

//	구매한 상품 갯수	
	public long selectAirRouteListTotal(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO);
	
//	항공노선수정	
	public long updateAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO);

//	노선구매수정
	public long updateAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO);
	
//	항공노선삭제
	public long deleteAirRoute(long airRouteno);
	
//	노선구매삭제
	public long deleteAirRouteBuy(long airRouteno);
	
}
