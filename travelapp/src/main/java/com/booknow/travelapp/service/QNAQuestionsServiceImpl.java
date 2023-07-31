package com.booknow.travelapp.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.paging.QNAQuestionPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;
import com.booknow.travelapp.mapper.QNAQuestionsMapper;

import lombok.AllArgsConstructor;

@Primary
@Service
@AllArgsConstructor
public class QNAQuestionsServiceImpl implements QNAQuestionsService{

	private QNAQuestionsMapper qnaQuestionsMapper;
	
	//게시물 등록 
	@Override
	public long registerQNAQuestion(QnaBoardsVO qnaBoards) {
		
		qnaQuestionsMapper.insertMyQNASelectKey(qnaBoards);
		
		System.out.println("QNA Q등록 게시물 번호: "+qnaBoards.getQnaQno());
		
		return qnaBoards.getQnaQno();
	};
	
	//게시물 리스트:페이징고려
	@Override
	public List<QnaBoardsVO> getQNAQList(QNAQuestionPagingDTO qnaQuestionPagingDTO){
		return qnaQuestionsMapper.selectQnaQTitle(qnaQuestionPagingDTO);
	}
	//게시물 총 개수 조회 서비스 :페이징 필요
	@Override
	public long getRowAmountTotal(QNAQuestionPagingDTO qnaQuestionPagingDTO) {
		return qnaQuestionsMapper.selectRowAmountTotal(qnaQuestionPagingDTO);
	}
	
	//게시물 조회
	@Override
	public QnaBoardsVO getQNAContent(Long qnaQno) {
		qnaQuestionsMapper.selectQnaQcontent(qnaQno);
		return qnaQuestionsMapper.selectQnaQcontent(qnaQno);
	}
	
	//게시물 수정화면
	/*
	 * @Override public QnaBoardsVO getQNADetailModify(long qnaQno) { return
	 * qnaQuestionsMapper.selectQnaQcontent(qnaQno); }
	 */
	
	//게시물 수정
	@Override
	public boolean modifyQNAContent(QnaBoardsVO qnaBoards) {
		return qnaQuestionsMapper.updateQnaQContent(qnaBoards)==1;
	}
	
	//게시물 답변 요청
	@Override
	public boolean setQNADeleted(Long qnaQno) {
		return qnaQuestionsMapper.updateQnaFlag(qnaQno)==1;
	}
	


	
	
	
	
	
	
	
	
	
}
