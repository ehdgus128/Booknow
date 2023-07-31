package com.booknow.travelapp.airways.service;

import java.util.List;

import com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingDTO;
import com.booknow.travelapp.airways.domain.AirLineRevVO;

public interface AirLineRevService {

	public List<AirLineRevVO> getBoardList(AirlineRevPagingDTO airlineRevPagingDTO);

	public long getRowTotal(AirlineRevPagingDTO airlineRevPagingDTO);
	
	public long registerBoard(AirLineRevVO airLineRevVO);

	public AirLineRevVO getRev(long airlineReno);

	public int modifyAirLineRev(AirLineRevVO airLineRevVO);

	public long updateMyLike(long airlineReno);

	
	public long reportAirLineRev(long airlineReno);

	public long deleteAirlineRev(long airlineRevno);


	public double averageStar(String airlineId);




}
