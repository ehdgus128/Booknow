<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/views/include/adminheader.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="conatiner">
	<div class="row" style="text-align:center">
        <div class="col-lg-12">
            <h1 class="page-header">TLBOOK 객실 상세페이지</h1>
        </div>
   	</div>
	<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div style="padding: 5px">
						<h2>판매일 추가</h2>
						<hr>
						</div>					
						<div class="form-group">
							<label for="board_content">객실이름</label>
							<input type="text" value="${hotelInfo.htRooName }" id="roomName" class="form-control" readonly>	
						</div>
						<div class="form-group">
							<label for="board_content">객실판매가격</label>
							<div class="btn-group" data-toggle="buttons">
							   <input type="text" id="htRooSellPrice"  autocomplete="off" >  
							   <div id="sellDateContainer"></div> 
							</div>
						</div>		
						<div class="form-group">
							<label for="board_content">객실판매일</label>
							<input type="date" id="htRooSellDate">  
							<br>
						</div>				
					    <button type="button" class="btn btn-primary" id="registerRoomDate">등록</button>
				        <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/admin/hotel/detail?htNo=${htNo }&busId=${busId}'">돌아가기</button>
				    </div>
				</div>
			</div>
			<div class="col-sm-3"></div>		
	</div>
	<div class="row">				
	<!-- 판매내역 표시되는 공간  -->
	<div id="showDateList" style="text-align:center;
		 margin-top:10px" ></div>
	</div>
	
	<div class="row" style="text-align:center">
        <div class="col-lg-12">
          <!-- 판매내역의 페이징처리  -->
			<div class="d-none d-md-block" id="paginationPlace">  
			</div>
        </div>
   	</div>
   	
	
			
</div>



<script>

var htRooNo = '<c:out value="${param.htRooNo}"/>';
var pageNum = 1;//디폴트 페이지


//페이지 번호 클릭 시 목록 업데이트
function goToPage(pageNum) {
	showDateList(htRooNo,pageNum);
}
	
<!--  csrf 토큰  -->
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";


$("#registerRoomDate").on("click", function() {
  var htRooNo = '<c:out value="${param.htRooNo}"/>'; //밖에 htRooNo 값있지만 저장이 안되서 안에도 값설정
  var htRooSellPrice = $("#htRooSellPrice").val();
  var htRooSellDate = $("#htRooSellDate").val();
  
  var sellParam = {
    htRooNo: htRooNo,
    htRooSellPrice: htRooSellPrice,
    htRooSellDate: htRooSellDate
  };
  
  $.ajax({
    type: "post",
    url: "${contextPath}/admin/hotel/addSellDate",
    contentType: "application/json; charset=utf-8",
    beforeSend: function(xhr) {
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    },
    data: JSON.stringify(sellParam),
    success: function(result) {
      alert("등록이 완료되었습니다.");
      showDateList(htRooNo,pageNum);
    }//end-success
  });
});


function showDateList(htRooNo,pageNum){
	
	console.log(pageNum);

	$.ajax({
		  type: "get",
		  url: "${contextPath}/admin/hotel/roombuylist/"+htRooNo+"/"+pageNum,
		  dataType: "json",
		  success: function(result) {		
			  var dateList = result.dateLists;	
			  
			  console.log(dateList);
			  
			  $("#showDateList").empty();			  
			  var str = "";			  
			  for(var i=0;i<dateList.length;i++){			
				str += '<ul class="list-group" style="display: inline-block; width:50%">';
				str +=     '<li class="list-group-item">판매날짜'+dateList[i].htRooSellDate+'</li>';
				str +=     '<li class="list-group-item">판매가격'+dateList[i].htRooSellPrice+'</li>';
				str += '</ul>';	  
				str += '<br>';
			  }//end-for
			  $("#showDateList").html(str);
			  
			  //페이징처리 
			  var pageBean = result.datePageBean;
			  
			//페이징처리 
	        	 var paginationStr = '<ul class="pagination justify-content-center">';
	        	    
	       	    // 이전 버튼
	       	    if (pageBean.prevPage <= 0) {
	       	        paginationStr += '<li class="page-item disabled">';
	       	        paginationStr += '<a href="#" class="page-link">이전</a>';
	       	        paginationStr += '</li>';
	       	    } else {
	       	        paginationStr += '<li class="page-item">';
	       	        paginationStr += '<a href="#" onclick="goToPage(' + pageBean.prevPage + ')" class="page-link">이전</a>';
	       	        paginationStr += '</li>';
	       	    }

	       	    // 페이지 번호
	       	    for (var idx = pageBean.min; idx <= pageBean.max; idx++) {
	       	        if (idx == pageBean.currentPage) {
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
	       	    if (pageBean.max >= pageBean.pageCnt) {
	       	        paginationStr += '<li class="page-item disabled">';
	       	        paginationStr += '<a href="#" class="page-link">다음</a>';
	       	        paginationStr += '</li>';
	       	    } else {
	       	        paginationStr += '<li class="page-item">';
	       	        paginationStr += '<a href="#" onclick="goToPage(' + pageBean.nextPage + ')" class="page-link">다음</a>';
	       	        paginationStr += '</li>';
	       	    }

	       	    paginationStr += '</ul>';

	       	    $("#paginationPlace").html(paginationStr);
	  
			  
		  	}//end-success
		  })//end-ajax
	
	 
}//end-showDateList



$(document).ready(function(){
	showDateList(htRooNo,pageNum);
})



	

</script>

<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>