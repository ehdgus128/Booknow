package com.booknow.travelapp.common.mapper;

import java.util.List;
import java.util.Map;

import com.booknow.travelapp.common.domain.QNAAnswerQuestionsVO;
import com.booknow.travelapp.common.domain.paging.QNAAnswerPagingDTO;

 

public interface QNAAnswerMapper {
	
 
//	 	 리스트조회
	    public List<QNAAnswerQuestionsVO> selectQNAAnswerList(QNAAnswerPagingDTO QNAAnswerPagingDTO);

	    //리스트 토탈
	    public long selectRowTotal(QNAAnswerPagingDTO pagingDTO);

	    //관리자 답변 등록
	    public void insertQNAanswer(QNAAnswerQuestionsVO answerVO);
	    
	    //유저 답변 +1
	    public long updateQnaQprocFlag(long qnaQno);
	     
	    //관리자 답변 수정
	    public int updateQNAanswer(QNAAnswerQuestionsVO answerVO);

	    public long rowTotalDifference( );
	    

		public List<QNAAnswerQuestionsVO> selectDetail(QNAAnswerPagingDTO pagingDTO);
	    
		public long selectRowTotalDetail(QNAAnswerPagingDTO pagingDTO);
		
		//삭제
		public long  deleteQnaAnswer(long qnaQno);
		public long  deleteQnaQuestion(long qnaQno);
		
		
		
//		 답변 없는 값 카운팅 맵
		 public Map<String, Long> selectQnaCategoryCounts();

	}

	
	
	
	
	
	

