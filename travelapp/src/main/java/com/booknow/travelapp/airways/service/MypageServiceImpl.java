package com.booknow.travelapp.airways.service;

import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.booknow.travelapp.airways.mapper.MypageMapper;
import com.booknow.travelapp.common.domain.TLUsers;

import lombok.AllArgsConstructor;

@Primary
@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private PasswordEncoder pwencoder;
	private MypageMapper mypageMapper;
	
	public TLUsers getUser(String userId) {
		return mypageMapper.selectUser(userId);
	}
	
	//유저 정보 수정 하기전에 비밀번호 치고 한번더  검사 
	public boolean getUserCheck(@RequestParam ("userId") String userId, @RequestParam ("userPassword") String userPassword) {
		String userDBPw = mypageMapper.selectUserPassword(userId);
		return pwencoder.matches(userPassword, userDBPw);  
	}


	public boolean modifyPassword(String userId, String userPassword) {
		userPassword = pwencoder.encode(userPassword);	
		System.out.println("[sys] pw2 : "+ userPassword);
		return (mypageMapper.updateUserPassword(userId, userPassword)==1);
	}
		
	public boolean modifyEmail(String userId, String userEmail) {
		return (mypageMapper.udateUserEmail(userId, userEmail) == 1);
	}
		
	public boolean modifyAddress(String userId, String userAddress) {
		return (mypageMapper.udateUserAddress(userId, userAddress) == 1);
	}

	public boolean modifyUserPhoneNumber(String userId, String userPhoneNumber) {
		return (mypageMapper.udateUserPhoneNumber(userId, userPhoneNumber) == 1);
	}
		
}
