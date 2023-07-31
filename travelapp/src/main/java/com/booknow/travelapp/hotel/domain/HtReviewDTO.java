package com.booknow.travelapp.hotel.domain;


import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class HtReviewDTO {
	
	List<HtReviewVO> htReviewList;
	HtReviewPagingDTO pageBean;

}// HtReviewDTO end
