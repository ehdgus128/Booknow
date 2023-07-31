package com.booknow.travelapp.hotel.mapper;

import java.util.List;

import com.booknow.travelapp.hotel.domain.HtHotelRankVO;

public interface HtMainMapper {

    // 호텔 평점 랭크
    List<HtHotelRankVO> selectHotelGradeRankList();

    // 호텔 판매 랭크
    List<HtHotelRankVO> selectHotelSellRankList();
    
}// mapper end
