<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
	<c:set var="isLogin" value="true" />
	<c:set var="loginUser" value="${principal.username}" />
</sec:authorize>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="/resources" />

<!DOCTYPE html>
<html>
<head>

    <!-- <link rel="shortcut icon" href="${contextPath}${resources}/img/com_favicon.ico" type="image/x-icon" sizes="16x16" /> -->
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Booknow Manager</title>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<%--     <!-- DataTables CSS -->
    <link href="${contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
 --%>
 
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<!-- 수업 에서 추가한 style -->
    <style>
        th, td{ text-align: center;}
    </style>
	
	<link rel="shortcut icon" href="${contextPath}/resources/img/favicon.ico" type="image/x-icon">
	
</head>

<body id="me">

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${contextPath}/resources/dist/js/sb-admin-2.js"></script>
<!-- script -->
    
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextPath}/admin/home" style="color: black;">Booknow Manager</a><!-- fix -->
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-user fa-fw"></i>
                        <sec:authorize access="isAuthenticated()">
                        ${loginUser}<span>님 접속</span>
                        </sec:authorize>
                        <sec:authorize access="isAnonymous()">
                        <span>로그인</span>
                        </sec:authorize>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
<sec:authorize access="isAnonymous()">
                        <li><a id="myLogin" href="${contextPath}/login"><i class="fa fa-sign-in fa-fw"></i>Sign in</a>
                        </li>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
                        <li><a id="myLogout" href="${contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i>Sign out</a>
                        </li>
</sec:authorize>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        <li>
                            <a href="${contextPath}/"><i class="fa fa-home fa-fw"></i> Main Page</a>
                        </li>
<sec:authorize access="isAnonymous()">                        
                        <li>
                            <a href="${contextPath}/login"><i class="fa fa-sign-in fa-fw"></i>Sign in</a>
                        </li>
</sec:authorize>                        
<sec:authorize access="isAuthenticated()">                        
                        <li>
                            <a href="${contextPath}/logout"><i class="fa fa-sign-in fa-fw"></i>Sign out</a>
                        </li>
</sec:authorize>

<!-- 매출 -->
                        <li>
                            <a href="#">
                                <i class="fa fa-bar-chart-o fa-fw"></i>
                                매출
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <!-- 여기에 링크 -->
                                    <a href="${contextPath}/admin/monthlySales">월별 매출</a>
                                </li>
                                <li>
                                    <!-- 여기에 링크 -->
                                    <a href="${contextPath}/admin/quarterlySales">분기별 매출</a>
                                </li>
                            </ul>
                        </li>
<!-- 매출 end -->

<!-- 호텔 -->
<!-- 정지은 수정완료 2307171702 -->
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-home"></i>
                               		 호텔
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <!-- 여기에 링크 -->
                                     <a href="${contextPath }/admin/hotel/register">호텔 상품 입력</a>         
                                </li>
                                <li>
                                    <!-- 여기에 링크 -->
                                     <a href="${contextPath }/admin/hotel/list">호텔 상품 목록</a>           
                                </li>
                            </ul>
                        </li>
<!-- 호텔 end -->

<!-- 항공 -->
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-plane"></i>
                                항공
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <!-- 여기에 링크 -->
                                     <a href="${contextPath }/admin/airways/airpurchas">항공 구매 내역</a>       
                                </li>
                                <li>
                                    <!-- 여기에 링크 -->
                                    <a href="${contextPath }/admin/airways/list">항공 상품 목록</a>  
                                </li>
                            </ul>
                        </li>
<!-- 항공 end -->

<!-- 결제 -->
                        <!-- <li>
                            <a href="#">
                                <i class="fa fa-krw"></i>
                                결제
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a>결제 목록</a>
                                </li>
                                <li>
                                    <a>결제 취소</a>
                                </li>
                            </ul>
                        </li> -->
<!-- 결제 end -->

<!-- 고객관리 -->
                        <li>
                            <a href="#">
                                <i class="fa fa-users"></i>
                                고객센터
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <!-- <li>
                                    <a>FAQ</a>
                                </li> -->
                                <li>
                                    <!-- 여기에 링크 -->
                                    <a href="${contextPath}/admin/qna">QNA</a><!--권태욱0715-->
                                </li>
                            </ul>
                        </li>
<!-- 고객관리 end -->


                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
