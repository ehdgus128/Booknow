<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<script>
	alert('수정되었습니다')
 	location.href = '${contextPath}/community/detail?tvcCatId=${communityBean.tvcCatId}&tvcBno=${communityBean.tvcBno}';
 </script>
 