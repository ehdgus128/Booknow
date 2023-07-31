package com.booknow.travelapp.service;

import java.util.List;

import com.booknow.travelapp.common.paging.FAQBoardPagingDTO;
import com.booknow.travelapp.domain.FaqBoardsVO;

public interface FAQBoardService {

	//FAQ게시글 목록조회
	public List<FaqBoardsVO> getFaqBoardList(FAQBoardPagingDTO faqBoardPagingDTO);
	
	//게시물 총 개수 조회_ 페이징 시 필요
	public long getRowAmountTotal(FAQBoardPagingDTO myBoardPagingDTO);
	
	//FAQ 게시물 등록(관리자) - selectKey 이용
	 public long registerFAQBoard(FaqBoardsVO FaqBoard);
	 
	 //FAQ  게시물 조회
	 public FaqBoardsVO getFAQBoard(Long faqNo);

	  //FAQ 게시물 삭제(관리자)
	  public boolean deletedFAQBoards(long faqNo);
	 
	 //FAQ 게시물 수정(관리자)
	 public boolean modifyFAQBoards(FaqBoardsVO FaqBoard);

	 //FAQ 게시물 조회수 증가
	 public void FaqLikeCnt(int faqLike);
}
