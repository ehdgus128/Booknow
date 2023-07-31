<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/views/include/adminheader.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="conatiner">
	<div class="row" style="text-align:center">
        <div class="col-lg-12">
            <h1 class="page-header">TLBOOK 호텔 등록페이지</h1>
        </div>
   	</div>
	<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action="${contextPath }/admin/hotel/register" method="post">
						<div style="padding: 5px">
						<h2>사업자 등록</h2>
						<hr>
						</div>
						<div class="form-group">
							<label for="board_content">사업자이름</label>
							<input type="text" id="busName" name="busName" class="form-control">	
						</div>
						<div class="form-group">
							<label for="board_content">사업자번호</label> <small style="color:red">&nbsp;&nbsp;&nbsp;[&nbsp;000-00-00000의 형식으로 작성해주세요&nbsp;]</small>
							<input type="text" id="busRegNum" name="busRegNum" class="form-control">	
							<button id="checkBusNumExist" type="button" class="btn btn-info">사업자번호 중복체크</button>
						</div>
						<div class="form-group">
							<label for="board_content">사업자등록여부</label>
							<div class="btn-group" data-toggle="buttons">
							  <label class="btn btn-primary active">
							    <input type="radio" name="busCertified" id="busCertified" value="1" checked> 증명
							  </label>
							  <label class="btn btn-primary">
							    <input type="radio" name="busCertified" id="busCertified" value="2" > 비증명
							  </label>
							</div>
						</div>
						<div style="padding: 5px">
						<h2>호텔 등록</h2>
						<hr>
						</div>
						<div class="form-group">
							<label for="board_content">호텔이름</label>
							<input type="text" id="htName" name="htName" class="form-control">	
						</div>
						<div class="form-group">
							<label for="board_content">호텔성급</label> &nbsp; &nbsp;
							<select class="form-select"  name="htRank" id="htRank"  style="width:110px; height:40px">
										<option value="1">1 성급</option>
										<option value="2">2 성급</option>
										<option value="3">3 성급</option>
										<option value="4">4 성급</option>
										<option value="5">5 성급</option>
							</select>
						</div>
						<div class="form-group">
								<label for="board_content">호텔지역</label> &nbsp;&nbsp;
									<select class="form-select"  name="htAreaCode" id="htAreaCode"  style="width:110px; height:40px"><%-- 지역 select --%>
										<option value="서울">서울</option>
										<option value="제주도">제주도</option>
										<option value="부산">부산</option>
										<option value="강릉">강릉</option>
										<option value="속초">속초</option>
										<option value="인천">인천</option>
										<option value="수원">수원</option>
										<option value="대구">대구</option>
										<option value="여주">여주</option>
										<option value="전주">전주</option>
										<option value="양양">양양</option>
										<option value="고성">고성</option>
										<option value="보령">보령</option>
										<option value="태안">태안</option>
										<option value="포항">포항</option>
										<option value="울산">울산</option>
										<option value="거제">거제</option>
									</select>
						</div>
						<div class="form-group">
							<label for="board_content">호텔상세주소</label>
							<input type="text" id="htAddress" name="htAddress" class="form-control">	
						</div>
						<div class="form-group">
							<label for="board_content">호텔타입</label>&nbsp;&nbsp;
							<select class="form-select" name="htType" id="htType" style="width:110px; height:40px"><%-- 호텔타입 select --%>
								<option value="호텔">호텔</option>
								<option value="리조트">리조트</option>
								<option value="게스트하우스">게스트하우스</option>	
							</select>
						</div>
						<div class="form-group">
							<label for="board_content">호텔연락처</label>
							<input type="text" id="htPhone" name="htPhone" class="form-control">	
						</div>
						<div class="form-group">
							<label for="board_content">호텔이메일</label>
							<input type="text" id="htEmail" name="htEmail" class="form-control">	
						</div>
						<div class="form-group">
							<label for="board_content">호텔계약일</label><br>
							<small>계약시작일</small>
							<input type="date" id="htStartAvail" name="htStartDate" autocomplete="off" >  
                    		<small>계약마감일</small>
                    		<input type="date" id="htEndAvail" name="htEndDate"  autocomplete="off" >  
						</div>
						<div style="padding: 5px">
						<h2>거래내역 등록</h2>
						<hr>
						</div>
						<div class="form-group">
							<label for="board_content">결제방법</label>&nbsp;&nbsp;						
							<select class="form-select"  name="htBuyTranType" id="htBuyTranType"  style="width:110px; height:40px"><%-- 지역 select --%>
										<option value="카드">카드</option>
										<option value="현금">현금</option>
							</select>			
						</div>
						<div class="form-group">
							<label for="board_content">구입금액</label>
							<input type="text" id="htBuyCost" name="htBuyCost" class="form-control">	
						</div>
							<!--csrf -->
						   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
						<!-- 작성버튼  -->
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">작성하기</button>
							</div>
						</div>
						</form>
						
						
					</div>
				</div>
			</div>
			
			<div class="col-sm-3"></div>
			
	</div>
</div>
<script>
  //사업자번호 중복체크 
  $("#checkBusNumExist").on("click",function(){
	  
	  var busRegNum = $("#busRegNum").val();
	  
	 //사업자번호 정규식 
	 var regex = /^\d{3}-\d{2}-\d{5}$/;
	 
	 if(!regex.test(busRegNum)){
		 alert("000-00-00000의 형식으로 작성해주세요");
		 return ;
	 }
	  
	  
	  $.ajax({
		  url:"${contextPath}/admin/hotel/checkBusNumExists/"+busRegNum,
		  type:"get",
		  dataType:"text",
		  success:function(result){
			  if(result == 'usable'){
				  alert("사용가능한 사업자번호입니다.");
				  $("#checkBusNumExist").data("checked",true);
			  }else{
				  alert("이미 등록된 사업자번호입니다.")
				  $("#checkBusNumExist").data("checked",false);
			  }//end-ifelse	  
		  }//end-success  
	  })//end-ajax	  
  })//end-checkBusNumExist
  
  
  //form 제출시 사업자 중복체크 여부 확인 
  $("form").on("submit",function(event){
	 
	  var busRegNum = $("#busRegNum").val();
	  var busName = $("#busName").val();
	  var htName = $("#htName").val();
	  var htRank = $("#htRank").val();
	  var htAreaCode = $("#htAreaCode").val();
	  var htAddress = $("#htAddress").val();
	  var htType = $("#htType").val();
	  var htPhone = $("#htPhone").val();
	  var htEmail = $("#htEmail").val();
	  var htBuyTranType = $("#htBuyTranType").val();
	  var htBuyCost = $("#htBuyCost").val();
	  
	  
	  

	  if(busRegNum.trim() == "" ){
		  alert("사업자 번호를 입력해주세요 ");
		  event.preventDefault(); // 폼 제출을 막음  
	  }else if(busName.trim()==""){
		 alert("사업자 이름을 입력해주세요");
		 event.preventDefault();
	  }else if(htName.trim()==""){
		  alert("호텔이름을 입력해주세요");
		  event.preventDefault();
	  }else if(htRank.trim()==""){
		  alert("호텔성급을 입력해주세요");
		  event.preventDefault();
	  }else if(htAreaCode.trim()==""){
		  alert("호텔지역을 입력해주세요")
		  event.preventDefault();
	  }else if(htAddress.trim()==""){
		  alert("호텔 상세주소를 입력해주세요");
		  event.preventDefault();
	  }else if(htType.trim()==""){
		  alert("호텔 타입을 입력해주세요");
		  event.preventDefault();
	  }else if(htPhone.trim()==""){
		  alert("호텔 연락처를 입력해주세요");
		  event.preventDefault();
	  }else if(htEmail.trim()==""){
		  alert("호텔 이메일을 입력해주세요");
		  event.preventDefault();
	  }else if(htBuyTranType.trim()==""){
		  alert("호텔 거래방법을 입력해주세요");
		  event.preventDefault();
	  }else if(htBuyCost.trim()==""){
		  alert("호텔 구매 가격을 입력해주세요");
		  event.preventDefault();
	  }else if($("#checkBusNumExist").data("checked") !== true ){ //요소의 checked 데이터가 false 일치하는지 비교 
		  // == (동등비교) : 자기 스스로 타입변환을 시도함  ( 0 == false은 true임 , 0은 false로 되고 ,  false는 0으로 됨 )
		  // === 일치비교 : 값과 타입을 모두 비교함 (타입 자동변환을 시도하지 않음 , 0 === false 는 false임 )
		 //!== true  : checked 데이터가 false거나 undefined(클릭안하면 undefiend)
		  // === false 로 하면 false일때만 작동함 
		  alert("사업자 중복체크를 해주세요");
		  event.preventDefault();
	  }else if(htPhone.length > 10 ){
		  alert("호텔연락처는 숫자 10자리 미만으로 작성해주세요")
		  event.preventDefault();
		  return;
	  }else if(busName.length > 3 ){
		  alert("이름은 3글자 이하로 작성해주세요")
		  event.preventDefault();
		  return;
	  }else if(htBuyCost.length > 10){
		  alert("구입가격은 10자리 미만으로 작성해주세요")
		  event.preventDefault();
		  return;
	  }else if(htAddress.length > 19 ){
		  alert("주소는 19글자 미만으로 작성해주세요")
		 event.preventDefault();
		  return;
	  }

  })//end-form

  


  
  
  

  

</script>
<%@include file="/WEB-INF/views/include/adminfooter.jsp" %>