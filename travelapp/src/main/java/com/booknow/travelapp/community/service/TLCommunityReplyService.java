package com.booknow.travelapp.community.service;

import java.util.List;

import com.booknow.travelapp.community.domain.TLCommunityReplyVO;
import com.booknow.travelapp.community.domain.common.TLCommunityReplyPagingDTO;

//댓글 서비스 
public interface TLCommunityReplyService {
 
	//댓글 리스트 조회
	List<TLCommunityReplyVO> getReplyList(Long tvcBno,int pageNum);
	
	//댓글총수 
	TLCommunityReplyPagingDTO getTotalRowAmount(Long tvcBno,int currentPage);
	
	//댓글 등록 
	boolean registerReply(TLCommunityReplyVO replyVO);
	
	//답글 등록
	boolean registerCommentForReply(TLCommunityReplyVO replyVO);
	
	//댓글 수정 
	boolean modifyReply(TLCommunityReplyVO replyVO);
	
	//댓글 삭제요청
	boolean updateRdelFlag(Long tvcRno);
}
