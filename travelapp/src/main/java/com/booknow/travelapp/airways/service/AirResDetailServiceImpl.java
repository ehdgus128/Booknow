package com.booknow.travelapp.airways.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.booknow.travelapp.airways.domain.AirResDetailVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.mapper.AirResDetailMapper;
import com.booknow.travelapp.airways.common.paging.domain.AirResDetailPagingDTO;


@Service
@Primary
public class AirResDetailServiceImpl implements AirResDetailService{

	//230627 세연 작성
	
	//생성자 주입
	private AirResDetailMapper airResDetailMapper;
	public AirResDetailServiceImpl (AirResDetailMapper airResDetailMapper) {
		this.airResDetailMapper = airResDetailMapper ;
	}
	
	
	//0 예약 1건에 대한 Detail 승객좌석등 정보(테이블 4개)
	public List<AirResDetailVO> getAirResDetail(long airRno) {
		return airResDetailMapper.selectAirResDetail(airRno);
	}
	  
	//1 예약 1건에 대하고 노선1건에 대한 Detail 승객 좌석들 정보
	public List<AirResDetailVO> getAirResDetail(long airResno, long airRouteno) {
		return airResDetailMapper.selectAirResDetailPerRoute(airResno, airRouteno);
	}

	//2 예약 1건에 대한 기본적인 AirRouteVO를 불러옴
	public List<AirRouteVO> getAirResPerRoute(long airResno){
		return airResDetailMapper.selectAirResPerRoute(airResno);
	}
	  
	//3 예약 1건당 승객좌석 수
	public int getAirResPerSeat(long airResno,long airRouteno) {
		return airResDetailMapper.selectAirResPerSeat(airResno,airRouteno);
	}

	//4 userId 별 예약리스트 
	public List<AirReservationsVO> getAirReservations(String userId, AirResDetailPagingDTO airResDetailPagingDTO){	
		return airResDetailMapper.selectAirReservations(userId, airResDetailPagingDTO);
	}
	
	//5 rowTotal
	public long getAirResRowTotal(String userId,AirResDetailPagingDTO airResDetailPagingDTO) {
		return airResDetailMapper.selectAirResRowTotal(userId,airResDetailPagingDTO);
	}
	  
	//6 예약 번호와 아이디에따른 승객 수
	public long getAirResPeopleCnt(long airResno) {
		return airResDetailMapper.selectAirResPeopleCnt(airResno);
	}
	
	//7 예약 번호에 따른 총 예약 가격
	public long getAirTotalprice(long airResno) {
		return airResDetailMapper.selectTotalprice(airResno);
	}

	public long notNullRes(String userId) {
		return airResDetailMapper.notNullRes(userId);
	}

	public String getUUId(String userId, long airResno) {
		return airResDetailMapper.selectUUID(userId, airResno);
	}
}
