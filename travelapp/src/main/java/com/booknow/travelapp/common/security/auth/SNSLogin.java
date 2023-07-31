package com.booknow.travelapp.common.security.auth;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.booknow.travelapp.common.domain.NaverUsers;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin implements OAuth2User {
	
	private OAuth20Service oauthService;
	private SnsVO sns;

	
	public SNSLogin(SnsVO sns) {
		
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.state(sns.getState())
				.build(sns.getApi20Instance());
		
		this.sns = sns;
	}
	
	
	public String getAuthorizationUrl() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	
	
	public NaverUsers getUserProfile(String code) throws Exception {
		
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
			
		return parseJson(response.getBody());
		
	}
	
	
	private NaverUsers parseJson(String body) throws JsonMappingException, JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		System.out.println(rootNode.toString());
		
		NaverUsers user = new NaverUsers();
		
		JsonNode resNode = rootNode.get("response");
		user.setNaverId(resNode.get("id").asText());
		user.setNaverName(resNode.get("name").asText());
		user.setNaverEmail(resNode.get("email").asText());
		user.setNaverMobile(resNode.get("mobile").asText());
		
		String naverBday = resNode.get("birthyear").asText() + "-" + resNode.get("birthday").asText();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			
			user.setNaverBday(sdf.parse(naverBday));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
			
		
		return user;
	}

	
	@Override
	public Map<String, Object> getAttributes() {
		// 속성(attributes)를 맵 형태로 반환
		return Collections.emptyMap();
	}

	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// 권한(authorities)을 반환
		return Collections.emptyList();
	}

	
	@Override
	public String getName() {
		// 사용자의 식별을 위한 이름 반환
		return null;
	}
	
	
	public OAuth2User toOAuth2User(NaverUsers user) {
		// 사용자 정보를 OAuth2User 형태로 변환하여 반환
		Map<String, Object> attributes = Collections.singletonMap("user", user);
		return new DefaultOAuth2User(getAuthorities(), attributes, "user");
	}
	

	
}

