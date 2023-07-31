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
import com.booknow.travelapp.common.service.AdminFlightPurchaseService;

import lombok.AllArgsConstructor;

@RequestMapping("/admin/airways")
@AllArgsConstructor
@Controller
public class AdminFlightPurchaseController {
	
	private AdminFlightPurchaseService adminFlightPurchaseService;
	

	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping("/airpurchas")
	public void showAirRoute(AmFlightPurchasePagingDTO amFlightPurchasePagingDTO, Model model){
		
		model.addAttribute("airRouteBuyList",adminFlightPurchaseService.getAirRouteBuyList(amFlightPurchasePagingDTO));
		
		Long rowTotal = adminFlightPurchaseService.getBuyRouteTotal();
		AmFlightPurchasePagingCreateDTO amFlightPurchaseCPagingCreateDTO = new AmFlightPurchasePagingCreateDTO(rowTotal, amFlightPurchasePagingDTO);
		
		System.out.println(":" + amFlightPurchaseCPagingCreateDTO);
		
		model.addAttribute("pagingCreator", amFlightPurchaseCPagingCreateDTO);
		
	}
	
	@PreAuthorize("hasAuthority('ADMIN')")	
	@GetMapping("/detail")
	public void showRoute(Long airRouteno,Model model,AmFlightPurchasePagingDTO amFlightPurchasePagingDTO) {
		
		System.out.println("detail:" + airRouteno);
		
		model.addAttribute("Route",adminFlightPurchaseService.getRoute(airRouteno));
		model.addAttribute("amFlightPurchasePagingDTO",amFlightPurchasePagingDTO);
	}
	
	@PreAuthorize("hasAuthority('ADMIN')")
	@PostMapping("/Register")
	public String registerAirRouteBuy(AdminFlightPurchaseVO adminFlightPurchaseVO,
									  AdminFlightBuyRouteVO adminFlightBuyRouteVO,
									  RedirectAttributes rtts) {
		
		System.out.println("=================================" + adminFlightBuyRouteVO);
		System.out.println("=================================" + adminFlightPurchaseVO);
		
		
		long airRouteno = adminFlightPurchaseService.registerAirRoute(adminFlightPurchaseVO);
		long airRoute = adminFlightPurchaseService.registerAirRouteBuy(adminFlightBuyRouteVO);
		
		rtts.addFlashAttribute("result", airRouteno);
		rtts.addFlashAttribute("result", airRoute);
		
		return "redirect:/admin/airways/airpurchas";
	}
	
	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping(value = "/Register")
	public void showRegisterAirRouteBuy() {
	}
	
//

}
