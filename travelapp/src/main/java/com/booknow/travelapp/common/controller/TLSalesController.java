package com.booknow.travelapp.common.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booknow.travelapp.common.domain.TLSalesListDTO;
import com.booknow.travelapp.common.domain.TLSalesVO;
import com.booknow.travelapp.common.service.TLSalesService;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@RequestMapping(value = "/admin")
@Controller
public class TLSalesController {
    // 230705 0040 동현 작성

    private TLSalesService salesService;
    
    
    @PostMapping(value = "/monthlySales2",
    		produces = "application/json; charset=utf-8")
	@PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<TLSalesListDTO> showList(@RequestBody TLSalesVO selectedYear) {
    	
    	System.out.println("controller의 showList 메서드실행==============");

    	
    	return ResponseEntity.ok(salesService.getMonthlySales(selectedYear));
    }
    
    //월별 매출 조회
    @GetMapping("/monthlySales")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showMonthlySales(Model model, TLSalesVO salesVO){
    } // showMonthlySales 메서드 end
    
    //분기별 매출 조회
    @GetMapping("/quarterlySales")
	@PreAuthorize("hasAuthority('ADMIN')")
    public void showQuarterlySales(Model model, TLSalesVO salesVO) {
    } // showQuarterlySales 메서드 end

} //class-end