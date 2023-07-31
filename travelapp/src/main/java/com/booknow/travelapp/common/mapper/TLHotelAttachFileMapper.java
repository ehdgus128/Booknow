package com.booknow.travelapp.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;

//작성자 정지은 호텔 첨부파일처리 mapper인터페이스 
public interface TLHotelAttachFileMapper {
	
	/*호텔*/
	
	//파일등록
	int insertAttachFile(TLHotelAttachFilesVO htFiles);
	
	//특정 호텔의 파일보기 
	TLHotelAttachFilesVO selectAttachFilesByHtNo(@Param("htNo")Long htNo);
	
	//특정 uuid의 파일삭제 
	int deleteAttachFile(@Param("htuuid")String htuuid);
	
	
	/*객실*/
	// 특정 호텔의 모든 방리스트 (첨부파일 등록시 select에 사용,페이징처리 X)
	List<TLHotelRoomVO> selectRoomListForSelect(@Param("htNo")Long htNo);
		
	//파일등록
	int insertRmAttachFile(TLRoomAttachFilesVO rmFiles);
	
	//rmUuid 파일 보기 
	TLRoomAttachFilesVO selectRmAttachFilesByHtRooNo(@Param("htRooNo")Long htRooNo);
	
	//특정 uuid의 파일삭제 
	int deleteRmAttachFile(@Param("rmUuid")String rmUuid);	

}
