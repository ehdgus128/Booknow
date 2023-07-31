package com.booknow.travelapp.hotel.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.booknow.travelapp.hotel.domain.HtResRoomDTO;
import com.booknow.travelapp.hotel.domain.HtResTimeDTO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
import com.booknow.travelapp.hotel.service.HtReservationService;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;



@AllArgsConstructor
@RequestMapping(value = "/hotel/htres/*")
@Controller
public class HtReservationController {

    // 작업자 김영환 2306271203
    // 예약 관련 controller
    private HtReservationService htReservationService;

    // 예약 페이지 호출
    @PreAuthorize(value = "isAuthenticated()")
    @GetMapping(value="/page")
    public void showResPage(HtResRoomDTO htResRoom, Model model) {
        
        String checkInStr = htResRoom.getHtStartDateStr();
        String checkOutStr = htResRoom.getHtEndDateStr();

        // format 객체
        DateFormat tmpFormat = new SimpleDateFormat("yyyy/MM/dd");

        // 달력 객체
        Calendar today = Calendar.getInstance();

        // DTO에서 일자가 null이거나 공백이면 오늘일자 set
        if (checkInStr == null || checkInStr.equals("")) {
            htResRoom.setHtStartDateStr(tmpFormat.format(today.getTime()));
        }

        // DTO에서 일자가 null이거나 공백이면 내일 일자 set
        if (checkOutStr == null || checkOutStr.equals("")) {
            today.add(Calendar.DATE, 1);
            htResRoom.setHtEndDateStr(tmpFormat.format(today.getTime()));
        }

        // 이전 페이지에서 받아온 방번호와 체크인, 체크아웃
        model.addAttribute("htResRoom", htResRoom);

        // 방번호로 호텔과 방정보를 DB에서 전달 받음.
        HtRoomVO room = htReservationService.getTLRoomHotel(htResRoom.getHtRooNo());
        
        //System.out.println("[sys] tlroom : "+ room);

        if (room == null) {
            return;
        }

        model.addAttribute(
            "room", 
            room
        ); // model add
    
    } // showResPage end

    @PreAuthorize(value = "isAuthenticated()")
    @PostMapping(value="/pay")
    public String showPaymentPage(HtResTimeDTO htResTime, Model model) {

        model.addAttribute(
            "htResTime", 
            htReservationService.prePaymentProcess(htResTime)
        );

        return "/hotel/htres/paymentPage";
    }// showPaymentPage end

    @PreAuthorize(value = "isAuthenticated()")
    @GetMapping(value="/result")
    public void showResResult(@RequestParam String result, Model model) {
        System.out.println("[sys] result : "+result);
        model.addAttribute("result", result);
    } // showResResult end
    
    @PreAuthorize(value = "isAuthenticated()")
    @GetMapping(value="/my")
    public void showPayList (
        @RequestParam(value="pageNum", defaultValue = "1") int pageNum,
        Model model
        ) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = ((UserDetails)principal).getUsername();
        model.addAttribute("payList", htReservationService.getUserHtResList(userId, pageNum));
        model.addAttribute("payListPage", htReservationService.getUserHtResListCount(userId, pageNum));
    } // showPayList end

    @PreAuthorize(value = "isAuthenticated()")
    @GetMapping(value="/detail")
    public void showResDetail(
        @RequestParam(value = "htResNo") Long htResNo,
        Model model
        ) {
        model.addAttribute("htResHotelRoom", htReservationService.getResNoSearchHotelRoom(htResNo));
        model.addAttribute("htResDetail", htReservationService.getHtResDetail(htResNo));
    }// showResDetail end
    
}// TLReservationController end
