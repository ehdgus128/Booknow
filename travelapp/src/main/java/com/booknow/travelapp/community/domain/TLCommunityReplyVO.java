package com.booknow.travelapp.community.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
 
@Getter
@Setter
@ToString
public class TLCommunityReplyVO {
	
	private Long tvcRno;
	private Long tvcBno;
	private String tvcRwriter;
	private String tvcRcontent;
	private Date tvcRregDate;
	private Timestamp tvcRmodDate;
	private int tvcRdelflag;
	private Long tvcPrno;
	//들여쓰기
	private int lvl; 
	
}
