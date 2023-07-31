<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booknow</title>

<!-- 결제 api -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- 202306271646 김영환 bootstrap icons 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href="${contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="${contextPath}/resources/img/favicon.ico" type="image/x-icon">


</head>
<body>
<sec:authentication property="principal" var="principal"/>
<img src="${contextPath}/resources/img/main.jpg" class="img position-absolute " style="position: relative;  min-width: 100%; height: 130%;" alt="배경이 없습니다.">
<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath}">Booknow</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/airways/">항공</a>
            <!-- <span class="visually-hidden">(current)</span> -->
          
        </li>
        <li class="nav-item">
          <a class="nav-link " href="${contextPath}/hotel/">호텔</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/community/list">커뮤니티</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/mypage/myMain">마이페이지</a>
        </li>
        <!-- 로그인 dropdown -->
        <li class="nav-item dropdown">
			<c:choose>
				<c:when test="${principal eq 'anonymousUser' }">
          			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">로그인</a>
          			<div class="dropdown-menu">
            			<a class="dropdown-item" href="${contextPath }/login">로그인</a>
           			</div> 
				</c:when>
				<c:otherwise>
	          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${principal.username}</a>
	           			<div class="dropdown-menu">
	             			<a class="dropdown-item" href="${contextPath }/logout">로그아웃</a>
	          			</div>
				</c:otherwise>
			</c:choose>
        </li>
        <!-- dropdown end -->
        <sec:authorize access="hasAuthority('ADMIN')" >
       		<li class="nav-item">
       			<a class="nav-link" href="${contextPath}/admin/home">관리자페이지</a>
       		</li>
        </sec:authorize>
      </ul>
    </div>
  </div>
</nav>

