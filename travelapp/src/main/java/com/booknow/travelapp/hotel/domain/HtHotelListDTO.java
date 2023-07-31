package com.booknow.travelapp.hotel.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//작업자 정지은 20230703 가격별 , 등급별 ajax처리위한 dto 
public class HtHotelListDTO {

    private String startDateStr;
    private String endDateStr;

}
