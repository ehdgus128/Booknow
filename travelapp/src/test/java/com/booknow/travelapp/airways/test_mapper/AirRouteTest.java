package com.booknow.travelapp.airways.test_mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.booknow.travelapp.airways.mapper.AirRouteMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
//@Log4j
public class AirRouteTest {
	
    @Setter(onMethod_ = @Autowired)
    private AirRouteMapper airRouteMapper;

//  //게시물 목록 조회 테스트 <-- 테스트 후 메서드 주석처리
//  @Test
//  public void testSelectBoardList() {
//	  
//	  String a = "서울";
//	  String b = "제주";
//      airRouteMapper.AirRouteSelect(b,a,"20230627").forEach(airRotue -> System.out.println(airRotue));
//      System.out.println(airRouteMapper);
//  }    
    
//   
  
}
