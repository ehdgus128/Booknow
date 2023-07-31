package com.booknow.travelapp.common.security.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsVO implements SnsUrls{
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	private String state;
	
	
	public SnsVO(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		this.api20Instance = NaverAPI20.instance();
		this.profileUrl = NAVER_PROFILE_URL;
		this.state = SESSION_STATE;
	}
}
