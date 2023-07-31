package com.booknow.travelapp.controller;


import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.service.MailSendService;


@Controller 
public class MailSendController {
   private MailSendService mailSendService;
   private String authNum ;
   
   public MailSendController (MailSendService mailSendService) {
      this.mailSendService = mailSendService;
   }
   
   
   @GetMapping(value = "/mypage/test")
   public void showjsp() {
      
   }
   
   @ResponseBody
   @PostMapping(value = "mypage/api/mailcheck", 
   consumes = MediaType.APPLICATION_JSON_VALUE)
   //consumes = "applicatoin/jason;charset=utf-8")
   public ResponseEntity<String> mailCheck(@RequestBody HashMap<String, Object> user){
     
   
      
       String username = (String) user.get("username");
       
       String authNum = mailSendService.joinEmail(username);
       this.authNum = authNum;
 
    
       return ResponseEntity.status(HttpStatus.OK).body(authNum);
   }
   
   
   
   @RequestMapping(value = "mypage/api/mailcheck2", method = RequestMethod.POST,
   consumes = "application/json;charset=UTF-8",
   produces = "application/json;charset=UTF-8")
   //consumes = "applicatoin/jason;charset=utf-8")
//   public boolean mailCheckNum(@RequestBody HashMap<String, Object> user, @RequestParam("inputNum") String inputNum){
   @ResponseBody   
   public ResponseEntity<Boolean>mailCheckNum(@RequestBody HashMap<String, Object> user){
     
   
      
        
    
       boolean response = false;
   
       String inputNum = (String) user.get("inputNum");
       System.out.println("authNum"+ authNum);
       System.out.println("inputNum"+ inputNum);
       
       if(authNum.equals(inputNum)) {
          System.out.println("authNum: "+ authNum);
          System.out.println(inputNum);
          
          response = true;
          System.out.println("인증번호가 같습니다");
          return new ResponseEntity<>(response, HttpStatus.OK);
       }else {
          response = false;
          System.out.println("인증번호가 다름");
          return new ResponseEntity<>(response, HttpStatus.OK);
       }
 
    
       
   }
   
}