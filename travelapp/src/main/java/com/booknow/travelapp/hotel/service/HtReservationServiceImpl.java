package com.booknow.travelapp.hotel.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booknow.travelapp.common.domain.TLUsers;
import com.booknow.travelapp.common.payment.payapi.PayRestApi;
import com.booknow.travelapp.hotel.common.TLHotelListPageDTO;
import com.booknow.travelapp.hotel.domain.HtResTimeDTO;
import com.booknow.travelapp.hotel.domain.HtReservationVO;
import com.booknow.travelapp.hotel.domain.HtRoomSellDateVO;
import com.booknow.travelapp.hotel.domain.HtRoomVO;
import com.booknow.travelapp.hotel.domain.HtSellTransVO;
import com.booknow.travelapp.hotel.mapper.HtReservationsMapper;
import com.fasterxml.jackson.databind.JsonNode;

import lombok.AllArgsConstructor;

// hotel service Impl

@Primary
@Service
@AllArgsConstructor
public class HtReservationServiceImpl implements HtReservationService{
    
    //페이지당 보여지는 레코드의 갯수 
	private static final int ROW_AMOUNT_PER_PAGE = 5;
	//화면 하단의 페이지 최소 페이지 번호 갯수 
	private static final int PAGING_NUM_CNT = 3;

    // 작업자 김영환 2306271208
    private HtReservationsMapper htReservationsMapper;
    private PayRestApi payRestApi;
    
    @Override
    public HtRoomVO getTLRoomHotel(Long htRooNo) {
        System.out.println("[sys] service getTLRoomHotel htRooNo : "+htRooNo);
        return htReservationsMapper.selectRoomJoinHotel(htRooNo);
    } // getTLRoomHotel end

    @Override
    public List<HtRoomSellDateVO> getHtRoomSellDateResAble(Long htRooNo) {
        System.out.println("[sys] service getTLRoomHotel htRooNo : "+htRooNo);
        return htReservationsMapper.selectHtRoomSellDateResAble(htRooNo);
    } // getHtRoomSellDateResAble end

    @Override
    public TLUsers getUserData(String userId) {
        return htReservationsMapper.selectUserData(userId);
    }

	@Override
	public HtRoomSellDateVO getResTotalPrice(HtResTimeDTO htResTime) {
		return htReservationsMapper.selectResTotalPrice(htResTime);
	}

    // 결제 사전 등록
    @Override
    public HtResTimeDTO prePaymentProcess(HtResTimeDTO htResTime) {

        String token = payRestApi.getPortOneToken();

        Long amount = getResTotalPrice(htResTime).getHtSellPrice();
        
        htResTime.setAmount(amount);

        JsonNode root = payRestApi.registerPreAmount(amount.toString(), token);

        HtSellTransVO sellTrans = new HtSellTransVO();

        String sellId = null;

        try {
            sellId = root.get("response").get("merchant_uid").asText();
            htResTime.setSellId(sellId);
            // 호텔 번호 
            sellTrans.setHtNo(htResTime.getHtNo());

            sellTrans.setHtSellTranPayment("카드");

            sellTrans.setSellUuid(sellId);
            sellTrans.setHtSellPrice(Long.valueOf(root.get("response").get("amount").asText()));
        } catch (Exception e) {
            System.out.println("[sys] str number parse error : "+e.getMessage());
        }// try catch end
        
        // 결제 후 검증을 위해 임시로 db insert
        htReservationsMapper.insertSellTrans(sellTrans);

        // 결제 후 검증을 위해 임시로 db insert
        htReservationsMapper.insertReservation(htResTime);
        
        return htResTime;
    }//prePaymentProcess end

    // 결제 완료 
    @Transactional
    @Override
    public boolean paymentSuccessProcess(HtResTimeDTO htResTime) {

        Integer resAble = htReservationsMapper.selectResAbleCheck(htResTime);

        if(resAble == null || resAble < 0) {
            // 결제 취소 api 추가
            payRestApi.cancelPaymentOne(htResTime.getSellId(), payRestApi.getPortOneToken());
            return false;
        } // if end

        htReservationsMapper.updateResConfirmSellDate(htResTime);
        htReservationsMapper.updateResConfirmSellTran(htResTime);
        htReservationsMapper.updateResConfirmRes(htResTime);
        
        return true;
    }// end

    // 결제 취소
    @Transactional
    @Override
    public boolean payCancelProcess(String sellId) {

        JsonNode root = payRestApi.cancelPaymentOne(sellId, payRestApi.getPortOneToken());
        if (root.get("response").asText().equals("null")) {
            //return false;
        }

        htReservationsMapper.updateResCancelSellTran(sellId);
        htReservationsMapper.updateResCancelRes(sellId);
        htReservationsMapper.updateResCancelSellDate(sellId);
        return true;
    }// payCancelProcess end

    @Override
    public List<HtSellTransVO> getUserHtResList(String userId, int currentPage) {
		//1 -> 0*10 = 0 인덱스부터 
		//2 -> 1*10 = 10 인덱스부터 
		int start = (currentPage-1)*ROW_AMOUNT_PER_PAGE;
		
		//인덱스 0번부터 3개 , 두번째 인자값이 페이지당 보여줄 레코드 개수 
		RowBounds rowBounds = new RowBounds(start,ROW_AMOUNT_PER_PAGE);
               
        return htReservationsMapper.selectUserHtResList(userId, rowBounds);
    }

    @Override
    public TLHotelListPageDTO getUserHtResListCount(String userId, int currentPage) {
        int rowAmountTotal = htReservationsMapper.selectUserHtResListCount(userId);
        TLHotelListPageDTO pageDTO = new TLHotelListPageDTO(rowAmountTotal,currentPage,ROW_AMOUNT_PER_PAGE, PAGING_NUM_CNT);
        return pageDTO;
    }

    @Override
    public HtReservationVO getHtResDetail(Long htResNo) {
        return htReservationsMapper.selectResNoSearchsellRes(htResNo);
    }

    @Override
    public HtRoomVO getResNoSearchHotelRoom(Long htResNo) {
        return htReservationsMapper.selectResNoSearchHotelRoom(htResNo);
    }

} // HtReservationServiceImpl end
