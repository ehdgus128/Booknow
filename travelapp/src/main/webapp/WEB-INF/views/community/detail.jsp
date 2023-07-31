<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/htheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<c:if test="${!empty fail}">
	<script>
		alert("삭제에 실패하였습니다");
	</script>
</c:if>


<div class="container position-relative" style="margin-top:50px">
		<!-- 상세페이지 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_writer_name">작성자</label>
							<input type="text" id="board_writer_name" name="board_writer_name" value="${username}" class="form-control" value="${boardDetail.tvcBwriter }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_date">작성날짜</label>
							<input type="text" id="board_date" name="board_date" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBregDate }'/>" disabled="disabled"/>
						</div>   
						<div class="form-group">
							<label for="board_date">수정날짜</label>
							<input type="text" id="board_date" name="board_date" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBmodDate }'/>" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_subject">제목</label>
							<input type="text" id="board_subject" name="board_subject" class="form-control" value="${boardDetail.tvcBtitle }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${boardDetail.tvcBcontent }</textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<img src="<spring:url value='/commuimage/${boardDetail.boardFile }'/>" width="100%"/>						
						</div>
						<div class="form-group">
							<div class="text-right">
								<a href="${contextPath }/community/list?tvcCatId=${boardDetail.tvcCatId}" class="btn btn-primary">목록보기</a>
								<a href="${contextPath }/community/modify?tvcCatId=${boardDetail.tvcCatId}&tvcBno=${boardDetail.tvcBno}" class="btn btn-info">수정하기</a>
								<a href="${contextPath }/community/delete?tvcCatId=${boardDetail.tvcCatId}&tvcBno=${boardDetail.tvcBno}" class="btn btn-danger">삭제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="col-sm-3"></div>
	</div>	<!--  상세페이지 끝  -->

	<small><strong>댓글&nbsp;[댓글]</strong></small> 
	 <!-- 댓글시작 -->
	<div class="card" style="margin-top:20px">
	  <div class="card-body">
	  	<div id="inputReply">
	  		<!-- 댓글 입력창 -->
	  	   <small>[작성자]</small> 
	  	   <input type="text" class="form-control" id="replyWriter" value="${username}">
	  	   <small>[댓글입력칸]</small> 
	  	  <input type="text" class="form-control" id="replyInputData" placeholder="댓글을 입력하세요" style="width: 100%; height: 100px;">
	  	  <button type="button" id="replyButton" class="btn btn-primary">입력</button>
	  	</div>
	  	
	   <!-- 댓글창 -->
      <div id="commentList" >
      </div>

	  </div>
	  
	  <!-- 댓글의 페이징처리  -->
	  <div class="d-none d-md-block" id="paginationPlace">
	  
	  </div>
	</div><!-- 댓글끝 -->


	
</div>
<script>

/////////////////////////////////////////////////댓글////////////////////////////////////////////////////////////

<!--  csrf 토큰  -->
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";


var tvcBno = '<c:out value="${param.tvcBno}"/>'; 
var pageNum = 1;


//페이지 번호 클릭 시 댓글 목록 업데이트
function goToPage(pageNum) {
    showCmtList(pageNum);
}

//댓글 목록 표시 
function showCmtList(pageNum) {	
    $.ajax({
        url: "${contextPath}/replies/" + tvcBno+"/"+pageNum,
        type: "get",
        dataType: "json",
        success: function (data) {
       	
        	var pageBean = data.pageBean;
            var commentList = data.commentList;
            
        	var str = "";
        	
        	for (var i = 0; i < commentList.length; i++) {
        	    var indentLevel = commentList[i].lvl; // 들여쓰기 레벨 (0부터 시작)
        	    var paddingLeft = indentLevel < 3? indentLevel*20 : 3*20 // 들여쓰기 레벨이 3이상인 경우에는 들여쓰기레벨을 3으로 고정시킴 
        	    // 스타일에 왼쪽 패딩 값을 적용하여 계층 구조를 표시
        	    str += '<div id="replyPlace" style="margin-top:10px; padding-left: ' + paddingLeft + 'px;">';
        	    str += '    <ul class="list-group list-group-flush">';
        	    str += '        <li class="list-group-item"><strong>[' + commentList[i].tvcRno + ']</strong>&nbsp;&nbsp;' + commentList[i].tvcRwriter + '</li>';
        	    str += '        <li class="list-group-item"><input type="text" class="form-control contentDNA" value="' + commentList[i].tvcRcontent + '" placeholder="댓글을 입력하세요" style="width: 100%; height: 100px;" disabled></li>';
        	    str += '    </ul>';
        	    str += '    <input type="hidden" value="' + commentList[i].tvcRno + '" id="rnoDNA"/>';
        	    str += '    <button class="btn btn-info replyForComment">답글</button>&nbsp;<button class="btn btn-success modifyButton">댓글수정</button>&nbsp;<button class="btn btn-danger deleteButton">댓글삭제</button>';
        	    str += '</div>';
        	}//end-for

        	$("#commentList").html(str);
        	
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
            
            
	   } //end-success
 
    })//end-ajax

}//end-showCmtList


//댓글 등록 
 $("#replyButton").on("click",function(){
 
	 var tvcBno = '<c:out value="${param.tvcBno}"/>';  
	 var writer = $("#replyWriter").val();
	 var content = $('#replyInputData').val();
	
	var param = {tvcRwriter:writer,tvcRcontent:content};
	
	$.ajax({
		url:"${contextPath}/replies/"+tvcBno,
		type:"post",
		data: param,
		dataType: 'text',
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		success:function(result){
			if(result == '성공'){
				alert("댓글 등록이 완료되었습니다.");
				showCmtList(pageNum);
			}else{
				alert("댓글 등록에 실패하였습니다.");
				false;
			}
			
		}//end-success
		
	})//end-ajax
	
}) //end-replyButton 


//댓글 수정 
$(document).on("click",".modifyButton",function(){
			
	//input창 활성화
	$(this).parent().find(".contentDNA").attr("disabled",false);	
	//원래있던 content저장 
	var contentValue = $(this).parent().find(".contentDNA").val();	
	//원래 있던 contentValue 값을 넣어서 input 값 새로 생성 
	$(this).parent().find(".contentDNA").innerHTML='<input type="text" class="form-control contentDNA" value="'+contentValue +'" placeholder="댓글을 입력하세요" style="width: 100%; height: 100px;" >';	
	// 버튼 이름 및 클래스 변경
    $(this).text("수정완료").attr("class", "btn btn-primary newMod");
	//선택한 rno값 	
    var rnoDNA = $(this).parent().find("#rnoDNA").val(); 

	$(document).on("click",".newMod",function(){
			
		//수정된값 
		var secondDNA = $(this).parent().find(".contentDNA").val();	
		var param = {tvcRno:rnoDNA,tvcRcontent:secondDNA};		
		
		modifyComment(param); 
			
	    $(this).text("댓글수정").attr("class", "btn btn-primary");
		
		return false;
	})
	
})//end-modifyButton

//댓글수정
function modifyComment(param){
	
		$.ajax({
			url:"${contextPath}/replies/new",
			type:"put",
			contentType: "application/json",
			data: JSON.stringify(param),
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			dataType:'text',
			success:function(result){
				if(result == '성공'){
					alert("댓글 수정 완료되었습니다.");
					showCmtList(pageNum);
				}else{
					alert("댓글 수정에 실패하였습니다.");
					false;
				}
				
			}//end-success
		
		})//end-ajax	
}//end-modifyComment



//댓글 삭제
$(document).on("click",".deleteButton",function(){
	var tvcRno =  $(this).parent().find("#rnoDNA").val();
	
	
	$.ajax({
		url:"${contextPath}/replies/updateDeleteFlag/"+tvcRno,
		type:"put",
		dataType:"text",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		success:function(result){
			if(result == '성공'){
				alert("댓글 삭제가 완료되었습니다.");
				showCmtList(pageNum);
			}else{
				alert("댓글 삭제에 실패하였습니다.");
				false;
			}
		}//end-success		
	})//end-ajax
})//end-deleteButton


//////////////////////////////////////////답글////////////////////////////////////////////////////////////

//답글 버튼 클릭시 답글입력 활성화 
$(document).on("click",".replyForComment",function(){
	
	// 답글 입력창을 생성하여 추가
    var replyInput = '<div class="replyInputBox">';
    replyInput += '     <small>[작성자]</small> <input type="text" class="form-control" id="commentWriter"> '
    replyInput += '     <small>[답글입력칸]</small> <input type="text" id="commentPlace" class="form-control replyContent" placeholder="답글을 입력하세요" style="width: 100%; height: 100px;">';
    replyInput += '		<button class="btn btn-primary submitReply">답글입력</button>';
    replyInput += '</div>';
    
    $(this).parent().append(replyInput);
    
    var tvcRno =  $(this).parent().find("#rnoDNA").val();
    
    var prno = tvcRno;
    
    //답글등록 
    $(document).on("click",".submitReply",function(){
    	alert("클릭");
    	var writer = $(this).parent().find("#commentWriter").val();
    	alert(writer);
    	var content = $(this).parent().find("#commentPlace").val();  	
    	var param = {tvcBno:tvcBno,tvcPrno:prno,tvcRwriter:writer,tvcRcontent:content};	
  	
    	 // Ajax 요청
        $.ajax({
            url: "${contextPath}/replies/commentForReply",
            type: "POST",
            dataType: "text",
            contentType: "application/json",
            beforeSend:function(xhr){
    			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
    		},
            data: JSON.stringify(param),
            success: function(result) {
                if (result === "성공") {
                    alert("답글이 등록되었습니다."); 
                    showCmtList(pageNum);
                } else {
                    alert("답글 등록에 실패하였습니다.");
                }
            }//end-success
        });//end-ajax 
        	
    });

});



//////////////////////////////////////첫 화면표시////////////////////////////////////////////////////////////

$(document).ready(function(){
	showCmtList(pageNum);
});


</script>
<%@ include file="../include/footer.jsp" %>
    
    
    
    