package com.booknow.travelapp.common.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;
import com.booknow.travelapp.common.mapper.AdminFlightPurchaseListMapper;

@Primary
@Service
public class AdminFlightPurchaseListServiceImpl implements AdminFlightPurchaseListService{
	
private AdminFlightPurchaseListMapper adminFlightPurchaseListMapper;
	
	public AdminFlightPurchaseListServiceImpl(AdminFlightPurchaseListMapper adminFlightPurchaseListMapper) {
		
		this.adminFlightPurchaseListMapper = adminFlightPurchaseListMapper;
		
	}
	
// 구매한상품리스트
	@Override
	public List<AdminFlightPurchaseVO> getAirRouteList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO) {
		
		return adminFlightPurchaseListMapper.selectAirRouteList(amFlightPurchasePagingDTO);
	}
	
//	구매한 상품 갯수
	@Override
	public long getAirRouteListTotal(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO) {
		
		return adminFlightPurchaseListMapper.selectAirRouteListTotal(amFlightPurchasePagingDTO);
	}
	
//	항공노선 테이블 수정 
	@Override
	public boolean modifyAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO) {
		
		return adminFlightPurchaseListMapper.updateAirRoute(adminFlightPurchaseVO) == 1L;
	}

//	노선구매 테이블 수정	
	@Override
	public boolean modifyAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO) {
		
		return adminFlightPurchaseListMapper.updateAirRouteBuy(adminFlightBuyRouteVO) == 1L;
	}
	
	
//	항공노선삭제
	@Override
	public boolean removeAirRoute(long airRouteno) {
		return adminFlightPurchaseListMapper.deleteAirRoute(airRouteno) == 1L;
	}
	
//	노선구매삭제
	@Override
	
	public boolean removeAirRouteBuy(long airRouteno) {
		
		return adminFlightPurchaseListMapper.deleteAirRouteBuy(airRouteno) == 1L;
	}

}
