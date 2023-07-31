package com.booknow.travelapp.common.controller;

import java.time.LocalDate;
import java.util.HashMap;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booknow.travelapp.common.domain.AdminManagerBoardVO;
import com.booknow.travelapp.common.domain.TLSalesVO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingCreateDTO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingDTO;
import com.booknow.travelapp.common.service.AdminManagerBoardService;
import com.booknow.travelapp.common.service.QNAnswerService;
import com.booknow.travelapp.common.service.TLSalesService;

import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PostMapping;


@AllArgsConstructor
@RequestMapping(value = "/admin/*")
@Controller
public class AdminController {
    // 관리자 페이지 controller

    private AdminManagerBoardService managerBoardService;
	private QNAnswerService answerService;
    private TLSalesService salesService;

    // 관리자 메인 페이지 호출
    @GetMapping(value="/home")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showAdminHome(AmBoardPagingDTO amBoardPaging, TLSalesVO selectedYear, Model model) {

        model.addAttribute("noticeList", managerBoardService.getManagerBoardList(amBoardPaging));
        model.addAttribute("TotalDifference", answerService.getRowTotalDifference());

        Long rowTotal = managerBoardService.getRowTotal();
        AmBoardPagingCreateDTO amBoardPagingCreate = new AmBoardPagingCreateDTO(amBoardPaging, rowTotal);

        model.addAttribute("noticePaging", amBoardPagingCreate);
        
		
        //올해 총 매출순이익 조회
		LocalDate now = LocalDate.now();
		
		String nowYear = String.valueOf(now.getYear());
        
		selectedYear.setSelectedYear(nowYear) ;
        
        long totalSales = 0 ;
    	
    	for(HashMap<String, Object> airSales : salesService.getMonthlySales(selectedYear).getAirSalesList()) {
    		long monthlySales = Long.parseLong(String.valueOf(airSales.get("MONTHLYSALES")));
    		
    		totalSales += monthlySales ;
    								
    	}
    	
    	for(HashMap<String, Object> htSales : salesService.getMonthlySales(selectedYear).getHtSalesList()) {
    		long monthlySales = Long.parseLong(String.valueOf(htSales.get("MONTHLYSALES")));
    		
    		totalSales += monthlySales ;
    								
    	}
    	
    	model.addAttribute("totalSales", totalSales) ;
        
        return;
    }// getMethodName end

    // 관리자 공지사항 등록 페이지 호출
    @GetMapping(value="/register")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showRegisterNotice() {
    }

    // 관리자 공지사항 등록
    @PostMapping(value="/register")
	@PreAuthorize("hasAuthority('ADMIN')")
    public String registerNotice(AdminManagerBoardVO adminManagerBoard, RedirectAttributes rtts) {

        System.out.println("[sys] adminManagerBoard : "+ adminManagerBoard);

        Long tmBno = managerBoardService.registerManagerBoard(adminManagerBoard);

        rtts.addFlashAttribute("result", tmBno);
        
        return "redirect:/admin/home";
    }
    
    // 관리자 공지사항 상세 페이지
    @GetMapping(value="/detail")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showNotice(Long tmBno, AmBoardPagingDTO amBoardPaging, Model model) {
        model.addAttribute("notice", managerBoardService.getManagerBoard(tmBno));
        model.addAttribute("noticePaging", amBoardPaging);
    }
    
    // 관리자 공지사항 수정 페이지 호출
    @GetMapping(value="/modify")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showModifyNotice(Long tmBno, AmBoardPagingDTO amBoardPaging, Model model) {
        model.addAttribute("notice", managerBoardService.getManagerBoard(tmBno));
        model.addAttribute("noticePaging", amBoardPaging);
    }
    
    // 관리 공지사항 수정
    @PostMapping(value="/modify")
	@PreAuthorize("hasAuthority('ADMIN')")
    public String modifyNotice(AdminManagerBoardVO adminManagerBoard, AmBoardPagingDTO amBoardPaging, RedirectAttributes rtts) {

        rtts.addAttribute("tmBno", adminManagerBoard.getTmBno());
        rtts.addFlashAttribute("result", "modifyfalse");
        if (managerBoardService.modifyManagerBoard(adminManagerBoard)) { // service
            rtts.addFlashAttribute("result", "modifytrue");
        }
        return "redirect:/admin/detail"+amBoardPaging.addPagingParmsToURI();
    }
    
    // 관리자 공지사항 삭제 요청
    @PostMapping(value="/delete")
	@PreAuthorize("hasAuthority('ADMIN')")
    public String requestDeletedNotice(Long tmBno, AmBoardPagingDTO amBoardPaging, RedirectAttributes rtts) {
        rtts.addFlashAttribute("result", "deletefalse");
        if (managerBoardService.modifyManagerBoardDelFlag(tmBno)) { // service
            rtts.addFlashAttribute("result", "deletetrue");
        }
        return "redirect:/admin/home" + amBoardPaging.addPagingParmsToURI();
    }
    
    // 관리자 공지사항 삭제
    @PostMapping(value="/remove")
	@PreAuthorize("hasAuthority('ADMIN')")
    public String removeDelFlagAllNotice(Long tmBno, AmBoardPagingDTO amBoardPaging, RedirectAttributes rtts) {
        rtts.addFlashAttribute("result", "removefalse");
        if (managerBoardService.removeManagerBoardDelFlagAll()) { // service
            rtts.addFlashAttribute("result", "removetrue");
        }
        return "redirect:/admin/home";
    }
    
}// AdminController end