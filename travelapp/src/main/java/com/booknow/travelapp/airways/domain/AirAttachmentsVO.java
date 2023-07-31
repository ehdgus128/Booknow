package com.booknow.travelapp.airways.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
// 230626 임지혁 생성
public class AirAttachmentsVO {
	private String airUuid;
	private String airLineId;
	private String airUploadPath;
	private String airFileName;
	private String airFileType;
}
