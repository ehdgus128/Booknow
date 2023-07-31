package com.booknow.travelapp.common.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.booknow.travelapp.airways.service.AirRouteService;
import com.booknow.travelapp.community.service.TLCommunityService;
import com.booknow.travelapp.hotel.service.HtMainService;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
public class HomeController {
	
	private HtMainService htMainService;
	private AirRouteService airRouteService;
	private TLCommunityService communityService;

	@GetMapping(value = "/")
	public String home(Locale locale, Model model) {
		
		// 호텔 평점 랭킹 top 5 
		model.addAttribute("hotelGradeRankList", htMainService.getHotelGradeRankList());

		// 항공사 평점 top 5
		model.addAttribute("airGradeRankList", airRouteService.getAirGradeRankList());

		// 커뮤니티 최신글 10개
		model.addAttribute("comBoardList", communityService.getCommuBoardListMain(null, 1));
		
		return "home";
	}// home
	
}// HomeController
