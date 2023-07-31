 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@include file="../include/flyheader.jsp" %>  

<div class="container-fluid position-relative"><!--큰틀-->
   <div class="row mx-2 my-2">
      <div class="col-12">
         <div class="row">
            <div class="col-2">  
               <div class="left-sidebar">
                  <div class="list-group">
                     <a class="list-group-item list-group-item-action active" href="${contextPath }/mypage/myMain">마이페이지</a>
                     <a href="#" class="list-group-item list-group-item-action" id="goDetail">회원정보/수정</a>

                     <a class="list-group-item list-group-item-action active">나의예약</a>
                     <a href="${contextPath }/hotel/htres/my" class="list-group-item list-group-item-action">호텔예약</a>
                     <a href="${contextPath }/airways/airResList" class="list-group-item list-group-item-action">항공예약</a>

                     <a class="list-group-item list-group-item-action active">QnA</a>
                     <a href="${contextPath }/qna/list" class="list-group-item list-group-item-action">나의문의내역</a>   
                     <a href="${contextPath }/qna/reg" class="list-group-item list-group-item-action">질문하기</a>
                     <a class="list-group-item list-group-item-action active" href="${contextPath }/boards/faq" >FAQ</a>
                     <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                        <button type="button" class="btn btn-primary">나의리뷰</button>
                        <div class="btn-group" role="group">
                           <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                           <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" >
                              <a class="dropdown-item" href="${contextPath }/mypage/myAirRev">항공리뷰</a>
                              <a class="dropdown-item" href="${contextPath }/mypage/myHTRev">호텔리뷰</a>
                           </div>
                        </div>
                     </div>
                  </div> 
               </div>  
               <!-- /end div left-sidebar  -->
            </div>
            <!-- col 2 end -->
            
            
            <div class="card border-light mb-3" style="width: 50%;margin:left;" >
  

            
            <div class="col-10">
               <hr>
               <h3>회원정보/수정</h3> 
               <hr>
               <!--  -->
               <div>
               <div class="form-group" style="width: 80%;margin: auto;">
                  <label class="col-form-label mt-4" for="inputDefault">아이디</label>
                  <input type="text" class="form-control"  readonly="readonly" value="${user.userId}" style="background-color: #dcdcdc;">   
               </div>
               <div class="form-group" style="width: 80%;margin: auto;">
                  <label class="col-form-label mt-4" for="inputDefault">비밀번호</label>
                  <input type="password" class="form-control" id="userPassword1" placeholder="수정할 비밀번호 입력창.">
                  <input type="password" class="form-control" id="userPassword2" placeholder="다시 한번 입력해주세요.">
                  <span id="passwordStatus"></span> <button type="button" id="btnPw" class="btn btn-primary">수정</button>
               </div>
               
               <!-- 이메일 수정중 -->
               <div class="form-group"  style="width: 80%;margin: auto;">
                  <label for="exampleSelect1" class="form-label mt-4">이메일</label>
                  <input id="preUserEmail"type="text" class="form-control"  readonly="readonly" value="${user.userEmail}" style="background-color: #dcdcdc;">   
                  <br>                 
                  <input class ="em"  type="text" id="userEmail1" placeholder="이메일 앞부분" class="form-control" style="size: 20%;" >
                  
                  <select  class ="em"  class="form-select" id="emailSelect" >
                     <option>@naver.com</option>
                     <option>@gmail.com</option>
                     <option>@daum.net</option>
                     <option id="emailOption" value="emailOption">@(기타)</option>
                  </select>
                     <input  class ="em" style="display: none; " type="text" id="userEmail11" placeholder="'@'제외한 이메일 뒷부분" class="form-control" >                      
                  <div class="col-sm-3 mt-3 ">
                     <input type="button" class="btn btn-primary" id="mail-Check-btn" value="메일인증" >
                  </div>
            <!--1    </div>   -->
                        
               <!-- 이메일 수정된것 --> 
               <div class="col-sm-7 mt-3 me-3"  style="width: 80%;margin:left;"  >
                  <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요 "
                        disabled="disabled" maxlength="6" onkeyup="checkAuthNumFn()"  style="width: 80%;margin: left;" > <!--  인증확인과 더불어 none-->
                  <button type="button" onclick="pushEmail();" id="afterCheckAddr"  class="btn btn-primary" >인증확인/수정</button>
               </div>
            </div>   <!--  1을 이자리로 -->  
               <div class="form-group"  style="width: 80%;margin: auto;">
                  <label class="col-form-label mt-4" for="inputDefault">이름</label>
                  <input type="text" class="form-control"  readonly="readonly" value="${user.userName}" style="background-color: #dcdcdc;">   
               </div>
               <div class="form-group"  style="width: 80%;margin: auto;">
                  <label class="col-form-label mt-4" for="inputDefault">생년월일</label>
                  <input type="text" class="form-control"  readonly="readonly" value="<fmt:formatDate value="${user.userBday}" pattern="yyyy-MM-dd" />" style="background-color: #dcdcdc;">   
               </div>
               <div class="form-group"  style="width: 80%;margin: auto;">
                  <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
                  <input type="text" id="preUserPhoneNumber" class="form-control"  readonly="readonly" value="${user.userPhoneNumber}" style="background-color: #dcdcdc;">   
               </div>

               <br>   
               <div  style="width: 80%;margin: auto;">
                  <p>    
                     <input id="phone" type="text" name="phone" title="전화번호 입력"  placeholder="(-)포함해서 입력해주세요" required/>
                     <button  type="button" id="phoneChk" class="doubleChk">인증번호 보내기</button><br/>
                     <input id="phone2" type="text" name="phone2" title="인증번호 입력" placeholder="인증번호 입력창" disabled required/>
                     <button type="button" id="phoneChk2" class="doubleChk">수정</button>
                     <span class="point successPhoneChk"><br><small>인증번호를 입력하고 수정을 누르면 전화번호가 수정됩니다.</small></span>
                     <input type="hidden" id="phoneDoubleChk"/>
                  </p>
               </div>
			<div style="width: 80%;margin: auto;">
               <label class="col-form-label mt-4" for="inputDefault" style=""margin: auto;">주소</label>
               <input type="text" id="preUserAddress" class="form-control"  readonly="readonly" value="${user.userAddress}" style="background-color: #dcdcdc;" >   <!--기존주소 정보  -->
               <!-- 우편 api -->
		
               <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
               <input type="text" id="sample6_postcode" placeholder="우편번호" >
               <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample6_address" placeholder="주소"><br>
               <input type="text" id="sample6_detailAddress" placeholder="상세주소">
               <input type="text" id="sample6_extraAddress" placeholder="참고항목">
               <button type="button" id="modifyAdressBtn" class="btn btn-primary">수정 </button>
     	</div>
     
            </div>
            <!-- col 10 -->
         </div>
         <!-- main row  -->
      </div>
      <!-- page col end -->
   </div>
   <!-- page row end -->
</div>
<!-- page container end -->
</div>
<form id="mypagefrm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
   <input type="hidden" value="${userId}">

</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$("#goDetail").on("click",function(){
   $("#mypagefrm").attr("action","${contextPath}/mypage/myDetail");
   $("#mypagefrm").attr("method","get");
   $("#mypagefrm").submit();
})

var csrfHeaderName = "${_csrf.headerName}" ;
var csrfToken = "${_csrf.token}" ;

   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
   });


   var address ="";
   var builingName = "";
   var zonecode = "";
   var detail = "";
   var totalAddress ="";

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            
            /*     <input type="text" id="sample6_postcode" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample6_address" placeholder="주소"><br>
                <input type="text" id="sample6_detailAddress" placeholder="상세주소">
               <input type="text" id="sample6_extraAddress" placeholder="참고항목">
             */ 
             
                 address = addr;
               var builingName = data.buildingName;
               var detail =  document.getElementById("sample6_detailAddress").value ;
               var zonecode = data.zonecode;
               
               totalAddress = "("+ zonecode +")"+  address ;
               
              
                
            }
        }).open();
    }
    
       $("#modifyAdressBtn").on("click",function(){

 
          
          var detail = document.getElementById("sample6_detailAddress").value ;
          
          totalAddress +=  " " + detail


          if(detail == "" || detail.length == 0 ||totalAddress == "" || address =="" || address.length == 0){

            alert("우편 번호 찾기를 누르고, 주소를 모두 입력해 주세요");
            return;

         }




           $.ajax({
             url: "${contextPath}/mypage/modifyAd",
             type: "POST",
             data: totalAddress,
            contentType: "application/json;charset=UTF-8",
             success: function(response) {
               if(response){
                  alert("주소가 수정되었습니다.");
                  document.getElementById("preUserAddress").value = totalAddress;
               }else{
                  alert("주소변경이 실패했습니다.")
               }
             }
           }); //ajax end
          
       })
    

       
        $(document).ready(function() {
               $("#userPassword1, #userPassword2").keyup(function() {
                   var pw1 = $("#userPassword1").val() ;
                    var pw2 = $("#userPassword2").val() ;
                     var requestData = {  pw1: pw1, pw2: pw2 };

                 $.ajax({
                   url: "${contextPath}/mypage/checkPw",
                   type: "POST",
                   data: JSON.stringify(requestData),
                  contentType: "application/json;charset=UTF-8",
                   success: function(response) {
                     $("#passwordStatus").text(response.message);
                   }
                 });
               });
             });
        
         
       
          // 비밀번호 수정 적절한지 확인
            $("#btnPw").on("click",function(){
             
             
             
             if($("#userPassword1").val().length <8  || $("#userPassword2").val().length < 8 ){
                
                alert("적절한 비밀번호를 입력해주세요.");
                
                //회원가입할때 정한 비밀번호 조건 보고 수정해야함
                
             }else if($("#userPassword1").val() != $("#userPassword2").val()){
                
                alert("동일한 비밀번호를 입력해주세요.");
                
                
             }else{
                
             
                pw1 = $("#userPassword1").val() ;
                
                console.log(pw1);
   
                 $.ajax({
                     
                    
                    url: "${contextPath}/mypage/modifyPw" ,
                    type: "POST",
                  data: JSON.stringify({ userPassword : pw1 }),
                  contentType: "application/json;charset=utf-8",
                  success: function(response){
                     
                     
                     if(response){
                     
                     alert("비밀번호 수정이 완료 되었습니다.");
                     
                     
                  }else{
                     
                     alert("비밀번호 수정이 실패했습니다.\n 다시시도해주세요.");
                  }
                  
                  }
                    
                 })
                  
             }//
               
              
          }) ;
       // 여기 이메일 주소 별 팝업 생성
         
                $(document).ready(function() {
             $("#emailSelect").change(function() {
               var selectedValue = $(this).val();
               if (selectedValue === "emailOption") {
      
                 //기타 옵션이 선택되었을때
                 $("#userEmail11").attr("style","display: inline-block");
                 
                 //var afterEmail = 선택된것
                 
               }else{
                  
                  $("#userEmail11").attr("style","display: none");
                
                //var afterEmail = 선택된것
               
               }
             });
           });
       
        
       
         
       var  emailAddress2= "0";
      
       
       
      //이메일 
       function checkAuthNumFn() {
             const mailCheckInput = document.querySelector('.mail-check-input').value;
             const mailCheckWarn = document.getElementById('mail-check-warn');

         }


      const mailCheck = document.querySelector('#mail-Check-btn');

      mailCheck.addEventListener("click", () => {
            

         var emailAddress = $("#userEmail1").val() +  $("#emailSelect").val();
         
         if($("#emailSelect").val() == "emailOption"){
            
         var    emailAddress = $("#userEmail1").val() + "@" + $("#userEmail11").val(); 
         
         }
         
         emailAddress2=  emailAddress;
         
         console.log('완성된 이메일 : ' + emailAddress);
   //    ㄴㅅ   


         if($("#userEmail1").val() == "" || $("#userEmail1").val().length == 0 || emailAddress.endsWith("@")){
                  alert("이메일 전체를 입력해주세요.");
                  return;
               }
            
               const email = emailAddress;
               const user = {
                  username: email
               }
            
               const url = "api/mailcheck";
      
                  
               $.ajax({
                  url: url,
                  type: "post",
                  data: JSON.stringify({ username: email }),
                  contentType: "application/json;charset=utf-8",
                  success: function(response) {
                     return response;
                  },
                  error: function(xhr, status, error) {
                     alert("이메일 전송이 실패하였습니다.");
                  }
               })
               .then(function(response) {
                  if (response !== null) {
                     alert("인증메일이 전송 되었습니다.");
                     console.log(response);
                     //값을
                     document.querySelector('.mail-check-input').removeAttribute('disabled');
                  } else {
                     alert("인증메일 전송에 실패 하였습니다.");
                  }

                  // 여기서에서 다해야함.
               });
            
   
      });//check Num function end 

         
      function pushEmail (){

         const mailCheckInputVal = document.querySelector('.mail-check-input').value;

         if(mailCheckInputVal.length== 0 || mailCheckInputVal == "" ){
            alert("이메일 인증번호를 받고 입력해주세요.")
            return;
         }
          
         console.log("이메일:" + emailAddress2);
         
         ///추가
         $.ajax({
            
            url: "${contextPath}/mypage/api/mailcheck2" ,
            type: "POST",
            data: JSON.stringify({ inputNum : mailCheckInputVal }),
            contentType: "application/json; charset=utf-8",
            success: function(response){
               console.log(response);
               if(response){ 
                    
                   
                  
                  
                  if (confirm("이메일을 수정하겠습니까?")) {
                        
                     //ajax 시작
                     $.ajax({
                           
                           
                        url: "${contextPath}/mypage/modifyEm" ,
                        type: "POST",
                        data: JSON.stringify({ userEmail : emailAddress2 }),
                        contentType: "application/json; charset=utf-8",
                        success: function(response){
                           console.log(response);
                           if(response){ 
                              alert("이메일 수정이 완료 되었습니다.");
                              document.getElementById("preUserEmail").value = emailAddress2;
                           }else{
                              alert("이메일 수정이 실패했습니다.\n 다시시도해주세요.");
                           }
                                 
                              
                        }//success end
                        
                     }); 
                     //ajax end  
                              
                  }else{   
                     alert("이메일이 수정되지 않았습니다.");    
                  }

         //    }if confirm end  
                  
                  
               }else{
                     alert("이메일 수정이 실패했습니다.\n 다시시도해주세요.");
                  
                 }
                     
                  
               
               
               
               
               
               
            },//success end
            
             
            
         }) ;//ajax.end
         //추가 끝
         
         
         
         }

         
      
    // 20230706 이메일 하고 나서 주소
    
    //주소 검색 검색버튼 누르면 나오는 창 
    
      
         

       
        
  //회원정보 수정눌렀을때 나오는 페이지 이동 
 /*    ??이건 Detail 에서 검사하는거 
      $("#checkUserBtn").on("click", function() {
        var userId = $("#inputUserIdVal").val();
        var userPassword = $("#inputPasswordVal").val();

        var requestData = JSON.stringify({ userId: userId, userPassword: userPassword });

        $.ajax({
          url: "${contextPath}/mypage/myDetail",
          method: "POST",
          data: requestData,
          contentType: "application/json;charset=UTF-8",
          success: function(response) {
            // AJAX 요청 성공 시 실행할 동작
            if (!response) {
              
              alert("비밀번호가 일치하지 않습니다.");
            }else{ 
               
             /* var formElement = document.getElementById("checkUserDiv");
           formElement.style.display = "none";
            
           document.getElementById("checkSuccessDiv").style.display = "block";
           
           
           
            var idFormData = document.querySelector("#idFormData");
           idFormData.method = "POST";
           idFormData.action = "${contextPath}/mypage/myModify";
         idFormData.submit();
                   
            }
          },
          error: function(xhr, status, error) {
            // AJAX 요청 실패 시 실행할 동작
            console.error(error);
          }
        });
      });
       */
      
   
   var code2 = "";
   var phone3 = "" ;
   $("#phoneChk").click(function(){
      
      var phone = $("#phone").val();
      
      if(!(/^(\d){2,4}-(\d){2,5}(-)?(\d){3,5}$/.test(phone))){
         
         alert("(-)을 표기한 올바른 전화번호를 입력해주세요.")
         return;
         
      }
      
      
      
      alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
       phone = $("#phone").val();
       phone3 = phone = $("#phone").val();
      $.ajax({
         type:"GET",
         url:"${contextPath}/phoneCheck?phone=" + phone,
         cache : false,
         success:function(data){
            if(data == "error"){
               alert("휴대폰 번호가 올바르지 않습니다.")
               $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
               $(".successPhoneChk").css("color","red");
               $("#phone").attr("autofocus",true);
            }else{                 
               $("#phone2").attr("disabled",false);
               $("#phoneChk2").css("display","inline-block");
               $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
               $(".successPhoneChk").css("color","green");
               $("#phone").attr("readonly",true);
               code2 = data;
            }
         }
      });
   });
   
   
   
   
  //휴대폰 인증번호 대조
   $("#phoneChk2").click(function(){


         if($("#phone2").val() == "" || $("#phone2").val().length == 0){

            alert("인증번호를  받고 인증번호를 입력 해 주세요");
            return;

         }



      if($("#phone2").val() == code2){
         $(".successPhoneChk").text("인증번호가 일치합니다.");
         $(".successPhoneChk").css("color","green");
         $("#phoneDoubleChk").val("true");
         $("#phone2").attr("disabled",true);
         
         /*  */ 
         if(confirm("전화번호를 수정하시겠습니까?")){
            
            
            $.ajax({
                  
                
               url: "${contextPath}/mypage/modifyHp" ,
               type: "POST",
               data: phone3 ,
               contentType: "application/json;charset=utf-8",
               success: function(response){
               
               if(response){ 
               alert("전화 번호 수정이 완료 되었습니다.");
               
               document.getElementById("preUserPhoneNumber").value = phone3 ;
               
                  }else{
                     
                     alert("전화번호 수정이 실패했습니다.\n 다시시도해주세요.");
                  }
                      
                     
                  }//success end
               
            })
          
            
             
            
            
         }else{
            
            alert("전화번호 수정이 취소되었습니다.");
            
         }
         
         /*  */
      }else{
         $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
         $(".successPhoneChk").css("color","red");
         $("#phoneDoubleChk").val("false");
         $(this).attr("autofocus",true);
      }
   });
   
   
</script>
    


 <%@include file="../include/footer.jsp" %>