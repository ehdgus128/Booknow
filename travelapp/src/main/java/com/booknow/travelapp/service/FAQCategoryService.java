package com.booknow.travelapp.service;

import java.util.List;

import com.booknow.travelapp.common.paging.FAQCategoryDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;

public interface FAQCategoryService {

	//카테고리 목록 조회
	public FAQCategoryDTO getCategoryList();
		
	//특정 카테고리 조회
	public List<FaqBoardsVO> getCategoryFaqBoardList(Long cateId);
		
}
