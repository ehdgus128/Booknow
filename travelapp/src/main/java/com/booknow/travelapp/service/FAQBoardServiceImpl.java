package com.booknow.travelapp.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.paging.FAQBoardPagingDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;
import com.booknow.travelapp.mapper.FAQBoardsMapper;

import lombok.AllArgsConstructor;

@Primary
@Service
@AllArgsConstructor
public class FAQBoardServiceImpl implements FAQBoardService{
	
	private FAQBoardsMapper faqBoardsMapper;
	
	//목록 조희 서비스
	@Override
	public List<FaqBoardsVO> getFaqBoardList(FAQBoardPagingDTO faqBoardPagingDTO) {
		
		return faqBoardsMapper.selectFaqBoardList(faqBoardPagingDTO);
	}
	
	//게시물 총 개수 조회_ 페이징 시 필요
	@Override
	public long getRowAmountTotal(FAQBoardPagingDTO faqBoardPagingDTO) {
		return faqBoardsMapper.selectRowAmountTotal(faqBoardPagingDTO);
	}
	
	//게시물 등록 :selectKey이용
	@Override
	public long registerFAQBoard(FaqBoardsVO FaqBoard) {
		faqBoardsMapper.insertFaqBoardSelectKey(FaqBoard);
		return FaqBoard.getFaqNo();
	}

	//게시글 조회
	@Override
	public FaqBoardsVO getFAQBoard(Long faqNo) {
		
		return faqBoardsMapper.selectFaqBoard(faqNo);
	}


	//게시물 삭제
	@Override
	public boolean deletedFAQBoards(long faqNo) {
		
		return faqBoardsMapper.deleteFaqboards(faqNo)==1;
	}
	
	//게시물 수정
	@Override
	public boolean modifyFAQBoards(FaqBoardsVO FaqBoard) {
		
		return faqBoardsMapper.updateFaqboards(FaqBoard)==1;
	}

	@Override
	public void FaqLikeCnt(int faqLike) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
