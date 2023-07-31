package com.booknow.travelapp.common.paging;

import java.util.List;

import com.booknow.travelapp.domain.FAQCategoryVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FAQCategoryDTO {
	
	private List<FAQCategoryVO> commonCateId;
	private List<FAQCategoryVO> hotelCateId;
	private List<FAQCategoryVO> airCateId;
	
}
