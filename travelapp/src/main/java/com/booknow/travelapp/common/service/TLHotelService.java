package com.booknow.travelapp.common.service;


import java.util.List;

import com.booknow.travelapp.common.domain.TLHotelBusinessVO;
import com.booknow.travelapp.common.domain.TLHotelBuyTranVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLHotelSellDateVO;
import com.booknow.travelapp.common.domain.TLHotelTotalDTO;
import com.booknow.travelapp.common.domain.TLHotelVO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelBuyPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdRoomPagingDTO;
 
//작업자 정지은  호텔등록 서비스 230711
public interface TLHotelService {

	
       /*                   호텔파트                   */
//create
	//사업자번호 중복체크 
	String checkBusRegNumExists(String busRegNum);
	
	//등록 
	 TLHotelTotalDTO registerHotelInfo(TLHotelTotalDTO hotel);
	
//read
	//메인페이지
	//리스트 조회 
	List<TLHotelVO> showHotelList(int pageNum);	
	//총수 
	TLAdHotelPagingDTO getTotalRowAmount(int currentPage);
	
	//상세페이지 
	//(호텔,거래내역,사업자 전부 조회) 
	TLHotelTotalDTO showHotelDetail(TLHotelTotalDTO hotelDTO);
		
	//특정 htNo의 호텔 한개 조회
	TLHotelVO showHotelDetail(Long htNo);
	
	//특정 busId의 사업자 정보 한개 조회 
	TLHotelBusinessVO showBusDetail(Long busId);
	
	//특정 htBuyTranId의 거래내역 한개 조회 
	TLHotelBuyTranVO showTranDetail(Long htNo);
	
	//수정 
	String updateHotelInfo(TLHotelTotalDTO hotelDTO);
	
	
//delete
	int removeBusUser(Long busId);
	
	/*                       방파트                         */
	
//read
	//방조회 
	List<TLHotelRoomVO> showRoomList(Long htNo,int pageNum);
	
	//페이징 처리를 위한 방총수 
	TLAdRoomPagingDTO getTotalRoomRowAmount(Long htNo,int currentPage);
	
	/*    구매내역       */
	
	//방구매내역 
	List<TLHotelSellDateVO> showRoomSellDate(Long htRooNo,int datePageNum); 
	
	//페이징 처리를 위한 방 구매내역 총수 
	TLAdHotelBuyPagingDTO getTotalSellAmount(Long htRooNo,int dateCurrentPage);
	
	//하나의 방조회 
	TLHotelRoomVO showRoomDetail(Long htRooNo);
	
	
	
	
	
	
//create 
	//방 등록
	boolean registerRoom(TLHotelRoomVO roomVO);

	//거래내역만 등록
	int registerRoomDate(TLHotelSellDateVO sell);
	
//delete
	int removeRoom(Long htRooNo);


} 
