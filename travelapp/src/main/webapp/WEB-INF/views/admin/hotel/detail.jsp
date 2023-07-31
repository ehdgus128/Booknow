<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/views/include/adminheader.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>
input[readonly] {
  border: none;
  background: none;
  outline: none;
  box-shadow: none;
}

</style>
<div class="conatiner">
    <div class="row" style="text-align:center">
        <div class="col-lg-12">
            <h1 class="page-header">TLBOOK 호텔 상세페이지 </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="card shadow">
                <div class="card-body">
                    <div style="padding: 5px; text-align:center">
                        <h2>사업자 상세</h2>
                        <hr>
                    </div>
                    <div class="form-group">
                        <label for="busName">사업자이름</label>
                        <input type="text" id="busName" value="${hotelDTO.busName}"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="busRegNum">사업자번호</label>
                        <input type="text" id="busRegNum" value="${hotelDTO.busRegNum}" class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="busCertified">사업자등록여부</label><br>
                     	<c:choose>
                     		<c:when test="${hotelDTO.busCertified eq '1'}">
                     			<strong>증명</strong>
                     		</c:when>
                     		<c:otherwise>
                     			<strong>비증명</strong>
                     		</c:otherwise> 
                     	</c:choose>
                    </div>
                    <div style="padding: 5px; text-align:center">
                        <h2>호텔 상세</h2>
                        <hr>
                    </div>
		              <%-- 호텔이미지표시--%>
		             <div id="hotelImage">
		              		 <label for="htName">호텔이미지</label>
							 <img id="hotelImageElement" src="" alt="Hotel Image" style="width:300px;" >				 
							 <!-- 수정하기 버튼을 눌렀을 때, 삭제하기 이미지등록 버튼이 생성되는 공간  -->
							 <div id="newDeleteButton"></div> 
							 <div id="newHotelImageButton"></div>		 
				     </div>
                    <div class="form-group">
                        <label for="htName">호텔이름</label>
                        <input type="text" id="htName" value="${hotelDTO.htName }" class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htRank">호텔성급</label>
                        <input type="text" id="htRank" value="${hotelDTO.htRank }" class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htAddress">호텔지역</label>
                        <input type="text" id="htAreaCode" value="${hotelDTO.htAreaCode }"  class="form-control readonly" readonly>  
                    </div>
                      <div class="form-group">
                        <label for="htAddress">호텔상세주소</label>
                        <input type="text" id="htAddress" value="${hotelDTO.htAddress }"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htType">호텔타입</label>
                        <input type="text" id="htType" value="${hotelDTO.htType }"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htPhone">호텔연락처</label>
                        <input type="text" id="htPhone" value="${hotelDTO.htPhone }"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htEmail">호텔이메일</label>
                        <input type="text" id="htEmail" value="${hotelDTO.htEmail }"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htAvailDate">호텔계약일</label><br>
                        <small>계약 시작일 : </small>
                        <input type="text" value="${hotelDTO.htStartDate }"  id="resultOfstart" autocomplete="off" readonly>  
                        <small>계약 마감일 : </small>
                    	<input type="text"  value="${hotelDTO.htEndDate }"  id="resultOfEnd"  autocomplete="off" readonly>  
                    </div>
                    <div style="padding: 5px; text-align:center">
                        <h2>거래내역 상세</h2>
                        <hr>
                    </div>
                    <div class="form-group">
                        <label for="htBuyTranType">결제방법</label>
                        <input type="text" id="htBuyTranType"  value="${hotelDTO.htBuyTranType }"  class="form-control readonly" readonly>  
                    </div>
                    <div class="form-group">
                        <label for="htBuyCost">구입금액</label>
                        <input type="text" id="htBuyCost" value="${hotelDTO.htBuyCost }"  class="form-control readonly" readonly>  
                    </div>
                   			<!-- 작성버튼  -->
						<div class="form-group">
							<div id="modifyComplete" class="text-right"></div>
							<div class="text-right">							
								<button type="submit" class="btn btn-primary" id="modifyButton" style="padding:5px">수정하기</button>
								<!-- 수정하기를 눌렀을 때 수정완료버튼이 뜨는 곳  -->
								<button type="button" class="btn btn-primary" id="deleteButton" style="padding:5px">삭제하기</button>
								<button type="button" id="registerButton" class="btn btn-primary"  style="padding:5px">객실 등록하기</button>  
                      			<button type="button" id="registerImage" class="btn btn-primary"  style="padding:5px">이미지 등록하기</button>  
                      			<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/admin/hotel/list'">목록</button>
							</div>
						</div>
						
						<hr>
					<div style="padding: 5px; overflow: auto;">
                        <h2 style="float: left;">객실정보 </h2>
                      
                        
                        <hr>
                    </div>
                    
                     
                    
<%--방 시작 --%>   
                    <%--방 등록 --%>
                    <div id="registerRoom" style="margin:20px"></div>
                  
               
                    <%-- 방 표시되는 곳 --%>       
                    <div id="roomList"></div>  
                     <%-- 방의 페이징처리  --%>
	  				<div class="d-none d-md-block" id="roomPagination" style="text-align:center"></div>						
<%-- 방 끝--%>  
 					
 					
<%-- 이미지 등록구간 --%>
                    
                    
              <%-- 호텔이미지등록 form표시공간 --%>
			 <div id="hotelImageForm"></div>
             
              <%-- 객실이미지등록 form표시공간 --%> 
             <div id="roomListForSelect" style="padding: 5px"> </div>	 
			 <div id="roomImageForm"></div>
			
<%-- 이미지 등록 국끝 --%>
 					
 					
 					
 					
					</div>
				</div>		
				<div class="col-sm-3"></div>		
		</div>	  
	</div>
</div>
<div id='show'></div>
<script>

<!--  csrf 토큰  -->

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";


<!-- ###########################  방파트 ############################## -->
<!--  htNo 조회  -->
var htNo = '<c:out value="${param.htNo}"/>';
<!--  페이지 디폴트  -->
var pageNum = 1;
<!-- busId 조회 -->
var busId = '<c:out value="${hotelDTO.busId}"/>';
<!-- buyTranId 조회 -->
var htBuyTranId = '<c:out value="${hotelDTO.htBuyTranId}" />';

<!--  ### read  -->
<!--  페이징처리  -->
function goToPage(pageNum){
	showRoomList(pageNum);
}

<!--  방리스트  -->
function showRoomList(pageNum){
	$.ajax({
		url:"${contextPath}/admin/hotel/room/list/"+htNo + "/" + pageNum,
		type:"get",
		dataType:"json",
		success:function(result){		
			
			var roomList = result.roomList;
			var roomPageBean = result.roomPageBean;
			
			//방리스트 
			$("#roomList").empty();	
			var roomStr = "";
			for(var i=0; i<roomList.length; i++){
				roomStr +="<div id='roomsList'>";
				roomStr += "<strong>객실이름:&nbsp;&nbsp;<input class='roomlistName' type='text' value='" + roomList[i].htRooName + "' readonly></strong><hr>"
				roomStr += "<ul>";
				roomStr += "<li>객실타입:&nbsp;&nbsp;<input class='roomlistType' type='text' value='" + roomList[i].htRooType + "' readonly></li>";
				roomStr += "<li>객실판매가격:&nbsp;&nbsp;<input class='roomlistSellPrice' type='text' value='" + roomList[i].htRooPrice + "' readonly></li>";
				roomStr += "<li><strong>[객실이미지]</strong></li>";
				roomStr += "<li id='roomlist"+i+"'></li>";
				roomStr += '<li><button class="btn btn-primary addSellDateButton" data-htroono="'+roomList[i].htRooNo+'">객실 판매일 추가</button></li>';
				roomStr += "</ul>";
				roomStr += '<button class="btn btn-danger deleteRoomButton">삭제</button>';
				roomStr += "<hr>";		
				roomStr +="</div>";
				showRoomImage(roomList[i].htRooNo, i);//이미지도 같이 보여줌 
			}//end-for
			$("#roomList").html(roomStr);
			
			
			
			//페이징처리 
       	 	var paginationStr = '<ul class="pagination justify-content-center">';
       	    
      	    // 이전 버튼
      	    if (roomPageBean.prevPage <= 0) {
      	        paginationStr += '<li class="page-item disabled">';
      	        paginationStr += '<a href="#" class="page-link">이전</a>';
      	        paginationStr += '</li>';
      	    } else {
      	        paginationStr += '<li class="page-item">';
      	        paginationStr += '<a href="#" onclick="goToPage(' + roomPageBean.prevPage + ')" class="page-link">이전</a>';
      	        paginationStr += '</li>';
      	    }

      	    // 페이지 번호
      	    for (var idx = roomPageBean.min; idx <= roomPageBean.max; idx++) {
      	        if (idx == roomPageBean.currentPage) {
      	            paginationStr += '<li class="page-item active">';
      	            paginationStr += '<a href="#" class="page-link">' + idx + '</a>';
      	            paginationStr += '</li>';
      	        } else {
      	            paginationStr += '<li class="page-item">';
      	            paginationStr += '<a href="#" onclick="goToPage(' + idx + ')" class="page-link">' + idx + '</a>';
      	            paginationStr += '</li>';
      	        }
      	    }

      	    // 다음 페이지
      	    if (roomPageBean.max >= roomPageBean.pageCnt) {
      	        paginationStr += '<li class="page-item disabled">';
      	        paginationStr += '<a href="#" class="page-link">다음</a>';
      	        paginationStr += '</li>';
      	    } else {
      	        paginationStr += '<li class="page-item">';
      	        paginationStr += '<a href="#" onclick="goToPage(' + roomPageBean.nextPage + ')" class="page-link">다음</a>';
      	        paginationStr += '</li>';
      	    }

      	    paginationStr += '</ul>';

      	    $("#roomPagination").html(paginationStr);
			
			
			
			
		}//end-roomList
	})//end-ajax
}//end-showRoomList

<!--  ### create  -->

//객실 등록 form  버튼 클릭
$("#registerButton").on("click",function(){
	
	 var registerForm = '<strong>[객실등록]</strong><hr>' +
					     '<strong>객실이름 : &nbsp; </strong><input type="text" id="roomName" class="form-control">' +
					     '<strong>객실타입 : &nbsp; </strong><input type="text" id="htRooType" class="form-control">' +
					     '<strong>객실 구매가격 : &nbsp; </strong><input type="text" id="roomSellPrice" class="form-control"><br>' +
					     '<button type="button" id="registerRoomButton" class="btn btn-primary"  style="float: right;">등록</button>';
     
	$("#registerRoom").html(registerForm);
	

	
	
	
})

$(document).on("click", "#registerRoomButton", function() {
		
	  registerRoomAndDate();
	  
}); 
	


//방 등록
function registerRoomAndDate(){
	
	//값저장
	var roomName = $("#roomName").val();
	var htRooType = $("#htRooType").val();
	
	alert(htRooType);
	var roomSellPrice = $("#roomSellPrice").val(); //판매가격 
	
	var param = {htRooName:roomName,
				htRooType:htRooType,
				htRooPrice:roomSellPrice,
				htNo:htNo};
	
	$.ajax({
		url:"${contextPath}/admin/hotel/room/register",
		type:"post",
		data:JSON.stringify(param),
		dataType:"text",
		contentType:"application/json",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		success:function(resultJson){	
			alert("객실이 등록되었습니다");	
			showRoomList(pageNum);
			
		}//end-success	
	})//end-ajax
}//end-registerRoomAndDate

<!-- ###############################  판매일추가  ############################### -->

//판매일 추가 버튼 클릭 시 동작하는 함수
$(document).on("click", ".addSellDateButton", function() {
 
	
	  var htroono = $(this).data("htroono");
	  alert("htRooNo: " + htroono);
	  
 	location.href="${contextPath}/admin/hotel/addSellDate?htRooNo="+htroono+"&busId="+busId+"&htNo="+htNo;
	
});






<!--  ############################# 이미지등록  ############################  -->

<!-- 버튼클릭 -->
$("#registerImage").on("click",function(){
	
	hotelImageRegisterStr(); // 호텔이미지 입력칸 생성
	showRoomListForSelect(); // 객실번호 select화면 생성 
	roomImageRegisterStr(); // 객실이미지 입력칸 생성 
	
});


<!-- 특정 호텔의 모든 방 조회 첨부파일 등록시 select에 넣기 위해 추가 (페이징처리 X)-->
function showRoomListForSelect(){		
	$.ajax({
		url:"${contextPath}/admin/hotel/select/"+htNo,
		type:"get",
		dataType:"json",
		success:function(roomList){
	
			
			var str = '<strong>객실이름 선택</strong><br><select class="form-select" aria-label="Default select example"><option selected>객실이름을 선택해주세요</option>';
			
			for(var i=0; i<roomList.length; i++){
				 str += '<option value="'+ roomList[i].htRooNo +'">'+roomList[i].htRooName+'</option>';
				 
			}
			str += '</select>';
			
			$("#roomListForSelect").html(str);
			
		}//end-success
		
		
	})//end-ajax
	
}//end-showRoomListForSelect





<%-- 호텔 이미지등록 form html추가  --%>	
function hotelImageRegisterStr(){
	
	var hotelImageRegisterForm = '<div class="uploadHotelDiv">'+
								 '<div class="form-group">'+
								 '<label for="board_content">호텔이미지 등록</label>'+
								 '<input type="file" class="form-control" id="hotelImageRegisterForm" />'+
								 '<button type="button" id="registerHotelImage">등록</button>'
								 '</div>'+
								 '</div>';						 
	$("#hotelImageForm").html(hotelImageRegisterForm);
	
	
}

<!-- 객실이미지등록  html 추가-->
function roomImageRegisterStr(){
	
	var roomImageRegisterForm = '<div class="uploadRoomDiv">'+
								'<div class="form-group">'+
								'<label for="board_content">객실이미지 등록</label>'+
								'<input type="file" class="form-control" id="roomImageRegisterForm" />'+
								'<button type="button" id="registerRoomImage">등록</button>'+
								'</div>'+
								'</div>';
	
	
	$("#roomImageForm").html(roomImageRegisterForm);
	
}


<!-- 호텔이미지등록 버튼-->

$(document).on("click","#registerHotelImage",function(){
	
	registerHotelImage();
	
})

<!-- 방이미지등록 버튼 -->
$(document).on("click","#registerRoomImage",function(){
	
	registerRoomImage();
})


<!--호텔이미지 등록-->
function registerHotelImage(){
		
	
	var inputHtFiles = $("#hotelImageRegisterForm"); // 요소저장	
	var fileNameCheck = inputHtFiles.val(); //요소이름    
	//허용되는 확장자 
	var allowExt = /(jpg|jpeg|png|gif)$/i;
	if(!allowExt.test(fileNameCheck)){
		alert("jpg,jpeg,png,gif 파일만 업로드 할 수 있습니다. ")
		return;
	}

	var files = inputHtFiles[0].files;
	//파일크기 제한
	var maxAllowedSize = 10485760; 
	if(files.size > maxAllowedSize ){
		return;
	}
		
	//ajax 보내기위한 form
	var formData = new FormData();
	//formData에 파일추가 (한개만 업로드해서 바로 0번째 인덱스만 추가)
	formData.append("hotelUploadFile",files[0])
	
	$.ajax({
		type:"post",
		url:"${contextPath}/admin/hotel/hotelImageUpload/"+htNo,
		processData:false,
		contentType:false,
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		data:formData,
		dataType:"text",
		success:function(result){
		
			alert("호텔이미지 등록이 완료되었습니다.");
			showHotelImage(htNo);
			
			
		}//end-success	
		,error:function(error){
			console.error(error);
		}
		
	});//end-ajax	
}//end-registerHotelImage


<!-- 호텔이미지 확인 -->
function showHotelImage(htNo) {
  $.ajax({
    url: "${contextPath}/admin/hotel/hotelFiles/" + htNo,
    type: "GET",
    xhrFields: {
        responseType: "blob" // Blob(binary big object:거대이진파일)로 응답 받아야함
      },
      success: function(data) {
          var imageUrl = URL.createObjectURL(data); //자바스크립트 api , url을 생성함
          $("#hotelImageElement").attr("src", imageUrl);
        },
    error: function() {
     
    }
  });
}



<!--방이미지 등록-->
function registerRoomImage(){
	//선택한 값이 htRooNo로 가도록 설정 
	var htRooNo = $("#roomListForSelect option:selected").val(); 
	
	var inputRmFiles = $("#roomImageRegisterForm");
	
	var fileNameCheck = inputRmFiles.val(); //요소이름    
	//허용되는 확장자 
	var allowExt = /(jpg|jpeg|png|gif)$/i;
	if(!allowExt.test(fileNameCheck)){
		alert("jpg,jpeg,png,gif 파일만 업로드 할 수 있습니다. ")
		return;
	}	
	
	var rmFiles = inputRmFiles[0].files;
	//파일크기 제한
	var maxAllowedSize = 10485760; 
	if(rmFiles.size > maxAllowedSize ){
		return;
	}

	
	var formData = new FormData();
	//formData 객체에 파일추가 
	formData.append("roomUploadFile",rmFiles[0])
	
	$.ajax({
		type:'post',
		url:"${contextPath}/admin/hotel/room/roomImageUpload/"+htRooNo,
		processData:false,
		contentType:false,
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		data:formData,
		dataType:'text',
		success:function(result){
			alert("객실 첨부파일 등록이 완료되었습니다.");
			showRoomList(pageNum);
		}//end-success
		,error:function(error){
			console.error(error);
		}
		
	})//end-ajax
}//end-registerRoomImage


<!-- 방이미지 확인 -->
function showRoomImage(htRooNo, index) {
	  $.ajax({
	    url: "${contextPath}/admin/hotel/room/roomFiles/" + htRooNo,
	    type: "GET",
	    xhrFields: {
	      responseType: "blob" // Blob(binary big object:거대이진파일)로 응답 받아야함
	    },
	    success: function (data) {
	      var imageUrl = URL.createObjectURL(data); //자바스크립트 api , url을 생성함
	      var imageElement = "<img src='" + imageUrl + "' class='room-image'  style='width:70%' >";
	      $("#roomlist" + index).append(imageElement);
	    },
		error:function(error){
			console.error(error);
		}
	  });
}


<!-- ########################## 수정 ####################################  -->	 

<!-- #### 호텔수정 -->
$("#modifyButton").on("click",function(){
	
	//readonly 속성들을 다 선택
	var readOnly = $(".readonly")
	//readonly 속성 false로 바꿈 
	readOnly.prop("readonly",false);
	
	$(this).hide();//수정하기 숨김, dom구조에는 남아있음 
	
	 // 수정하기 버튼 생성
	 var modifyFinishButton = $("<button class='btn btn-success' id='modifyFinishButton'>수정완료</button>");
	 $("#modifyComplete").empty().append(modifyFinishButton);
	 
	 // 수정하기 버튼 클릭 이벤트 처리
 	 modifyFinishButton.on("click", function() {
  		  modifyHotelInfo();
	 });

})//end-modifyButton


//수정 완료 버튼을 누르면 수정처리시작
$(document).on("click","#modifyFinishButton",function(){
	modifyHotelInfo();
})//end-수정완료 

//수정 ajax
function modifyHotelInfo(){	
	
	  // 사업자 정보
	  var mdbusName = $("#busName").val();
	  var mdbusRegNum = $("#busRegNum").val();
	  var mdbusCertified = $("#busCertified").val();
	  
	  // 호텔 정보
	  var mdhtName = $("#htName").val();
	  var mdhtRank = $("#htRank").val();
	  var mdhtAreaCode = $("#htAreaCode").val();
	  var mdhtAddress = $("#htAddress").val();
	  var mdhtType = $("#htType").val();
	  var mdhtPhone = $("#htPhone").val();
	  var mdhtEmail = $("#htEmail").val();
	  var mdhtStartDate = $("#htStartDate").val();
	  var mdhtEndDate = $("#htEndDate").val();
	  
	  // 거래내역 정보
	  var mdhtBuyTranType = $("#htBuyTranType").val();
	  var mdhtBuyCost = $("#htBuyCost").val();
	 
	  //전달 객체 
	  var modifyParam = {
			  			 htNo:htNo,
			  			 htName:mdhtName,
			  			 htRank:mdhtRank,
			             htAreaCode:mdhtAreaCode,
			             htType:mdhtType,
			             htPhone:mdhtPhone,
			             htEmail:mdhtEmail,
			             htAddress:mdhtAddress,
			  			 busId:busId,
			  			 busName:mdbusName,
			  			 busRegNum:mdbusRegNum,
			  		    busCertified:mdbusCertified,
			  			 htBuyTranId:htBuyTranId,
			  			 htBuyTranType:mdhtBuyTranType,
			  			htBuyCost:mdhtBuyCost
			  			}
	  
	  
	  $.ajax({
		  url:"${contextPath}/admin/hotel/modify",
		  type:"put",
		  data:JSON.stringify(modifyParam),
		  contentType:"application/json",
		  beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
		  success:function(result){
			  if(result == '성공'){
				  //readonly 재설정
				  handleModifySuccess();
				  
			  }else{
				  alert("수정에 문제가 생겼습니다.")
			  }  
		  },
			error:function(error){
				console.error(error);
			}
		  
	  })//end-ajax
}//end-modifyHotelInfo



//수정완료 후 호출 
function handleModifySuccess(){
	alert("수정이 완료되었습니다.");
	changeToReadOnly();
}


//readonly 재설정 
function changeToReadOnly(){
	
	 var readOnlyElements = $(".readonly");
	  readOnlyElements.prop("readonly", true);
	  
	 $("#modifyFinishButton").hide();//수정완료버튼 숨기고
	 //수정하기 버튼 다시 보이게하기  
	 $("#modifyButton").show();
	 //이미지 새로등록하기 버튼도 숨김
	 $("#registerNewHotelImage").hide();
	  
}//end-showDetailPage



<!-- ########################### 삭제 ######################################-->


<!-- 호텔삭제 -->
//호텔 delete( delete cascade로 연결되어있어서 사업자만 삭제하면 호텔 방 다 삭제됨 )
$("#deleteButton").on("click",function(){
	
	var result = confirm("정말로 삭제하시겠습니까? \n 호텔과 관련된 모든 정보가 삭제됩니다. ");
	
	if(result){
		//'예'버튼 
		deleteHotel(busId);
	}
	
})

function deleteHotel(busId){
	
	alert("삭제");
	
	/* $.ajax({
		url:"${contextPath}/admin/hotel/delete/"+busId+"/"+htNo,
		type:"delete",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		success:function(response){			
		window.location.href="${contextPath}/admin/hotel/list";		
		},
		error:function(error){
			console.error(error);
		}
	})//end-ajax */
	
}//end-deleteHotel



$(document).on("click",".deleteRoomButton",function(){
	var result = confirm("정말로 삭제하시겠습니까? \n 객실과 관련된 모든 정보가 삭제됩니다. ");
	
	if(result){
		//'예'버튼 
//		deleteRoom(htRooNo);
	    $(this).closest("#roomsList").hide(); // 해당 룸 정보를 숨김

	}
	
	
	
})

//객실삭제 
function deleteRoom(htRooNo){
	
	alert("삭제");

	
	/* $.ajax({
		url:"${contextPath}/admin/hotel/deleteRoom/"+htRooNo,
		type:"delete",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		success:function(response){			
		window.location.href="${contextPath}/admin/hotel/list";		
		},
		error:function(error){
			console.error(error);
		}
	})//end-ajax */
	
	
	
	
}//end-deleteHotel






<!-- ###########################  처음 화면표시 ############################## -->



$(document).ready(function(){
	showRoomList(pageNum);
	showHotelImage(htNo);

});


</script>




<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>