package com.booknow.travelapp.hotel.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HtDetailDTO {
	private Long htNo;
	private long htRooNo ;
	private String htAddress;
	private int htRank; // 표시하기
	private String htName;  
}
