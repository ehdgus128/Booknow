package com.booknow.travelapp.hotel.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.hotel.domain.HtResTimeDTO;
import com.booknow.travelapp.hotel.domain.HtReservationVO;
import com.booknow.travelapp.hotel.domain.HtRoomSellDateVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
import com.booknow.travelapp.hotel.domain.HtSellTransVO;

// 작업자: 김영환 일시: 2306261728
// mapper inteface
public interface HtReservationsMapper {

    // 호텔 정보
    public void selectHotel(Long htNo);

    // 방과 호텔 정보 
    public HtRoomVO selectRoomJoinHotel(Long htRooNo); // 추가 작업자 김영환 2306271207

    // 2306301940 김영환 예약가능한 방의 예약일자
    public List<HtRoomSellDateVO> selectHtRoomSellDateResAble(Long htRooNo);

    // 2307021817 김영환 예약테이블 관련 추가
    // 예약목록 리스트
    public List<HtReservationVO> selectReservationList();
    
    // 예약 조회
    public HtReservationVO selectReservation(Long htResNo);

    // 유저 정보 읽어오기
    public TLUsers selectUserData(String userId);

    // 선택한 기간에 대한 유저 입장 구매 총액 (김영환 추가 2307061219)
    public HtRoomSellDateVO selectResTotalPrice(HtResTimeDTO htResTime);

    // 예약 입력
    public Long insertReservation(HtResTimeDTO htResTime);

    // 판매 테이블 입력
    public Long insertSellTrans(HtSellTransVO htSellTrans);

    // 방의 sell date의 null을 체크해서 예약이 가능한지 체크
    public Integer selectResAbleCheck(HtResTimeDTO htResTime);

    // 방에 예약을 완료했음을 업데이트
    public Long updateResConfirmSellDate(HtResTimeDTO htResTime);

    // 판매 완료 했음을 판매 테이블에서 업데이트
    public Long updateResConfirmSellTran(HtResTimeDTO htResTime);

    // 예약 테이블에 판매 테이블과 연결
    public Long updateResConfirmRes(HtResTimeDTO htResTime);

    // 결제 취소 결제 상세 업데이트
    public Long updateResCancelSellTran(String sellId);

    // 결제 취소 예약 업데이트
    public Long updateResCancelRes(String sellId);

    // 결제 취소 방일자 업데이트
    public Long updateResCancelSellDate(String sellId);

    // 나의 호텔 예약 리스트 기능 추가 김영환
    // 결제 리스트
    public List<HtSellTransVO> selectUserHtResList(String userId, RowBounds rowBounds);

    // 결제 리스트 페이징을 위한 총수
    public int selectUserHtResListCount(String userId);

    // 예약 상세
    public HtReservationVO selectHtResDetail(Long htResNo);

    // 예약 번호로 방과 호텔 정보 검색
    public HtRoomVO selectResNoSearchHotelRoom(Long htResNo);

    // 예약 상세 판매 추가
    public HtReservationVO selectResNoSearchsellRes (Long htResNo);

} // HtReservationsMapper end
