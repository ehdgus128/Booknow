package com.booknow.travelapp.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

//230705 임지혁 생성

@Controller
public class TLErrMsgController {

	@GetMapping("/accessForbiddenError")
	public String callAccessForbiddenPage(String tlAccessDeniedMsg,
										  Authentication authentication, 
										  Model model) {
		
		System.out.println("전달된 authentication: " + authentication);
		model.addAttribute("tlAccessDeniedMsg", tlAccessDeniedMsg);
		
		return "/users/err_msg/tlAccessForbiddenMsg";
	}
	
	
}
