package com.booknow.travelapp.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booknow.travelapp.hotel.domain.HtReviewDTO;
import com.booknow.travelapp.hotel.domain.HtReviewVO;
import com.booknow.travelapp.hotel.service.HtReviewService;



//숙소 리뷰 처리 컨트롤러
//230629김가현_리뷰처리컨트롤러작성중

@RequestMapping("/hotel/rev")
@RestController
public class HtHotelReviewController {

	//생성자 자동 주입
	private HtReviewService htReviewService ;
	
	@Autowired
	public HtHotelReviewController(HtReviewService htReviewService) {
		this.htReviewService = htReviewService;
	}
	
	
	@GetMapping(
		value = "/list/{htNo}/{pageNum}",
		produces = "application/json; charset=UTF-8")
	public ResponseEntity<HtReviewDTO> showReviewList(
		@PathVariable("htNo")Long htNo,
		@PathVariable("pageNum")Integer pageNum) {
		

		if(pageNum == null) {
			pageNum = 1;
		}

		HtReviewDTO htReviewDTO = new HtReviewDTO();
		
		htReviewDTO.setHtReviewList(htReviewService.getReviewList(htNo, pageNum));
		htReviewDTO.setPageBean(htReviewService.getTotalReviewCount(htNo, pageNum));
		
		return new ResponseEntity<HtReviewDTO>(htReviewDTO, HttpStatus.OK);
	}// showReviewList end
	
	
		
	//댓글 등록 PostMapping
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/reg",
			consumes = "application/json; charset=UTF-8",
			produces = "text/plain; charset=UTF-8" )
	public ResponseEntity<String> registerReview(@RequestBody HtReviewVO myReviewVO) {
		
		String result = "실패";

		if (htReviewService.registerReview(myReviewVO)) {
			result = "성공";
		}

		return new ResponseEntity<String>(result,HttpStatus.OK);
	} // registerReview
						
}// HtHotelReviewController end
