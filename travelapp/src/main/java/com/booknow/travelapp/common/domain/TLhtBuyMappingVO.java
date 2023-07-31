package com.booknow.travelapp.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작업자 정지은 (맵핑테이블용 vo, 호텔거래내역 테이블,방구매내역테이블 맵핑)
@Getter
@Setter
@ToString
public class TLhtBuyMappingVO {
	 private Long htBuyTranId;
	 private Long htRooBuyDateId;
}
