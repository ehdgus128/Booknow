package com.booknow.travelapp.hotel.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.hotel.domain.HtResTimeDTO;
import com.booknow.travelapp.hotel.domain.HtRoomSellDateListDTO;
import com.booknow.travelapp.hotel.domain.HtRoomSellDateVO;
import com.booknow.travelapp.hotel.service.HtReservationService;

import lombok.AllArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RequestMapping(value = "/hotel/htresr/*")
@AllArgsConstructor
@RestController
public class HtReservationRestController {

    // 작업자 김영환 2306301959
    // 예약 관련 Restcontroller

    private HtReservationService htReservationService;
    
    // 예약가능한 방 일자 반환
    @PreAuthorize("isAuthenticated()")
    @GetMapping(
        value="/date/{htRooNo}",
        produces = "application/json; charset=utf-8"
    )
    public ResponseEntity<HtRoomSellDateListDTO> getRoomSellDate(@PathVariable("htRooNo") Long htRooNo) {

        System.out.println("[sys] RestController : htRooNo" + htRooNo);

        return ResponseEntity.ok().body(new HtRoomSellDateListDTO(htReservationService.getHtRoomSellDateResAble(htRooNo)));
    }

    // 유저 정보 반환
    @PreAuthorize("isAuthenticated()")
    @GetMapping(
        value="/user/{userId}",
        produces = "application/json; charset=utf-8"
    )
    public ResponseEntity<TLUsers> getUserData(@PathVariable("userId") String userId) {
        return ResponseEntity.ok(htReservationService.getUserData(userId));
    }

    // 에약 총액 반환
    @PreAuthorize("isAuthenticated()")
    @PostMapping(
        value="/totalpay",
        consumes = "application/json; charset=utf-8",
        produces = "application/json; charset=utf-8"
    )
    public ResponseEntity<HtRoomSellDateVO> getResTotalPrice(@RequestBody HtResTimeDTO htResTime) {

        System.out.println("[sys] rest 1 : "+htResTime.getHtResCheckInStr());
        System.out.println("[sys] rest 2 : "+htResTime.getHtResCheckOutStr());
        
        return ResponseEntity.ok(htReservationService.getResTotalPrice(htResTime));
    }
    
    // 결제 완료 프로세스 
    @PreAuthorize(value = "isAuthenticated()")
    @PostMapping(
        value="/pay/success",
        consumes = "application/json; charset=utf-8",
        produces = "application/json; charset=utf-8"
    )
    public ResponseEntity<HtResTimeDTO> paymentSuccess(@RequestBody HtResTimeDTO htResTime) {

        System.out.println("[sys] htResTime : "+htResTime);
        boolean result = htReservationService.paymentSuccessProcess(htResTime);

        htResTime.setResult(result);
        return ResponseEntity.ok(htResTime);
    }// paymentSuccess end
    
    // 결제 취소 
    @PreAuthorize(value = "isAuthenticated()")
    @PostMapping(
        value="/pay/cancel",
        consumes = "application/json; charset=utf-8",
        produces = "application/json; charset=utf-8"
    )
    public ResponseEntity<HtResTimeDTO> paymentCancel(@RequestBody HtResTimeDTO htPay) {
    	
    	System.out.println(htPay.getSellId());
    	
        // 취소 서비스
        boolean result = htReservationService.payCancelProcess(htPay.getSellId());

        // 취소 결과 
        htPay.setResult(result);

        return ResponseEntity.ok(htPay);
    } // paymentCancel end
    
} // HtReservationRestController end
