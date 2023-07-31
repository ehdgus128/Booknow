package com.booknow.travelapp.airways.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booknow.travelapp.airways.domain.AirPassengersListDTO;
import com.booknow.travelapp.airways.domain.AirPassengersVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteSellVO;
import com.booknow.travelapp.airways.mapper.AirPaymentMapper;
import com.booknow.travelapp.airways.mapper.AirReservationsMapper;
import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.payment.payapi.PayRestApi;
import com.fasterxml.jackson.databind.JsonNode;

import lombok.AllArgsConstructor;

//230628 1255 동현 수정
@Service
@AllArgsConstructor
@Primary
public class AirReservationsServiceImpl implements AirReservationsService{
	
	private AirReservationsMapper airReservationsMapper ;
	private AirPaymentMapper airPaymentMapper ;
	private PayRestApi payRestApi;
	
	// 고객이 선택한 항공편 정보 조회
	public List<AirReservationsVO> getAirReservationsInfo(long airRouteno) {
		return airReservationsMapper.selectChoicedFlight(airRouteno) ;
	}

	// 예약자 정보 조회
	public List<TLUsers> getUserInfo(String userId) {
		return airReservationsMapper.selectUserInfo(userId) ;
	}

	
	// 최종 예약정보 확인 (결제페이지)
	public List<AirReservationsVO> getFinalReservationInfo(long airRouteno) {
		return airReservationsMapper.selectFinalReservation(airRouteno) ;
	}
	
	// 판매테이블 추가
	public int registerSellInfo(AirRouteSellVO airRouteSellVO) {
		return airReservationsMapper.insertSellInfo(airRouteSellVO) ;
	}
	
	// 예약테이블 추가
	public int registerResInfo(AirReservationsVO airReservationsVO) {
		
		
		return airReservationsMapper.insertResInfo(airReservationsVO) ;
	}
	
	// 탑승객 정보 입력
	public int registerPassengerInfo(AirPassengersVO airPassengers) {
		
		
		return airReservationsMapper.insertPassengerInfo(airPassengers) ;
	}
	
	// 선택한 노선의 이코노미 잔여좌석 수 조회
	public long getSpareESeat(long airRouteno) {
		
		
		return airPaymentMapper.selectSpareESeat(airRouteno) ;
	}
	
	// 선택한 노선의 prestige 잔여좌석 수 조회
	public long getSparePSeat(long airRouteno) {
		
		
		return airPaymentMapper.selectSparePSeat(airRouteno) ;
	}

	// 탑승객 수 조회
	public long selectPasCnt(long airResno) {
		
		return airPaymentMapper.selectPasCnt(airResno) ;
	}

	// 결제완료 시 이코노미 잔여좌석수가 탑승자 수만큼 감소
	public int updateESeat(HashMap<String, Object> airMap) {
		
		return airPaymentMapper.updateESeatCnt(airMap) ;
	}

	// 결제완료 시 prestige 잔여좌석수가 탑승자 수만큼 감소
	public int updatePSeat(HashMap<String, Object> airMap) {
		
		return airPaymentMapper.updatePSeatCnt(airMap) ;
	}

	// 결제완료 시 판매상태 update
	public int updateStatus(String sellUuid) {
		
		return airPaymentMapper.updateSellStatus(sellUuid) ;
	}
	
	// 결제완료 시 예약테이블 airSellno update
	public int updateRes(HashMap<String, Object> resMap) {
		
		return airPaymentMapper.updateResTable(resMap) ;
	}

	@Override
	@Transactional
	// 결제 시작 전 판매테이블/예약테이블/탑승객테이블 insert
	public AirPassengersListDTO prePayment(AirPassengersListDTO airPass) {
		
		
		//탑승자가 입력한 정보 저장
		List<String> passengersNameList = new ArrayList<String>();
		
		
		//탑승자 인원
		Long total = Long.parseLong(airPass.getPeopleCnt());
		
		//총 결제금액
		int onewayPrice = 0 ;
		int upwayPrice = 0 ;
		int downwayPrice = 0 ;
			
		Long totalPrice = 0L ;
		   
		long upwayEconomy = 0L;
		long downwayEconomy = 0L;
		long upwayPrestige = 0L;
		long downwayPrestige;
		
		double discountRate = 0.0;
		
		
		long airRouteno1 = 0;
		long airRouteno2 = 0;
		
		
		for (AirPassengersVO pass : airPass.getAirPassengersList()) {
			discountRate += pass.getAirDisCntRate();
			passengersNameList.add(pass.getAirPasName());
		}// for end
		
		//왕복일 때
		if(airPass.getAirResno2() != null && !airPass.getAirResno2().equals("") && airPass.getAirResno2().length() != 0) {
			
			airRouteno2 = Long.parseLong(airPass.getAirResno2()) ;
			airPass.setFinalReservation2(airReservationsMapper.selectFinalReservation(airRouteno2));
			
			
			// airrouteno2
			downwayEconomy = airPass.getFinalReservation2().get(0).getEconomyCharge();
			downwayPrestige = airPass.getFinalReservation2().get(0).getPrestigeCharge();
			
			
			//오는편 총 가격(downwayPrice)
			if(airPass.getAirClass2().equals("economy")) {
				downwayPrice = (int) (downwayEconomy * discountRate);
			}else {
				downwayPrice = (int) (downwayPrestige * discountRate);
			}
			
			AirReservationsVO airRes2 = new AirReservationsVO();
			
			//오는편 예약번호 insert
			airRes2.setUserId(airPass.getUserId()) ;
			airRes2.setAirRouteno(airRouteno2) ;
			airRes2.setTotalPrice(downwayPrice) ;
			airRes2.setAirClass(airPass.getAirClass2());
			
			
			airReservationsMapper.insertResInfo(airRes2);
			
			long resNo2 = airRes2.getAirResno();
			
			
			airPass.getFinalReservation2().get(0).setAirResno(airRes2.getAirResno());
			
			//탑승객 테이블 insert
			for (AirPassengersVO pass : airPass.getAirPassengersList()) {
				
				pass.setAirResno(resNo2);
				
				airReservationsMapper.insertPassengerInfo(pass);
				//pass.getAirDisCntRate()	
			}// for end
		}// if end
		
		
		airRouteno1 = Long.parseLong(airPass.getAirResno1()) ;
		airPass.setFinalReservation1(airReservationsMapper.selectFinalReservation(airRouteno1));
		
		
		upwayEconomy = airPass.getFinalReservation1().get(0).getEconomyCharge();
		upwayPrestige = airPass.getFinalReservation1().get(0).getPrestigeCharge();
		
		
		//가는편 총 가격(upwayPrice)
		if(airPass.getAirClass1().equals("economy")) {
			upwayPrice = (int) (upwayEconomy * discountRate);
		}else {
			upwayPrice = (int) (upwayPrestige * discountRate);
		}
		
		
		AirReservationsVO airRes = new AirReservationsVO();
		
		//가는편 예약번호 insert
		airRes.setUserId(airPass.getUserId()) ;
		airRes.setAirRouteno(airRouteno1) ;
		airRes.setTotalPrice(upwayPrice) ;
		airRes.setAirClass(airPass.getAirClass1());
		
		
		airReservationsMapper.insertResInfo(airRes);
		
		long resNo = airRes.getAirResno();
		
		
		airPass.getFinalReservation1().get(0).setAirResno(airRes.getAirResno());
		
		for (AirPassengersVO pass : airPass.getAirPassengersList()) {
			
			pass.setAirResno(resNo);
			airReservationsMapper.insertPassengerInfo(pass);
						
		}// for end
		
		//사전 insert process 끝
		
		// totalPrice
		totalPrice = upwayPrice + downwayPrice + 0L;
		
		airPass.setTotal(total);
		airPass.setOnewayPrice(onewayPrice);
		airPass.setUpwayPrice(upwayPrice);
		airPass.setDownwayPrice(downwayPrice);
		airPass.setTotalPrice(totalPrice);
		airPass.setPassengersList(passengersNameList);
		airPass.setAirRouteno1(airRouteno1);
		airPass.setAirRouteno2(airRouteno2);
		
		
		// 결제 사전 등록
		JsonNode root = payRestApi.registerPreAmount(String.valueOf(totalPrice), payRestApi.getPortOneToken());

		// sellUuid, amount 설정
		airPass.setSellUuid(root.get("response").get("merchant_uid").asText());
		airPass.setAmount(root.get("response").get("amount").asText());
		
		// 판매테이블 insert
		airReservationsMapper.insertSellInfo(new AirRouteSellVO(null, airPass.getUserId(), null, null, airPass.getSellUuid(), totalPrice));
		
		
		return airPass;
	}// prePayment end

	
	
	@Override
	@Transactional
	// 결제 성공 후 잔여좌석 select / 잔여좌석 - 인원수 update / 판매상태 update / 예약테이블 airsellno update
	public void afterPayment(AirPassengersListDTO airPass) {
		
		HashMap<String, Object> airMap = new HashMap<String, Object>();
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		airMap.put("airResno", airPass.getAirResno1());
		airMap.put("airRouteno", airPass.getAirRouteno1());	

		//가는편 잔여좌석 수 조회
		
		//가는편의 좌석등급이 economy
		if(airPass.getAirClass1().equals("economy")) {
			
			int checkERoute1 = Integer.parseInt(String.valueOf(airPaymentMapper.selectSpareESeat(airPass.getAirRouteno1())  - airPass.getTotal()));
			
			if(checkERoute1 < 0) {
				return ;
			}
			airPaymentMapper.updateESeatCnt(airMap) ;
		//가는편의 좌석등급이 prestige
		}else {
			
			int checkPRoute1 = Integer.parseInt(String.valueOf(airPaymentMapper.selectSparePSeat(airPass.getAirRouteno1())  - airPass.getTotal()));
			
			if(checkPRoute1 < 0) {
				return ;
			}
			airPaymentMapper.updatePSeatCnt(airMap) ;
		}
		
		airMap.clear();
		airMap.put("airResno", airPass.getAirResno2());
		airMap.put("airRouteno", airPass.getAirRouteno2());	
		
		//오는편 잔여좌석 수 조회
		if(airPass.getAirResno2() != null && !airPass.getAirResno2().equals("") && airPass.getAirResno2().length() != 0) {
			
			if(airPass.getAirClass2().equals("economy")) {
				
				int checkERoute2 = Integer.parseInt(String.valueOf(airPaymentMapper.selectSpareESeat(airPass.getAirRouteno2())  - airPass.getTotal()));
				
				if(checkERoute2 < 0) {
					return ;
				}
				airPaymentMapper.updateESeatCnt(airMap) ;
			}else {
				
				int checkPRoute2 = Integer.parseInt(String.valueOf(airPaymentMapper.selectSparePSeat(airPass.getAirRouteno2())  - airPass.getTotal()));
				
				if(checkPRoute2 < 0) {
					return ;
				}
				airPaymentMapper.updatePSeatCnt(airMap) ;
			}
			
		}
		
		
		//판매테이블의 판매상태 update
		airPaymentMapper.updateSellStatus(airPass.getSellUuid()) ;
		
		//판매테이블의 판매일시 update
		airPaymentMapper.updateSellDate(airPass.getSellUuid());
		
		//예약테이블 airsellno update
		resMap.put("sellUuid", airPass.getSellUuid());
		resMap.put("airResno1", airPass.getAirResno1());
		resMap.put("airResno2", airPass.getAirResno2());
		
		airPaymentMapper.updateResTable(resMap);
	}// afterPayment - end

	@Override
	@Transactional
	//결제 완료 후 고객이 취소 시 판매상태 '판매취소' update / route테이블 잔여좌석 + update 
	public void cancelPayment(AirPassengersListDTO airPass) {
		
		HashMap<String, Object> airMap = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> testList = airPaymentMapper.selectRoundFlagInfo(airPass.getSellUuid());
		
		//편도
		if(testList.size() == 1) {
			
			// 판매상태 = '결제취소' update 
			airPaymentMapper.updateSellCancel(airPass.getSellUuid());
			
			payRestApi.cancelPaymentOne(airPass.getSellUuid(), payRestApi.getPortOneToken());
			
			
			// 가는편 route테이블 잔여좌석 + update
			airMap.put("airResno", airPass.getAirResno());
			airMap.put("airRouteno", airPass.getAirRouteno());
			
			
			if(airPass.getAirClass().equals("economy")) {
				
				airPaymentMapper.updateESeatCntPlus(airMap);
			}else {
				
				airPaymentMapper.updatePSeatCntPlus(airMap);
			}

			airMap.clear();
		//왕복
		}else {
			
			// 판매상태 = '결제취소' update 
			airPaymentMapper.updateSellCancel(airPass.getSellUuid());
			
			payRestApi.cancelPaymentOne(airPass.getSellUuid(), payRestApi.getPortOneToken());
			
			airPass.setAirRouteno1(Long.parseLong(String.valueOf(testList.get(0).get("AIRROUTENO"))));
			airPass.setAirRouteno2(Long.parseLong(String.valueOf(testList.get(1).get("AIRROUTENO"))));
			
			airPass.setAirResno1(String.valueOf(testList.get(0).get("AIRRESNO")));
			airPass.setAirResno2(String.valueOf(testList.get(1).get("AIRRESNO")));
			
			airPass.setAirClass1(String.valueOf(testList.get(0).get("AIRCLASS")));
			airPass.setAirClass2(String.valueOf(testList.get(1).get("AIRCLASS")));
			
			 // 가는편 route테이블 잔여좌석 + update
			 airMap.put("airResno", airPass.getAirResno1());
			 airMap.put("airRouteno", airPass.getAirRouteno1());
			
			 if(airPass.getAirClass1().equals("economy")) {
				
			 	airPaymentMapper.updateESeatCntPlus(airMap);
			 }else {
				
			 	airPaymentMapper.updatePSeatCntPlus(airMap);
			 }
			
			 airMap.clear();
			
			 // 오는편 route테이블 잔여좌석 + update
			 
		 	airMap.put("airResno", airPass.getAirResno2());
		 	airMap.put("airRouteno", airPass.getAirRouteno2());
			
		 	if(airPass.getAirClass2().equals("economy")) {
				
		 		airPaymentMapper.updateESeatCntPlus(airMap);
		 	}else {
				
		 		airPaymentMapper.updatePSeatCntPlus(airMap);
		 	}
			
		}
		
	}// cancelPayment - end
}
