package com.booknow.travelapp.airways.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.booknow.travelapp.airways.domain.AirPassengersListDTO;
import com.booknow.travelapp.airways.domain.AirReservationsVO;
import com.booknow.travelapp.airways.service.AirReservationsService;

import lombok.AllArgsConstructor;

//230628 1303 동현 수정
@Controller
@AllArgsConstructor
@RequestMapping("/airways")
public class AirReservationsController {
	
	private AirReservationsService airReservationsService ;
	
	// 고객이 선택한 항공편 정보 조회 + 예약자 정보 조회
	@GetMapping("/book")
	@PreAuthorize("isAuthenticated()")
	public void showChoicedFlight(Model model, AirReservationsVO airReservationsVO,
								  @RequestParam("routeno1") String routeno1,
								  @RequestParam("routeno2") String routeno2,
								  @RequestParam("boundFlag") String boundFlag,
								  @RequestParam("total") String total,
								  @RequestParam("res_seatFlag") List<String> res_seatFlag){
		
		long airResno1 = 0 ;
		long airResno2 = 0 ;
		
		boolean roundFlag ;
		
		if(boundFlag.equals("onewayFlag")) {
			
			airResno1 = Long.parseLong(routeno1) ;
			roundFlag = false ;
			
			model.addAttribute("airResno1", airResno1) ;
			model.addAttribute("roundFlag", roundFlag) ;
		}else {
			
			airResno1 = Long.parseLong(routeno1) ;
			airResno2 = Long.parseLong(routeno2) ;
			roundFlag = true ;
			
			model.addAttribute("airResno1", airResno1) ;
			model.addAttribute("airResno2", airResno2) ;
			model.addAttribute("roundFlag", roundFlag) ;
		}
		
		//탑승자 인원
		int peopleCnt = Integer.parseInt(total) ;
		
		//현재 로그인한 사용자의 Id값
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		
		
		model.addAttribute("airClass", res_seatFlag);
		
		
		if(roundFlag) { 
			
			model.addAttribute("twowayRes1", 
					airReservationsService.getAirReservationsInfo(airResno1));
			
			model.addAttribute("twowayRes2", 
					airReservationsService.getAirReservationsInfo(airResno2));
			
		}else {
			
			model.addAttribute("onewayRes", airReservationsService.getAirReservationsInfo(airResno1));
		}
		
		model.addAttribute("userInfo", airReservationsService.getUserInfo(username)) ;
	
		
		model.addAttribute("peopleCnt", peopleCnt);
		
	
	}
		
// 탑승객 정보 입력 + 최종 예약정보 확인 (결제페이지)
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/payment")
	public void registerFinalInfo(AirPassengersListDTO airPass,
								  Model model) {
		
		model.addAttribute("airPass", airReservationsService.prePayment(airPass));
		
	}
		

	//결제완료 후 
	@PostMapping(
			value = "/pay/success",
			consumes = "application/json; charset=utf-8",
			produces = "application/json; charset=utf-8")
	public ResponseEntity<AirPassengersListDTO> paySuccess(@RequestBody AirPassengersListDTO airPass) {
	
		airReservationsService.afterPayment(airPass);
		AirPassengersListDTO result = new AirPassengersListDTO();
		result.setResult("success");
		return ResponseEntity.ok(result);
		
	}
	

	//결제취소요청 
	@PostMapping(
			value = "/pay/cancel",
			consumes = "application/json; charset=utf-8",
			produces = "application/json; charset=utf-8")
	public ResponseEntity<AirPassengersListDTO> payCancel(@RequestBody AirPassengersListDTO airPass) {
	

		System.out.println("결제취소Ajax 실행됨===========");
		
		airReservationsService.cancelPayment(airPass) ;
		
		AirPassengersListDTO result = new AirPassengersListDTO();
		result.setResult("success");
		return ResponseEntity.ok(result);
		
	}
		
}
