package com.booknow.travelapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.common.paging.QNAQuestionPagingCreatorDTO;
import com.booknow.travelapp.common.paging.QNAQuestionPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;
import com.booknow.travelapp.service.QNAQuestionsService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/qna")
@AllArgsConstructor
public class QNAQuestionController {
	@Setter(onMethod_ = @Autowired)
	private QNAQuestionsService qnaQuestionsService;
	
	//어노테이션
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list") //Question 화면
	public void showQuestionPage(QNAQuestionPagingDTO qnaQuestionPagingDTO, Model model) {
		
		//아이디
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
		qnaQuestionPagingDTO.setQnaQwriter(userId);
		
		// 아이디 가져오는거
		System.out.println("user정보:"+qnaQuestionPagingDTO);
		model.addAttribute("qnaLidst",qnaQuestionsService.getQNAQList(qnaQuestionPagingDTO));
		long rowAmountTotal = qnaQuestionsService.getRowAmountTotal(qnaQuestionPagingDTO);
		QNAQuestionPagingCreatorDTO qnaQuestionPagingCreatorDTO=
			
				new QNAQuestionPagingCreatorDTO(rowAmountTotal,qnaQuestionPagingDTO);
		System.out.println("qnaQuestionPagingCreatorDTO정보:"+qnaQuestionPagingCreatorDTO.getEndPagingNum());
		System.out.println("qnaQuestionPagingCreatorDTO정보:"+qnaQuestionPagingCreatorDTO.getLastPageNum());
		model.addAttribute("pagingCreator",qnaQuestionPagingCreatorDTO);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/reg") //질문 등록_화면
	public void QnaQuestionRegisterPage() {
		System.out.println("컨트롤러_게시물 등록 페이지 호출");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/reg") //질문 등록_처리
	public String QnaQuestionRegisterPage(QnaBoardsVO qnaBoards,
										  RedirectAttributes redirectAttr) {
		
		long qnaQno = qnaQuestionsService.registerQNAQuestion(qnaBoards);
		
		System.out.println("controller_등록처리 된 qnaQno:"+qnaQno);

		redirectAttr.addFlashAttribute("result",qnaQno);
		
		return "redirect:/qna/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/detail", "/modify"})//게시물 조회,수정 페이지 호출
	public void showQnadetail(@RequestParam("qnaQno") long qnaQno,Model model,
							   QNAQuestionPagingDTO qnaQuestionPagingDTO) {
			System.out.println("컨트롤러_게시물 조회-수정 페이지 호출: "+qnaQno);
		model.addAttribute("qnaBoards",qnaQuestionsService.getQNAContent(qnaQno));
		model.addAttribute("qnaQuestionPagingDTO ",qnaQuestionPagingDTO);
			System.out.println("컨트롤러 _화면으로 전달할 model: "+model);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")//게시물 수정 처리
	public String modifyBoard(QnaBoardsVO qnaBoards, RedirectAttributes redirectAttr) {
		System.out.println("컨트롤러_게시물 수정 전달된 qnaBoards 값:"+qnaBoards);
		
		if(qnaQuestionsService.modifyQNAContent(qnaBoards)) {
			redirectAttr.addFlashAttribute("result","successModify");
		}

				
		return "redirect:/qna/detail?qnaQno="+qnaBoards.getQnaQno();
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/answerCheck")
	public String setBoardAnswer(@RequestParam("qnaQno") long qnaQno,RedirectAttributes redirectAttr) {
		if (qnaQuestionsService.setQNADeleted(qnaQno)) {
			redirectAttr.addFlashAttribute("result","answerCheck");
		}
		return "redirect:/qna/answerCheck";
	}
	
	
}
