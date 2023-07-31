package com.booknow.travelapp.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Primary
@Service
public class MailSendServiceImpl implements MailSendService {
 
	@Autowired
    private JavaMailSender javaMailSender;
    
    @Autowired
    public void MailSendService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    private int authNumber;
 
    @Override
    public void makeRandomNumber() {
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
//        log.info("checkNum : " + checkNum);
        authNumber = checkNum;
    }
 
    @Override
    public String joinEmail(String email) {
        makeRandomNumber();
 
        String toMail = email;
        String title = "이메일수정을 위한 인증메일입니다.";
        String message =
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" +
                "인증번호는 " + authNumber + " 입니다." +
                "<br><br>" +
                "해당 인증번호를 인증번호 확인한에 기입하여 주시기바랍니다.";
        mailSend(message,toMail, title);
        return Integer.toString(authNumber);
    }
 
    @Override
    public void mailSend(String message,String toMail, String title) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 입력시 html 양식으로 전달됨. 안하면 일단 텍스트 형식임.
            helper.setText(message,true);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

	 //
    
    
}