package com.booknow.travelapp.service;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.paging.QNAAnswerPagingCreatorDTO;
import com.booknow.travelapp.common.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.domain.QnaBoardsVO;
import com.booknow.travelapp.mapper.QNAQuestionsMapper;

import lombok.AllArgsConstructor;

@Primary
@Service
@AllArgsConstructor
public class QNAAnswerServiceImpl implements QNAAnswerService {

	private QNAQuestionsMapper qnaQuestionMapper;

	@Override
	public QNAAnswerPagingCreatorDTO getQNAAnswerListByQno(QNAAnswerPagingDTO qnaAnswerPaging) {
		
		QNAAnswerPagingCreatorDTO qnaAnswerPagingCreator =
				new QNAAnswerPagingCreatorDTO(
						qnaQuestionMapper.selectQnaAnswerTotal(qnaAnswerPaging),
						qnaAnswerPaging,
						qnaQuestionMapper.selectQnaAnswerlist(qnaAnswerPaging));
		
		return qnaAnswerPagingCreator;
	}

	@Override
	public long getAnswerTotalbyQno(QNAAnswerPagingDTO qnaAnswerPaging) {
		
		return qnaQuestionMapper.selectQnaAnswerTotal(qnaAnswerPaging);
	}

	@Override
	public QnaBoardsVO getAnswer(Long qnaQno) {
		QnaBoardsVO qnaBoards = qnaQuestionMapper.selectQNAAnswer(qnaQno);
		return qnaBoards;
	}
	
	
}
