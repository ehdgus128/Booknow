package com.booknow.travelapp.airways.service;

import java.util.List;

import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingCreatorDTO;
import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingDTO;
import com.booknow.travelapp.airways.domain.AirRankVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;

//230627 임지혁 작성
public interface AirRouteService {
	
	//모든 항공노선 조회
	
//	0627박효준 편도 항공노선 SELECT
//	0629 임지혁 수정 nav바 검색창: VO 이용
	//230701 임지혁: 페이징 고려
	public AirwaysPagingCreatorDTO getAirRouteSearchList(AirwaysPagingDTO airwaysPaging);

	
	//230628 임지혁: 항공노선 삽입
	public int registerAirRoute(AirRouteVO airRouteVO, int numOfRows);
	
	
	//노선 좌석수 업데이트
	public boolean modifyAirRouteSeatCnt(long airRouteno, long seatCnt);
	
	
	//노선 삭제
	public boolean deleteAirRoute(long airRouteno);

	
	// 항공사 평점 랭킹 top 5
	public List<AirRankVO> getAirGradeRankList();
	
	//항공편 최저가
	public List<AirRouteVO> getAirLowPrice();

}
