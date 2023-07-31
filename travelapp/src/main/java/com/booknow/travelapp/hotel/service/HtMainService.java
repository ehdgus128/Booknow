package com.booknow.travelapp.hotel.service;

import java.util.List;

import com.booknow.travelapp.hotel.domain.HtHotelRankVO;

public interface HtMainService {
    
    // 호텔 랭크
    List<HtHotelRankVO> getHotelGradeRankList();

    // 호텔 판매 랭크
    List<HtHotelRankVO> getHotelSellRankList();

}// interface end
