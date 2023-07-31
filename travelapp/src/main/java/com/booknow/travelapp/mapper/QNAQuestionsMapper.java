package com.booknow.travelapp.mapper;

import java.util.List;

import com.booknow.travelapp.common.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.common.paging.QNAQuestionPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;

public interface QNAQuestionsMapper {

	//게시물 등록 
	public Integer insertMyQNASelectKey(QnaBoardsVO qnaBoard);
	
	// 게시물 조회_페이징 고려
	public List<QnaBoardsVO> selectQnaQTitle(QNAQuestionPagingDTO qnaQuestionPagingDTO);
	
	//게시물 총개수 조회(페이징)
	public long selectRowAmountTotal(QNAQuestionPagingDTO qnaQuestionPagingDTO);
	
	//특정 게시물 조회
	public QnaBoardsVO selectQnaQcontent(Long qnaQno);
	
	//특정게시물 수정
	public int updateQnaQContent(QnaBoardsVO qnaBoard);
	
	//특정 게시물 답변요청
	public int updateQnaFlag (Long qnaQno);
	
	//특정 답변 리스트
	public List<QnaBoardsVO> selectQnaAnswerlist(QNAAnswerPagingDTO qnaAnswerPagingDTO);
	
	//답변 총 개수 확인
	public int selectQnaAnswerTotal(QNAAnswerPagingDTO qnaAnswerPagingDTO);
	
	//특정 답변 조회
	public QnaBoardsVO selectQNAAnswer(Long qnaQno);


}
