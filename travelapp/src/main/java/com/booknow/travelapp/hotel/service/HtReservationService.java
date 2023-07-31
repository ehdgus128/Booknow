package com.booknow.travelapp.hotel.service;

import java.util.List;

import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HtResTimeDTO;
import com.booknow.travelapp.hotel.domain.HtReservationVO;
import com.booknow.travelapp.hotel.domain.HtRoomSellDateVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
import com.booknow.travelapp.hotel.domain.HtSellTransVO;

// hotel service interface
public interface HtReservationService { // 작업자 김영환 2306271208

    // 방과 호텔 정보 
    public HtRoomVO getTLRoomHotel(Long htRooNo);

    // 예약가능한 방의 예약일자
    public List<HtRoomSellDateVO> getHtRoomSellDateResAble(Long htRooNo);

    // 유저 정보 읽어오기
    public TLUsers getUserData(String userId);

    // 선택한 기간에 대한 유저 입장 구매 총액
    public HtRoomSellDateVO getResTotalPrice(HtResTimeDTO htResTime);

    // 결제 사전 작업
    public HtResTimeDTO prePaymentProcess(HtResTimeDTO htResTime);

    // 결제 성공
    public boolean paymentSuccessProcess(HtResTimeDTO htResTime);

    // 결제 취소
    public boolean payCancelProcess(String sellId);

    // 나의 예약 리스트
    // 나의 결제 리스트
    public List<HtSellTransVO> getUserHtResList(String userId, int currentPage);

    // 결제 리스트 페이징을 위한 함수
    public TLHotelListPageDTO getUserHtResListCount(String userId, int currentPage);

    // 나의 예약 상세
    public HtReservationVO getHtResDetail(Long htResNo);

    // 나의 예약 번호로 방과 호텔 정보 검색
    public HtRoomVO getResNoSearchHotelRoom(Long htResNo);
    
}// interface end
