package com.booknow.travelapp.service;

import com.booknow.travelapp.common.paging.QNAAnswerPagingCreatorDTO;
import com.booknow.travelapp.common.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;

public interface QNAAnswerService {

	public QNAAnswerPagingCreatorDTO getQNAAnswerListByQno(QNAAnswerPagingDTO qnaAnswerPaging);
	
	public long getAnswerTotalbyQno(QNAAnswerPagingDTO qnaAnswerPaging);

	public QnaBoardsVO getAnswer(Long qnaQno);
	
}
