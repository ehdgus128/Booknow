package com.booknow.travelapp.airways.mypage.service;


import java.util.List;

import com.booknow.travelapp.airways.domain.AirLineRevVO;
import com.booknow.travelapp.airways.mypage.domain.MypageHotelVO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO2;


public interface MypageRevService {
	
	public List<AirLineRevVO> getMyAirRev(String userId, MypagePagingDTO mypagePagingDTO) ;
	
	public long getRevRowtotal (String userId, MypagePagingDTO mypagePagingDTO) ;
	
	public long notNullAirRev (String userId);
	
//	public List<AirLineRevVO> getMyAirRevASC(String userId, MypagePagingDTO mypagePagingDTO);
//	
//	public List<AirLineRevVO> getMyAirRevStarDESC(String userId, MypagePagingDTO mypagePagingDTO);
//
//	public List<AirLineRevVO> getMyAirRevStarASC(String userId, MypagePagingDTO mypagePagingDTO);

	//호텔 리뷰
	public List<MypageHotelVO> getMyHTRev(String userId, MypagePagingDTO2 mypagePagingDTO) ;
	
	public long getMyHTRevRowtotal (String userId, MypagePagingDTO2 mypagePagingDTO) ;
	
	public long notNullHTRev (String userId);
	
	
}
