package com.booknow.travelapp.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.community.domain.TLCommunityBoardVO;
import com.booknow.travelapp.community.domain.TLCommunityCateVO;
  
//23070411:36 작업자 정지은 커뮤니티 mapper 인터페이스 
public interface TLCommunityMapper {
	
	//카테고리 화면
	List<TLCommunityCateVO> selectCateList();
	
	//커뮤니티 게시판 리스트
	List<TLCommunityBoardVO> selectCommuList(@Param("tvcCatId")Long tvcCatId,RowBounds rowBounds); 
	
	//게시글 총수 
	int selectRowTotal(@Param("tvcCatId")Long tvcCatId);
	
	//글등록
	int insertBoard(TLCommunityBoardVO tlCommunityBoardVO);
	
	//글 수정처리 
	int updateCommuBoard(TLCommunityBoardVO tlCommunityBoardVO);
	
	//커뮤니티 상세페이지 화면 
	TLCommunityBoardVO selectCommuDetail(@Param("tvcCatId")Long tvcCatId,@Param("tvcBno")Long tvcBno);

	//삭제 요청처리 
	int updateBdelFlag(@Param("tvcBno")Long tvcBno,@Param("tvcCatId")Long tvcCatId);

	//조회수 증가 처리 
	int updateViewsCnt(@Param("tvcBno")Long tvcbno);
}
