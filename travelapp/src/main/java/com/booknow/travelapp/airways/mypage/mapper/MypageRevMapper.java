package com.booknow.travelapp.airways.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.airways.domain.AirLineRevVO;
import com.booknow.travelapp.airways.mypage.domain.MypageHotelVO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO2;

public interface MypageRevMapper {
	
	//항공 리뷰 관련
	public List<AirLineRevVO> selectMyAirRev(@Param("userId") String userId, @Param("mypagePagingDTO")MypagePagingDTO mypagePagingDTO);
	
	public long selectMyAirRevRowtotal(@Param("userId") String userId, @Param("mypagePagingDTO") MypagePagingDTO mypagePagingDTO);
	
//	public List<AirLineRevVO> selectMyAirRevASC(@Param("userId") String userId, @Param("mypagePagingDTO")MypagePagingDTO mypagePagingDTO);
//	
//	public List<AirLineRevVO> selectMyAirRevStarDESC(@Param("userId") String userId, @Param("mypagePagingDTO")MypagePagingDTO mypagePagingDTO);
//
//	public List<AirLineRevVO> selectMyAirRevStarASC(@Param("userId") String userId, @Param("mypagePagingDTO")MypagePagingDTO mypagePagingDTO);

	public long notNullAirRev (String userId);
	
	//호텔 리뷰 관련
	public List<MypageHotelVO> selectMyHTRev(@Param("userId") String userId, @Param("mypagePagingDTO") MypagePagingDTO2 mypagePagingDTO2);
	
	public long selectMyHTRevRowtotal(@Param("userId") String userId, @Param("mypagePagingDTO") MypagePagingDTO2 mypagePagingDTO2);
	
	public long notNullHTRev (String userId);

}
