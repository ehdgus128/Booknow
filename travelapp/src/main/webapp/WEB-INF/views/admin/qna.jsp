		<%@include file="/WEB-INF/views/include/adminheader.jsp"%>
		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<style>
		.container-fluid {
		    padding-right: 100PX;
		    padding-left: 100PX;
		    margin-right: 100PX;
		    margin-left: 100PX;
		}
		.panel-default {
			margin-bottom: 20px;
			border: 1px solid #ddd;
			border-radius: 4px;
		}
		
		.panel-default .panel-heading {
			background-color: #f5f5f5;
			padding: 10px;
		}
		
		.panel-default .panel-title {
			margin-top: 0;
			margin-bottom: 5px;
			font-size: 18px;
		}
		
		.panel-default .panel-body {
			padding: 15px;
			font-size: 16px;
		}
		
		.panel-default .panel-footer {
			background-color: #f5f5f5;
			padding: 10px;
			font-size: 14px;
		}
		
		.panel-default .panel-footer::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.panel-default .panel-footer p {
			margin-bottom: 0;
		}
		
		.panel-default .panel-footer span {
			font-weight: bold;
		}
		
		/* Question Panel */
		.panel-question {
			border-color: #337ab7;
		}
		.panel-answer {
			border-color: #5cb85c;
		}
		.panel-primary .panel-heading {
				background-color: #337ab7;
				color: #fff;
			}
		
			.panel-primary .panel-footer {
				background-color: #f5f5f5;
				border-top: 1px solid #ddd;
			}
		
			.panel-primary .panel-footer .pull-left {
				color: #333;
			}
		
			.panel-primary .panel-footer .pull-right {
				color: #337ab7;
			}
		
			.panel-primary .panel-footer .fa-arrow-circle-right {
				color: #337ab7;
			}
		
			.panel-primary .panel-footer .clearfix {
				clear: both;
			}
		
			.panel-primary .panel-footer a:hover {
				text-decoration: none;
			}
		
			.panel-primary .huge {
				font-size: 48px;
			}
		
			.panel-primary .panel-title {
				font-size: 24px;
				margin-top: 5px;
				margin-bottom: 5px;
			}
		
			.panel-primary .panel-body p {
				margin-bottom: 0;
			}
			.container-fluid {
			    padding-left: 100PX;
			    margin-right: auto;
			    margin-left: 16%;
			}
		.listContainer { width: fit-content ; }
		.col-lg-6 {
		    display: inline-block;
		}
		.collapse.in {height: auto;}
		.buttonArea {width: 100%;}
		.selectBoxArea {width: 100%; margin-bottom: 10px;}
		.btnView {width: 45%; display: inline-block;}
		.btn-block+.btn-block {margin-top: 0;}
	.btn-default.btn-xs {
	    font-size: 12px;
	    padding: 2px 10px;
	}
	
	.dropdown-menu {
	    width: auto; 
	    min-width: auto; 
	}
	
	.buttonArea {
	  display: flex;
	}
	
	.buttonArea button {
	  margin-right: 0;
	}
	
	.buttonArea button:last-child {
	  margin-right: 0;
	}
	 .panel-body {
	  overflow-x: auto;
	    word-wrap: break-word;
	}
	    
	
		</style>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
				</div>
					<h1 class="text-center">  QNA 리스트</h1>
			</div>
		
			<div class="row text-center">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${TotalDifference}</div>
									<div>새로운 질문</div>
								</div>
							</div>
						</div>
					<!-- 	<a href="http://localhost:8080/travelapp/admin/qnadetail"> -->
						<div class="panel-footer">
				    <div class="row">
				        <div class="col-sm-4">
				            <button type="button" class="btn btn-default" onclick="location.href='${contextPath}/admin/qnadetail?scope=T&keyword=항공'">
				                항공 <span class="badge">${categoryCounts['COUNT_AIR']}</span>
				            </button>
				        </div>
				        <div class="col-sm-4">
				            <button type="button" class="btn btn-default" onclick="location.href='${contextPath}/admin/qnadetail?scope=T&keyword=호텔'">
				                호텔 <span class="badge">${categoryCounts['COUNT_HOTEL']}</span>
				            </button>
				        </div>
				        <div class="col-sm-4">
				            <button type="button" class="btn btn-default" onclick="location.href='${contextPath}/admin/qnadetail?scope=T&keyword=공통'">
				                공통 <span class="badge">${categoryCounts['COUNT_COMMON']}</span>
				            </button>
				        </div>
				    </div>
				</div>
					</div>
				</div>
				
				<div class="row text-center">
					<div class="col-lg-4">
						<div class="btn-group">
							<div class="col-lg-4">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="listContainer">
				<!-- <div class="text-center">
					<h3>유저 질문 관리자 답변</h3>
				</div> -->
				
				<div class="selectBoxArea">
			 
				</div>
				<div class="buttonArea">
				  <button class="btn btn-default btnView" onclick="location.href='${contextPath}/admin/qna'">View All Question</button>
				  <button class="btn btn-default btnView" onclick="location.href='${contextPath}/admin/qnadetail?scope=A&keyword=1'">View Only Answer</button>
				  <button class="btn btn-default btnView" onclick="location.href='${contextPath}/admin/qnadetail?scope=Q&keyword=항공'">항공</button>
				  <button class="btn btn-default btnView" onclick="location.href='${contextPath}/admin/qnadetail?scope=Q&keyword=호텔'">호텔</button>
				  <button class="btn btn-default btnView" onclick="location.href='${contextPath}/admin/qnadetail?scope=Q&keyword=공통'">공통</button>
				</div>
	
				<c:forEach items="${revList}" var="list">
				<div class="panel panel-default" style="margin-top:20px;">
			       <div class="panel-heading">
			           <i class="fa fa-bell fa-fw"></i>${list.qnaQcategory}   ${list.qnaQno}
			           
			           <div style="text-align: right;">
				    <div class="btn-group">
				        <button type="button" class="btn btn-outline btn-default" data-toggle="modal" data-target="#myModal"
				            data-qnaqno="${list.qnaQno}"
				            data-qnaqcategory="${list.qnaQcategory}"
				            style="${list.qnaQprocFlag eq 0 ? '' : 'display: none;'}">
				            등록
				        </button>
				        <button type="button" class="btn btn-outline btn-warning modi_btn" data-toggle="modal" data-target="#myModal2"
				            data-qnaqno="${list.qnaQno}"
				            data-qnaqcategory="${list.qnaQcategory}"
				            data-qnaacontent="${list.qnaAcontent}"
				            data-qnaawriter="${list.qnaAwriter}"
				            data-qnaano="${list.qnaAno}"
				            style="${list.qnaQprocFlag eq 1 ? '' : 'display: none;'}">
				            수정
				        </button>
				        <button type="button" class="btn btn-outline btn-danger delete_btn" data-toggle="modal" data-target="#myModal1"
				            data-qnaqno="${list.qnaQno}">
				            삭제
				        </button>
				    </div>
				</div>
			       </div>
			       <!-- .panel-heading -->
			       <div class="panel-body">
			           <div class="panel-group" id="accordion">
			               <div class="panel panel-default">
			                   <div class="panel-heading">
			                       <h4 class="panel-title">
			                           <a data-toggle="collapse" data-parent="#accordion" ><small>${list.qnaQno}</small> ${list.qnaQtitle}  </a>
			                       </h4>
			                   </div>
			                   <div id="collapseOne" class="panel-collapse collapse in">
			                       <div class="panel-body">
			                         ${list.qnaQcontent}<br><br>
			                         작성자: ${list.qnaQwriter} <br>
									작성일자: ${list.qnaQregDate} <br>
									수정일자:  <fmt:formatDate value="${list.qnaQmodDate}" pattern="yyyy/MM/dd HH:mm"/><br>
			                       </div>
			                   </div>
			               </div>
			             <c:choose>
					  <c:when test="${list.qnaQprocFlag == 0}">

							<div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
					            
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse in">
					        <div class="panel-body">
					        <div class="alert alert-danger">
                               <h2  class="text-center">미처리 QNA </h2> 
                            </div>
					         
					        </div>
					      </div>
					    </div>
					    
					  </c:when>
					  <c:otherwise>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
					            <small>${list.qnaAno} </small>  &nbsp;${list.qnaAwriter}
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse in">
					        <div class="panel-body">
					          ${list.qnaAcontent}<br><br>
					          작성자: ${list.qnaAwriter}<br>
					          작성일자: <fmt:formatDate value="${list.qnaAregDate}" pattern="yyyy/MM/dd HH:mm"/><br>
					          수정일자: <fmt:formatDate value="${list.qnaAmodDate}" pattern="yyyy/MM/dd HH:mm"/><br> 
					        </div>
					      </div>
					    </div>
					  </c:otherwise>
					</c:choose>
			           </div>
			       </div>
			       <!-- .panel-body -->
			   </div>
			   
			</c:forEach>
			<!-- 등록모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title" id="myModalLabel">게시물 작성 - <span id="qnaQnoValue"></span> <br><span id="qnaQcategoryValue"></span></h4>
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		            </div>
		            <div class="modal-body">
		                <form action="${contextPath}/admin/qna/register" method="POST">
		                    <input type="hidden" name="qnaQno" id="qnaQnoInput" value="">
		                    <div class="form-group">
		                        <label for="qnaAcontent">내용</label>
		                        <input type="text" name="qnaAcontent" id="qnaAcontent" class="form-control" placeholder="내용" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="qnaAwriter">작성자</label>
		                        <input type="text" name="qnaAwriter" id="qnaAwriter" class="form-control" placeholder="작성자" required>
		                    </div>
		                    <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
		                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		                	<sec:csrfInput/>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 삭제 모달 -->
		<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">삭제 확인</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		      </div>
		      <div class="modal-body">
		        <p>정말로 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="confirmDelete">삭제</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 수정 모달 -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalLabel">수정 모달</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form id="modifyForm">
	          <div class="form-group">
	            <label for="qnaqno">질문 번호:</label>
	            <input type="text" class="form-control" id="qnaqnoInput" name="qnaQno" readonly="readonly">
	            <input type="hidden" class="form-control" id="qnaanoInput" name="qnaAno" readonly="readonly">
	          </div>
	          <div class="form-group">
	            <label for="qnaqcategory">질문 카테고리:</label>
	            <input type="text" class="form-control" id="qnaqcategoryInput" name="qnaQcategory" readonly="readonly">
	          </div>
	          <div class="form-group">
	            <label for="qnaacontent">질문 내용:</label>
	            <textarea class="form-control" id="qnaacontentInput" name="qnaAcontent"></textarea>
	          </div>
	          <div class="form-group">
	            <label for="qnaawriter">질문 작성자:</label>
	            <input type="text" class="form-control" id="qnaawriterInput" name="qnaAwriter">
	          </div>
	          <sec:csrfInput/>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
		<!-- 페이퍼-->
				<div class="container text-center">
					<ul class="pagination">
						<c:if test="${pagingCreator.prev}">
							<li class="page-item"><a href="1" aria-label="Previous"
								class="page-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pagingCreator.prev}">
							<li class="page-item"><a
								href="${pagingCreator.startPagingNum - 1}" aria-label="Previous"
								class="page-link"> <span aria-hidden="true">이전</span>
							</a></li>
						</c:if>
				
						<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}"
							end="${pagingCreator.endPagingNum}" step="1">
							<li
								class="page-item ${pagingCreator.qnaAnswerPaging.pageNum == pageNum ? 'active' : ''}">
								<a class="page-link" href="${pageNum}">${pageNum}</a>
							</li>
						</c:forEach>
				
						<c:if test="${pagingCreator.next}">
								<li class="page-item"><a
								href="${pagingCreator.endPagingNum + 1}" class="page-link"
								aria-label="Next"> <span aria-hidden="true">다음</span>
							</a></li>
						</c:if>
						<c:if test="${pagingCreator.next}">
							<li class="page-item"><a href="${pagingCreator.lastPageNum}"
								class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			
		</div>
		
		 
		
			<script type="text/javascript">
			
			/*  토큰*/
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
	
			
			/*  페이징*/
			$(".pagination a").on("click", function(e) {
				  e.preventDefault();
				  var pageNum = $(this).attr("href");
				  var frmSendValue = $("<form>").attr("method", "GET");
		
				  var currentPageURL = window.location.href;
				  var currentScope = getParameterByName("scope", currentPageURL);
				  var currentKeyword = getParameterByName("keyword", currentPageURL);
		
				  if (currentPageURL.includes("/admin/qnadetail")) {
				    frmSendValue.attr("action", "${contextPath}/admin/qnadetail");
				  } else if (currentPageURL.includes("/admin/qna")) {
				    frmSendValue.attr("action", "${contextPath}/admin/qna");
				  }
					
				  frmSendValue.append($("<input>").attr("type", "hidden").attr("name", "scope").val(currentScope));
				  frmSendValue.append($("<input>").attr("type", "hidden").attr("name", "keyword").val(currentKeyword));
				  frmSendValue.append($("<input>").attr("type", "hidden").attr("name", "pageNum").val(pageNum));
				  frmSendValue.appendTo(document.body).submit();
				});
		
				function getParameterByName(name, url) {
				  name = name.replace(/[\[\]]/g, "\\$&");
				  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
				  var results = regex.exec(url);
				  if (!results) return "";
				  if (!results[2]) return "";
				  return decodeURIComponent(results[2].replace(/\+/g, " "));
				}
		
			/*  등록모달*/
			
				 $(document).ready(function() {
		        $('button[data-target="#myModal"]').on('click', function() {
		            var qnaQno = $(this).data('qnaqno');
		            var qnaQcategory = $(this).data('qnaqcategory');
		            
		            $('#qnaQnoValue').text(qnaQno);
		            $('#qnaQcategoryValue').text(qnaQcategory);
		            $('#qnaQnoInput').val(qnaQno);
		            $('#qnaQcategoryInput').val(qnaQcategory);
		     		 
		            console.log("csrfHeaderName: "+ csrfHeaderName);
		    		console.log("csrfTokenValue: "+ csrfTokenValue);
		            
		        });
		    });
			    
				 // 삭제 
			$('.delete_btn').click(function() {
		    var qnaqno = $(this).data('qnaqno');
		    var contextPath = "${contextPath}";
		    var previousUrl = window.location.href; 
		
		    $('#deleteConfirmationModal').modal('show');
		
		    $('#deleteConfirmationModal').on('click', '.btn-primary', function() {
		        $.ajax({
		            url: '/travelapp/admin/qna/Delete',
		            method: 'GET',
		            data: {
		                qnaQno: qnaqno 
		            },
		            success: function(response) {
		                console.log('삭제 요청이 완료되었습니다.');
		                window.location.href = previousUrl;  
		            } 
		        });
		    });
		});
		
		
		/*수정  */
	 $(document).ready(function() {
	  $('.modi_btn').click(function() {
	    var qnaqno = $(this).data('qnaqno');
	    var qnaqcategory = $(this).data('qnaqcategory');
	    var qnaacontent = $(this).data('qnaacontent');
	    var qnaawriter = $(this).data('qnaawriter');
	    var qnaano = $(this).data('qnaano');
	    
	    $('#qnaqnoInput').val(qnaqno);
	    $('#qnaqcategoryInput').val(qnaqcategory);
	    $('#qnaacontentInput').val(qnaacontent);
	    $('#qnaawriterInput').val(qnaawriter);
	    $('#qnaanoInput').val(qnaano);
	  });
	
	  $('#modifyBtn').click(function() {
	    var formData = {
	      qnaQno: $('#qnaqnoInput').val(),
	      qnaAno: $('#qnaanoInput').val(),
	      qnaQcategory: $('#qnaqcategoryInput').val(),
	      qnaAcontent: "'" + $('#qnaacontentInput').val() + "'",  
	      qnaAwriter: "'" + $('#qnaawriterInput').val() + "'" 
	    };
	    
	    $.ajax({
	      url: '${contextPath}/admin/qna/modi',
	      type: 'POST',
	      data: JSON.stringify(formData),
	      contentType: 'application/json',
	      success: function(response) {
	        if (response === 'ReplyModifySuccess') {
	         // alert('수정되었습니다.');
	        	 location.reload(); 
	        }  
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	        alert('에러');
	      }
	    });
	
	    $('#myModal2').modal('hide');
	  });
	});
	
	 
			</script>
		
		<%@include file="/WEB-INF/views/include/adminfooter.jsp"%>
