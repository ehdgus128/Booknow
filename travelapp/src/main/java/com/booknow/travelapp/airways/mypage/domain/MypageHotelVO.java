package com.booknow.travelapp.airways.mypage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MypageHotelVO {

			private long htRevNo;
			private String userid;
			private int htRevStar;
			private long htRevLike;
			private String htRevTitle; 
			private String htRevContents;
			private Date htRevRegDate;
			private int htRevDelFlag;
			private long htNo;
			 
	
	
}
