package com.booknow.travelapp.common.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdminManagerBoardVO {
    private Long tmBno;
    private String tmBtitle;
    private String tmBcontent;
    private String tmBwriter;
    private String tmBtype;
    private Date tmBregDate;
    private Date tmBmodDate;
    private Integer tmBdelFlag;
}
