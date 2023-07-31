package com.booknow.travelapp.hotel.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HotelVO;
import com.booknow.travelapp.hotel.service.HtHotelListService;


//작업자 정지은 , 호텔리스트 컨트롤러 23-06-27
@Controller
@RequestMapping("/hotel/*")
public class HtHotelListController {
	
	private HtHotelListService htHotelListService;
	 
	
	
	public HtHotelListController(HtHotelListService htHotelListService) {
		this.htHotelListService = htHotelListService;
	}

	//호텔리스트 (지역,날짜) 
	@GetMapping("/list")
	public void showHotelList(
		HotelVO hotel,
		@RequestParam(value="pageNum", defaultValue = "1") int pageNum, 
		Model model
		) {
			model.addAttribute("search", hotel);
			model.addAttribute("pageNum", pageNum);
	}//showHotelList end
	
	
//	//호텔 등급 높은 순 
	//@GetMapping("/desc/{htAreaCode}/{startDateStr}/{endDateStr}/{HighRank}/{pageNum}")
	@GetMapping("/desc/{HighRank}/{pageNum}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> showHotelDesc(
		HotelVO hotel,
		@PathVariable("HighRank")int rank, 
		@PathVariable(value="pageNum", required=false) Integer pageNum){

		if(pageNum == null) {
			pageNum = 1;
		}
	
		hotel.setHtrankflg(rank);
		
		HashMap<String, Object> hotelObj = new HashMap<String, Object>();	
		hotelObj.put("hotelList",htHotelListService.getHotelList(hotel,pageNum));	
		
		TLHotelListPageDTO pagingCreator = htHotelListService.getRowAmountTotal(hotel, pageNum);	
		hotelObj.put("pagingCreator", pagingCreator);
		
		
		return new ResponseEntity<HashMap<String, Object>>(hotelObj,HttpStatus.OK);	
	}
	

	//호텔 등급 낮은 순 
	//@GetMapping("/asc/{htAreaCode}/{startDateStr}/{endDateStr}/{LowRank}/{pageNum}")
	@GetMapping("/asc/{LowRank}/{pageNum}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> showHotelAsc(
		HotelVO hotel,
		@PathVariable("LowRank")int rank,
		@PathVariable(value="pageNum", required=false) Integer pageNum){				
		if(pageNum == null) {
			pageNum = 1;
		}
		
		hotel.setHtrankflg(rank);
		
		HashMap<String, Object> hotelObj = new HashMap<String, Object>();	
		hotelObj.put("hotelList",htHotelListService.getHotelList(hotel,pageNum));	
		
		TLHotelListPageDTO pagingCreator = htHotelListService.getRowAmountTotal(hotel, pageNum);	
		hotelObj.put("pagingCreator", pagingCreator);
		
		return new ResponseEntity<HashMap<String, Object>>(hotelObj,HttpStatus.OK);	
	}
	
	
	//가격 높은 호텔 조회 
	//@GetMapping("/high/{htAreaCode}/{startDateStr}/{endDateStr}/{highPrice}/{pageNum}")
	@GetMapping("/high/{highPrice}/{pageNum}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> showHotelPriceHigh(
		HotelVO hotel,
		@PathVariable("highPrice")int highPrice,
		@PathVariable(value="pageNum", required=false) Integer pageNum){
		
		if(pageNum == null) {
			pageNum = 1;
		}
		
		hotel.setHtpriceFlg(highPrice);	
		
		HashMap<String, Object> hotelObj = new HashMap<String, Object>();	
		hotelObj.put("hotelList",htHotelListService.getHotelList(hotel,pageNum));	
		
		TLHotelListPageDTO pagingCreator = htHotelListService.getRowAmountTotal(hotel, pageNum);	
		hotelObj.put("pagingCreator", pagingCreator);
		
		return new ResponseEntity<HashMap<String, Object>>(hotelObj,HttpStatus.OK);	
		
	}

	//가격 낮은 호텔 조회 
	//@GetMapping("/low/{htAreaCode}/{startDateStr}/{endDateStr}/{lowPrice}/{pageNum}")
	@GetMapping("/low/{lowPrice}/{pageNum}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> showHotelPriceLow(
		HotelVO hotel,
		@PathVariable("lowPrice")int lowPrice,
		@PathVariable(value="pageNum", required=false) Integer pageNum){

		if(pageNum == 0) {
			pageNum = 1;
		}
		
		hotel.setHtpriceFlg(lowPrice);
		
		HashMap<String, Object> hotelObj = new HashMap<String, Object>();	
		hotelObj.put("hotelList",htHotelListService.getHotelList(hotel,pageNum));	
		
		TLHotelListPageDTO pagingCreator = htHotelListService.getRowAmountTotal(hotel, pageNum);	
		hotelObj.put("pagingCreator", pagingCreator);
		
		
		return new ResponseEntity<HashMap<String, Object>>(hotelObj,HttpStatus.OK);	
	}
	
	
	//호텔이미지 보여주기 
	//호텔 이미지 보여주기 
	@GetMapping("/hotelFiles/{hotelNumber}")
	@ResponseBody
	public ResponseEntity<Resource> getHotelFileByFileName(@PathVariable("hotelNumber") Long htNo) {
		
		 //db저장된 이미지 정보 불러오기
		 TLHotelAttachFilesVO hotelFile = htHotelListService.showImageOfHotel(htNo);	  
		 String htUuid =  hotelFile.getHtuuid();
		 String htUploadPath = hotelFile.getHtUploadPath(); // C:\myupload\hotel\2023\07\13
		 String htFileName = hotelFile.getHtFileName(); //hotel.jpg		
		  //이미지경로
		  String filePath = htUploadPath + "\\" +  htUuid +  "_"  +  htFileName;
		  //파일객체 생성(파일을 조작할 수 있는 클래스)
		  File file = new File(filePath);
	  
		  String mimeType = "";		  
		  //파일의 경로가 존재하면 실행
		  if(file.exists()) {
			 
			  try {
				//로컬파일에 저장된 이미지 읽기 
				InputStream inputStream = new FileInputStream(file);
				 Resource resource = new InputStreamResource(inputStream);
					
					//contentType 설정 (이미지 mime타입이 여러개(jpeg,png 등) 러서 데이터 종류를 식별해야함)
					// 마지막 .(점) 이후를 추출 
					String extension = htFileName.substring(htFileName.lastIndexOf(".")+1); 
					
					//mime타입 설정 (호텔등록페이지에서 jpg,jpeg,png,gif만 업로드되도록 햇음)
					switch(extension.toLowerCase()) {
						case "jpg":
					    case "jpeg":
					        mimeType = "image/jpeg";
					        break;
					    case "png":
					        mimeType = "image/png";
					        break;
					    case "gif":
					        mimeType = "image/gif";
					        break;      
					}
					
					
					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.parseMediaType(mimeType));
					headers.setContentLength(file.length()); 
					
					//이미지를 전달할 때는 header와 body 둘다 보내야함 
					return ResponseEntity.ok()
					       .headers(headers)
					       .body(resource);  
					  
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}//end-trycatch
			
		  }//end-if  	  		  
	  return ResponseEntity.notFound().build(); 
	}
	
	//객실이미지보여주기 
	@GetMapping("/roomFiles/{htRooNo}")
	@ResponseBody
	public ResponseEntity<Resource> getRoomImages(@PathVariable("htRooNo") Long htRooNo) throws IOException {

	    // db에서 특정 방의 이미지리스트를 받아옴
	    TLRoomAttachFilesVO roomFile = htHotelListService.showImageOfRoom(htRooNo);   
	  
	    
	    if(roomFile != null) {
	    	  String rmUuid =  roomFile.getRmUuid();
	 		 String rmUploadPath = roomFile.getRmUploadPath(); // C:\myupload\hotel\2023\07\13
	 		 String rmFileName = roomFile.getRmFileName(); //hotel.jpg
	 		 
	 		  //이미지경로
	 		  String filePath = rmUploadPath + "\\" +  rmUuid +  "_"  +  rmFileName;
	 		  //파일객체 생성(파일을 조작할 수 있는 클래스)
	 		  File file = new File(filePath);
	 	  
	 		  String mimeType = "";
	 		  
	 		  //파일의 경로가 존재하면 실행
	 		  if(file.exists()) {
	 			 
	 			  try {
	 				//로컬파일에 저장된 이미지 읽기 
	 				InputStream inputStream = new FileInputStream(file);
	 				 Resource resource = new InputStreamResource(inputStream);
	 					
	 					//contentType 설정 (이미지 mime타입이 여러개(jpeg,png 등) 러서 데이터 종류를 식별해야함)
	 					// 마지막 .(점) 이후를 추출 
	 					String extension = rmFileName.substring(rmFileName.lastIndexOf(".")+1); 
	 					
	 					//mime타입 설정 (호텔등록페이지에서 jpg,jpeg,png,gif만 업로드되도록 햇음)
	 					switch(extension.toLowerCase()) {
	 						case "jpg":
	 					    case "jpeg":
	 					        mimeType = "image/jpeg";
	 					        break;
	 					    case "png":
	 					        mimeType = "image/png";
	 					        break;
	 					    case "gif":
	 					        mimeType = "image/gif";
	 					        break;      
	 					}
	 					
	 					
	 					HttpHeaders headers = new HttpHeaders();
	 					headers.setContentType(MediaType.parseMediaType(mimeType));
	 					headers.setContentLength(file.length()); 
	 					
	 					//이미지를 전달할 때는 header와 body 둘다 보내야함 
	 					return ResponseEntity.ok()
	 					       .headers(headers)
	 					       .body(resource);  
			
	 			} catch (FileNotFoundException e) {
	 				e.printStackTrace();
	 			}//end-trycatch
	 			
	 		  }//end-if  	  
	
	    }
	   
		  
		  return ResponseEntity.notFound().build(); 
	    
	}
	
	
		
}// class end
