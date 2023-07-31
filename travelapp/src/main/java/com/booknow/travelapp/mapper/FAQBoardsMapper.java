package com.booknow.travelapp.mapper;

import java.util.List;

import com.booknow.travelapp.common.paging.FAQBoardPagingDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;

public interface FAQBoardsMapper {
	
	//FAQ게시글 목록조회
	public List<FaqBoardsVO> selectFaqBoardList(FAQBoardPagingDTO faqBoardPagingDTO);
	
	//FAQ게시물 총 개수 조회(페이징)
	public long selectRowAmountTotal(FAQBoardPagingDTO faqBoardPagingDTO);
	
	//FAQ 게시물 등록(관리자) - selectKey 이용
	 public long insertFaqBoardSelectKey(FaqBoardsVO FaqBoard);
	 
	 //FAQ 카테고리 게시물 조회
	 public FaqBoardsVO selectFaqBoard(Long faqNo);

	  //FAQ 게시물 삭제(관리자)
	  public int deleteFaqboards(long faqNo);
	 
	 //FAQ 게시물 수정(관리자)
	 public long updateFaqboards(FaqBoardsVO FaqBoard);

	 //FAQ 게시물 조회수 증가
	 public void FaqLikeCnt(Long faqLike);
	
	
}
