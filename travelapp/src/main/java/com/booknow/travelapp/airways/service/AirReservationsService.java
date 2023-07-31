package com.booknow.travelapp.airways.service;

import java.util.HashMap;
import java.util.List;

import com.booknow.travelapp.airways.domain.AirPassengersListDTO;
import com.booknow.travelapp.airways.domain.AirPassengersVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteSellVO;
import com.booknow.travelapp.common.domain.TLUsers;

//230628 1254 동현 수정
public interface AirReservationsService {
	
	// 고객이 선택한 항공편 정보 조회
	public List<AirReservationsVO> getAirReservationsInfo(long airRouteno) ;
	
	// 예약자 정보 조회
	public List<TLUsers> getUserInfo(String userId) ;
		
	// 최종 예약정보 확인 (결제페이지)
	public List<AirReservationsVO> getFinalReservationInfo(long airRouteno) ;
	
	// 판매테이블 추가
	public int registerSellInfo(AirRouteSellVO airRouteSellVO) ;
	
	// 예약테이블 추가
	public int registerResInfo(AirReservationsVO airReservationsVO) ;
	
	// 탑승객 정보 입력
	public int registerPassengerInfo(AirPassengersVO airPassengers) ;
	
	// 선택한 노선의 이코노미 잔여좌석 수 조회
	public long getSpareESeat(long airRouteno) ;
	
	// 선택한 노선의 prestige 잔여좌석 수 조회
	public long getSparePSeat(long airRouteno) ;
	
	// 탑승객 수 조회
	public long selectPasCnt(long airResno);
	
	// 결제완료 시 이코노미 잔여좌석수가 탑승자 수만큼 감소
	public int updateESeat(HashMap<String, Object> airMap);
	
	// 결제완료 시 prestige 잔여좌석수가 탑승자 수만큼 감소
	public int updatePSeat(HashMap<String, Object> airMap);
	
	// 결제완료 시 판매상태 update
	public int updateStatus(String sellUuid);
	
	// 결제완료 시 예약테이블 airSellno update
	public int updateRes(HashMap<String, Object> resMap);
	
	// 결제 시작 전 판매테이블/예약테이블/탑승객테이블 insert
	public AirPassengersListDTO prePayment(AirPassengersListDTO airPass);
	
	// 결제 성공 후 잔여좌석 select / 잔여좌석 - 인원수 update / 판매상태 update / 예약테이블 airsellno update
	public void afterPayment(AirPassengersListDTO airPass);
	
	// 결제 완료 후 고객이 취소 시 판매상태 '판매취소' update / route테이블 잔여좌석 + update 
	public void cancelPayment(AirPassengersListDTO airPass);
	
	
}
