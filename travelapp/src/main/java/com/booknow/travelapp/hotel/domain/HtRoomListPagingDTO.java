package com.booknow.travelapp.hotel.domain;

import java.util.List;

import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class HtRoomListPagingDTO {
    //2307071611 장유정 - 객실 목록 페이징 처리

    private List<HtRoomVO> htRoomList;
    private TLHotelListPageDTO pagingCreator;

}// HtRoomListPagingDTO