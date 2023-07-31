package com.booknow.travelapp.airways.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.airways.domain.AirResDetailVO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.common.paging.domain.AirResDetailPagingDTO;

public interface AirResDetailMapper {
	
	
	/// 230627 심세연 생성  /
	
	
	//0 detail 내역 정보 4개 조인 select 
	public List<AirResDetailVO> selectAirResDetail(long airResno);
	
	//1 테이블 4개 예약번호 + 노선 (왕복)/
		public List<AirResDetailVO> selectAirResDetailPerRoute(long airResno, long airRouteno);
	
	//2 예약 1건당 나오는 노선
		public List<AirRouteVO> selectAirResPerRoute(long airResno);
	
	
	//3 예약 1건당 총 승객 수 
	public int selectAirResPerSeat(long airResno, long airRouteno);
		
	 //4 예약 내역에 들어가기 전 예약 list select문 //mapper -1
	public List<AirReservationsVO> selectAirReservations(@Param("userId") String userId, @Param("airResDetailPagingDTO") AirResDetailPagingDTO airResDetailPagingDTO );
														//@Param("depPlandTime") Timestamp depPlandTime,@Param("arrPlandTime") Timestamp arrPlandTime 
		
	//5 rowTotal
	public long selectAirResRowTotal(@Param("userId") String userId, @Param("airResDetailPagingDTO") AirResDetailPagingDTO airResDetailPagingDTO ) ;
									//	@Param("depPlandTime") Timestamp depPlandTime,@Param("arrPlandTime") Timestamp arrPlandTime 	
	
	//
	public long selectAirResPeopleCnt(long airResno);
	
	//20230703 예약번호 별 가격
	public long selectTotalprice(long airResno);
	//
	
	public long notNullRes(String userId);
	
	
	//20230712 uuId구하기
	public String selectUUID(@Param("userId") String userId,@Param("airResno") long airResno);
	
	
	 
}
