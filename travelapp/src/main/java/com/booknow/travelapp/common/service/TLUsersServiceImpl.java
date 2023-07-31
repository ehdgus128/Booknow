package com.booknow.travelapp.common.service;

import org.springframework.context.annotation.Primary;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.booknow.travelapp.common.domain.TLAuthoritys;
import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.mapper.TLUsersMapper;

import lombok.AllArgsConstructor;

//230705 임지혁 생성

@Service
@Primary
@AllArgsConstructor
public class TLUsersServiceImpl implements TLUsersService{
	TLUsersMapper tlUsersMapper;
	UserDetailsService userDetailsService;

	
	// 특정 회원 조회
	@Override
	public TLUsers getTLUser(String userId) {
		
		return tlUsersMapper.selectTLUser(userId);
	}

	
	// 특정 회원 조회(OUTER JOIN)
	@Override
	public TLUsers getMyMemberOUTER(String userId) {
		
		return tlUsersMapper.selectMyMemberOUTER(userId);
	}
	
	// 회원 가입
	@Override
	public boolean registerTLUser(TLUsers tlUser) {
		
		return tlUsersMapper.insertTLUser(tlUser) == 1;
	}
	
	
	// 회원 권한 한 개 등록
	@Override
	public boolean registerAuthoritys(TLAuthoritys authority) {
		
		return tlUsersMapper.insertTLAuthoritys(authority) == 1;
		
	}
	
	
	// ID 중복검사
	@Override
	public String getDupId(String userId) {
		
		return tlUsersMapper.selectDupId(userId);
	}

	
	//230711: 비밀번호 수정
	@Override
	public boolean modifyTLUserPw(TLUsers tlUser) {
		
		return tlUsersMapper.updateTLUserPw(tlUser) == 1;
	}
	
	
	//230712: 아이디 찾기
	@Override
	public String getTLUserId(String userName, String userEmail) {
		
		return tlUsersMapper.selectTLUserId(userName, userEmail);
	}
	
	
	//230715 가입된 Sns유저 찾기
	@Override
	public TLUsers getTLUserSnsLoggedIn(NaverUsers naverUser) {
		
		return tlUsersMapper.selectTLUserSnsLoggedIn(naverUser);
	}
	
	
	//230716 sns로그인한 기존 유저 로그인처리
	@Override
	public Authentication getSnsUserAuthenticate(TLUsers tlUser) {
		
		UserDetails userDetails = userDetailsService.loadUserByUsername(tlUser.getUserId());
		
		//UserDetails 객체의 유저정보로 인증토큰 만들어 새 인증객체 만들고 리턴
		Authentication authentication 
			= new UsernamePasswordAuthenticationToken(userDetails, userDetails, userDetails.getAuthorities());
		
		return authentication;
	}
	
	
}
