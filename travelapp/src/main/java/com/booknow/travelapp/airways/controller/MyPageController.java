package com.booknow.travelapp.airways.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.airways.mypage.ApiResponse;
import com.booknow.travelapp.airways.mypage.RequestData;
import com.booknow.travelapp.airways.service.MypageService;
import com.booknow.travelapp.common.domain.TLUsers;



@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	//20230703 1452 세연 생성 _  이 컨트롤러는 마이페이지 관련 컨트롤러인데 airways 패키지에다가 임시로 만들었습니다.. ( + views/myPage.jsp 도 ) 나중에 옮길것

	private MypageService mypageService;
	
	//서비스 주입
	@Autowired
	public  MyPageController(MypageService mypageService) {
		this.mypageService = mypageService;
	}
 
	@GetMapping("/myMain")
	@PreAuthorize("isAuthenticated()")
	public void showMypage(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
		
		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);
	}
 
	@GetMapping("/myDetail") //회원정보 수정전 체크 페이지 POST 방식으로 접속했을때 ->어차피 로그인해야해서 get으로함 
	@PreAuthorize("isAuthenticated()")
	public void showMypageDetail(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);

	}
  
	//detail 들어가서 한번더 비밀번호 확인하는 칸 
	@RequestMapping(value = "/myDetail", method = RequestMethod.POST,
		consumes = "application/json;charset=UTF-8", 
		produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Boolean> checkBeforeUser(@RequestBody Map<String, String> requestData,
											Model model) {
		String userId = requestData.get("userId");
		String userPassword = requestData.get("userPassword");
		
		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);
		
		boolean response = mypageService.getUserCheck(userId, userPassword);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	//마이페이지 수정 페이지에 관한 것 
	//detail -> 비밀번호 확인하고 나서 수정페이지이동 
	@PostMapping("/myModify") //회원정보 수정전 체크 페이지 POST 방식으로 접속했을때 ->어차피 로그인해야해서 get으로함 
	//@PreAuthorize("isAuthenticated()")
	public void showMypageModify(Model model) {
		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);
	}
	
	@GetMapping("/myModify") //보안상
	@PreAuthorize("isAuthenticated()")
	public String showAddressGet(Model model) {
		
		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();


		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);
			
		return "redirect:myDetail" ;
	}

 
	//비밀번호 한글자씩 칠때마다 유효성 검사
	@RequestMapping(value = "/checkPw", method = RequestMethod.POST,
		consumes = "application/json;charset=UTF-8", 
		produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ApiResponse checkpw(@RequestBody RequestData requestData,
	                                       Model model) {
 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("user",mypageService.getUser(userId)); 
		model.addAttribute("userId",userId);
			
		String pw1 = requestData.getPw1();
		String pw2 = requestData.getPw2();

		String message ="" ;

		if (pw1.length() < 8 && pw2.length() < 8) {
			message = "비밀번호 길이를 8자 이상으로 입력해주세요.";
		} else if (!pw1.equals(pw2)) {
			message = "비밀번호를 일치시켜주세요.";
		} else {
			message = "사용가능한 비밀번호 입니다.";
		}

		return new ApiResponse(message) ;
	}

	//비밀번호 변경
	@Transactional
	@RequestMapping(value = "/modifyPw", method = RequestMethod.POST,
			consumes = "application/json;charset=UTF-8", 
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Boolean>  modifyPw(@RequestBody TLUsers user, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("userId",userId);

		boolean response = mypageService.modifyPassword(userId, user.getUserPassword());
		model.addAttribute("user",mypageService.getUser(userId)); 
		return new ResponseEntity<Boolean>(response,HttpStatus.OK);
	}

	//이메일 변경
	@Transactional
	@RequestMapping(value = "/modifyEm", method = RequestMethod.POST,
			consumes = "application/json;charset=UTF-8", 
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Boolean> modifyEm(@RequestBody TLUsers user, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
		
		model.addAttribute("userId",userId);
		 
		boolean response = mypageService.modifyEmail(userId, user.getUserEmail()) ;
		model.addAttribute("user",mypageService.getUser(userId)); 
		return new ResponseEntity<Boolean>(response,HttpStatus.OK);
	}

	//주소검색
	//변경
	@Transactional
	@RequestMapping(value = "/modifyAd", method = RequestMethod.POST,
			consumes = "application/json;charset=UTF-8", 
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Boolean> modifyAd(@RequestBody String userAddress, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
		
	
		model.addAttribute("userId",userId);
			
		boolean response = mypageService.modifyAddress(userId, userAddress) ;
		model.addAttribute("user",mypageService.getUser(userId)); 
		return new ResponseEntity<Boolean>(response,HttpStatus.OK);
	}
		
		
	@Transactional
	@RequestMapping(value = "/modifyHp", method = RequestMethod.POST,
			consumes = "application/json;charset=UTF-8", 
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Boolean> modifyHp(@RequestBody String userPhoneNumber, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();

		model.addAttribute("userId",userId);
			
		boolean response = mypageService.modifyUserPhoneNumber(userId,  userPhoneNumber) ;
		model.addAttribute("user",mypageService.getUser(userId)); 
		return new ResponseEntity<Boolean>(response,HttpStatus.OK);
	}
	
}
