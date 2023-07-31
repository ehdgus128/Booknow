package com.booknow.travelapp.domain;

import lombok.Data;


@Data
public class FaqBoardsVO {

	private long faqNo ;
	private String faqQuestion;
	private String faqAnswer;
	private long cateId;
	private int faqLike;
	
}
