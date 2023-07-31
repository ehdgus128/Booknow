package com.booknow.travelapp.airways.common.paging.domain;

import java.util.List;

import com.booknow.travelapp.airways.domain.AirRouteVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
//230701 임지혁: list페이지 페이지네이션
public class AirwaysPagingCreatorDTO {
	private AirwaysPagingDTO airwaysPaging;
	private List<AirRouteVO> airRouteList ;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	public AirwaysPagingCreatorDTO(long rowTotal,
								  AirwaysPagingDTO airwaysPaging,
								  List<AirRouteVO> airRouteList) {
		
		this.rowTotal = rowTotal;
		this.airwaysPaging = airwaysPaging;
		this.airRouteList = airRouteList;
		this.pagingNumCnt = 10;
		
		this.endPagingNum = (int) Math.ceil((this.airwaysPaging.getPageNum() * 1.0) / this.pagingNumCnt) * this.pagingNumCnt;
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
		
		this.lastPageNum = (int) Math.ceil((this.rowTotal * 1.0) / this.airwaysPaging.getNumOfRows());
		
		if (this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		
		this.next = this.endPagingNum < this.lastPageNum;
		
		System.out.println("airwaysPaging: " + this.airwaysPaging.toString());
		System.out.println("endPagingNum: " + this.endPagingNum);
		System.out.println("startPagingNum: " + this.startPagingNum);
		System.out.println("prev: " + this.prev);
		System.out.println("next: " + this.next);
		System.out.println("lastPageNum: " + this.lastPageNum);
	}
	
}
