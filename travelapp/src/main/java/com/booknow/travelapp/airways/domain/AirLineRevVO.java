package com.booknow.travelapp.airways.domain;


import java.sql.Timestamp;

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
public class AirLineRevVO {

	private long airlineRevno ;   //항공사리뷰번호
	private String userId ;   //유저아이디
	private String airlineId ;  //항공사코드
	private long airlineStar ; //항공사별점
	private long airlineLike ; // 항공사리뷰추천
	private String  airlineRevTitle ; // 항공사리뷰제목
	private String  airlineRevContents ; // 항공사리뷰내용
	private Timestamp airlineRevRegDate ; //항공사리뷰등록일
	private int airlineRevDelFlag ;  //유저신고요청
}
