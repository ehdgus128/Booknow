package com.booknow.travelapp.hotel.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;


//202307052154 장유정 - 수정
public interface HtRoomsDetailMapper {
	
	//호텔 정보
	public HotelVO selectHotelData(Long htNo);
	
	//페이징 처리를 위한 특정 호텔의 방리스트 
    public List<HtRoomVO> selectRoomListPaging(HotelVO hotelVO, RowBounds rowBounds);

    // 호텔의 방 총 갯수
    public Integer selectRoomTotal(HotelVO hotelVO);
	    
}// mapper end
