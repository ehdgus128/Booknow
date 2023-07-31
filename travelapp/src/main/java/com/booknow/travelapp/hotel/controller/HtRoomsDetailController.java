package com.booknow.travelapp.hotel.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.domain.HtRoomListPagingDTO;
import com.booknow.travelapp.hotel.service.HtRoomsDetailService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/hotel/rooms/*")

// 2307052152 장유정 코드 수정
public class HtRoomsDetailController{
	
	private HtRoomsDetailService hotelRoomsDetailService;

	// 호텔의 방리스트 jsp 호출 메소드
	@GetMapping("/list")
	public void showRoomsDetailList(HotelVO hotel, Model model) {
	    System.out.println("컨트롤러 - 객실 목록 및 호텔 정보 조회...");
	    
		String checkIn = hotel.getHtStartDateStr();
		String checkOut = hotel.getHtEndDateStr();

	    Long htNo = hotel.getHtNo();
	    
        // format 객체
        DateFormat tmpFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 달력 객체
        Calendar today = Calendar.getInstance();

        // DTO에서 일자가 null이거나 공백이면 오늘일자 set
        if (checkIn == null || checkIn.equals("")) {
        	hotel.setHtStartDateStr(tmpFormat.format(today.getTime()));
        }

        // DTO에서 일자가 null이거나 공백이면 내일 일자 set
        if (checkOut == null || checkOut.equals("")) {
            today.add(Calendar.DATE, 1);
            hotel.setHtEndDateStr(tmpFormat.format(today.getTime()));
        }
	    
	    HotelVO sevHotel = hotelRoomsDetailService.getHotelData(htNo);
	    
	    sevHotel.setHtStartDateStr(checkIn);
	    sevHotel.setHtEndDateStr(checkOut);
	    
		// 호텔정보
	    model.addAttribute("hotel", sevHotel);
	}// showRoomsDetailList end

	// 호텔의 방리스트 ajax 통신 메소드
	@GetMapping("/list/re/{pageNum}")
	@ResponseBody
	public ResponseEntity<HtRoomListPagingDTO> getHotelRoomList(
			@PathVariable("pageNum") Integer pageNum,
			HotelVO hotelVO
		){

		String checkIn = hotelVO.getHtStartDateStr();
		String checkOut = hotelVO.getHtEndDateStr();
		Long htNo = hotelVO.getHtNo();

		System.out.println("[sys] checkIn : "+checkIn);
		System.out.println("[sys] checkOut : "+checkOut);
		System.out.println("[sys] htNo : "+htNo);

        // format 객체
        DateFormat tmpFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 달력 객체
        Calendar today = Calendar.getInstance();

        // DTO에서 일자가 null이거나 공백이면 오늘일자 set
        if (checkIn == null || checkIn.equals("")) {
            hotelVO.setHtStartDateStr(tmpFormat.format(today.getTime()));
        }

        // DTO에서 일자가 null이거나 공백이면 내일 일자 set
        if (checkOut == null || checkOut.equals("")) {
            today.add(Calendar.DATE, 1);
            hotelVO.setHtEndDateStr(tmpFormat.format(today.getTime()));
        }
		
		HtRoomListPagingDTO roomList = new HtRoomListPagingDTO();

		roomList.setHtRoomList(hotelRoomsDetailService.getListPaging(hotelVO, pageNum));
		roomList.setPagingCreator(hotelRoomsDetailService.getRoomTotal(hotelVO, pageNum));
		
		return ResponseEntity.ok(roomList);	
	}// getHotelRoomList end

	

} // HtRoomsDetailController end

