package com.booknow.travelapp.community.service;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.booknow.travelapp.community.domain.TLCommunityBoardVO;
import com.booknow.travelapp.community.domain.TLCommunityCateVO;
import com.booknow.travelapp.community.domain.common.TLCommunityPagingDTO;
import com.booknow.travelapp.community.mapper.TLCommunityMapper;

//2307041017  작업자: 정지은 커뮤니티 서비스 인터페이스 구현 
@Service
@Primary
public class TLCommunityServiceImpl implements TLCommunityService {
 
	//페이지당 보여지는 레코드의 갯수 
	private static final int ROW_AMOUNT_PER_PAGE = 10;
	// 메인에 보여줄 갯수
	private static final int rowAmountPerPageMain = 5;
	
	// 화면 하단에 표시할 기본 페이지 번호 개수 (10개)
	private static final int PAGING_NUM_CNT = 10; 
	//파일 로컬저장 경로 
	private static final String PATH_UPLOAD="C:/myupload/commu";
	
	
	private TLCommunityMapper tlCommunityMapper;
	
	public TLCommunityServiceImpl(TLCommunityMapper tlCommunityMapper) {
		this.tlCommunityMapper = tlCommunityMapper;
	}


	//카테고리 보여주기 
	@Override
	public List<TLCommunityCateVO> getCommuCateList() {
		return tlCommunityMapper.selectCateList();
	}

	//게시판리스트 보여주기 
	@Override
	public List<TLCommunityBoardVO> getCommuBoardList(Long tvcCatId,int pageNum) {
		
		int start=(pageNum-1)*ROW_AMOUNT_PER_PAGE;	
		RowBounds rowBounds = new RowBounds(start,ROW_AMOUNT_PER_PAGE);
		
		return tlCommunityMapper.selectCommuList(tvcCatId,rowBounds);
	}

	
	//메인화면 화면의 게시판리스트 
	@Override
	public List<TLCommunityBoardVO> getCommuBoardListMain(Long tvcCatId, int pageNum) {
		int start=(pageNum-1)*rowAmountPerPageMain;	
		RowBounds rowBounds = new RowBounds(start,rowAmountPerPageMain);
		
		return tlCommunityMapper.selectCommuList(tvcCatId,rowBounds);
	}


	//게시글 총수 
	@Override
	public TLCommunityPagingDTO getTotalRowAmount(Long tvcCatId,int currentPage) {
		 int contentCnt = tlCommunityMapper.selectRowTotal(tvcCatId);
		 TLCommunityPagingDTO pageBean = new TLCommunityPagingDTO(contentCnt, currentPage, ROW_AMOUNT_PER_PAGE, PAGING_NUM_CNT);
		return pageBean;
	}
	
	
	//파일저장 
	@Override
	public String saveUploadFile(MultipartFile upload_file) {	
		String file_name = System.currentTimeMillis()+"_"+upload_file.getOriginalFilename();
			
		try {
			upload_file.transferTo(new File(PATH_UPLOAD + "/" + file_name));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return file_name;
	}
	
	//게시글 등록
	@Override
	public long registerBoard(TLCommunityBoardVO communityBoard) {
		
		MultipartFile upload_file = communityBoard.getUpload_file();
			
		if(upload_file.getSize()>0) {
			String file_name = saveUploadFile(upload_file);
			communityBoard.setBoardFile(file_name);
		}
		
		return tlCommunityMapper.insertBoard(communityBoard);
	}
	
	//게시글 수정 
	@Override
	public boolean modifyBoard(TLCommunityBoardVO communityBoard) {
		
		MultipartFile upload_file = communityBoard.getUpload_file();
		
		if(upload_file.getSize()>0) {
			String file_name = saveUploadFile(upload_file);
			communityBoard.setBoardFile(file_name);
		}
		
		return (tlCommunityMapper.updateCommuBoard(communityBoard)==1);
	}

	//상세페이지 화면 
	@Transactional
	@Override
	public TLCommunityBoardVO getCommuBoardDetail(Long tvcCatId,Long tvcBno) {

		tlCommunityMapper.updateViewsCnt(tvcBno);
		return tlCommunityMapper.selectCommuDetail(tvcCatId,tvcBno);
	}

	//삭제 요청처리 
	@Override
	public boolean updateBdelFlag(Long tvcBno, Long tvcCatId) {
		return (tlCommunityMapper.updateBdelFlag(tvcBno, tvcCatId) == 1);
	}



	

}
