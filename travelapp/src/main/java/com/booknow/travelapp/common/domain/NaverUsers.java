package com.booknow.travelapp.common.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class NaverUsers {
	
	private String naverId;
	private String naverName;
	private String naverEmail;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date naverBday;
	private String naverMobile;
	
	
}
