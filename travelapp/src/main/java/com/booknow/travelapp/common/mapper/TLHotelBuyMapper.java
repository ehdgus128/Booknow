package com.booknow.travelapp.common.mapper;

import com.booknow.travelapp.common.domain.TLHotelVO;
import com.booknow.travelapp.common.domain.TLhtBuyMappingVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.common.domain.TLHotelBusinessVO;
import com.booknow.travelapp.common.domain.TLHotelBuyTranVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLHotelSellDateVO;

//작업자 정지은 호텔,방구매 mapper인터페이스 ->  호텔파트 , 방파트 나눠서 작성함 
public interface TLHotelBuyMapper {
	
   /*호텔파트*/
//create 	
	//사업자번호 중복체크 
	String checkBusRegNumExists(@Param("busRegNum")String busRegNum);
	
	//사업자등록
	int insertBusinessUser(TLHotelBusinessVO businessVO);
	
	//호텔등록
	int insertHotel(TLHotelVO hotel);
	
	//거래내역 등록 
	int insertBuyTran(TLHotelBuyTranVO buy); 

//read

//메인화면 
	//화면 처리용 호텔 조회  
	List<TLHotelVO> selectHotelByName(RowBounds rowBounds);
	
	//화면의 페이징처리용 호텔 총수 
	int selectHotelTotal();
	
	
//상세페이지		
	//사업자 상세 
	TLHotelVO selectHotelInfo(@Param("busId")Long busId);
	
	//호텔상세 
	TLHotelBusinessVO selectBusInfo(@Param("busId")Long busId);
	
	//거래내역 상세 
	TLHotelBuyTranVO selectTranInfo(@Param("htNo")Long htNo);

//update 
	//사업자 수정
	int updateBusInfo(TLHotelBusinessVO busVO);
	//호텔 수정 
	int updateHotelInfo(TLHotelVO hotelVO);
	//상세거래내역 수정
	int updateTranInfo(TLHotelBuyTranVO tranVO);
	
	
//delete
	//delete cascade로 연결되있어서 사업자만 삭제하면 호텔, 방 다 삭제됨
	int deleteBusUser(@Param("busId")Long busId);
	
	
	/*방파트*/
		
//read
	//특정 호텔의 방조회 
	List<TLHotelRoomVO> selectRoomList(@Param("htNo")Long htNo,RowBounds rowBounds);
	
	//페이징처리를 위한 방 총수 
	int selectRoomTotal(@Param("htNo")Long htNo);

	//하나의 방 조회 
	TLHotelRoomVO selectRoomByRooNo(@Param("htRooNo")Long htRooNo);
	
	/* 방구매내역 파트 */
	
	//방구매내역 조회 
	List<TLHotelSellDateVO> selectRoomSellDate(@Param("htRooNo")Long htRooNo,RowBounds rowBounds);
	
	//페이징처리용 방구매내역 총수 
	int selectSellDateTotal(@Param("htRooNo")Long htRooNo);
	
	
	
//create
	//방등록 
	int insertRoom(TLHotelRoomVO roomVO);
	
	//방구매내역 등록 
	int insertSellDate(TLHotelSellDateVO sellDateVO);
	
	//맵핑테이블용 데이터저장 
	int insertHtBuyMapping(TLhtBuyMappingVO buyMappingVO);
	
	//delete
	int deleteAdRoom(Long htRooNo);
	
}
