package com.booknow.travelapp.common.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
@Primary
public class TLUsersMailSendServiceImpl implements TLUsersMailSendService{
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void TLUsersMailSendService(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	private String authCode;
	private String authString;
	
	
	//이메일 인증용 5자리 난수 생성 메서드
	@Override
	public void makeRandomNumber() {
		
		authCode = String.valueOf(new Random().nextInt(88888) + 11111); //(0 ~ 88888) + 11111 = (0 ~ 99999) 
	}
	
	
	//임시 비밀번호 발급을 위한 8자리 랜덤 문자열 생성 메서드
	@Override
	public void makeRandomStrings() {
		
		int charMin = 97; // "a"
		int charMax = 122; // "z"
		int strLength = 8;
		
		StringBuilder buffer = new StringBuilder(strLength);
		
		for (int i = 0; i < strLength; i++) {
		    
			//(0~1 난수 생성) * 26 : 범위 내의 부동소수점 값을 얻어 정수 변환 + charMin
			int charRandom = charMin + (int) (new Random().nextFloat() * (charMax - charMin + 1));
		    buffer.append((char) charRandom); //8자리 길이만큼 buffer에 한 글자씩 더함
		}
		
		authString = buffer.toString();
		
	}
	
		
	// 회원가입 인증 이메일
	@Override
	public String authEmailForm(String email) {
		System.out.println("회원가입 인증 이메일 서비스 호출됨");
		makeRandomNumber();
		
		System.out.println("authCode: " + authCode);
		
		String setFrom = "travelappbooknow@gmail.com";
		String setTo = email;
		String title = "[travelapp]회원 가입 인증 이메일입니다.";
		String content =
				"홈페이지를 방문해주셔서 감사합니다."
			  + "<br><br>"
			  + "인증번호는" + authCode + "입니다."
			  + "<br>"
			  + "해당 인증번호를 인증번호 확인란에 기입해주세요.";
		
		emailSend(setFrom, setTo, title, content);
		return authCode;
	}
	
	
	//임시비밀번호 발급 이메일
	@Override
	public String findPwEmailForm(String userEmail) {
		System.out.println("임시비밀번호 발급 이메일 서비스 호출됨");
		
		makeRandomStrings();
		makeRandomNumber();
		
		String tempPassword = authString + authCode;
		
		System.out.println("tempPassword: " + tempPassword);
		
		String setFrom = "travelappbooknow@gmail.com";
		String setTo = userEmail;
		String title = "[travelapp]임시 비밀번호 발급 안내입니다.";
		String content =
				"홈페이지를 방문해주셔서 감사합니다."
			  + "<br><br>"
			  + "임시 비밀번호는" + tempPassword + "입니다."
			  + "<br>"
			  + "임시 비밀번호로 로그인한 뒤 비밀번호를 변경해주세요.";
		
		emailSend(setFrom, setTo, title, content);
		
		return tempPassword;
	}
	
	
	// 이메일 전송
	@Override
	public void emailSend(String setFrom, String setTo, String title, String content) {
		System.out.println("emailSend 호출됨");
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(setTo);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public String getEcodeAuthCheck(String eCode) {
		System.out.println("eCode: " + eCode + " and " + "authCode: " + authCode);
		
		return (eCode.equals(authCode)) ? "correct" : "wrong";
		
	}
	
}
