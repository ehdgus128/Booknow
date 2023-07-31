package com.booknow.travelapp.common.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.booknow.travelapp.common.domain.TLAuthoritys;
import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.service.TLUsersMailSendService;
import com.booknow.travelapp.common.service.TLUsersService;

import lombok.AllArgsConstructor;

//230705 임지혁 생성

@Controller
@AllArgsConstructor
public class TLUsersController {
	private TLUsersService tlUsersService;
	private PasswordEncoder pwEncoder;
	private TLUsersMailSendService mailSendService;
	
	//회원가입 페이지 호출
	@PreAuthorize("isAnonymous()")
	@GetMapping("/join")
	public String showTLUserRegisterPage(NaverUsers naverUser, 
										 Model model) {
		
		if (naverUser.getNaverId() == null) {
			
			model.addAttribute("naverUser", null);
			
		} else {
			
			model.addAttribute("naverUser", naverUser);
		}
		
		
		return "/users/join";
	}
	
	
	// 회원 가입
	@Transactional
	@PreAuthorize("isAnonymous()")
	@PostMapping("/join")
	public String registerTLUser(TLUsers user, Model model) {
		
		user.setUserMileage(1000);
		user.setUserPassword((pwEncoder.encode(user.getUserPassword())));
		
		boolean resultFlag = tlUsersService.registerTLUser(user);
		model.addAttribute("resultFlag", resultFlag);
		
		if (resultFlag) {
			
			String userId = user.getUserId();
			
			if (tlUsersService.registerAuthoritys(new TLAuthoritys(userId, "USER", null))) {
				model.addAttribute("userId", userId);
			}
			
		}	
		
		return "/users/welcome";
	}
	
	
	//아이디 중복 체크
	@PreAuthorize("isAnonymous()")
	@PostMapping("/users/idcheck")
	@ResponseBody
	public ResponseEntity<String> getIdDupCheck(String userId) {
		
		return new ResponseEntity<String>(tlUsersService.getDupId(userId), HttpStatus.OK);
	}
	
	
	//회원가입 인증 이메일 전송
	@GetMapping(value = "/users/emailcheck")
	@ResponseBody
	public ResponseEntity<String> getEmailAuthCheck(String email) {
		
		System.out.println(email + "인증 요청 from /join");
		
		return new ResponseEntity<String>(mailSendService.authEmailForm(email), HttpStatus.OK);
	}
	
	@PostMapping("/users/ecodecheck")
	@ResponseBody
	public ResponseEntity<String> getEcodeAuthCheck(String eCode) {
		
		return new ResponseEntity<String>(mailSendService.getEcodeAuthCheck(eCode), HttpStatus.OK);
	}
	
	
	//비밀번호 찾기 페이지
	@PreAuthorize("isAnonymous()")
	@GetMapping("/users/findpw")
	public void findPw() {
		
	}
	
	
	// 임시 비밀번호 발급 이메일 전송
	@Transactional
	@PreAuthorize("isAnonymous()")
	@PostMapping(value = "/users/findpw",
				 consumes = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String>findPwAjax(@RequestBody Map<String, Object> userIdAndEmail) {
		System.out.println("컨트롤러의 findPwAjax 메서드 호출됨");
		
		String userId = (String) userIdAndEmail.get("userId");
		String userEmail = (String) userIdAndEmail.get("userEmail");
		
		TLUsers tlUser = tlUsersService.getTLUser(userId);
		System.out.println("tlUser: " + tlUser.toString());
		
		if (userEmail.equals(tlUser.getUserEmail())) {
			
			tlUser.setUserPassword(pwEncoder.encode(mailSendService.findPwEmailForm(userEmail)));
			
			if (tlUsersService.modifyTLUserPw(tlUser)) {
				
				return new ResponseEntity<String>("success", HttpStatus.OK);
			}
			
		} 
			
		return new ResponseEntity<String>("failed", HttpStatus.OK);
	
	}
	
	
	//아이디 찾기 페이지
	@PreAuthorize("isAnonymous()")
	@GetMapping("/users/findid")
	public void findId() {
		
	}
	
	
	
	// 가입 아이디 찾기
	@Transactional
	@PreAuthorize("isAnonymous()")
	@PostMapping(value = "/users/findid",
				 consumes = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String>findIdAjax(@RequestBody Map<String, Object> userNameAndEmail) {
		System.out.println("컨트롤러의 findIdAjax 메서드 호출됨");
		
		String userName = (String) userNameAndEmail.get("userName");
		String userEmail = (String) userNameAndEmail.get("userEmail");
		
		System.out.println("userName: " + userName);
		System.out.println("userEmail: " + userEmail);
		
		String userId = tlUsersService.getTLUserId(userName, userEmail);
		
		if (userId == null || userId.length() == 0) {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
			
		}
			
		return new ResponseEntity<String>(userId, HttpStatus.OK);
	
	}
	
	
}
