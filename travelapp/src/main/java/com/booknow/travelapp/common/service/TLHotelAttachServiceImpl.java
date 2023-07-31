package com.booknow.travelapp.common.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.common.mapper.TLHotelAttachFileMapper;

//작업자 정지은 첨부파일 서비스 23071315 
@Service
@Primary
public class TLHotelAttachServiceImpl implements TLHotelAttachService{
	
	private TLHotelAttachFileMapper fileMapper;
	public TLHotelAttachServiceImpl(TLHotelAttachFileMapper fileMapper) {
		this.fileMapper = fileMapper;
	}
	
	/*                   호텔                 */
	//파일등록
	@Override
	public boolean registerHtFile(TLHotelAttachFilesVO fileVO) {
		return fileMapper.insertAttachFile(fileVO)==1;
	}

	//특정 호텔의  파일보기
	@Override
	public TLHotelAttachFilesVO showAttachFilesByHtNo(Long htNo) {
		return fileMapper.selectAttachFilesByHtNo(htNo);
	}
	
	/*                      방                 */
	
	// 특정 호텔의 모든 방리스트 (첨부파일 등록시 select에 사용,페이징처리 X)
	@Override
	public List<TLHotelRoomVO> showRoomListForSelect(Long htNo) {
		return fileMapper.selectRoomListForSelect(htNo);
	}
	
	//파일등록 
	@Override
	public boolean registerRmFile(TLRoomAttachFilesVO rmFileVO) {
		return fileMapper.insertRmAttachFile(rmFileVO)==1;
	}

	//특정방의 이미지보기 
	@Override
	public TLRoomAttachFilesVO showRmAttachFilesByhtRooNo(Long htRooNo) {
		return fileMapper.selectRmAttachFilesByHtRooNo(htRooNo);
	}

}
