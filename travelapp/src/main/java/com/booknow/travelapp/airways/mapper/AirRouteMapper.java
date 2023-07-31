package com.booknow.travelapp.airways.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingDTO;
import com.booknow.travelapp.airways.domain.AirRankVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;


public interface AirRouteMapper {
	
//	편도 항공노선 SELECT 0627박효준(List<AirRouteVO>추가)
	// 230629 임지혁 수정 nav바 검색창: parameter로 VO객체 이용하도록 수정
	// 230701 임지혁 수정 paging 고려
	public List<AirRouteVO> selectAirRouteSearchList(AirwaysPagingDTO airwaysPaging);
	
	//230627 임지혁 작성
	
	//230701 임지혁: 노선 개수 - 페이징시 사용
	public long selectRowTotal(AirwaysPagingDTO airwaysPaging);
	
	//230628 임지혁: 항공노선 삽입
	public int insertAirRoute(List<Map<String, Object>> airRouteMapList);
	
	
	//노선 좌석수 업데이트
	public int updateAirRouteSeatCnt(long airRouteno, long seatCnt);
	
	//노선 삭제
	public int deleteAirRoute(long airRouteno);

	// 항공사 평점 랭킹 top 5
	public List<AirRankVO> selectAirGradeRankList();
	
	//항공편 최저가 
	public List<AirRouteVO> selectAirLowPrice();
		
}
