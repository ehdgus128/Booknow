package com.booknow.travelapp.airways.mypage;

import lombok.NoArgsConstructor;
import lombok.Setter;

//20230705 마이페이지 회원수정 관련 때문에 만듬
@Setter
@NoArgsConstructor
 
public class RequestData {
	
	private String pw1;
	
	public String getPw1() {
		return pw1;
	}
	
	private String pw2;
	
	public String getPw2() {
		return pw2;
	}
	
}
