<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/htheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script>
	//작성자의 글이 아니면 수정못하게 막기
	var username = '<c:out value="${username}" />';
	var writer = '<c:out value="${boardDetail.tvcBwriter}" />';
	if(username != writer){
		
		alert("게시글의 작성자가 아닙니다.")
		location.href="${contextPath}/community/list";
		
	}

</script>



<div class="container position-relative" style="margin-top:50px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="${contextPath }/community/modify?tvcCatId=${param.tvcCatId}&tvcBno=${param.tvcBno}" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="board_writer_name">작성자</label>
							<input type="text" id="board_writer_name" name="tvcBwriter" class="form-control" value="${boardDetail.tvcBwriter}" readonly/>
						</div>
						<div class="form-group">
							<label for="board_date">작성날짜</label>
							<input type="text" id="board_date" name="tvcBregDate" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBregDate}'/>" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_date">수정날짜</label>
							<input type="text" id="board_date" name="tvcBmodDate" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBmodDate}'/>" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_subject">제목</label>
							<input type="text" id="board_subject" name="tvcBtitle" class="form-control" value="${boardDetail.tvcBtitle }"/>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" name="tvcBcontent" class="form-control" rows="10" style="resize:none">${boardDetail.tvcBcontent }</textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<button  type='button' id='deleteImage' class='btn btn-danger'>이미지삭제</button>	
							<img id="imageResult" src="<spring:url value='/commuimage/${boardDetail.boardFile }'/>" width="100%"/>						
							<img id="imagePreview" src="#" alt="Image Preview" width="100%">
							<input type="file" name="upload_file" id="fileData" class="form-control" accept="image/*" multiple/>	
						
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">수정완료</button>
								<a href="${contextPath }/community/detail?tvcCatId=${boardDetail.tvcCatId}&tvcBno=${boardDetail.tvcBno}" class="btn btn-info">취소</a>
							</div>
						</div>
						<!--csrf -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
	
</div>

<script>

$("#fileData").on("change",function(){
	var reader = new FileReader();
	reader.onload = function(e){
		$("#imagePreview").attr("src",e.target.result);
	};
	
	reader.readAsDataURL(this.files[0]);
	
})





	$("#deleteImage").on("click",function(){
		$("#imageResult").attr("src","#");
		$("#fileData").val("");
	})
</script>
		

<%@ include file="../include/footer.jsp" %>
    
    
    
    