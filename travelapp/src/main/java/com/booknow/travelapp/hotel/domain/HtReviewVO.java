package com.booknow.travelapp.hotel.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class HtReviewVO {
			
	private long htRevNo ; //숙소 리뷰 번호
	private long htRevStar ; //숙소 리뷰 별점
	private String htRevTitle ; //숙소 리뷰 제목
	private String htRevContents ; //숙소 리뷰 내용
	private Date htRevRegDate ; //숙소 리뷰 등록일
	private String htRevDelFlag ; //숙소 리뷰 삭제요청
	private Long htNo ; //숙소 번호
	private String userId ; //유저 아이디
		
} // MyReviewVO end

