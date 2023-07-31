package com.booknow.travelapp.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

//230705 임지혁 생성
public class TLAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
					   AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		response.sendRedirect("/travelapp/accessForbiddenError?tlAccessDeniedMsg=" + accessDeniedException.getMessage());
		
		
		
	}

	
	
	
}
