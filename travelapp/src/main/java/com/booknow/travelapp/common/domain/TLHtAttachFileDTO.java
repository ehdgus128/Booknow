package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class TLHtAttachFileDTO {
	
	private String htFileName;//원본파일이름 
	private String htUploadPath;// 업로드경로 
	private String htUuid; 
	private String fileType;
	private String htRepoPath = "C:/myupload/hotel"; //서버의 첨부파일 기본 저장경로 

}
