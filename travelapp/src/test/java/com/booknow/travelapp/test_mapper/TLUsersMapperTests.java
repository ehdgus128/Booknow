package com.booknow.travelapp.test_mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.common.domain.TLAuthoritys;
import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.mapper.TLUsersMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/security-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TLUsersMapperTests {


    //사용자 패스워드 암호화 
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;
    
    @Setter(onMethod_ = @Autowired)
    private TLUsersMapper tLUsersMapper;

    //회원 등록 테스트: 테스트(1)//2//3//
    @Test
    public void testInsertMyMember() {
//
    	TLUsers tLUsers = new TLUsers();
    	tLUsers.setUserId("userAdmin");
//    	tLUsers.setUserPassword((pwencoder.encode("sss55555")));

//    	tLUsers.setUserName("김영환");
//    	tLUsers.setUserEmail("e");
//    	tLUsers.setUserAddress("a");
//    	tLUsers.setUserMileage(1);
//    	tLUsers.setUserBday(new Date(5));
//    	tLUsers.setUserPhoneNumber("p");
//    	
//    	tLUsersMapper.insertTLUser(tLUsers);
    	TLAuthoritys authoritys = new TLAuthoritys("userAdmin", "ROLE_MEMBER", null);
    	tLUsersMapper.insertTLAuthoritys(authoritys);
        
        
    }// test end
    
} //class-end

