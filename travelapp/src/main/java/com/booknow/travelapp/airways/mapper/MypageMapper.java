package com.booknow.travelapp.airways.mapper;

import org.apache.ibatis.annotations.Param;

import com.booknow.travelapp.common.domain.TLUsers;

public interface MypageMapper {
	
	public TLUsers selectUser(String userId);
	
	public String  selectUserPassword (@Param("userId") String  userId);
	
	public int updateUserPassword(@Param("userId") String userId, @Param("userPassword") String userPassword );

	public int udateUserEmail(@Param("userId") String userId, @Param("userEmail") String userEmail );
	
	public int udateUserAddress(@Param("userId") String userId, @Param("userAddress") String userAddress);
	
	public int udateUserPhoneNumber(@Param("userId") String userId, @Param("userPhoneNumber") String userPhoneNumber);
}
