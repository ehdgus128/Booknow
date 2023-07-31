<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/htheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
<div class="container position-relative" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="${contextPath }/community/write_pro?tvcCatId=${param.tvcCatId}" method="post"  enctype="multipart/form-data">
						<div class="form-group">
							<label for="board_writer_name">작성자</label>
							<input type="text" id="tvcBwriter" name="tvcBwriter" value="${username}" class="form-control" readonly/>
						</div> 
						<div class="form-group">
							<label for="board_subject">제목</label>
							<input type="text" id="tvcBtitle" name="tvcBtitle" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="tvcBcontent" name="tvcBcontent" class="form-control" rows="10" style="resize:none"></textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<div id="deleteImage"></div>
							<input type="file" class="form-control" name="upload_file" id="fileData"  accept="image/*" multiple/>
							<%-- 파일보이는 곳 --%>				
							<img id="imagePreview" src="#" alt="Image Preview" width="100%">
							
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">작성하기</button>
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

<%-- 파일 업로드 후 바로 이미지를 보여줄 수 있는 js --%>
$("#fileData").on("change",function(){
	var reader = new FileReader(); //이미지를 불러옴 
	reader.onload = function(e){ //이벤트 객체(change 이벤트가 발생했을 때 실행되는 함수 )
		$("#imagePreview").attr("src",e.target.result); //src속성 변경  , e.target : fileData , result : 이미지를 읽어온 후 생성한 url 
	};
	reader.readAsDataURL(this.files[0]);
	$("#deleteImage").html("<button  type='button' id='deleteImage' class='btn btn-danger'>이미지삭제</button>");
})//end-change



$("#deleteImage").on("click",function(){
	$("#imagePreview").attr("src","#"); // 이미지 미리보기 초기화 
	$("#fileData").val("");//파일 입력 필드 초기화 
	$(this).remove(); //이미지 삭제 버튼 제거 
})



</script>
<%@ include file="../include/footer.jsp" %>
    
    
    
    