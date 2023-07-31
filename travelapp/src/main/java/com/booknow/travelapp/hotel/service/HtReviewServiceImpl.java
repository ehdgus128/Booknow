package com.booknow.travelapp.hotel.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.hotel.domain.HtReviewPagingDTO;
import com.booknow.travelapp.hotel.domain.HtReviewVO;
import com.booknow.travelapp.hotel.mapper.HtHotelReviewMapper;

@Primary
@Service
public class HtReviewServiceImpl implements HtReviewService{

	//페이징처리 정지은 2307101531
	//페이지당 보여지는 레코드의 갯수
	private static final int rowAmountPerPage = 4;

	//화면 하단에 표시할 기본 페이지 번호 개수 
	private static final int pageNumCnt = 3;
	
	private HtHotelReviewMapper hotelReviewMapper ;

	@Autowired
	public HtReviewServiceImpl(HtHotelReviewMapper hotelReviewMapper) {
		this.hotelReviewMapper = hotelReviewMapper;
	}

	//특정 호텔의 리뷰리스트 전부를 불러오는 코드
	@Override
	public List<HtReviewVO> getReviewList(Long htNo,Integer pageNum) {				
		int start = (pageNum-1)*rowAmountPerPage;
		RowBounds rowBounds = new RowBounds(start,rowAmountPerPage);	
		return hotelReviewMapper.selectTotalReviewList(htNo,rowBounds);
	}

	//리뷰총수 
	@Override
	public HtReviewPagingDTO getTotalReviewCount(Long htNo, int currentPage) {
		int reviewCnt = hotelReviewMapper.selectReviewTotalCnt(htNo);
		HtReviewPagingDTO pageBean = new HtReviewPagingDTO(reviewCnt,currentPage,rowAmountPerPage,pageNumCnt);
		return pageBean;
	}
	
	//리뷰 등록
	@Override
	public boolean registerReview(HtReviewVO htRev) {
		return (hotelReviewMapper.insertMyReview(htRev) == 1);
	}

	// 리뷰 수정
	@Override
	public boolean modifyReivew(HtReviewVO htRev) {
		return (hotelReviewMapper.updateModifyReivew(htRev) == 1);
	}

	// 리뷰 삭제요청
	@Override
	public boolean modifyDelFlagReivew(long htRevNo) {
		return (hotelReviewMapper.updateModifyDelFlagReivew(htRevNo) == 1);
	}

	// 리뷰 삭제
	@Override
	public boolean removeHtReivew(long htRevNo) {
		return (hotelReviewMapper.deleteHtReivew(htRevNo)== 1);
	}
	
} // HtReviewServiceImpl end
