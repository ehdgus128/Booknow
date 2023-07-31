package com.booknow.travelapp.hotel.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
import com.booknow.travelapp.hotel.mapper.HtRoomsDetailMapper;


@Primary
@Service
//202307052154 장유정 - 수정
public class HtRoomsDetailServiceImpl implements HtRoomsDetailService{

	//페이지당 보여지는 레코드의 갯수 
	private static final int rowAmountPerPage = 4;
	//화면 하단의 페이지 최소 페이지 번호 갯수 
	private static final int pagingNumCnt = 3;

	@Autowired
	public HtRoomsDetailServiceImpl(HtRoomsDetailMapper hotelRoomsDetailMapper) {
		this.hotelRoomsDetailMapper = hotelRoomsDetailMapper;
	}

	private HtRoomsDetailMapper hotelRoomsDetailMapper;
	
	//호텔 정보
	@Override
	public HotelVO getHotelData(Long htNo) {
		return hotelRoomsDetailMapper.selectHotelData(htNo);
	}
	
	
	//페이징 처리를 위한 특정 호텔의 방리스트 
	@Override
	public List<HtRoomVO> getListPaging(HotelVO hotelVO, int currentPage) {
		
		//1 -> 0*10 = 0 인덱스부터 
		//2 -> 1*10 = 10 인덱스부터 
		int start = (currentPage-1)*rowAmountPerPage;
		
		//인덱스 0번부터 3개 , 두번째 인자값이 페이지당 보여줄 레코드 개수 
		RowBounds rowBounds = new RowBounds(start,rowAmountPerPage);	

		return hotelRoomsDetailMapper.selectRoomListPaging(hotelVO, rowBounds);
	}


	@Override
	public TLHotelListPageDTO getRoomTotal(HotelVO hotelVO, Integer currentPage) {
		int rowAmountTotal = hotelRoomsDetailMapper.selectRoomTotal(hotelVO);

		TLHotelListPageDTO pageDTO = new TLHotelListPageDTO(rowAmountTotal,currentPage,rowAmountPerPage, pagingNumCnt);

		return pageDTO;
	}

	
	
}// HtRoomsDetailServiceImpl end
