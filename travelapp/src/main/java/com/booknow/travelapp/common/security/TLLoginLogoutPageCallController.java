package com.booknow.travelapp.common.security;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.security.auth.SNSLogin;
import com.booknow.travelapp.common.security.auth.SnsVO;
import com.booknow.travelapp.common.service.TLUsersService;

//230706 임지혁 생성

@Controller
public class TLLoginLogoutPageCallController {
	
	@Inject
	private TLUsersService tlUserService;
	
	@Inject
	private SnsVO naverSns;
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/login")
	public String callLoginPage (String error, String logout, Model model) {
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getAuthorizationUrl());
		
		if (error != null) {
			System.out.println("====Login Error Occured====:error:length(): " + error.length());
			System.out.println("====Login Error Occured====:error:hashCode(): " + error.hashCode());
			model.addAttribute("error", "로그인 오류 발생, 아이디 또는 암호를 확인해주세요");
		
		} else if (logout != null) {
			System.out.println("====Logout Completed====:logout:length(): " + logout.length());
			System.out.println("====Logout Completed====:logout:hashCode(): " + logout.hashCode());
			model.addAttribute("logout", "로그아웃되었습니다.");
			
		} else {
			model.addAttribute("normal", "로그인 페이지 호출");
		}
		
		return "/users/tlLogin";
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/auth/{snsService}/callback",
					method = {RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService, 
								  @RequestParam String code, Model model,
								  HttpSession session,
								  HttpServletRequest request) throws Exception {
		
		SnsVO sns = naverSns;
		
		SNSLogin snsLogin = new SNSLogin(sns);
		
		NaverUsers naverUser = snsLogin.getUserProfile(code);
		System.out.println("profile: " + naverUser);
		
		TLUsers tlUser  = tlUserService.getTLUserSnsLoggedIn(naverUser);
		
		if (tlUser != null) {
			model.addAttribute("result", tlUser.getUserId() + "님, 환영합니다.");
			
			//230716 회원가입된 유저 네이버로그인시 강제 로그인처리
		    SecurityContext securityContext = SecurityContextHolder.getContext();
		    
		    //서비스에서 리턴받은 인증객체로 principal change
		    securityContext.setAuthentication(tlUserService.getSnsUserAuthenticate(tlUser));
		    
		    //session = request.getSession(true);
		    
		    // 현재 session에 해당 principal 담긴 securityContext 바인딩
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		    
		} else {
			model.addAttribute("result", naverUser.getNaverName() + "님은 아직 가입되지 않은 사용자입니다.");
			model.addAttribute("result2", "회원가입을 진행해주세요.");
			model.addAttribute("naverUser", naverUser);
			
		}
		
		
		return "/users/tlLoginResult";
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/logout")
	public String callLogoutPage() {
		
		return "/users/tlLogout";
	}
	
	
}
