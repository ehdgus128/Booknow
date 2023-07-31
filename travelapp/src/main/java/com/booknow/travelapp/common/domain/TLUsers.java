package com.booknow.travelapp.common.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
@NoArgsConstructor
public class TLUsers {

    private String userId;
    private String userPassword;
    private String userName;
    private String userEmail;
    private String userAddress;
    private int userMileage;
    //230709 임지혁: form에서 name=userBday로 들어온 값이 "yyyy-MM-dd" 형식이면 Date 타입으로 변환해서 받는다
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date userBday;
    private String userPhoneNumber;
    private Timestamp userRegDate;
    private Timestamp userModDate;
    private int userStorage;
    private boolean enabled;
    
    //230717 임지혁: 네이버 로그인한 사용자 기존 사용자와 동일성 확인
    private String naverId;
    
    private List<TLAuthoritys> authorityList;
}
