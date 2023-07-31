package com.booknow.travelapp.common.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.common.domain.AdminFlightBuyRouteVO;
import com.booknow.travelapp.common.domain.AdminFlightPurchaseVO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingCreateDTO;
import com.booknow.travelapp.common.domain.paging.AmFlightPurchasePagingDTO;
import com.booknow.travelapp.common.service.AdminFlightPurchaseListService;

import lombok.AllArgsConstructor;

@RequestMapping("/admin/airways")
@AllArgsConstructor
@Controller
public class AdminFlightPurchaseListController {
	
	private AdminFlightPurchaseListService adminFlightPurchaseListService;
	
	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping("/list")
	public void showAirRouteList(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO, Model model){
		
		System.out.println(amFlightPurchasePagingDTO.getKeyword());
		
		model.addAttribute("RouteList",adminFlightPurchaseListService.getAirRouteList(amFlightPurchasePagingDTO));
		
		Long rowTotal = adminFlightPurchaseListService.getAirRouteListTotal(amFlightPurchasePagingDTO);
		AmFlightPurchasePagingCreateDTO amFlightPurchaseCPagingCreateDTO = new AmFlightPurchasePagingCreateDTO(rowTotal, amFlightPurchasePagingDTO);
		
		System.out.println(":" + amFlightPurchaseCPagingCreateDTO);
		
		model.addAttribute("pagingCreator", amFlightPurchaseCPagingCreateDTO);
		
	}
	
	@PreAuthorize("hasAuthority('ADMIN')")
	@PostMapping("/modify")
	public String modifyAirRoute(AdminFlightBuyRouteVO adminFlightBuyRouteVO,
								 AdminFlightPurchaseVO adminFlightPurchaseVO,
								 AmFlightPurchasePagingDTO amFlightPurchasePagingDTO,
								 RedirectAttributes rtts) {
		
		System.out.println("adminFlightBuyRouteVO==========="+adminFlightBuyRouteVO);
		System.out.println("adminFlightPurchaseVO==========="+adminFlightPurchaseVO);
		
		if(adminFlightPurchaseListService.modifyAirRoute(adminFlightPurchaseVO)) {
			rtts.addFlashAttribute("result","success");
		} else {
			rtts.addFlashAttribute("result","fail");
		}
		
		if(adminFlightPurchaseListService.modifyAirRouteBuy(adminFlightBuyRouteVO)) {
			rtts.addFlashAttribute("result","Buysuccess");
		} else {
			rtts.addFlashAttribute("result","Buyfail");
		}
		
		rtts.addAttribute("airRouteno",adminFlightPurchaseVO.getAirRouteno());
		rtts.addAttribute("airRouteno",adminFlightBuyRouteVO.getAirRouteno());
		
		return "redirect:/admin/airways/list";
	}
	
	@PreAuthorize("hasAuthority('ADMIN')")	
	@PostMapping("/remove")
	public String removeAirRouteList(long airRouteno,
									 RedirectAttributes rtts,
									 AmFlightPurchasePagingDTO amFlightPurchaseDto) {
		
		System.out.println("airRouteno================="+airRouteno);
		if(adminFlightPurchaseListService.removeAirRouteBuy(airRouteno) && adminFlightPurchaseListService.removeAirRoute(airRouteno)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:/admin/airways/list";		
	}

}
