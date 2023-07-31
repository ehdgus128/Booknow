package com.booknow.travelapp.airways.mypage.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.booknow.travelapp.airways.domain.AirLineRevVO;
import com.booknow.travelapp.airways.mypage.domain.MypageHotelVO;
import com.booknow.travelapp.airways.mypage.mapper.MypageRevMapper;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO;
import com.booknow.travelapp.airways.mypage.paging.domain.MypagePagingDTO2;

@Primary
@Service
public class MypageRevServiceImpl implements  MypageRevService  {
	
	private MypageRevMapper mypageRevMapper;
	
	public MypageRevServiceImpl(MypageRevMapper mypageRevMapper) {
		this.mypageRevMapper = mypageRevMapper;
	}
	
	public List<AirLineRevVO> getMyAirRev(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO mypagePagingDTO) {
		return mypageRevMapper.selectMyAirRev(userId, mypagePagingDTO);
	}
	
	public long getRevRowtotal(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO mypagePagingDTO) {
		return mypageRevMapper.selectMyAirRevRowtotal(userId, mypagePagingDTO);
	};

	
	public long notNullAirRev (String userId) {
		return mypageRevMapper.notNullAirRev(userId);
	}
	
//	public List<AirLineRevVO> getMyAirRevASC(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO mypagePagingDTO) {
//		return mypageRevMapper.selectMyAirRevASC(userId, mypagePagingDTO);
//	}
//	
//	public List<AirLineRevVO> getMyAirRevStarDESC(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO mypagePagingDTO) {
//		return mypageRevMapper.selectMyAirRevStarDESC(userId, mypagePagingDTO);
//	}
//	
//	
//	public List<AirLineRevVO> getMyAirRevStarASC(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO mypagePagingDTO) {
//		return mypageRevMapper.selectMyAirRevStarASC(userId, mypagePagingDTO);
//	}
	
	public List<MypageHotelVO> getMyHTRev(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO2 mypagePagingDTO) {
		return mypageRevMapper.selectMyHTRev(userId, mypagePagingDTO) ;
	}
	
	public long getMyHTRevRowtotal(@RequestParam("userId") String userId, @RequestParam("mypagePagingDTO") MypagePagingDTO2 mypagePagingDTO) {
		return mypageRevMapper.selectMyHTRevRowtotal(userId, mypagePagingDTO);
	}
	
	public long notNullHTRev (String userId) {
		return mypageRevMapper.notNullHTRev(userId);
	}
	
}
