package com.booknow.travelapp.airways.mapper;

import java.util.List;

import com.booknow.travelapp.airways.common.paging.domain.AirlineRevPagingDTO;
import com.booknow.travelapp.airways.domain.AirLineRevVO;

public interface AirLineRevMapper {

    // 목록조회 
    public List<AirLineRevVO> selectAirRevList(AirlineRevPagingDTO airlineRevPagingDTO);

    // 목록 조회 토탈
    public long selectRowTotal(AirlineRevPagingDTO airlineRevPagingDTO);

    // 게시물 등록
    public void insertAirlineRev(AirLineRevVO airLineRevVO);

    // 리뷰 게시글 삭제
    public long  deleteAirLineRev(long airLineRevno);

    // 리뷰 게시글 신고
    public long reportAirLineRev(long airlineRevno);

    // 리뷰 게시글 수정
    public int modifyAirLineRev(AirLineRevVO airLineRevVO);

    // 총 후기 수
    public String selectAirLineCount(String airlineId);

    // 리뷰 추천 +1
    public long updateMyLike(long airLineRevno);
    
    // 리뷰 한개  조회
    public AirLineRevVO selectOneRev(long airLineRevno);
    
    // 평균 별점
    public double averageStar(String airlineId);
}
