package com.booknow.travelapp.airways.test_service;


//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.airways.service.AirReservationsService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class AirReservationsServiceTest {

    @Setter(onMethod_ = @Autowired)
    private AirReservationsService airReservationsService ;

//    @Test
//    public void testAirReservationsServiceExist() {
//    	log.info(airReservationsService);
//    	assertNotNull(airReservationsService) ;
//    }
    
    //고객이 선택한 항공편 정보 조회 테스트
//    @Test
//    public void testSelectChoicedFlight() {
//    	
//    	List<AirReservationsVO> testList = 
//    	airReservationsService.getAirReservationsInfo(1234) ;
//    	
//    	System.out.println("항공사이름: " + testList.get(0).getAirlineNm());
//    	System.out.println("노선번호: " + testList.get(0).getVihicleId());
//    	System.out.println("출발공항: " + testList.get(0).getDepAirportId());
//    	System.out.println("도착공항: " + testList.get(0).getArrAirportId());
//    	System.out.println("출발시간: " + testList.get(0).getDepPlandTime());
//    	System.out.println("도착시간: " + testList.get(0).getArrPlandTime());
//    	System.out.println("좌석등급: " + testList.get(0).getAirClass());
//    	
//    }// test end
    
  //로그인된 사용자 정보조회 테스트
//    @Test
//    public void testSelectUserInfo() {
//
//    	List<TLUsers> testUserList = 
//    			airReservationsService.getUserInfo("userAdmin") ;
//    	
//    	System.out.println("testUserList: " + testUserList);
//    	
//    	System.out.println("userName: " + testUserList.get(0).getUserName());
//    	System.out.println("userEmail: " + testUserList.get(0).getUserEmail());
//    	System.out.println("userPhoneNumber: " + testUserList.get(0).getUserPhoneNumber());
//    	System.out.println("userBday: " + testUserList.get(0).getUserBday());
//    	
//    }// test end
    
      //탑승객 등록 테스트
//    @Test
//    public void testRegisterPassenger() {
//
//    	AirPassengersVO newPassenger = new AirPassengersVO();
//    	
//    	newPassenger.setAirPasno(9999);
//    	newPassenger.setAirResno(11111);
//    	newPassenger.setAirPasName("탑승자1");
//    	newPassenger.setAirPasGender("남자");
//    	newPassenger.setAirPasBDate("19980101");
//    	
//    	airReservationsService.registerPassengerInfo(newPassenger) ;
//    	
//    }
    
    //최종예약정보 조회테스트
    @Test
    public void testSelectFinalInfo() {
    	
    	
    	airReservationsService.getFinalReservationInfo(11111) ;
    	

    }// test end
    
} //class-end

