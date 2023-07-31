package com.booknow.travelapp.test_mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.hotel.mapper.HtReservationsMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class HtResMapperTest {

    @Setter(onMethod_ = @Autowired)
    private HtReservationsMapper htReservationsMapper;

    @Test
    public void TestselectHtRoomSellDateResAble() {
        System.out.println("[sys] room sell date test : "+ 
        htReservationsMapper.selectHtRoomSellDateResAble(700L));
    }

}// HtResMapperTest end
