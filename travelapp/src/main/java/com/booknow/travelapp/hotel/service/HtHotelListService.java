package com.booknow.travelapp.hotel.service;

import java.util.List;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HotelVO;

//작업자:정지은
//230703 호텔리스트 서비스
public interface HtHotelListService {
	
	//호텔리스트 조회
	public List<HotelVO> getHotelList(HotelVO hotel,int currentPage);
	
	//호텔 총 수
	public TLHotelListPageDTO getRowAmountTotal(HotelVO hotel, int currentPage);
	
	//첨부파일조회 (호텔)
	public TLHotelAttachFilesVO showImageOfHotel(Long htNo);
	
	//첨부파일조회 (객실)
	public TLRoomAttachFilesVO showImageOfRoom(Long htRooNo);
	
}
