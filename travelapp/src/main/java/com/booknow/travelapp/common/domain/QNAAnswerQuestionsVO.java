package com.booknow.travelapp.common.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class QNAAnswerQuestionsVO {
	 
		//관리자답변
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
	}

	
 
    
 