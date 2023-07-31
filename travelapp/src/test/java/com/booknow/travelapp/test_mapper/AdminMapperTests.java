package com.booknow.travelapp.test_mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.common.domain.TLSalesVO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingDTO;
import com.booknow.travelapp.common.mapper.AdminMapper;
import com.booknow.travelapp.common.mapper.TLSalesMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/security-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class AdminMapperTests {

    @Setter(onMethod_ = @Autowired)
    private AdminMapper adminMapper;
    
    @Setter(onMethod_ = @Autowired)
    private TLSalesMapper tLSalesMapper;

//    @Test
//    public void selectManagerBoardListTest() {
//        System.out.println("[sys] admin test : "+ adminMapper.selectManagerBoardList(new AmBoardPagingDTO(1, 5)));
//    }
//
//    @Test
//    public void selectManagerBoardTest() {
//        System.out.println("[sys] admin test : "+ adminMapper.selectManagerBoard(2L));
//    }
//
//    @Test
//    public void updateManagerBoardTest() {
//        System.out.println("[sys] admin test : "+ adminMapper.selectManagerBoard(2L));
//    }
//    
    @Test
    public void tLSalesMapperTest() {
    	TLSalesVO test = new TLSalesVO();
    	test.setSelectedYear("2023");
    	System.out.println("[sys] mapper test : "+tLSalesMapper.selectHtMonthlySales(test));
    }
}// test end
