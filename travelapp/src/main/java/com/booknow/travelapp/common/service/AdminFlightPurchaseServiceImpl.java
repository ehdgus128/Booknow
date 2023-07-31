package com.booknow.travelapp.common.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;
import com.booknow.travelapp.common.mapper.AdminFlightPurchaseMapper;

@Primary
@Service
public class AdminFlightPurchaseServiceImpl implements AdminFlightPurchaseService{
	
	private AdminFlightPurchaseMapper adminFlightPurchaseMapper;
	
	public AdminFlightPurchaseServiceImpl(AdminFlightPurchaseMapper adminFlightPurchaseMapper) {
		
		this.adminFlightPurchaseMapper = adminFlightPurchaseMapper;
		
	}
	
//	구매한 항공노선 갯수	
	@Override
	public long getBuyRouteTotal() {
		return adminFlightPurchaseMapper.selectBuyRouteTotal();
	}
	
	// 구매한항공노선리스트
	@Override
	public List<AdminFlightBuyRouteVO> getAirRouteBuyList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO) {
		
		return adminFlightPurchaseMapper.airSelectRouteBuy(amFlightPurchasePagingDTO);
	}

//	특정 노선 정보
	@Override
	public AdminFlightPurchaseVO getRoute(long airRouteno) {
		
		return adminFlightPurchaseMapper.selectRoute(airRouteno);
		
	}
  
//	항공노선등록
	@Override
	public Long registerAirRoute(AdminFlightPurchaseVO adminFlightPurchaseVO) {
		
		adminFlightPurchaseMapper.insertAirRoute(adminFlightPurchaseVO);
		
		return adminFlightPurchaseVO.getAirRouteno();
	}
	
//	노선구매 테이블 입력	
	@Override
	public long registerAirRouteBuy(AdminFlightBuyRouteVO adminFlightBuyRouteVO) {
		
		adminFlightPurchaseMapper.insertAirRouteBuy(adminFlightBuyRouteVO);
		
		return adminFlightBuyRouteVO.getAirRouteno();
	}



	

}
