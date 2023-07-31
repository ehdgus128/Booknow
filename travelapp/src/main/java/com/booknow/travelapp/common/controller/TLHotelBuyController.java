package com.booknow.travelapp.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booknow.travelapp.common.domain.TLRoomAttachFilesVO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelBuyPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdRoomPagingDTO;
import com.booknow.travelapp.common.domain.TLHotelAttachFilesVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLHotelSellDateVO;
import com.booknow.travelapp.common.domain.TLHotelTotalDTO;
import com.booknow.travelapp.common.service.TLHotelAttachService;
import com.booknow.travelapp.common.service.TLHotelService;

//230711 호텔등록페이지 작업자 정지은 (호텔파트랑 방파트로 구역 나눔)
@Controller
@RequestMapping(value="/admin/hotel/*")
public class TLHotelBuyController {
	
	private TLHotelService hotelService;
	private TLHotelAttachService attachService;
	
	
	public TLHotelBuyController(TLHotelService hotelService,
							TLHotelAttachService attachService) {
		this.hotelService = hotelService;
		this.attachService = attachService;
	}
	

	/*                         호텔파트                        */
	//호텔등록리스트 
	@GetMapping("/list")
    @PreAuthorize("hasAuthority('ADMIN')")
	public void showHotelList(ModelMap model,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		model.put("hotelList",hotelService.showHotelList(pageNum));
		TLAdHotelPagingDTO pageBean = hotelService.getTotalRowAmount(pageNum);
		model.put("pageBean", pageBean);
			
	}
	
	//호텔등록페이지
	@GetMapping("/register")
	@PreAuthorize("hasAuthority('ADMIN')")
	public void showRegisterPage() {
	}

	//create	
	//호텔등록구현 
	@PostMapping("/register")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String registerHotel(TLHotelTotalDTO hotel,
			RedirectAttributes redirectAttr) {	
		
		TLHotelTotalDTO hotelDTO = hotelService.registerHotelInfo(hotel);	 
		Long htNo = hotelDTO.getHtNo();
		Long busId = hotelDTO.getBusId();
		
		//값 전달
		redirectAttr.addAttribute("htNo",htNo);
		redirectAttr.addAttribute("busId",busId);		
	       
		return "redirect:/admin/hotel/detail";
	}
		
	
	//사업자번호 중복체크 
	@GetMapping(value="/checkBusNumExists/{busRegNum}",
				produces="text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> checkBusRegNumExists(@PathVariable("busRegNum")String busRegNum){	
			String result = hotelService.checkBusRegNumExists(busRegNum);
		
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}

//read	
	//호텔상세페이지 
	@GetMapping("/detail")
	@PreAuthorize("hasAuthority('ADMIN')")
	public void showHotelDetail(@RequestParam(value="htNo",required=false)Long htNo,
			@RequestParam(value="busId",required=false)Long busId,ModelMap model) {	
	
		System.out.println("htNo: "+htNo);
		System.out.println("busId: "+busId);
		
		
		TLHotelTotalDTO hotelDTO = new TLHotelTotalDTO();
		hotelDTO.setHtNo(htNo);
		hotelDTO.setBusId(busId);	
		
		//리스트에서는 htNo만 받음 	
		model.put("hotelDTO", hotelService.showHotelDetail(hotelDTO));
	}
	
//update
	//호텔수정 
	@PutMapping(value="/modify",
				consumes="application/json; charset=utf-8",
				produces="text/plain; charset=utf-8")
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> modifyHotel(@RequestBody TLHotelTotalDTO hotelDTO) {
		return new ResponseEntity<String>(hotelService.updateHotelInfo(hotelDTO),HttpStatus.OK);
	}
	

	//호텔삭제 
//delete cascade로 연결되있어서 사업자만 삭제하면 호텔, 방 다 삭제됨
/*	@DeleteMapping("/delete/{busId}")
	@ResponseBody	
	public ResponseEntity<String> deleteHotel(@PathVariable("busId")Long busId,
											   @PathVariable("htNo")Long htNo) {
		hotelService.removeBusUser(busId);

		//로컬에 있는 파일데이터도 지우기 
		TLHotelAttachFilesVO attachFile = attachService.showAttachFilesByHtNo(htNo);
		String htUploadPath = attachFile.gethtUploadPath();//경로	
		//경로를 운영체제에 알맞게 변환 
		Path filePath = Paths.get(htUploadPath);
		//운영체제 경로 
		String osPath = FileSystems.getDefault().getPath().toString();
		// uuid
		String htuuid = attachFile.getHtUuid(); 
		// 파일이름 
		String htFileName = attachFile.getHtFileName(); 
		// 삭제할 파일의 경로+파일명
		String filePath =osPath+"\"+uuid+"_"+htFileName ; 
        File file = new File(filePath);
        if (file.exists()) {
            boolean deleted = file.delete();
            if (deleted) {
                System.out.println("파일이 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("파일 삭제에 실패했습니다.");
            }
        } else {
            System.out.println("삭제할 파일이 존재하지 않습니다.");
        }
		return new ResponseEntity<String>("삭제",HttpStatus.OK);
	}	
	
*/
	
		
	/*                         방파트                        */
//read	
	//방리스트 
	@GetMapping(value="/room/list/{htNo}/{pageNum}",
				produces= {"application/json; charset=UTF-8"})
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<HashMap<String, Object>> showRoomList(@PathVariable("htNo")Long htNo,
															@PathVariable("pageNum")Integer pageNum){
		  if(pageNum == null) {
			  pageNum = 1;
		  }
		  
		  HashMap<String, Object> resultRoom = new HashMap<String, Object>();

		  TLAdRoomPagingDTO roomPageBean =  hotelService.getTotalRoomRowAmount(htNo, pageNum);
		  resultRoom.put("roomPageBean", roomPageBean);
		  resultRoom.put("roomList", hotelService.showRoomList(htNo,pageNum));
		
		 return new ResponseEntity<HashMap<String, Object>>(resultRoom,HttpStatus.OK);
	}
	
//	//방거래날짜 
//	@GetMapping(value="/room/date/{htRooNo}",
//				produces= {"application/json; charset=UTF-8"})
//	@ResponseBody
//	public ResponseEntity<List<TLHotelRoomVO>> showRoomDate(@PathVariable("htRooNo")Long htRooNo){
//		return new ResponseEntity<List<TLHotelRoomVO>>(hotelService.showRoomBuyDate(htRooNo),HttpStatus.OK);
//	}
//	

//create 
	//방 등록 
	@PostMapping(value="/room/register",
				 produces= {"text/plain; charset=UTF-8"},
				 consumes="application/json; charset=utf-8")
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> registerRoomAndDate(@RequestBody TLHotelRoomVO roomVO){
		
		System.out.println(roomVO.getHtRooType() + ":타입");
		String result;
		if(hotelService.registerRoom(roomVO)) {
			result="성공";
		}else {
			result = "오류";
		}
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	

	/*                판매일 추가 페이지                             */
	
	
	//판매일추가 페이지 
	@GetMapping("/addSellDate")
	@PreAuthorize("hasAuthority('ADMIN')")
	public void showAddSellDatePage(@RequestParam("htRooNo")Long htRooNo,
									@RequestParam("busId")Long busId,
									@RequestParam("htNo")Long htNo,
									ModelMap model) {
		model.put("hotelInfo", hotelService.showRoomDetail(htRooNo));
		model.put("busId", busId);
		model.put("htNo", htNo);
	}
				
	//판매일추가
	@PostMapping(value="/addSellDate",
				produces= {"text/plain; charset=UTF-8"},
				consumes="application/json; charset=utf-8")
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> addSellDate(@RequestBody TLHotelSellDateVO sellVO){
		
		System.out.println("htroono : " + sellVO.getHtRooNo());
		hotelService.registerRoomDate(sellVO);	
		return new ResponseEntity<String>("완료",HttpStatus.OK);
	}
	
	//판매목록 리스트페이지 
	@GetMapping(value="roombuylist/{htRooNo}/{pageNum}",
				produces= {"application/json; charset=utf-8"})
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<HashMap<String,Object>> showDateLists(@PathVariable("htRooNo")Long htRooNo,
																@PathVariable(value="pageNum")Integer pageNum){		
		
		if(pageNum == null) {
			pageNum = 1;
		}
		
		TLAdHotelBuyPagingDTO datePageBean = hotelService.getTotalSellAmount(htRooNo, pageNum);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("datePageBean", datePageBean);
		resultMap.put("dateLists", hotelService.showRoomSellDate(htRooNo,pageNum));
		return new  ResponseEntity<>(resultMap,HttpStatus.OK);  
	}
	

	//객실삭제
//delete 
	//delete cascade로 연결되있어서 객실 삭제하면 모든 데이터가 삭제됨 
/*	@DeleteMapping("/deleteRoom/{htRooNo}")
	@ResponseBody	
	public ResponseEntity<String> deleteHotel(@PathVariable("htRooNo")Long htRooNo) {
		hotelService.removeRoom(htRooNo);
		//로컬에 있는 파일데이터도 지우기 
		TLRoomAttachFilesVO attachFile = attachService.showRmAttachFilesByhtRooNo(htRooNo);
		String rmUploadPath = attachFile.gethtUploadPath();//경로	
		//경로를 운영체제에 알맞게 변환 
		Path filePath = Paths.get(rmUploadPath);
		//운영체제 경로 
		String osPath = FileSystems.getDefault().getPath().toString();
		// uuid
		String rmuuid = attachFile.getRmUuid(); 
		// 파일이름 
		String rmFileName = attachFile.getRmFileName(); 
		// 삭제할 파일의 경로+파일명
		String filePath =osPath+"\"+rmuuid+"_"+htFileName ; 
        File file = new File(filePath);
        if (file.exists()) {
            boolean deleted = file.delete();
            if (deleted) {
                System.out.println("파일이 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("파일 삭제에 실패했습니다.");
            }
        } else {
            System.out.println("삭제할 파일이 존재하지 않습니다.");
        }

		return new ResponseEntity<String>("삭제",HttpStatus.OK);
	}	
*/
	
	
	/*                           첨부파일파트                         */
	
//create	
	//호텔
	@PostMapping(value="/hotelImageUpload/{htNo}",
				 produces= {"text/plain; charset=UTF-8"})
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> hotelFileUploadAjax(@PathVariable("htNo")Long htNo,
														MultipartFile hotelUploadFile){
		
		/*                db 저장                   */
		TLHotelAttachFilesVO hotelFile = new TLHotelAttachFilesVO();	
		//htNo셋팅 
		hotelFile.setHtNo(htNo);	
		//부모경로뽑기
		String repoPath = hotelFile.getHtRepoPath(); //C:/myupload/hotel
		//운영체제용 경로설정 
		Path getOsPath = Paths.get(repoPath,getDateFormatPathName());
		String htUploadPath = getOsPath.toAbsolutePath().normalize().toString();
		//문자열 경로 추가 
		File fileUploadPath = new File(htUploadPath);			
		//htUploadPath 셋팅 
		hotelFile.setHtUploadPath(htUploadPath);		
		//파일이 존재하지 않을 시 생성
		if(!fileUploadPath.exists()) {
			fileUploadPath.mkdirs();
		}
		//원본문자열 
		String fileName = hotelUploadFile.getOriginalFilename();
		System.out.println("파일이름: "+fileName);
		//원본파일이름 셋팅 
		hotelFile.setHtFileName(fileName);	
		//uuid생성
		UUID hotelUUID = UUID.randomUUID();
		//htUUID 셋팅
		hotelFile.setHtuuid(hotelUUID.toString());
		attachService.registerHtFile(hotelFile); //db 저장 
		

		//파일이름에 uuid추가
		fileName = hotelUUID.toString() + "_" + fileName;
		System.out.println("uuid추가된이름: "+fileName);	
		//업로드 정보 (저장경로 + 파일이름 문자열로 파일객체 생성)
		File saveUploadFile = new File(fileUploadPath,fileName);
		System.out.println("저장시 사용되는 파일이름 : " + saveUploadFile);		
		//파일객체를 이용하여 업로드 파일저장
		try {
			hotelUploadFile.transferTo(saveUploadFile);
		}catch (IOException e) {
			e.printStackTrace();
		}						
		
		return new ResponseEntity<String>("등록완료",HttpStatus.OK);
	}
	

	//방이미지등록
	@PostMapping(value="room/roomImageUpload/{htRooNo}",
				 produces= {"text/plain; charset=UTF-8"})
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<String> roomFileUploadAjax(@PathVariable("htRooNo")Long htRooNo,
													 MultipartFile roomUploadFile){
		
		//rmUuid값을 전달해주기위한 클래스		
		TLRoomAttachFilesVO roomFile = new TLRoomAttachFilesVO();
		//htRooNo 셋팅
		roomFile.setHtRooNo(htRooNo);
		
		//부모경로 
		String parentPath = roomFile.getRmRepoPath(); 
		//부모경로 + 날짜경로 추가 
		File fileUploadPath = new File(parentPath,getDateFormatPathName());
		//경로 존재 X, 폴더생성
		if(!fileUploadPath.exists()) {
			fileUploadPath.mkdirs();
		}
		//rmUploadPath 셋팅
		String uploadPath = fileUploadPath.getAbsolutePath(); 
		roomFile.setRmUploadPath(uploadPath);
		
		//원본파일문자열
		String originalFileName = roomUploadFile.getOriginalFilename();
		//rmFileName 셋팅 
		roomFile.setRmFileName(originalFileName);
		
		//UUID추가 , uuid 셋팅
		UUID uuid = UUID.randomUUID();
		roomFile.setRmUuid(uuid.toString());
					
		//방의 파일 db등록 
		attachService.registerRmFile(roomFile);			
		originalFileName = uuid.toString() + "_" + originalFileName;					
		//파일업로드 file객체 생성(저장경로 + 파일이름) 
		File saveUploadFile = new File(fileUploadPath,originalFileName);
	
		//파일전송 
		try {
			roomUploadFile.transferTo(saveUploadFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
					
		return new ResponseEntity<String>("등록",HttpStatus.OK);
	}
	
	

	// 특정 호텔의 모든 방리스트 (첨부파일 등록시 select에 사용,페이징처리 X)
	@GetMapping(value="/select/{htNo}",
				produces= {"application/json; charset=UTF-8"})
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<List<TLHotelRoomVO>> showHotelRooms(@PathVariable("htNo")Long htNo){		
		return new ResponseEntity<List<TLHotelRoomVO>>(attachService.showRoomListForSelect(htNo),HttpStatus.OK);
	}
		
	
	
	
//read
	//호텔 이미지 보여주기 
	@GetMapping("/hotelFiles/{htNo}")
	@ResponseBody //호텔은 이미지 하나만 저장되게 만들어서 <Resource>로 설정했음
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<Resource> getHotelFileByFileName(@PathVariable("htNo") Long htNo) {
		
		
		 //db저장된 이미지 정보 불러오기
		 TLHotelAttachFilesVO hotelFile = attachService.showAttachFilesByHtNo(htNo);	  
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
	
	
	// 방이미지보여주기
	@GetMapping("/room/roomFiles/{htRooNo}")
	@ResponseBody
	@PreAuthorize("hasAuthority('ADMIN')")
	public ResponseEntity<Resource> getRoomImages(@PathVariable("htRooNo") Long htRooNo) throws IOException {

	    // db에서 특정 방의 이미지리스트를 받아옴
	    TLRoomAttachFilesVO roomFile = attachService.showRmAttachFilesByhtRooNo(htRooNo);   
	    
	    System.out.println("방이미지 컨트롤러 ");
	    
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
	
	
	//날짜 형식 폴더경로 생성 메소드 
	private String getDateFormatPathName() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String strDatefmtPathName = sdf.format(date);
		return strDatefmtPathName.replace("/", File.separator);
	}
	
}
