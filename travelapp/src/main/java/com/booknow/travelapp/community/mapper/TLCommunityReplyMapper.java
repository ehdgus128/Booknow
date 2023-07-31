package com.booknow.travelapp.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.community.domain.TLCommunityReplyVO;

//작업자: 정지은
public interface TLCommunityReplyMapper {
	
	//댓글 목록 조회 
	List<TLCommunityReplyVO> selectReplyList(@Param("tvcBno")Long tvcBno,RowBounds rowBounds);
	
	//댓글총수
	int selectRowTotal(@Param("tvcBno")Long tvcBno);
	
	//댓글 등록
	int insertReplyForBoard(TLCommunityReplyVO replyVO);
	
	//답글 등록
	int commentForReply(TLCommunityReplyVO replyVO);
	
	//댓글수정 
	int updateReply(TLCommunityReplyVO replyVO);
	
	//댓글 삭제 요청
	int updateRdelFlag(@Param("tvcRno")Long tvcRno);
}
