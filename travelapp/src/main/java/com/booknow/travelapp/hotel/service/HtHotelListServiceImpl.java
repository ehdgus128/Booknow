package com.booknow.travelapp.hotel.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.mapper.HtHotelListMapper;


//작업자 정지은 23-06-27 호텔리스트 서비스
@Primary
@Service
public class HtHotelListServiceImpl implements HtHotelListService{

	//페이지당 보여지는 레코드의 갯수 
	private static final int ROW_AMOUNT_PER_PAGE = 5;
	//화면 하단의 페이지 최소 페이지 번호 갯수 
	private static final int PAGING_NUM_CNT = 5;
	
	//mapper 주입
	private HtHotelListMapper htHotelListMapper;
	
	@Autowired
	public HtHotelListServiceImpl(HtHotelListMapper htHotelListMapper) {
		this.htHotelListMapper = htHotelListMapper;
	}
	
	//호텔리스트 조회 
	@Override
	public List<HotelVO> getHotelList(HotelVO hotel, int currentPage) {		 
				
		//1 -> 0*10 = 0 인덱스부터 
		//2 -> 1*10 = 10 인덱스부터 
		int start = (currentPage-1)*ROW_AMOUNT_PER_PAGE;
		
		//인덱스 0번부터 3개 , 두번째 인자값이 페이지당 보여줄 레코드 개수 
		RowBounds rowBounds = new RowBounds(start,ROW_AMOUNT_PER_PAGE);	
			
		System.out.println(htHotelListMapper.selectHotelList(hotel,rowBounds));
		
		return htHotelListMapper.selectHotelList(hotel,rowBounds);
	}
    
	//호텔총수
	@Override
	public TLHotelListPageDTO getRowAmountTotal(HotelVO hotel, int currentPage) {
		
		int rowAmountTotal = htHotelListMapper.selectRowAmountTotal(hotel);
		 
		System.out.println(rowAmountTotal);

		TLHotelListPageDTO pageDTO = new TLHotelListPageDTO(rowAmountTotal,currentPage,ROW_AMOUNT_PER_PAGE, PAGING_NUM_CNT);

		return pageDTO;
				
	}// getRowAmountTotal end

	
	//첨부파일 확인 (호텔)
	@Override
	public TLHotelAttachFilesVO showImageOfHotel(Long htNo) {
		return htHotelListMapper.selectAttachFileOfHotel(htNo);
	}

	//첨부파일 확인 (객실)
	@Override
	public TLRoomAttachFilesVO showImageOfRoom(Long htRooNo) {
		return htHotelListMapper.selectAttachFileOfRoom(htRooNo);
	}
	
} // HtHotelListServiceImpl end


