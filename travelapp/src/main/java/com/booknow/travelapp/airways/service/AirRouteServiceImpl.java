package com.booknow.travelapp.airways.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingCreatorDTO;
import com.booknow.travelapp.airways.common.paging.domain.AirwaysPagingDTO;
import com.booknow.travelapp.airways.domain.AirRankVO;
import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.mapper.AirRouteMapper;

import lombok.AllArgsConstructor;

//230627 임지혁 작성
@Primary
@Service
@AllArgsConstructor
public class AirRouteServiceImpl implements AirRouteService{
	private AirRouteMapper airRouteMapper;
	
	
//	0627박효준 편도 항공노선 SELECT
//	0629 임지혁 수정 nav바 검색창: VO 이용
	@Override
	public AirwaysPagingCreatorDTO getAirRouteSearchList(AirwaysPagingDTO airwaysPaging) {
		
		long rowTotal = airRouteMapper.selectRowTotal(airwaysPaging);
		int pageNum = airwaysPaging.getPageNum();
		
		AirwaysPagingCreatorDTO airwaysPagingCreator = null;
		
		if (rowTotal == 0) {
			airwaysPaging.setPageNum(1);
			
		} else {
			
			if (pageNum == -1) {
				pageNum = (int) Math.ceil(rowTotal / (airwaysPaging.getNumOfRows() * 1.0));
				airwaysPaging.setPageNum(pageNum);
			}
			
		}
		
		airwaysPagingCreator = new AirwaysPagingCreatorDTO(rowTotal, 
				airwaysPaging, 
				airRouteMapper.selectAirRouteSearchList(airwaysPaging));
		
		//System.out.println("서비스의 airwaysPagingCreator: " + airwaysPagingCreator);
		return airwaysPagingCreator;
		
	}
	
	
	//230628 임지혁 DB에 항공노선 정보입력
	//230701 임지혁 수정: airlineNm, Id 관련 예외처리
	@Override
	public int registerAirRoute(AirRouteVO airRouteVO, int numOfRows) {
		
		List<Map<String, Object>> airRouteMapList = new ArrayList<>();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		
		int totalCount = 0;
		BufferedReader bf = null;
		String result = null;
		String key = "j6GcyyvmxJet0G9NxmoZG7s0oEylfTXfIuOFTnYPHZITlgMREirbgHlO8qQvbV1CyO664Md6NGoVaWrP8WFOXA%3D%3D";
		
		try{
			URL url = new URL(  "https://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList?"
						  	  + "serviceKey=" + key 
						  	  + "&pageNo=1&numOfRows=" + numOfRows + "&_type=json"
						  	  + "&depAirportId=" + modifyAirportNmtoId(airRouteVO.getDepAirportNm()) 
						  	  + "&arrAirportId=" + modifyAirportNmtoId(airRouteVO.getArrAirportNm()) 
						  	  + "&depPlandTime=" + simpleDateFormat.format(airRouteVO.getDepPlandTime())  
						 	 );
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine().trim(); //response 문자열에 불규칙하게 공백 포함되어 있는 경우 있어서 공백 제거
			
			if (!result.startsWith("{")) { // <OpenAPI> 등 "{"로 시작하지 않는 경우 제외 
				return 0;
			}
			
			bf.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject(result); 
		JSONObject response = jsonObject.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		
		totalCount = body.getInt("totalCount");
		
		if (totalCount == 0) { //해당 노선 없음
		    
			return totalCount;
		    
		} else if (totalCount == 1) { //해당 노선 1개
		    JSONObject items = body.getJSONObject("items");
		    JSONObject item = items.getJSONObject("item");
		    
		    airRouteMapList.add(createAirRouteMap(item));
		    
		} else { //노선 여러개: JSONArray로 제공
		    JSONObject items = body.getJSONObject("items");
		    JSONArray item = items.getJSONArray("item");

		    for (int i = 0; i < item.length(); i++) {
		        JSONObject airRouteObj = item.getJSONObject(i);
		        airRouteMapList.add(i, createAirRouteMap(airRouteObj));
		    }
		}
		
		
		System.out.println("출발 공항: " + airRouteVO.getDepAirportNm());
		System.out.println("도착 공항: " + airRouteVO.getArrAirportNm());
		System.out.println("출발 날짜: " + simpleDateFormat.format(airRouteVO.getDepPlandTime()));
		
		return airRouteMapper.insertAirRoute(airRouteMapList);
		
	}	
	
	//JSONObject인 경우와 JSONArray인 경우 중복되는 코드 메서드로 뺌
	private Map<String, Object> createAirRouteMap(JSONObject item) {
	    Map<String, Object> airRouteMap = new HashMap<>();

	    if (!item.isNull("airlineNm")) {
	        airRouteMap.put("airlineId", modifyAirlineNmToId(item.getString("airlineNm")));
	    } else {
	        airRouteMap.put("airlineId", "UFO"); //airlineNm 안 넘어오는 경우 예외 ID 처리
	    }

	    airRouteMap.put("depAirportNm", item.getString("depAirportNm"));
	    airRouteMap.put("arrAirportNm", item.getString("arrAirportNm"));

	    airRouteMap.put("depPlandTime", String.valueOf(item.getLong("depPlandTime")));
	    airRouteMap.put("arrPlandTime", String.valueOf(item.getLong("arrPlandTime")));

	    if (!item.isNull("economyCharge")) {
	        airRouteMap.put("economyCharge", item.getLong("economyCharge"));
	    } else {
	        airRouteMap.put("economyCharge", 0);
	    }

	    if (!item.isNull("prestigeCharge")) {
	        airRouteMap.put("prestigeCharge", item.getLong("prestigeCharge"));
	    } else {
	        airRouteMap.put("prestigeCharge", 0);
	    }

	    airRouteMap.put("vihicleId", item.getString("vihicleId"));

	    return airRouteMap;
	}
	
	
	//230627 임지혁
	//from airlineNm to airlineId
	private String modifyAirlineNmToId(String airlineNm) {
		String airlineId = null;
		
		if (airlineNm.equals("대한항공")) {
			airlineId = "KAL";
		} else if (airlineNm.equals("아시아나항공")) {
			airlineId = "AAR";
		} else if (airlineNm.equals("제주항공")) {
			airlineId = "JJA";
		} else if (airlineNm.equals("진에어")) {
			airlineId = "JNA";
		} else if (airlineNm.equals("에어부산")) {
			airlineId = "ABL";
		} else if (airlineNm.equals("이스타항공")) {
			airlineId = "ESR";
		} else if (airlineNm.equals("하이에어")) {
			airlineId = "HGG";
		} else if (airlineNm.equals("에어서울")) {
			airlineId = "ASV";
		} else if (airlineNm.equals("티웨이항공")) {
			airlineId = "TWB";
		} else if (airlineNm.equals("플라이강원")) {
			airlineId = "FGW";
		} else {
			airlineId = "UFO"; // 불규칙하게 나오는 해외항공사 예외 처리 ID
		}
		
		return airlineId;
	}
	
	
	//230629 임지혁
	//from airportNm to airportId
	private String modifyAirportNmtoId(String airportNm) {
		String airportId = null;
		
		if (airportNm.equals("김포")) {
			airportId = "NAARKSS";
		} else if (airportNm.equals("제주")) {
			airportId = "NAARKPC";
		} else if (airportNm.equals("인천")) {
			airportId = "NAARKSI";
		} else if (airportNm.equals("김해")) {
			airportId = "NAARKPK";
		} else if (airportNm.equals("양양")) {
			airportId = "NAARKNY";
		} else if (airportNm.equals("광주")) {
			airportId = "NAARKJJ";
		} else if (airportNm.equals("원주")) {
			airportId = "NAARKNW";
		} else if (airportNm.equals("사천")) {
			airportId = "NAARKPS";
		} else if (airportNm.equals("울산")) {
			airportId = "NAARKPU";
		} else if (airportNm.equals("여수")) {
			airportId = "NAARKJY";
		} else if (airportNm.equals("군산")) {
			airportId = "NAARKJK";
		} else if (airportNm.equals("포항")) {
			airportId = "NAARKTH";
		} else if (airportNm.equals("대구")) {
			airportId = "NAARKTN";
		} else if (airportNm.equals("청주")) {
			airportId = "NAARKTU";
		} else if (airportNm.equals("무안")) {
			airportId = "NAARKJB";
		}
		
		return airportId;
	}
	
	
	
	//노선 좌석 수 업데이트
	@Override
	public boolean modifyAirRouteSeatCnt(long airRouteno, long seatCnt) {
		
		return airRouteMapper.updateAirRouteSeatCnt(airRouteno, seatCnt) == 1;
	}

	
	//노선 삭제
	@Override
	public boolean deleteAirRoute(long airRouteno) {
		
		return airRouteMapper.deleteAirRoute(airRouteno) == 1;
	}
	
	

	// 항공사 평점 랭킹 top 5
	@Override
	public List<AirRankVO> getAirGradeRankList() {
		return airRouteMapper.selectAirGradeRankList();
	}


	//항공편 최저가
	@Override
	public List<AirRouteVO> getAirLowPrice() {
		return airRouteMapper.selectAirLowPrice();
	}
	
}