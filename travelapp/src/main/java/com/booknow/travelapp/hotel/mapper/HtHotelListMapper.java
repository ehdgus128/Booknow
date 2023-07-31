package com.booknow.travelapp.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.hotel.domain.HotelVO;

//정지은 호텔리스트 mapper interface 
public interface HtHotelListMapper { 

	//호텔리스트 조회 
	public List<HotelVO> selectHotelList(HotelVO hotel, RowBounds rowBounds);
	
	//호텔총수 
	public Integer selectRowAmountTotal(HotelVO hotel);
	
	//첨부파일 조회 (호텔)
	public TLHotelAttachFilesVO selectAttachFileOfHotel(@Param("htNo")Long htNo);
	
	//첨부파일 조회(객실)
	public TLRoomAttachFilesVO selectAttachFileOfRoom(@Param("htRooNo")Long htRooNo); 
}
