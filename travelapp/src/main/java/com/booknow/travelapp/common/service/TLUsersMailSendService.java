package com.booknow.travelapp.common.service;

//230706 임지혁 생성: 인증 이메일 전송 서비스

public interface TLUsersMailSendService {
	
	public void makeRandomNumber();
	
	public void makeRandomStrings();
	
	public String authEmailForm(String email);
	
	public String findPwEmailForm(String userEmail);
	
	public void emailSend(String setFrom, String setTo, String title, String content);
	
	public String getEcodeAuthCheck(String eCode);
	
}
