package com.booknow.travelapp.common.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.common.domain.QNAAnswerQuestionsVO;
import com.booknow.travelapp.common.domain.paging.QNAAnswerPagingCreatorDTO;
import com.booknow.travelapp.common.domain.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.common.service.QNAnswerService;
	
@Controller
@RequestMapping(value = "/admin/")
public class QNAnswerController {
	
	private QNAnswerService answerService;
	  
	public QNAnswerController( QNAnswerService answerService) {
        this.answerService = answerService;
    }
 
	@GetMapping("/qna")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String showRevList(QNAAnswerPagingDTO QNAAnswerPagingDTO, Model model) {
	    model.addAttribute("revList", answerService.getQNAAnswerList(QNAAnswerPagingDTO));
	    long revTotal = answerService.getRowTotal(QNAAnswerPagingDTO);
	    model.addAttribute("TotalDifference",answerService.getRowTotalDifference());
	    
	    Map<String, Long> categoryCounts = answerService.getQnaCategoryCounts();
        model.addAttribute("categoryCounts", categoryCounts);
        
        model.addAttribute("revTotal", revTotal);
	    
	    QNAAnswerPagingCreatorDTO  qNAAnswerPagingCreatorDTO =
				new QNAAnswerPagingCreatorDTO(revTotal, QNAAnswerPagingDTO);
        
	    model.addAttribute("pagingCreator", qNAAnswerPagingCreatorDTO); 
	    return "/admin/qna";  

	}
	
	@GetMapping("/qnadetail")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String showDetail ( QNAAnswerPagingDTO QNAAnswerPagingDTO,Model model) {
		model.addAttribute("revList", answerService.selectDetail(QNAAnswerPagingDTO ));
		model.addAttribute("TotalDifference",answerService.getRowTotalDifference());
		
		  Map<String, Long> categoryCounts = answerService.getQnaCategoryCounts();
	       model.addAttribute("categoryCounts", categoryCounts);
		 
		
		long revTotal = answerService.selectRowTotalDetail(QNAAnswerPagingDTO);
	    QNAAnswerPagingCreatorDTO  qNAAnswerPagingCreatorDTO =
				new QNAAnswerPagingCreatorDTO(revTotal, QNAAnswerPagingDTO);
	    model.addAttribute("revTotal", revTotal);
	    model.addAttribute("pagingCreator", qNAAnswerPagingCreatorDTO); 
	     
		return "/admin/qna";  
		
	}
	
	///등록 페이지
	@PostMapping("/qna/register") 
	@PreAuthorize("hasAuthority('ADMIN')")
	public String registerAirRev(QNAAnswerQuestionsVO answerQuestionsVO,
	                             RedirectAttributes redirectAttr,
	                             Model model,
	                             @RequestParam("qnaQno") long qnaQno,
	                             HttpServletRequest request) {

	    long QNAno = answerService.registerQNAAnswer(answerQuestionsVO);
	    answerService.updateQnaQprocFlag(qnaQno);
	    redirectAttr.addFlashAttribute("result", QNAno);
	    
	    String previousUrl = request.getHeader("Referer");
	    return "redirect:" + previousUrl;
	}

	
	 //수정 컨트롤ㄹ러
	@PostMapping("/qna/modi")
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> modifyReply(@RequestBody QNAAnswerQuestionsVO answerQuestionsVO) {
	    int modCnt = answerService.updateQNAAnswer(answerQuestionsVO);
	    
	    if (modCnt == 1) {
	        return new ResponseEntity<String>("ReplyModifySuccess", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<String>("ReplyModifyFail", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}


	 
	
	@Transactional
	@GetMapping("/qna/Delete")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String deleteAirlineRev(@RequestParam("qnaQno") long qnaQno  ) {
		answerService.deleteQnaAnswer(qnaQno);
		answerService.deleteQnaQuestion(qnaQno);

		return "redirect:/admin/qna";
	}
	
	
}
