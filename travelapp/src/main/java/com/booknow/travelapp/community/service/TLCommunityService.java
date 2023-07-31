package com.booknow.travelapp.community.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.booknow.travelapp.community.domain.TLCommunityBoardVO;
import com.booknow.travelapp.community.domain.TLCommunityCateVO;
import com.booknow.travelapp.community.domain.common.TLCommunityPagingDTO;

//2307041017  작업자: 정지은 커뮤니티 서비스 인터페이스
public interface TLCommunityService {
	 
	//파일저장
	String saveUploadFile(MultipartFile upload_file);
	//카테고리  
	List<TLCommunityCateVO> getCommuCateList();
	//게시판 리스트 
	List<TLCommunityBoardVO> getCommuBoardList(Long  tvcCatId,int pageNum);

	//main home 게시판 리스트 
	List<TLCommunityBoardVO> getCommuBoardListMain(Long tvcCatId,int pageNum);

	//게시글 총수(카테고리 반영)
	TLCommunityPagingDTO getTotalRowAmount(Long tvcCatId,int currentPage);
	//게시글 등록
	long registerBoard(TLCommunityBoardVO communityBoard);
	//게시글 수정 
	boolean modifyBoard(TLCommunityBoardVO communityBoard);
	//상세페이지
	TLCommunityBoardVO getCommuBoardDetail(Long tvcCatId,Long tvcBno);
	//삭제 요청처리 
	boolean updateBdelFlag(Long tvcBno,Long tvcCatId);
	
}
