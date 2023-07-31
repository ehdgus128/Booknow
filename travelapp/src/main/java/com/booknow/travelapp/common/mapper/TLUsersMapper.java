package com.booknow.travelapp.common.mapper;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.booknow.travelapp.common.domain.TLAuthoritys;
import com.booknow.travelapp.common.domain.TLUsers;

public interface TLUsersMapper {
	
	// 특정 회원 조회
	public TLUsers selectTLUser(String userId);
	
	
	// 특정 회원 조회 (OUTER JOIN)
	public TLUsers selectMyMemberOUTER(String userId);
	
	
	// 230706 임지혁: ID 중복 검사
	public String selectDupId(String userId);
	
	
	// 회원 가입
	public Integer insertTLUser(TLUsers tlUser);
	
	
    // 회원 권한 한개 등록
    public Integer insertTLAuthoritys(TLAuthoritys authoritys);	
    
    
    //230712 비밀번호 업데이트
    public Integer updateTLUserPw(TLUsers tlUser);
    
    
    //230712 아이디 찾기
    public String selectTLUserId(@Param("userName") String userName, @Param("userEmail") String userEmail);
    
    
    //230716 가입된 sns유저 찾기
    public TLUsers selectTLUserSnsLoggedIn(NaverUsers naverUser);
    
    
}
