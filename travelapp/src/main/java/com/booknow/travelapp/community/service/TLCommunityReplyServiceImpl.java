package com.booknow.travelapp.community.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.community.domain.TLCommunityReplyVO;
import com.booknow.travelapp.community.domain.common.TLCommunityReplyPagingDTO;
import com.booknow.travelapp.community.mapper.TLCommunityReplyMapper;

@Service
@Primary
public class TLCommunityReplyServiceImpl implements TLCommunityReplyService {
	
	//페이지당 보여지는 레코드의 갯수 
	private static final int ROW_AMOUNT_PER_PAGE = 5;
	//화면 하단에 표시할 기본 페이지 번호 개수 
	private static final int PAGING_NUM_CNT = 3;
	
	
	private TLCommunityReplyMapper communityMapper;
	
	public TLCommunityReplyServiceImpl(TLCommunityReplyMapper communityMapper) {
		this.communityMapper = communityMapper;
	} 

	//댓글리스트 조회 
	@Override
	public List<TLCommunityReplyVO> getReplyList(Long tvcBno,int pageNum) {
		
		int start = (pageNum-1)*ROW_AMOUNT_PER_PAGE;
		RowBounds rowBounds = new RowBounds(start,ROW_AMOUNT_PER_PAGE);
		
		return communityMapper.selectReplyList(tvcBno,rowBounds);
	}
	
	//댓글총수
	@Override
	public TLCommunityReplyPagingDTO getTotalRowAmount(Long tvcBno,int currentPage) {
		
		int replyCnt = communityMapper.selectRowTotal(tvcBno);
		TLCommunityReplyPagingDTO pageBean = new TLCommunityReplyPagingDTO(replyCnt, currentPage, ROW_AMOUNT_PER_PAGE, PAGING_NUM_CNT);
		return pageBean;
	}
	

	//댓글등록
	@Override
	public boolean registerReply(TLCommunityReplyVO replyVO) {
		return communityMapper.insertReplyForBoard(replyVO)==1;
	}
	
	//답글등록 
	@Override
	public boolean registerCommentForReply(TLCommunityReplyVO replyVO) {
		return communityMapper.commentForReply(replyVO)==1;
	}
	
	//댓글수정
	@Override
	public boolean modifyReply(TLCommunityReplyVO replyVO) {
		return communityMapper.updateReply(replyVO)==1;
	}

	//댓글삭재요청
	@Override
	public boolean updateRdelFlag(Long tvcRno) {
		return communityMapper.updateRdelFlag(tvcRno)==1;
	}

}
