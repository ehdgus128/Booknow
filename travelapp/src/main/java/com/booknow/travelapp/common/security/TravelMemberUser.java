package com.booknow.travelapp.common.security;

import org.springframework.security.core.userdetails.User;

import com.booknow.travelapp.common.domain.TLUsers;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class TravelMemberUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private TLUsers tlUser;
	
	public TravelMemberUser(TLUsers tlUser) {
		super(tlUser.getUserId(), tlUser.getUserPassword(), tlUser.getAuthorityList()); // stream 안쓴 이유는 tluser check해보시면 되요 김영환_202306260958
		this.tlUser = tlUser;
	}


}
