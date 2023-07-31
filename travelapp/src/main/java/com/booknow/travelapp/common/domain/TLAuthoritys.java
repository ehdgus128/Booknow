package com.booknow.travelapp.common.domain;

import java.sql.Timestamp;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.Assert;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TLAuthoritys implements GrantedAuthority{
    // stream 하기 싫어서 interface 상속 받아서 구현

	private static final long serialVersionUID = 1L;

    private String userId;
    private String authority; // security가 사용하는 변수
    private Timestamp grantedDate;

    public TLAuthoritys(String authority) {
		Assert.hasText(authority, "A granted authority textual representation is required");
        this.authority = authority;
    }

    // 아래는 simple user에 구현된 method
    // 혹시 몰라서 구현해둠
    @Override
    public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj instanceof TLAuthoritys) {
			return this.authority.equals(((TLAuthoritys) obj).authority);
		}
		return false;
    }

	@Override
	public int hashCode() {
		return this.authority.hashCode();
	}

	@Override
	public String toString() {
		return this.authority;
	}
}
