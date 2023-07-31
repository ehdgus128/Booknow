package com.booknow.travelapp.airways.test_service;
 

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.airways.mapper.AirResDetailMapper;
import com.booknow.travelapp.airways.service.AirResDetailService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/security-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class seyeon_Test {


 
    @Setter(onMethod_ = @Autowired)
    private AirResDetailMapper airResDetailMapper;
    
    @Setter(onMethod_ = @Autowired)
    private AirResDetailService airResDetailService;

    //상세 정보 select 테스트
    @Test
    public void testAitResSelet() {

    	
    //	 airResDetailService.getAirResDetail(11111);
        
    	
    }// test end
    
} //class-end */

