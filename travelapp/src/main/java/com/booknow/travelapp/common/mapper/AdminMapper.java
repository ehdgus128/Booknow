package com.booknow.travelapp.common.mapper;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminManagerBoardVO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingDTO;

public interface AdminMapper {

    // 공지사항 목록
    public List<AdminManagerBoardVO> selectManagerBoardList(AmBoardPagingDTO amBoardPaging);

    // 공지사항 조회
    public AdminManagerBoardVO selectManagerBoard(Long tmBno);

    // 공지사항 수정
    public Long updateManagerBoard(AdminManagerBoardVO managerBoard);

    // 공지사항 삭제 요청
    public Long updateManagerBoardDelFlag(Long tmBno);

    // 삭제 요청 받은 공지사항 삭제
    public Long deleteManagerBoardDelFlagAll();

    // 공지사항 등록
    public Long insertManagerBoard(AdminManagerBoardVO managerBoard);

    // 페이징 처리를 위한 게시글 총수
    public Long selectRowTotal();

}// AdminMapper end
