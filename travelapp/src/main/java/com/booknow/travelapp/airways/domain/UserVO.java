package com.booknow.travelapp.airways.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//20230723 세연 생성 임시로 마이페이지 때문에 만든 VO
@Setter
@Getter
@ToString
public class UserVO {

	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userAddress;
	private Date userBday;
	private long userMileage;
	private String userPhoneNumber;
	private Timestamp userRegDate;
	private Timestamp userModDate;
	private long userStorage;
	private char enabled;
	 

}
