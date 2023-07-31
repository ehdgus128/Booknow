package com.booknow.travelapp.common.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;


//230705 임지혁 생성
public class TlLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
									   HttpServletResponse response,
									   Authentication authentication) throws ServletException, IOException {
		
		// //현재 session을 return or session이 없으면 null return
//		 HttpSession session = request.getSession(false);
//		
//		 if (session != null) {
//		 	session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
//		 	//현재 session이 있을 때 Authentication-Failure 예외 속성을 제거
//		 }

		// 아래 함수가 동일한 기능을 해요 김영환
		clearAuthenticationAttributes(request);
		
		Set<String> authNameList = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		//인증정보를 set으로 저장											로그인한 유저의 authorities 반환하거나 인증 사실 없으면 empty collection 반환
		
		RequestCache requestCache = new HttpSessionRequestCache()	;
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		//현재 request, response의 saved request 반환 or null
		
		// 갈곳이 있으면  super의 함수를 통해서 직행
		if (savedRequest != null) {	
			super.onAuthenticationSuccess(request, response, authentication);
			
			return;
		}

		// 갈곳이 없는데 admin이면 admin홈으로
		if (authNameList.contains("ADMIN")) { //임시
			response.sendRedirect("/travelapp/admin/home");
			return;
		}

		// 갈곳이 없고 admin도 아니면 홈페이지로
		response.sendRedirect("/travelapp/");
	}
	
}
