package com.booknow.travelapp.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booknow.travelapp.hotel.service.HtMainService;

import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;


@AllArgsConstructor
@RequestMapping(value = "/hotel/*")
@Controller
public class HtMainController {

    private HtMainService htMainService;

    @GetMapping(value="/")
    public String showHotelMain(Model model) {

        model.addAttribute("hotelGradeRankList", htMainService.getHotelGradeRankList());
        model.addAttribute("hotelSellRankList", htMainService.getHotelSellRankList());

        return "hotel/main";
    }
    
} // HtMainController end
