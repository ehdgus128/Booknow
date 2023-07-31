	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="../../include/flyheader.jsp"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
	<style>
	.container {
	  width: 80% !important;
	  padding: 50px 0;
	}
	
	.card {
	  width: 100% !important;
	}
	
	.form-select2 {
	  width: 5% !important;
	}
	
	.btn-group {
	  float: right;
	}
	
	.pagination {
	  display: inline-flex;
	}
	
	.form-control {
	  width: 50% !important;
	}
	
	#page-wrapper {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	}
	
	#page-wrapper form {
	  width: 80%;
	  max-width: 600px;
	  padding: 50px;
	  background-color: #f8f8f8;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	  margin-top: 50px;
	}
	
	h2 {
	  font-size: 24px;
	  margin-bottom: 20px;
	}
	
	.form-group {
	  margin-bottom: 20px;
	}
	
	.form-label {
	  display: block;
	  font-weight: bold;
	  margin-bottom: 5px;
	}
	
	.form-control {
	  width: 100%;
	  padding: 8px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	.form-control2 {
	  width: 100%;
	  padding: 8px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	.form-control3{
	  width: 100%;
	  padding: 8px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	
	textarea.form-control {
	  height: 120px;
	}
	
	.form-select1 {
	  width: 30%;
	  padding: 10px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	.form-select2 {
	  width: 20%;
	  padding: 10px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	
	.btn-group {
	  float: right;
	  margin-top: 10px;
	}
	
	.btn-primary,
	.btn-danger {
	  padding: 10px 20px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: none;
	  cursor: pointer;
	}
	</style>
	
<div class="container position-relative">
	
	<div id="page-wrapper">
	  <form role="form1" action="${contextPath}/review/airline/register" method="post" name="frmBoard">
	      <div><small>${airlineId}</small><h2> <span>
	          <c:choose>
	            <c:when test="${airlineId == 'KAL'}">대한항공</c:when>
	            <c:when test="${airlineId == 'AAR'}">아시아나항공</c:when>
	            <c:when test="${airlineId == 'ABL'}">에어부산</c:when>
	            <c:when test="${airlineId == 'ASV'}">에어서울</c:when>
	            <c:when test="${airlineId == 'ESR'}">이스타항공</c:when>
	            <c:when test="${airlineId == 'JJA'}">제주항공</c:when>
	            <c:when test="${airlineId == 'JNA'}">진에어</c:when>
	            <c:when test="${airlineId == 'TWB'}">티웨이항공</c:when>
	            <c:when test="${airlineId == 'FGW'}">플라이강원</c:when>
	            <c:when test="${airlineId == 'HGG'}">하이에어</c:when>
	            <c:when test="${airlineId == 'UFO'}">해외항공사</c:when>
	            <c:otherwise>""</c:otherwise>
	          </c:choose>
	        </span></h2></div> 
	    <div class="form-group">
	      <h3>유저ID: ${username}</h3>
	      <input type="text" class="form-control" id="userId" aria-describedby="userId" name="userId" value="${username}" readonly="readonly" placeholder="userId">
	    </div>
	      <input type="text" class="form-control" id="airlineId" aria-describedby="airlineId" name="airlineId" value="${airlineId}" readonly="readonly" placeholder="airlineId">
		<div class="form-group">
		  <label for="starSelect2" class="form-label mt-4">항공사 별점</label>
		  <select class="form-select2" id="starSelect" name="airlineStar"   >
		    <option value="1">⭐</option>
		    <option value="2">⭐⭐</option>
		    <option value="3">⭐⭐⭐</option>
		    <option value="4">⭐⭐⭐⭐</option>
		    <option value="5">⭐⭐⭐⭐⭐</option>
		  </select>
		</div>
		
		<div>
		  <strong>선택한 별점:</strong> <span id="selectedStar"></span>
		</div>
	
	    <div class="form-group">
	      <label for="titileHelp1" class="form-label mt-4" name="airlineRevTitle">리뷰 제목</label>
	      <input type="text" class="form-control1" id="titileHelp1" name="airlineRevTitle" aria-describedby="titileHelp" placeholder="경험했던 것 중 가장 중요한 것을 적어주세요." style="width: 100%;">
	      <small id="titileHelp" class="form-text text-muted">글자수 제한 15</small>
	    </div>
	
	    <div class="form-group">
	      <label for="RevContentsArea" class="form-label mt-4">리뷰 쓰기</label>
	      <textarea class="form-control2" id="RevContentsArea" rows="3" name="airlineRevContents" placeholder="리뷰 쓰기."></textarea>
	    </div>
	
	    <div class="form-group">
	      <button type="submit" class="btn btn-primary">리뷰 제출</button>
	      <button type="button" id="btnMovecancel" class="btn btn-danger" >리뷰 취소</button>
	    </div>
	      <sec:csrfInput/>
	  </form>
	</div>
		
		
</div>

		
		<script>
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
	  var airlineId = "${airlineId}";
	  $("#btnMovecancel").on("click", function(e){
	    var newUrl = "${contextPath}/review/airline/list?airlineId=" + airlineId;
	    self.location.href = newUrl;
	  });
	  
	  
	  /*  별점 보이게 하기*/
	  $(document).ready(function() {
		  $("#starSelect").on("change", function() {
		    var selectedValue = $(this).val();
		    $("#selectedStar").text(getStarRating(selectedValue));
		  });
		});
	
		function getStarRating(value) {
		  var starRating = "";
		  for (var i = 0; i < value; i++) {
		    starRating += "⭐";
		  }
		  return starRating;
		}
		
		
		/* 값 안넣으면 나오기 */
		 document.querySelector("form[name='frmBoard']").addEventListener("submit", function(event) {
	  event.preventDefault();
	
	  var airlineId = document.getElementById("airlineId").value;
	  var userId = document.getElementById("userId").value;
	  var airlineStar = document.getElementById("starSelect").value;
	  var airlineRevTitle = document.getElementById("titileHelp1").value;
	  var airlineRevContents = document.getElementById("RevContentsArea").value;
	
	  if (airlineId === "" || userId === "" || airlineStar === "" || airlineRevTitle === "" || airlineRevContents === "") {
	    alert("리뷰 정보를 알맞게 넣으세요");
	  } else {
	    document.forms["frmBoard"].submit();
	  }
	});
	
	document.getElementById("btnMovecancel").addEventListener("click", function() {
	});
	
	   /*   제목 글자수 제한 */
	   document.getElementById("titileHelp1").addEventListener("input", function() {
	        var input = this.value;
	        var byteCount = 0;
	        var maxLength = 50;
	        
	        for (var i = 0; i < input.length; i++) {
	            var charCode = input.charCodeAt(i);
	            byteCount += (charCode < 128) ? 1 : 2;
	            
	            if (byteCount > maxLength) {
	                this.value = input.substring(0, i);
	                alert("입력 제한을 초과하였습니다. ");
	                break;
	            }
	        }
	    });
	      /*     내용글자수 제한 */
	     document.getElementById("RevContentsArea").addEventListener("input", function() {
	         var input = this.value;
	         var byteCount = 0;
	         var maxLength = 1000;
	         
	         for (var i = 0; i < input.length; i++) {
	             var charCode = input.charCodeAt(i);
	             byteCount += (charCode < 128) ? 1 : 2;
	             
	             if (byteCount > maxLength) {
	                 this.value = input.substring(0, i);
	                 alert("입력 제한을 초과하였습니다.");
	                 break;
	             }
	         }
	     });
	
	</script>
	<%@include file="../../include/footer.jsp"%>
