package com.booknow.travelapp.common.service;

import java.util.List;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;

//작업자 정지은 2307131716 첨부파일 서비스 
public interface TLHotelAttachService {

	/*    호텔      */
	//파일등록
	boolean registerHtFile(TLHotelAttachFilesVO fileVO);
	
	//특정호텔의 파일보기 
	TLHotelAttachFilesVO showAttachFilesByHtNo(Long htNo);
	
	
	
	/*     방       */
	
	// 특정 호텔의 모든 방리스트 (첨부파일 등록시 select에 사용,페이징처리 X)
	List<TLHotelRoomVO> showRoomListForSelect(Long htNo);
	
	//파일등록 
	boolean registerRmFile(TLRoomAttachFilesVO rmFileVO);
	
	//htRooNo 이미지보기 
	TLRoomAttachFilesVO showRmAttachFilesByhtRooNo(Long htRooNo);
	
	
}
