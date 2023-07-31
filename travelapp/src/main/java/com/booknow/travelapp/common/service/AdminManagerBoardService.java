package com.booknow.travelapp.common.service;

import java.util.List;

import com.booknow.travelapp.common.domain.AdminManagerBoardVO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingDTO;

public interface AdminManagerBoardService {

    // 공지사항 목록
    public List<AdminManagerBoardVO> getManagerBoardList(AmBoardPagingDTO amBoardPaging);

    // 공지사항 조회
    public AdminManagerBoardVO getManagerBoard(Long tmBno);

    // 공지사항 수정
    public boolean modifyManagerBoard(AdminManagerBoardVO managerBoard);

    // 공지사항 삭제 요청
    public boolean modifyManagerBoardDelFlag(Long tmBno);

    // 삭제 요청 받은 공지사항 삭제
    public boolean removeManagerBoardDelFlagAll();

    // 공지사항 등록
    public Long registerManagerBoard(AdminManagerBoardVO managerBoard);

    // 페이징 처리를 위한 게시글 총수
    public Long getRowTotal();

} // AdminManagerBoardService end
