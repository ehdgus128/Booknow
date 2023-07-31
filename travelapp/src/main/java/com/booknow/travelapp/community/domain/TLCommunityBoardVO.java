package com.booknow.travelapp.community.domain;
 
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//20230704 작업자 정지은 커뮤니티 게시판 vp 
public class TLCommunityBoardVO {
	private Long tvcBno;
	private String tvcBtitle;
	private String tvcBcontent;
	private String tvcBwriter;
	private Date tvcBregDate;
	private Timestamp tvcBmodDate;
	private int tvcBviewsCnt;
	private int tvcBreplyCnt;
	private int tvcBdelFlag;
	private Long tvcCatId;
	private String boardFile; //db저장용 
	
	private MultipartFile upload_file; //파일타입 받는 용 
}
