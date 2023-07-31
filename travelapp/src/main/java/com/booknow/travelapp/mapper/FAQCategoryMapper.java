package com.booknow.travelapp.mapper;

import java.util.List;

import com.booknow.travelapp.domain.FAQCategoryVO;
import com.booknow.travelapp.domain.FaqBoardsVO;

public interface FAQCategoryMapper {

	//카테고리 목록 조회
	public List<FAQCategoryVO> selectCategoryList(Long cateId);
	
	//특정 카테고리 조회
	public List<FaqBoardsVO> selectCategoryFaqBoardList(Long cateId);
	
	//특정 게시글 조회
	public List<FaqBoardsVO> getFaqQuestion(Long faqNo);
	
	
}
