package com.booknow.travelapp.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.hotel.domain.HtReviewVO;

public interface HtHotelReviewMapper {
		
	//특정 호텔의 모든리뷰 조회하기
	public List<HtReviewVO> selectTotalReviewList(@Param("htNo")Long htNo, RowBounds rowBounds);
	
	//정지은 230710 특정 호텔의 리뷰 총갯수 
	public int selectReviewTotalCnt(Long htNo);

	//리뷰 등록하기 
	public int insertMyReview(HtReviewVO htRev);

	// 리뷰 수정
	public int updateModifyReivew(HtReviewVO htRev);

	// 리뷰 삭제 요청
	public int updateModifyDelFlagReivew(long htRevNo);

	// 리뷰 삭제
	public int deleteHtReivew(long htRevNo);
		
} // HtHotelReviewMapper end
