package com.booknow.travelapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.common.paging.FAQBoardPagingCreatorDTO;
import com.booknow.travelapp.common.paging.FAQBoardPagingDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;
import com.booknow.travelapp.service.FAQBoardService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/boards")
@AllArgsConstructor
public class FAQController {
	
	private FAQBoardService faqBoardService;

	//게시물 전체 목록 조회_페이징처리
	@GetMapping("/faq")
	public void showFAQBoardList(FAQBoardPagingDTO faqBoardPagingDTO,Model model) {
		model.addAttribute("faqboardsList",faqBoardService.getFaqBoardList(faqBoardPagingDTO));
		long rowAmountTotal = faqBoardService.getRowAmountTotal(faqBoardPagingDTO);
		
		FAQBoardPagingCreatorDTO faqBoardPagingCreatorDTO = new FAQBoardPagingCreatorDTO(rowAmountTotal,faqBoardPagingDTO);
		model.addAttribute("pagingCreator",faqBoardPagingCreatorDTO);
		//System.out.println("컨트롤러 _ FAQ페이징 고려 조회 완료");
	}
	
	//게시물 등록 - 페이지 호출
	@GetMapping("/register")
	public void showFAQBoardRegisterPage() {
		
	}
	
	//게시물 등록 -처리
	@PostMapping("/register")
	public String registerNewFAQBoard(FaqBoardsVO faqBoard, RedirectAttributes redirectAttr ) {
		long faqNo = faqBoardService.registerFAQBoard(faqBoard);
		redirectAttr.addFlashAttribute("result",faqNo);
		return "redirect:/boards/faq";
	}

	//특정 게시물 조회 
	@GetMapping("/faqdetail")
	public void showBoardDetail(@RequestParam("faqNo") Long faqNo, Model model,
								@ModelAttribute("faqBoardPagingDTO")FAQBoardPagingDTO faqBoardPagingDTO ) {
		
		model.addAttribute("faqboards",faqBoardService.getFAQBoard(faqNo));
		System.out.println("model:"+model);
	}
	
	//특정 게시물 수정 처리
	@PostMapping("/modify")
	public String modifyBoard(FaqBoardsVO faqBoard, RedirectAttributes redirectAttr ) {
		if(faqBoardService.modifyFAQBoards(faqBoard)) {
			redirectAttr.addFlashAttribute("result","successModify");
		}
		return "redirect:/boards/faqdetail?faqno="+faqBoard.getFaqNo();
	}
	
	//특정게시물 삭제
	@PostMapping("/remove")
	public String removeBoard(@RequestParam("faqNo") long faqNo,RedirectAttributes redirectAttr ) {
		if(faqBoardService.deletedFAQBoards(faqNo)) {
			redirectAttr.addFlashAttribute("result","successRemove");
		}
		return "redirect:/boards/faq";
	}
}
