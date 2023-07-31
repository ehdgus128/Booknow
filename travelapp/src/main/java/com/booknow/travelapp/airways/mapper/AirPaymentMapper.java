package com.booknow.travelapp.airways.mapper;

import java.util.HashMap;
import java.util.List;

public interface AirPaymentMapper {
	
	//	230711 1809 동현 수정

	// 선택한 노선의 이코노미 잔여좌석 수 조회
	public long selectSpareESeat(long airRouteno);

	// 선택한 노선의 prestige 잔여좌석 수 조회
	public long selectSparePSeat(long airRouteno);

	// 탑승객 수 조회
	public long selectPasCnt(long airResno);
	
	// 결제완료 시 이코노미 잔여좌석수가 탑승자 수만큼 감소
	public int updateESeatCnt(HashMap<String, Object> airMap);
	
	// 결제완료 시 prestige 잔여좌석수가 탑승자 수만큼 감소
	public int updatePSeatCnt(HashMap<String, Object> airMap);
	
	// 결제완료 시 판매상태 update
	public int updateSellStatus(String sellUuid);
	
	// 결제완료 시 판매일시 update
	public int updateSellDate(String sellUuid);
	
	// 결제완료 시 예약테이블 airSellno update
	public int updateResTable(HashMap<String, Object> resMap);
	
	// 결제취소 시 판매상태 = '결제취소' update
	public int updateSellCancel(String sellUuid);
	
	// 결제완료 시 이코노미 잔여좌석수가 탑승자 수만큼 감소
	public int updateESeatCntPlus(HashMap<String, Object> airMap);
	
	// 결제완료 시 prestige 잔여좌석수가 탑승자 수만큼 감소
	public int updatePSeatCntPlus(HashMap<String, Object> airMap);
	
	// 결제도중 취소한 판매건의 탑승객 테이블 삭제
	public void deletePasTable();
	
	// 결제도중 취소한 판매건의 예약 테이블 삭제
	public void deleteResTable();
	
	// 결제도중 취소한 판매건의 판매 테이블 삭제
	public void deleteSellTable();
	
	// sellUuid로 왕복 항공편 정보 조회
	public List<HashMap<String, Object>> selectRoundFlagInfo(String sellUuid);

}
