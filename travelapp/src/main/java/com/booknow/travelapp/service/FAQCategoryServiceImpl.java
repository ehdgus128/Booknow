package com.booknow.travelapp.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.paging.FAQCategoryDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;
import com.booknow.travelapp.mapper.FAQCategoryMapper;

import lombok.AllArgsConstructor;

@Primary
@Service
@AllArgsConstructor
public class FAQCategoryServiceImpl implements FAQCategoryService {
	
	private FAQCategoryMapper faqCategoryMapper;

	@Override
	public FAQCategoryDTO getCategoryList() {
		return  new FAQCategoryDTO(
				faqCategoryMapper.selectCategoryList(1L), 
				faqCategoryMapper.selectCategoryList(2L), 
				faqCategoryMapper.selectCategoryList(3L)
		);
	}
	
	@Override
	public List<FaqBoardsVO> getCategoryFaqBoardList(Long cateId) {
		
		return faqCategoryMapper.selectCategoryFaqBoardList(cateId);
	}
	
	
}
