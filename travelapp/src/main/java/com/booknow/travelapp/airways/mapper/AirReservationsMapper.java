package com.booknow.travelapp.airways.mapper;

import java.util.List;

import com.booknow.travelapp.airways.domain.AirPassengersVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteSellVO;
import com.booknow.travelapp.common.domain.TLUsers;


public interface AirReservationsMapper {
	
	//	230628 1246 동현 수정

	// 고객이 선택한 항공편 정보 조회
	public List<AirReservationsVO> selectChoicedFlight(long airRouteno);
	
	// 현재 로그인한 유저의 정보 조회
	public List<TLUsers> selectUserInfo(String userId); 

	// 최종 예약정보 확인 (결제페이지)
	public List<AirReservationsVO> selectFinalReservation(long airRouteno);
	
	// 판매번호등록
	public int insertSellInfo(AirRouteSellVO airRouteSellVO);
	
	// 예약번호등록
	public int insertResInfo(AirReservationsVO airReservationsVO);
	
	
	// 탑승객 정보 입력
	public int insertPassengerInfo(AirPassengersVO airPassengersVO);
		
}
