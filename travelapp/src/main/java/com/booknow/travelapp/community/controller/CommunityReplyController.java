package com.booknow.travelapp.community.controller;

import java.util.HashMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booknow.travelapp.community.domain.TLCommunityReplyVO;
import com.booknow.travelapp.community.domain.common.TLCommunityReplyPagingDTO;
import com.booknow.travelapp.community.service.TLCommunityReplyService;


@RequestMapping(value= {"/replies"})
@RestController
public class CommunityReplyController {
	
	private TLCommunityReplyService replyService;
	
	public CommunityReplyController(TLCommunityReplyService replyService) {
		this.replyService= replyService;
	}

	//댓글 리스트 전체 조회 
	@GetMapping(value="/{tvcBno}/{pageNum}",
				produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<HashMap<String, Object>> showReplyList(@PathVariable("tvcBno")Long tvcBno,
																  @PathVariable(value="pageNum")Integer pageNum){
		if(pageNum == null) {
			pageNum = 1;
		}
		
		System.out.println("컨트롤러에 오나요?");
		
		TLCommunityReplyPagingDTO pageBean = replyService.getTotalRowAmount(tvcBno, pageNum);	
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap.put("pageBean", pageBean);
		resultMap.put("commentList", replyService.getReplyList(tvcBno,pageNum));	
		return new ResponseEntity<HashMap<String, Object>>(resultMap,HttpStatus.OK);
	}
	
	
	//댓글등록
	@PreAuthorize("isAuthenticated()") 
	@PostMapping(value="/{tvcBno}",
				produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> registerReply(@PathVariable("tvcBno")Long tvcBno,TLCommunityReplyVO tlReplyVO){	
		String result = "";		
		if(replyService.registerReply(tlReplyVO)) {
			result = "성공";
		}else {
			result = "실패";
		}	
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	
	
	//답글등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/commentForReply",
			consumes= {"application/json; charset=UTF-8"},
			produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> commentForReply(@RequestBody TLCommunityReplyVO tlReplyVO){
	    System.out.println("답글등록 컨트롤러");

	    String result = "";		
	    if(replyService.registerCommentForReply(tlReplyVO)) {
	        result = "성공";
	    } else {
	        result = "실패";
	    }	
	    return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	
	//댓글수정 
	@PreAuthorize("isAuthenticated()")
	@PutMapping(value="/new",
				consumes= {"application/json; charset=UTF-8"},
				produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> modifyReply(@RequestBody TLCommunityReplyVO tlReplyVO){
	
		System.out.println("컨트롤러에 왔나요 ?");	
		String result = "";	
		if(replyService.modifyReply(tlReplyVO)) {
			result = "성공";
		}else {
			result = "실패";
		}		
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	
	
	//댓글 삭제 요청
	@PreAuthorize("isAuthenticated()")
	@PutMapping(value="/updateDeleteFlag/{tvcRno}",
				produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> updateDeleteFlag(@PathVariable("tvcRno")Long tvcRno){
		
		String result = "";
		if(replyService.updateRdelFlag(tvcRno)) {
			result = "성공";
		}else {
			result = "실패";
		}		
		return new ResponseEntity<String>(result,HttpStatus.OK);
		
	}
	
	
	
}
