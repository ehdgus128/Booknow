package com.booknow.travelapp.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QnaBoardsVO {

	private long qnaAno;
    private Date qnaAregDate;
    private Timestamp qnaAmodDate;
    private String qnaAcontent;
    private String qnaAwriter;
    
    
    //FK
    private long qnaQno;
    
    
    //유저질문
    private String qnaQcategory;
    private String qnaQtitle;
    private String qnaQcontent;
    private String qnaQwriter;
    private Date qnaQregDate;
    private Timestamp qnaQmodDate;
    private int qnaQprocFlag;
	
//	QNAANO
//	QNAAREGDATE
//	QNAAMODDATE
//	QNAACONTENT
//	QNAAWRITER
//	QNAQNO
	
}
