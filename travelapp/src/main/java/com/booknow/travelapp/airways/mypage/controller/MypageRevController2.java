package com.booknow.travelapp.airways.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingCreatorDTO2;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO2;
import com.booknow.travelapp.airways.mypage.service.MypageRevService;


// 20230712 세연 생성 2가 붙은 것은 마이페이지->호텔리뷰입니다 /안붙은것은 항공리뷰입니다.
@Controller
@RequestMapping(value="/mypage")
public class MypageRevController2 {

	private MypageRevService mypageRevService;
	
	@Autowired
	public MypageRevController2(MypageRevService mypageRevService) {
		this.mypageRevService = mypageRevService;
	}
		
	@GetMapping(value="/myHTRev")
	@PreAuthorize("isAuthenticated()")
	public void showMyAirRev(Model model, MypagePagingDTO2 mypagePagingDTO) {
	    
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
	     
 	    model.addAttribute("userId",userId);
 		long rowTotal = mypageRevService.getMyHTRevRowtotal(userId, mypagePagingDTO);
 		System.out.println(rowTotal);
 		
 		MypagePagingCreatorDTO2 mypagePagingCreatorDTO =
				new MypagePagingCreatorDTO2 (rowTotal, mypagePagingDTO);
 		model.addAttribute("mypagePagingCreatorDTO",mypagePagingCreatorDTO);
		
 		
 		if(mypageRevService.notNullHTRev(userId) != 0) {

			model.addAttribute("myHTRevList",mypageRevService.getMyHTRev(userId, mypagePagingDTO));
			model.addAttribute("scope",mypagePagingDTO.getScope());
			model.addAttribute("keyword",mypagePagingDTO.getKeyword());  
 		}else{
 			System.out.println("rowtotal"+ rowTotal+"(= 0)개");
 			model.addAttribute("myHTRevList","resNull");
 		}
		
	}
	
}
