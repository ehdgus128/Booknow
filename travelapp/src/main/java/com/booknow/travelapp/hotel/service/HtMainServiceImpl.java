package com.booknow.travelapp.hotel.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.hotel.domain.HtHotelRankVO;
import com.booknow.travelapp.hotel.mapper.HtMainMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Primary
@Service
public class HtMainServiceImpl implements HtMainService{

    private HtMainMapper htMainMapper;

    @Override
    public List<HtHotelRankVO> getHotelGradeRankList() {
        return htMainMapper.selectHotelGradeRankList();
    }

    @Override
    public List<HtHotelRankVO> getHotelSellRankList() {
        return htMainMapper.selectHotelSellRankList();
    }

}// service end
