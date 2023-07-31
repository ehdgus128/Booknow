package com.booknow.travelapp.airways.controller;

import java.util.Locale;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingCreatorDTO;
import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingDTO;
import com.booknow.travelapp.airways.service.AirRouteService;

import lombok.AllArgsConstructor;

//230627 임지혁 작성
@Controller
@AllArgsConstructor
@RequestMapping("/airways")
public class AirRouteController {
	private AirRouteService airRouteService;
	
	// 230629 임지혁: nav바 검색창
	// 230701 임지혁: 페이지네이션 추가
	// 230706 임지혁: 파라미터 수정
	
	//검색 초기값 세팅
	@PreAuthorize("permitAll")
	@GetMapping(value = "/tickets")
	public void showAirRouteSearchList(Model model, AirwaysPagingDTO airwaysPaging,
									   @RequestParam(required=false) String depPlandTimeStrInbound) {
		
		if(depPlandTimeStrInbound != null && depPlandTimeStrInbound.length() != 0) {
			model.addAttribute("depPlandTimeStrInbound", depPlandTimeStrInbound);
		}
		
		model.addAttribute("airwaysPaging", airwaysPaging);
	}
	
	
	//상세검색 ajax
	@PreAuthorize("permitAll")
	@PostMapping(value = "/tickets/ajax",
				 consumes = {"application/json; charset=utf-8"},
				 produces = {"application/json; charset=utf-8"})
	@ResponseBody
	public ResponseEntity<AirwaysPagingCreatorDTO> showAirRouteList(@RequestBody AirwaysPagingDTO airwaysPaging) {

		System.out.println("컨트롤러의 airwaysPaging: " + airwaysPaging);
		
		AirwaysPagingCreatorDTO airwaysPagingCreatorAjax = 
				airRouteService.getAirRouteSearchList(new AirwaysPagingDTO(airwaysPaging.getPageNum(),
																		   airwaysPaging.getDepAirportNmStr(),
																		   airwaysPaging.getArrAirportNmStr(),
																		   airwaysPaging.getDepPlandTimeStr(),
																		   airwaysPaging.getDepMin(),
																		   airwaysPaging.getDepMax(),
																		   airwaysPaging.getBoundFlag(),
																		   airwaysPaging.getTotal(),
																		   airwaysPaging.getSeatFlag(),
																		   airwaysPaging.getSortFlag(),
																		   airwaysPaging.getAirlineIdArr()));
		
		
		System.out.println("컨트롤러의 airwaysPagingCreator: " + airwaysPagingCreatorAjax);
		
		return new ResponseEntity<AirwaysPagingCreatorDTO>(airwaysPagingCreatorAjax, HttpStatus.OK);
	}
	
	
	// 230628 임지혁: 항공노선 입력
	// 230717 : com.booknow.travelapp.airways.task.InsertAirRouteScheduler로 이동
	
//	@PreAuthorize("permitAll")
//	@PostMapping("/register")
//	public void registerAirRoute(@RequestParam("depAirportNmInput") String depAirportNmInput,
//								@RequestParam("arrAirportNmInput") String arrAirportNmInput,
//								@RequestParam(value ="depPlandTimeInput", required=false) String depPlandTimeInput,
//								@RequestParam("numOfRows") int numOfRows) {
//		System.out.println("컨트롤러의 registerAirRoute 메서드 호출됨");
//		
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		
//		if (depPlandTimeInput == null || depPlandTimeInput.length() == 0) {
//			depPlandTimeInput = simpleDateFormat.format(new Date());
//		}
//		
//		AirRouteVO airRouteVO = null;
//		
//		try {
//			airRouteVO = new AirRouteVO(depAirportNmInput, 
//										arrAirportNmInput, 
//									    simpleDateFormat.parse(depPlandTimeInput));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		// 230702 임지혁: 날짜별 전 항공노선 입력
//		if (depAirportNmInput.isEmpty() || arrAirportNmInput.isEmpty()) {
//			try {
//				airRouteService.insertAirRouteUsingPermutation(simpleDateFormat.parse(depPlandTimeInput), numOfRows);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			System.out.println("날짜별 전 노선 insert 메서드 실행됨");
//		} else {
//			System.out.println(airRouteService.registerAirRoute(airRouteVO, numOfRows) + " 행 insert됨");
//		}
//		
//	}

		
	//노선 좌석 수 변경
	@GetMapping("/modifyCnt")
	public String modifyRouteSeatCnt(long airRouteno, long seatCnt, RedirectAttributes rttr) {
		
		if (airRouteService.modifyAirRouteSeatCnt(airRouteno, seatCnt)) {
			System.out.println("successModify");
			rttr.addFlashAttribute("result", "successModify");
		} else {
			rttr.addFlashAttribute("result", "failedModify");
		}
		
		return "redirect:/airways/tickets";
		
	}
	
	
	//노선 삭제
	@GetMapping("/remove")
	public String removeAirRoute(long airRouteno, RedirectAttributes rttr) {
		
		if (airRouteService.deleteAirRoute(airRouteno)) {
			rttr.addFlashAttribute("result", "successRemove");
		} else {
			rttr.addFlashAttribute("result", "failedRemove");
		}
		
		return "redirect:/airways/tickets";
	}
	
	
	@GetMapping("/")
	public String main(Locale locale,Model model) {
		
		model.addAttribute("airGradeRankList", airRouteService.getAirGradeRankList());
		model.addAttribute("airLowPrice", airRouteService.getAirLowPrice());
		
		return "/airways/main";
	}
	
}
