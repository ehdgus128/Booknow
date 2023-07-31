package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 방첨부파일 등록
@Getter
@Setter
@ToString
public class TLRoomAttachFilesVO {
	
	private String rmUuid;	
	private String rmUploadPath;	
	private String rmFileName;
	private String rmFileType;
	private Long htRooNo;
	
	//db저장 X
	private String rmRepoPath = "C:/myupload/room"; //서버의 첨부파일 기본 저장경로

}
