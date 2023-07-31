package com.booknow.travelapp.hotel.service;

import java.util.List;

import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
//202307052154 장유정 - 수정
public interface HtRoomsDetailService {

	//객실 목록 조회
	public HotelVO getHotelData(Long htNo);
	
	
	//페이징 처리를 위한 호텔 방의 리스트 
	public List<HtRoomVO> getListPaging(HotelVO hotelVO, int currentPage);

	// 호텔의 방 총 갯수
	public TLHotelListPageDTO getRoomTotal(HotelVO hotelVO, Integer currentPage);
	
}// service end
