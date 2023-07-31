package com.booknow.travelapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booknow.travelapp.common.paging.QNAAnswerPagingCreatorDTO;
import com.booknow.travelapp.common.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;
import com.booknow.travelapp.service.QNAAnswerService;
import lombok.AllArgsConstructor;

@RequestMapping(value= {"/answer"})
@RestController
@AllArgsConstructor
public class QNAAnswerController {
	
	private QNAAnswerService qnaAnswerService;

	@PreAuthorize("isAuthenticated()")
	@GetMapping(value ="/pages/{qnaQno}/{page}",
				produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<QNAAnswerPagingCreatorDTO> showAnswerList(@PathVariable("qnaQno") Long qnaQno,
																	@PathVariable("page") Integer pageNum){
		System.out.println("[sys] showAnswerList start");
		QNAAnswerPagingDTO qnaAnswerPaging = new QNAAnswerPagingDTO(qnaQno,pageNum);
		
		QNAAnswerPagingCreatorDTO qnaAnswerPagingCreator=qnaAnswerService.getQNAAnswerListByQno(qnaAnswerPaging);
	
		ResponseEntity<QNAAnswerPagingCreatorDTO> responseEntity =
				new ResponseEntity<>(qnaAnswerPagingCreator,HttpStatus.OK);
		
		System.out.println("[sys] showAnswerList end");
		return responseEntity;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/{qnaQno}",
				produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<QnaBoardsVO> getAnswer(@PathVariable("qnaQno")Long qnaQno
												  ){
		System.out.println("[sys] getAnswer start2");
		QnaBoardsVO qnaBoards = qnaAnswerService.getAnswer(qnaQno);
		System.out.println("[sys] getAnswer end2");
		return new ResponseEntity<>(qnaBoards,HttpStatus.OK);
	}
	
	
	
	
}
