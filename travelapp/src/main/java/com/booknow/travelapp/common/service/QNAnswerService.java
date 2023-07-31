package com.booknow.travelapp.common.service;

import java.util.List;
import java.util.Map;

import com.booknow.travelapp.common.domain.QNAAnswerQuestionsVO;
import com.booknow.travelapp.common.domain.paging.QNAAnswerPagingDTO;

public interface QNAnswerService {

	public List<QNAAnswerQuestionsVO> getQNAAnswerList(QNAAnswerPagingDTO pagingDTO);

	public long getRowTotal(QNAAnswerPagingDTO pagingDTO);

	
	public long registerQNAAnswer(QNAAnswerQuestionsVO answerVO);

	public int updateQNAAnswer(QNAAnswerQuestionsVO answerVO);

	public long getRowTotalDifference();


	public List<QNAAnswerQuestionsVO> selectDetail(QNAAnswerPagingDTO pagingDTO);

	public long selectRowTotalDetail(QNAAnswerPagingDTO pagingDTO);

	public long deleteQnaQuestion(long qnaQno);

	public long deleteQnaAnswer(long qnaQno);

	public long updateQnaQprocFlag(long qnaAno);

	public Map<String, Long> getQnaCategoryCounts();



	 
   

}  
