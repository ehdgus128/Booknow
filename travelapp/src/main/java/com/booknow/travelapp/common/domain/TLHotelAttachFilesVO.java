package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 
//호텔사진 등록vo 
@Getter 
@Setter
@ToString
public class TLHotelAttachFilesVO {

	private String htuuid;
	private String htUploadPath;
	private String htFileName;
	private String htFileType;
	private Long htNo;
	
	//db저장 X
	private String htRepoPath = "C:/myupload/hotel"; //서버의 첨부파일 기본 저장경로 
	
}
