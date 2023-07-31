package com.booknow.travelapp.airways.service;

import java.util.List;

import com.booknow.travelapp.airways.domain.AirResDetailVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.common.paging.domain.AirResDetailPagingDTO;

public interface AirResDetailService {
	
	//230627 세연 작성
	
	
	
	//0 테이블 4개 예약번호 편도 + 왕복)
	public List<AirResDetailVO> getAirResDetail(long airReno);
	 
	
	//1테이블 4개 예약번호 + 노선 (왕복)//추가예정
	public List<AirResDetailVO> getAirResDetail(long airResno, long airRouteno) ;
	
	
	
	//2 예약 1건에 대한 기본적인 AirRouteVO를 불러옴
	public List<AirRouteVO> getAirResPerRoute(long airResno);
	  
	
	
	//3 예매 번호 당 총 승객 수
	public int getAirResPerSeat(long airResno, long airRouteno);

	
	//4 userId 별 예약리스트 
	public List<AirReservationsVO> getAirReservations(String userId, AirResDetailPagingDTO airResDetailPagingDTO);

	//5 rowTotal
	public long getAirResRowTotal(String userId, AirResDetailPagingDTO airResDetailPagingDTO);
	
	
	///
	//6  8시 51분 추가
	public long getAirResPeopleCnt(long airResno);
	
	// 총 가격
	public long getAirTotalprice(long airResno);
	
	
	public long notNullRes(String userId);
	
	public String getUUId(String userId, long airResno);
}
