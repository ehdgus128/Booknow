package com.booknow.travelapp.airways.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingDTO;
import com.booknow.travelapp.airways.domain.AirLineRevVO;
import com.booknow.travelapp.airways.mapper.AirLineRevMapper;

@Primary
@Service  
public class AirLineRevServiceImpl implements AirLineRevService {
	
	private AirLineRevMapper airLineRevMapper ;

	public AirLineRevServiceImpl(AirLineRevMapper airLineRevMapper  ) {
		this.airLineRevMapper = airLineRevMapper ;
	}

	//게시물 목록
	@Override
	public List<AirLineRevVO> getBoardList(AirlineRevPagingDTO airlineRevPagingDTO) {
		
		return airLineRevMapper.selectAirRevList(airlineRevPagingDTO);
	}
	
	//게시물 총수: 페이징 시 사용됨
	public long getRowTotal(AirlineRevPagingDTO airlineRevPagingDTO) {
		return airLineRevMapper.selectRowTotal(airlineRevPagingDTO) ;
	}
	
	//게시물 등록: selectKey 이용
	@Transactional
	@Override
	public long registerBoard(AirLineRevVO  airLineRevVO) {

		//게시물 등록
		airLineRevMapper.insertAirlineRev(airLineRevVO) ;
		
		 
	 
		
		return airLineRevVO.getAirlineRevno() ;
	}
	

	//특정 게시물 조회
	@Override
	public AirLineRevVO getRev(long airlineReno) {
		AirLineRevVO airLineRevVO =  airLineRevMapper.selectOneRev(airlineReno); 
		return airLineRevVO ;
	}
	@Transactional
	 @Override
	    public long  deleteAirlineRev(long airlineRevno) {
	        return airLineRevMapper.deleteAirLineRev(airlineRevno);
	    }

	
	

	//게시물 수정
	@Transactional
	@Override
	public int modifyAirLineRev(AirLineRevVO  airLineRevVO) {
		
//		long airlineReno = airLineRevVO.getAirlineRevno() ;
//		int boardModifyResult = airLineRevMapper.modifyAirLineRev(airLineRevVO) ;

		Integer modCnt = airLineRevMapper.modifyAirLineRev(airLineRevVO);

		return modCnt;
	}
	
	//리뷰 추천  +1
	@Transactional
	@Override
	public long updateMyLike(long airlineReno) {
		
		long cnt = airLineRevMapper.updateMyLike(airlineReno);
		return cnt++;
	}
	
	
	//신고기능 +1
	@Transactional
	@Override
	public long reportAirLineRev(long airlineReno) {
		
		long cnt = airLineRevMapper.reportAirLineRev(airlineReno);
		return cnt++;
	}
	
	 // 평균별점
	 @Override
	  public double averageStar(String airlineId) {
      return airLineRevMapper.averageStar(airlineId);
  }

	 




}
