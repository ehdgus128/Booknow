package com.booknow.travelapp.service;

import java.util.List;

import com.booknow.travelapp.common.paging.QNAQuestionPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;

public interface QNAQuestionsService {

	//게시물 등록 
	public long registerQNAQuestion(QnaBoardsVO qnaBoards);
	
	//게시물 리스트:페이징고려
	public List<QnaBoardsVO> getQNAQList(QNAQuestionPagingDTO qnaQuestionPagingDTO);
	
	//게시물 총 개수 조회 서비스_페이징 필요
	public long getRowAmountTotal(QNAQuestionPagingDTO qnaQuestionPagingDTO);
	
	//게시물 조회
	public QnaBoardsVO getQNAContent(Long qnaQno);
	
	//게시물 수정화면
	//public QnaBoardsVO getQNADetailModify(long qnaQno);
	
	//게시물 수정
	public boolean modifyQNAContent(QnaBoardsVO qnaBoards);
	
	//게시물 답변 요청
	public boolean setQNADeleted(Long qnaQno);








}
