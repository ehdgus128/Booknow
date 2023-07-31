package com.booknow.travelapp.airways.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingCreatorDTO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO;
import com.booknow.travelapp.airways.mypage.service.MypageRevService;

@Controller
@RequestMapping(value="/mypage")
public class MypageRevController {

	private MypageRevService mypageRevService;
	
	@Autowired
	public MypageRevController(MypageRevService mypageRevService) {
		this.mypageRevService = mypageRevService;
	}
		
	@GetMapping(value="/myAirRev")
	@PreAuthorize("isAuthenticated()")
	public void showMyAirRev(Model model, MypagePagingDTO mypagePagingDTO) {
	    
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("userId",userId);
		long rowTotal = mypageRevService.getRevRowtotal(userId, mypagePagingDTO);

		MypagePagingCreatorDTO mypagePagingCreatorDTO = new MypagePagingCreatorDTO(rowTotal, mypagePagingDTO);
		
		model.addAttribute("mypagePagingCreatorDTO",mypagePagingCreatorDTO);

		if(mypageRevService.notNullAirRev(userId) != 0) {
			model.addAttribute("myAirRevList",mypageRevService.getMyAirRev(userId, mypagePagingDTO));
			model.addAttribute("scope",mypagePagingDTO.getScope());
			model.addAttribute("keyword",mypagePagingDTO.getKeyword()); 
		}else {
			System.out.println("rowtotal"+ rowTotal+"(= 0)개");
			model.addAttribute("myAirRevList","resNull");
		}
	
	}
	
}
