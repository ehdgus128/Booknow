package com.booknow.travelapp.airways.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.airways.common.paging.domain.AirResDetailPagingCreatorDTO;
import com.booknow.travelapp.airways.common.paging.domain.AirResDetailPagingDTO;
import com.booknow.travelapp.airways.domain.AirResDetailVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.service.AirResDetailService;

@Controller
@RequestMapping("/airways/*")
public class AirResDetailControllor {

   
   //2023 06 27  세연 추가
   // private static final Class<Long> ResponseEntity = null; 20230710이게 왜생긴지 몰라서 일단 주석
   //서비스 주입
   private AirResDetailService airResDetailService;

   @Autowired
   public AirResDetailControllor(AirResDetailService airResDetailService) {
      this.airResDetailService = airResDetailService;
   }


   //airResList의 두번째 버전 : login유저 버전
   //principal 객체로 수정 --> 로그인 거쳐서 principal 객체를 만들수 없어서, 이 소스에 관해서는 아직 테스트는 안해봄 
   @GetMapping("/airResList" ) 
   @PreAuthorize("isAuthenticated()") //로그인해야 들어올수 있음
   public void showUserResList(Model model,  AirResDetailPagingDTO airResDetailPagingDTO){

      Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String userId = ((UserDetails)principal).getUsername();

      model.addAttribute("userId", userId);
      //
      long  airResRowTotal = airResDetailService.getAirResRowTotal(userId,airResDetailPagingDTO);


      if(airResDetailService.notNullRes(userId) != 0) {

         AirResDetailPagingCreatorDTO pagingDTO = new AirResDetailPagingCreatorDTO(airResRowTotal,airResDetailPagingDTO);
         model.addAttribute("pagingDTO", pagingDTO);


         model.addAttribute("keyword", airResDetailPagingDTO.getKeyword());
         model.addAttribute("scope", airResDetailPagingDTO.getScope());

         model.addAttribute("depPlandTime", airResDetailPagingDTO.getDepPlandTime());
         model.addAttribute("arrPlandTime", airResDetailPagingDTO.getArrPlandTime());

         model.addAttribute("airResPagingLast", pagingDTO.getAirResPagingLast());

         model.addAttribute("userResList" ,airResDetailService.getAirReservations(userId, airResDetailPagingDTO));

      } else {
         model.addAttribute("userResList", "ResNull");
      }

   }
   
   //해당 계정만 들어올수 있게 
   @GetMapping("/airResDetail")
   @PreAuthorize("isAuthenticated()")
   public void showUserResDetail(Model model, @RequestParam("airResno") long airResno ) {
      
      Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String userId = ((UserDetails)principal).getUsername();
	        
      List<AirResDetailVO> airResDetail =  airResDetailService.getAirResDetail(airResno);
      List<AirRouteVO> airResPerRoute = airResDetailService.getAirResPerRoute(airResno);
    
      //  새로 추가 20230712
      if((!airResDetail.get(0).getUserId().equals(userId)) ){ //get했을때 다른 userId 내역보는걸 방지 // 500오류는 따로 처리해줘야함 
         model.addAttribute("checkUser",404);
         model.addAttribute("airResDetail",null);
      }else {
    
         //총 인원 수 
         model.addAttribute("peopleCnt",airResDetailService.getAirResPeopleCnt(airResno))  ;
         //예약번호
         model.addAttribute("airResno",airResno);

         //세부번호
         model.addAttribute("airResDetail",airResDetail);

         //예약 번호 1건당 노선
         model.addAttribute("airResPerRoute",airResPerRoute);
         model.addAttribute("uuId",airResDetailService.getUUId(userId,airResno));
      }
   }
   
   
   @ResponseBody
   @PostMapping(value="/airResDetail",
               produces= "application/json;charset=utf-8" )
   public ResponseEntity<HashMap<String,Long>> peopleCnt (@RequestParam("airResno") long airResno, Model model) {
      
      Long peopleCnt =  airResDetailService.getAirResPeopleCnt(airResno);
      Long totalPrice =  airResDetailService.getAirTotalprice(airResno);  
      
      HashMap<String, Long> response = new HashMap<>();
      response.put("peopleCnt", peopleCnt);
      response.put("totalPrice", totalPrice);

      return  new ResponseEntity<>(response, HttpStatus.OK);
   }

   
   
  
   
   
   
}