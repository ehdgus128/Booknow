package com.booknow.travelapp.common.service;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.booknow.travelapp.common.domain.TLHotelVO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelBuyPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdHotelPagingDTO;
import com.booknow.travelapp.common.domain.paging.TLAdRoomPagingDTO;
import com.booknow.travelapp.common.domain.TLHotelBusinessVO;
import com.booknow.travelapp.common.domain.TLHotelBuyTranVO;
import com.booknow.travelapp.common.domain.TLHotelRoomVO;
import com.booknow.travelapp.common.domain.TLHotelSellDateVO;
import com.booknow.travelapp.common.domain.TLHotelTotalDTO;
import com.booknow.travelapp.common.mapper.TLHotelBuyMapper;

//작업자 정지은  호텔등록 서비스 230711
@Primary 
@Service
public class TLHotelServiceImpl implements TLHotelService{
	
	//호텔 페이징처리 
	//페이지당 보여지는 레코드 갯수 
	private static final int rowAmountPerPage = 6;
	//화면 하단에 표시할 기본 페이지 번호 개수 
	private static final int pageNumCnt = 5;
	
	//방페이지 
	//방 페이징처리
	private static final int roomRowAmountPerPage = 3;
	//방 화면 하단에 페이지 번호 표시
	private static final int roomPageNumCnt = 3;
	
	
	//구매내역 페이징처리 
	private static final int dateRowAmountPerPage = 3;
	private static final int datePageNumCnt = 3;
	
	private TLHotelBuyMapper hotelBuyMapper;
	
	public TLHotelServiceImpl(TLHotelBuyMapper hotelBuyMapper) {
		this.hotelBuyMapper = hotelBuyMapper;
	} 

	
	/*                 호텔파트                 */
//create	
	//사업자번호 중복체크 
	@Override
	public String checkBusRegNumExists(String busRegNum) {
		return hotelBuyMapper.checkBusRegNumExists(busRegNum);
	}

	
	//호텔등록
	@Transactional
	@Override
	public TLHotelTotalDTO registerHotelInfo(TLHotelTotalDTO hotel) {
		
		//사업자등록 
		TLHotelBusinessVO bus = new TLHotelBusinessVO();
		bus.setBusName(hotel.getBusName());
		bus.setBusRegNum(hotel.getBusRegNum());
		bus.setBusCertified(hotel.getBusCertified());
		hotelBuyMapper.insertBusinessUser(bus);	
		
		hotel.setBusId(bus.getBusId()); // busId 등록
		
		//호텔등록
		TLHotelVO hotelVO = new TLHotelVO();
		hotelVO.setHtName(hotel.getHtName());
		hotelVO.setHtRank(hotel.getHtRank());
		hotelVO.setHtAddress(hotel.getHtAddress());
		hotelVO.setHtAreaCode(hotel.getHtAreaCode());
		hotelVO.setHtType(hotel.getHtType());
		hotelVO.setHtPhone(hotel.getHtPhone());
		hotelVO.setHtEmail(hotel.getHtEmail());
		hotelVO.setBusId(3L);
		hotelVO.setBusRegNum(hotel.getBusRegNum());
		hotelVO.setHtStartDate(hotel.getHtStartDate());
		hotelVO.setHtEndDate(hotel.getHtEndDate());
		hotelBuyMapper.insertHotel(hotelVO);
		
		hotel.setHtNo(hotelVO.getHtNo());//htNo등록 
		
		
		TLHotelBuyTranVO tran = new TLHotelBuyTranVO();
		tran.setHtNo(hotelVO.getHtNo());
		tran.setHtBuyTranType(hotel.getHtBuyTranType());
		tran.setHtBuyCost(hotel.getHtBuyCost());
		hotelBuyMapper.insertBuyTran(tran);		
		hotel.setHtBuyTranId(tran.getHtBuyTranId());
		
		return hotel;
	}
	
	
//read 
	
//메인화면 조회
	//화면처리용 호텔리스트 조회 
	@Override
	public List<TLHotelVO> showHotelList(int pageNum) {
		
		int start = (pageNum-1)*rowAmountPerPage;
		RowBounds rowBounds = new RowBounds(start,rowAmountPerPage);
		
		return hotelBuyMapper.selectHotelByName(rowBounds);
	}
	
	//화면 처리용 호텔 총수 
	@Override
	public TLAdHotelPagingDTO getTotalRowAmount(int currentPage) {
		int rowTotal = hotelBuyMapper.selectHotelTotal();
		TLAdHotelPagingDTO pageBean = new TLAdHotelPagingDTO(rowTotal, currentPage, rowAmountPerPage, pageNumCnt);
		return pageBean;
	}

	
	
	//상세페이지 
	@Override
	public TLHotelTotalDTO showHotelDetail(TLHotelTotalDTO hotelDTO) {
		
		//사업자상세조회 
		Long busId = hotelDTO.getBusId();
		System.out.println("busId:" + busId);
		TLHotelBusinessVO busVO = hotelBuyMapper.selectBusInfo(busId);
		hotelDTO.setBusId(busVO.getBusId());
		hotelDTO.setBusName(busVO.getBusName());
		hotelDTO.setBusRegNum(busVO.getBusRegNum());
		hotelDTO.setBusCertified(busVO.getBusCertified());			
				
		//호텔상세조회	
		Long htNo = hotelDTO.getHtNo();
		TLHotelVO hotelVO= hotelBuyMapper.selectHotelInfo(busId);
		hotelDTO.setHtNo(hotelVO.getHtNo());
		hotelDTO.setHtName(hotelVO.getHtName());
		hotelDTO.setHtRank(hotelVO.getHtRank());
		hotelDTO.setHtAddress(hotelVO.getHtAddress());
		hotelDTO.setHtAreaCode(hotelVO.getHtAreaCode());
		hotelDTO.setHtType(hotelVO.getHtType());
		hotelDTO.setHtPhone(hotelVO.getHtPhone());
		hotelDTO.setHtEmail(hotelVO.getHtEmail());
		hotelDTO.setHtStartDate(hotelVO.getHtStartDate());
		hotelDTO.setHtEndDate(hotelVO.getHtEndDate());
	
		//거래상세조회 
		TLHotelBuyTranVO tranVO= hotelBuyMapper.selectTranInfo(htNo);
		hotelDTO.setHtBuyTranId(tranVO.getHtBuyTranId());
		hotelDTO.setHtBuyTranDate(tranVO.getHtBuyTranDate());
		hotelDTO.setHtBuyTranType(tranVO.getHtBuyTranType());
		hotelDTO.setHtBuyCost(tranVO.getHtBuyCost());
		
		return hotelDTO;
	}
	
	
	//특정 사업자 한명 조회 
	@Override
	public TLHotelBusinessVO showBusDetail(Long busId) {
		return hotelBuyMapper.selectBusInfo(busId);
	}
		
	//특정 호텔 한개 조회 
	@Override
	public TLHotelVO showHotelDetail(Long busId) {
		return hotelBuyMapper.selectHotelInfo(busId);
	}

	//특정 거래내역 한개 조회 
	@Override
	public TLHotelBuyTranVO showTranDetail(Long htNo) {
		return hotelBuyMapper.selectTranInfo(htNo);
	}

//update
	
	//호텔정보 수정
	@Override
	public String updateHotelInfo(TLHotelTotalDTO hotelDTO) {		
		//사업자 수정  
		Long busId = hotelDTO.getBusId();
		TLHotelBusinessVO busVO = new TLHotelBusinessVO();
		busVO.setBusId(busId);
		busVO.setBusName(hotelDTO.getBusName());
		busVO.setBusRegNum(hotelDTO.getBusRegNum());
		busVO.setBusCertified(hotelDTO.getBusCertified());			
		int busResult = hotelBuyMapper.updateBusInfo(busVO);	
		
		//호텔 수정
		Long htNo = hotelDTO.getHtNo();
		TLHotelVO hotelVO = new TLHotelVO();
		hotelVO.setHtNo(htNo);
		hotelVO.setHtName(hotelDTO.getHtName());
		hotelVO.setHtRank(hotelDTO.getHtRank());
		hotelVO.setHtAddress(hotelDTO.getHtAddress());
		hotelVO.setHtAreaCode(hotelDTO.getHtAreaCode());
		hotelVO.setHtType(hotelDTO.getHtType());
		hotelVO.setHtPhone(hotelDTO.getHtPhone());
		hotelVO.setHtEmail(hotelDTO.getHtEmail());
		hotelVO.setHtStartDate(hotelDTO.getHtStartDate());
		hotelVO.setHtEndDate(hotelDTO.getHtEndDate());
		int hotelResult  = hotelBuyMapper.updateHotelInfo(hotelVO);
	
		//거래상세 수정
		TLHotelBuyTranVO buyVO = new TLHotelBuyTranVO();
		buyVO.setHtBuyTranId(hotelDTO.getHtBuyTranId());
		buyVO.setHtBuyTranDate(hotelDTO.getHtBuyTranDate());
		buyVO.setHtBuyTranType(hotelDTO.getHtBuyTranType());
		buyVO.setHtBuyCost(hotelDTO.getHtBuyCost());
		int buyResult =  hotelBuyMapper.updateTranInfo(buyVO);
		
		if( busResult>0 || hotelResult>0 || buyResult>0 ) {
			return "성공";
		}
		
		return "오류";
	}

	
	
//delete
	//delete cascade로 연결되있어서 사업자만 삭제하면 호텔, 방 다 삭제됨
	@Override
	public int removeBusUser(Long busId) {
		return hotelBuyMapper.deleteBusUser(busId);
	}

	/*                        방파트                    */
	

//read
	//특정호텔의 방조회 
	@Override
	public List<TLHotelRoomVO> showRoomList(Long htNo,int pageNum) {
		
		int startRoom = (pageNum - 1)*roomRowAmountPerPage;
		RowBounds rowBounds = new RowBounds(startRoom,roomRowAmountPerPage);
		
		return  hotelBuyMapper.selectRoomList(htNo,rowBounds);
	}
	
	
	//페이징 처리를 위한 방총수 
	@Override
	public TLAdRoomPagingDTO getTotalRoomRowAmount(Long htNo, int currentPage) {
		
		int contentCnt = hotelBuyMapper.selectRoomTotal(htNo);
		TLAdRoomPagingDTO roomPageBean = new TLAdRoomPagingDTO(contentCnt, currentPage, roomRowAmountPerPage, roomPageNumCnt);
		return roomPageBean;
	}

	
	//구매내역파트 

	//방구매내역조회 
	@Override
	public List<TLHotelSellDateVO> showRoomSellDate(Long htRooNo,int datePageNum) {
		
		int dateStart = (datePageNum - 1)*dateRowAmountPerPage;
		RowBounds rowBounds = new RowBounds(dateStart,dateRowAmountPerPage);
		
		return hotelBuyMapper.selectRoomSellDate(htRooNo,rowBounds);
	}

	
	//페이징처리를 위한 전체 판매개수 조회 
	@Override
	public TLAdHotelBuyPagingDTO getTotalSellAmount(Long htRooNo,int dateCurrentPage) {
		
		int dateCnt = hotelBuyMapper.selectSellDateTotal(htRooNo);
		TLAdHotelBuyPagingDTO datePageBean = new TLAdHotelBuyPagingDTO(dateCnt, dateCurrentPage, dateRowAmountPerPage, datePageNumCnt);
		
		return datePageBean;
	}
	
	//하나의 방조회 
	@Override
	public TLHotelRoomVO showRoomDetail(Long htRooNo) {
		return hotelBuyMapper.selectRoomByRooNo(htRooNo);
	}
	

//create
	
	//방,거래내역,맵핑테이블 등록
	@Override
	public boolean registerRoom(TLHotelRoomVO roomVO) {
		
		return hotelBuyMapper.insertRoom(roomVO)==1;
	}

	//방 거래내역만 등록 
	@Override
	public int registerRoomDate(TLHotelSellDateVO sell) {
		return	hotelBuyMapper.insertSellDate(sell);
	}

	//delete cascade로 연결되있어서 객실 삭제하면 모든 데이터가 삭제됨 
	@Override
	public int removeRoom(Long htRooNo) {
		return hotelBuyMapper.deleteAdRoom(htRooNo);
	}
	
}

