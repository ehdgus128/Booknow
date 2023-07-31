package com.booknow.travelapp.common.service;

import org.springframework.security.core.Authentication;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.booknow.travelapp.common.domain.TLAuthoritys;
import com.booknow.travelapp.common.domain.TLUsers;

//230705 임지혁 생성

public interface TLUsersService {
	
	// 특정 회원 조회
	public TLUsers getTLUser(String userId);
	
	
	// 특정 회원 조회(OUTER JOIN)
	public TLUsers getMyMemberOUTER(String userId);
	
	
	// 회원 가입
	public boolean registerTLUser(TLUsers tlUser);
	
	
	// 회원 권한 한 개 등록
	public boolean registerAuthoritys(TLAuthoritys authority);

	
	// ID 중복검사
	public String getDupId(String userId);
	
	
	//230711: 비밀번호 수정
	public boolean modifyTLUserPw(TLUsers tlUser);
	
	
	//230712: 아이디 찾기
	public String getTLUserId(String userName, String userEmail);
	
	
	//230715 가입된 Sns유저 찾기
	public TLUsers getTLUserSnsLoggedIn(NaverUsers naverUser);
	
	
	//230716 sns로그인한 기존 유저 로그인처리
	public Authentication getSnsUserAuthenticate(TLUsers tlUser);
	
	
}
