package com.booknow.travelapp.hotel.service;

import java.util.List;

import com.booknow.travelapp.hotel.domain.HtReviewPagingDTO;
import com.booknow.travelapp.hotel.domain.HtReviewVO;


public interface HtReviewService {

	
	public List<HtReviewVO> getReviewList(Long htNo,Integer pageNum); //댓글 리스트 확인
	
	public HtReviewPagingDTO getTotalReviewCount(Long htNo,int currentPage);
	
	public boolean registerReview(HtReviewVO htRev); //댓글 등록

	public boolean modifyReivew(HtReviewVO htRev); //댓글 수정

	public boolean modifyDelFlagReivew(long htRevNo); //댓글 삭제요청

	public boolean removeHtReivew(long htRevNo); //댓글 삭제

}// HtReviewService end
