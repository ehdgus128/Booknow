package com.booknow.travelapp.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booknow.travelapp.common.domain.QNAAnswerQuestionsVO;
import com.booknow.travelapp.common.domain.paging.QNAAnswerPagingDTO;
import com.booknow.travelapp.common.mapper.QNAAnswerMapper;

@Primary
@Service
public class QNAnswerServiceImpl implements QNAnswerService{
    
    private QNAAnswerMapper QNAAnswerMapper ;
   
    public QNAnswerServiceImpl(QNAAnswerMapper QNAAnswerMapper  ) {
		this.QNAAnswerMapper = QNAAnswerMapper ;
	}
    
    
    @Override
    public List<QNAAnswerQuestionsVO> getQNAAnswerList(QNAAnswerPagingDTO pagingDTO) {
        return QNAAnswerMapper.selectQNAAnswerList(pagingDTO );
    }
    
    @Override
    public List<QNAAnswerQuestionsVO> selectDetail (QNAAnswerPagingDTO pagingDTO) {
    	return QNAAnswerMapper.selectDetail(pagingDTO);
    }

    @Override
    public long getRowTotal(QNAAnswerPagingDTO pagingDTO) {
        return QNAAnswerMapper.selectRowTotal(pagingDTO);
    }
    @Override
    public long selectRowTotalDetail(QNAAnswerPagingDTO pagingDTO) {
    	return QNAAnswerMapper.selectRowTotalDetail(pagingDTO);
    }
    
    @Transactional
	@Override
	public long updateQnaQprocFlag(long qnaQno) {
		
		long cnt = QNAAnswerMapper.updateQnaQprocFlag (qnaQno);
		return cnt++;
	}

	@Transactional
    @Override
    public long registerQNAAnswer(QNAAnswerQuestionsVO answerVO) {
    	QNAAnswerMapper.insertQNAanswer(answerVO);
    	
		return answerVO.getQnaAno();
    }
    

	@Transactional
    @Override
    public int updateQNAAnswer(QNAAnswerQuestionsVO answerVO) {
		Integer modCnt = QNAAnswerMapper.updateQNAanswer(answerVO);
		return modCnt;
    }
    
	
    @Override
    public long getRowTotalDifference() {
        return  QNAAnswerMapper.rowTotalDifference(); 
    }
    
    
//     둘다 삭제
    @Transactional
	 @Override
	    public long  deleteQnaAnswer(long qnaQno) {
	        return QNAAnswerMapper.deleteQnaAnswer(qnaQno);
	    }
    @Transactional
	 @Override
	    public long  deleteQnaQuestion(long qnaQno) {
	        return QNAAnswerMapper.deleteQnaQuestion(qnaQno);
	    }
    
    @Override
    public Map<String, Long> getQnaCategoryCounts() {
        return QNAAnswerMapper.selectQnaCategoryCounts();
    }

    
    
    }

