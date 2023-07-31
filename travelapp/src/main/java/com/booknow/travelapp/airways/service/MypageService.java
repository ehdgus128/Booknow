package com.booknow.travelapp.airways.service;

import org.springframework.web.bind.annotation.RequestParam;

import com.booknow.travelapp.common.domain.TLUsers;


public interface MypageService {
	
	public TLUsers getUser(String userId);

	public boolean getUserCheck(@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword);

	public boolean modifyPassword(@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword);

	public boolean modifyEmail(@RequestParam("userId") String userId, @RequestParam("userEmail") String userEmail);

	public boolean modifyAddress(@RequestParam("userId") String userId, @RequestParam("userAddress") String userAddress);

	public boolean modifyUserPhoneNumber(@RequestParam("userId") String userId, @RequestParam("userPhoneNumber") String userPhoneNumber);
}
