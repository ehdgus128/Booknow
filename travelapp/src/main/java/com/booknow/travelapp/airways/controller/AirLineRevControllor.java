package com.booknow.travelapp.airways.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingCreatorDTO;
import com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingDTO;
import com.booknow.travelapp.airways.domain.AirLineRevVO;
import com.booknow.travelapp.airways.service.AirLineRevService;



@Controller
@RequestMapping("/review/airline")
public class AirLineRevControllor {

   
   private AirLineRevService airLineRevService;
   public AirLineRevControllor( AirLineRevService airLineRevService) {
      this.airLineRevService = airLineRevService;
   }
   // http://localhost:8080/travelapp/review/airline/list?airlineId=JJA
//페이지 조회 토탈 페이징 처리   
   @GetMapping("/list")
   public String showRevList(AirlineRevPagingDTO airlineRevPagingDTO,
							   Model model,
							   @RequestParam("airlineId") String airlineId ) {
	   
	   
	   model.addAttribute("airlineId",airlineId) ; 
	   model.addAttribute("keyword", airlineRevPagingDTO.getKeyword()) ;
	   model.addAttribute("revList",airLineRevService.getBoardList(airlineRevPagingDTO));
	 
	   
	   double averageStar = airLineRevService.averageStar(airlineId);
	    model.addAttribute("averageStar", averageStar);
	   
	   
	 long revTotal = airLineRevService.getRowTotal(airlineRevPagingDTO);
	   AirlineRevPagingCreatorDTO airlineRevPagingCreatorDTO =new AirlineRevPagingCreatorDTO(revTotal, airlineRevPagingDTO);
	   
	   model.addAttribute("pagingCreator", airlineRevPagingCreatorDTO);
	   model.addAttribute("revTotal", revTotal);
	   
	   return "/review/airline/list";
   }
//   틍록 페이지 
   @PreAuthorize("isAuthenticated()")
   @GetMapping("/register")
	public void  registerAirRevPage(Model model,@RequestParam("airlineId") String airlineId 
									   ) {
		System.out.println("리뷰 페이지");
//Model model	
   Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
   String username = ((UserDetails)principal).getUsername();
   model.addAttribute("username",username);
  
  System.out.println("username>>>>>>>>>>>>>>>>>>>>>>>>>>"+username);
		 model.addAttribute("airlineId",airlineId) ; 
 }
   @PostMapping("/register") 
	  public String registerAirRev(AirLineRevVO airLineRevVO ,
			  					   RedirectAttributes redirectAttr ,
			  					   @RequestParam("airlineId") String airlineId  ) {
		 
		  long  airlineRevno =airLineRevService.registerBoard(airLineRevVO);
		  redirectAttr.addFlashAttribute("result", airlineRevno) ;
	  return "redirect:/review/airline/list?airlineId=" + airlineId;
	  }
    
	  
	  // 삭제  페이지 
	  @Transactional
	  @GetMapping("/Delete")
	  public String deleteAirlineRev(@RequestParam("airlineRevno") long airlineRevno  ,
			   @RequestParam("airlineId") String airlineId ) {
	    airLineRevService.deleteAirlineRev(airlineRevno);
	     System.out.println("삭제된 리뷰 번호: "+airlineRevno);

	     return "redirect:/review/airline/list?airlineId=" + airlineId;
	  }

 
	  
	  //수정 컨트롤ㄹ러
	  @RequestMapping(value = "/modi/{airlineRevno}", method = RequestMethod.PUT, consumes = "application/json;charset=utf-8", produces = "text/plain;charset=utf-8")
	  public ResponseEntity<String> modifyReply(@PathVariable("airlineRevno") long airlineRevno, 
			  									@RequestBody AirLineRevVO airLineRevVO,
			  									@RequestParam("airlineId") String airlineId  ) {
	      
	      int modCnt = airLineRevService.modifyAirLineRev(airLineRevVO);

	      if (modCnt == 1) {
	          return new ResponseEntity<String>("ReplyModifySuccess", HttpStatus.OK);
	         
	      } else {
	          return new ResponseEntity<String>("ReplyModifyFail", HttpStatus.INTERNAL_SERVER_ERROR);
	      }
	  }

	  
//	 좋아요 기능
	 
	  @PostMapping("/like")
	    @ResponseBody
	    public ResponseEntity<?> updateLikeCount(@RequestParam("revNo") long revNo,@RequestParam("airlineId") String airlineId  ) {
	        try {
	            long updatedCount = airLineRevService.updateMyLike(revNo);
	            return ResponseEntity.ok().body(updatedCount);
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	        }
	    }
	  
	  //신고기능
	  @GetMapping("/report")
	  public String reportAirlineRev(@RequestParam("airlineRevno") long airlineRevno  ,
			  						@RequestParam("airlineId") String airlineId ) {
	    airLineRevService.reportAirLineRev(airlineRevno);

	     return "redirect:/review/airline/list?airlineId=" + airlineId;
	  }
	 
}