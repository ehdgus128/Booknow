package com.booknow.travelapp.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booknow.travelapp.common.paging.FAQCategoryDTO;
import com.booknow.travelapp.domain.FAQCategoryVO;
import com.booknow.travelapp.domain.FaqBoardsVO;
import com.booknow.travelapp.service.FAQCategoryService;

import lombok.AllArgsConstructor;

@RequestMapping(value = {"/boards/faq"})
@RestController
@AllArgsConstructor
public class FAQCategoryController {
	
	private FAQCategoryService faqCategoryService;

	//카테고리 목록 조회
	@GetMapping(value = "/cate/{cateId}",
				consumes = {"application/json; charset=UTF-8"},
				produces = {"application/json; charset=UTF-8"})
	public ResponseEntity<List<FAQCategoryVO>> showCategoryList(){
		
	
		return ResponseEntity.ok(null);
	}
	
	//특정 카테고리 조회
	@GetMapping(value = "/{cateId}",
				produces = {"application/json; charset=UTF-8"})
	public ResponseEntity<List<FaqBoardsVO>> getCategory(@PathVariable("cateId")Long cateId){
		
		//List<FAQCategoryVO> faqCategoryVO = faqCategoryService.getCategoryList(cateId);
		//return new ResponseEntity<>(faqCategoryVO,HttpStatus.OK);
		
		System.out.println("[sys] cate boardlist : "+cateId);

		return ResponseEntity.ok(faqCategoryService.getCategoryFaqBoardList(cateId));
	
	}
	
	

		//특정 카테고리 조회
	@GetMapping(value = "/list/{cateId}",
				produces = {"application/json; charset=UTF-8"})
	public ResponseEntity<FAQCategoryDTO> getCategoryFaqBoardList(@PathVariable("cateId") Long cateId){
		
		// FAQCategoryVO faqCategoryVO = faqCategoryService.getCategory(cateId);
		// catedto
		// dto 
		return new ResponseEntity<FAQCategoryDTO>(faqCategoryService.getCategoryList(),HttpStatus.OK);
	}
	
}

