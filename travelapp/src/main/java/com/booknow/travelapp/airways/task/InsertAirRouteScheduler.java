package com.booknow.travelapp.airways.task;

import java.util.Calendar;
import java.util.Date;

import org.springframework.context.annotation.Primary;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.booknow.travelapp.airways.domain.AirRouteVO;
import com.booknow.travelapp.airways.mapper.AirPaymentMapper;
import com.booknow.travelapp.airways.service.AirRouteService;


//230717 임지혁: AirRouteServiceImpl에서 스케쥴러 클래스로 변경
@Primary
@Component
public class InsertAirRouteScheduler {
	
	private AirRouteService airRouteService;
	private Date depTime;
	private static final int NUMOFROWS = 150;
	//
	private AirPaymentMapper airPaymentMapper;
	
	public InsertAirRouteScheduler(AirRouteService airRouteService, AirPaymentMapper airPaymentMapper) {
		this.airRouteService = airRouteService;
		this.airPaymentMapper = airPaymentMapper;
	}
	
	//결제도중 취소된 판매건 테이블에서 삭제
	@Scheduled(cron = "0 0 4 * * *")
	public void deleteNoneSell() {
		
		System.out.println("air스케줄러 실행=============");
		
		airPaymentMapper.deletePasTable();
		airPaymentMapper.deleteResTable();
		airPaymentMapper.deleteSellTable();
		
		System.out.println("air스케줄러 끝=============");
	}
	
	@Scheduled(cron = "0 0 4 * * *")
	public void registerAirRouteAll() {
			
		System.out.println("insertAirRouteScheduler.registerAirRouteAll 실행됨");
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, + 7); //오늘 +7 날짜로 변경
		
		depTime = new Date(calendar.getTimeInMillis());
		
		insertAirRouteUsingPermutation();
		
		System.out.println("InsertAirRouteScheduler.registerAirRouteAll 완료");
			
	}
	
	
	//임지혁 230702 insert 노선 using 순열(Permutation)
	private void insertAirRouteUsingPermutation() {
		
		String[] airportNm = {"김포", "제주", "인천", "김해", "양양", 
							  "광주", "원주", "사천", "울산", "여수", 
							  "군산", "포항", "대구", "청주", "무안"};
	   	int n = airportNm.length; //15
		String[] outputNm = new String[n];
		boolean[] visited = new boolean[n]; //기본값 false
		
		permutation(airportNm, outputNm, visited, 0, n, 2);
	   	
	}
	
	
	//airportNm의 길이만큼 반복: 방문되지 않은 배열의 경우 방문한 것으로 표시하고 outputNm[0] = airportNm[0], outputNm[1] = airportNm[1], depth가 2에 도달했을때 노선 insert 메서드 호출
	//호출 완료 후 다시 방문하지 않은 것으로 변경, 이후의 순열에서 선택되지 않은 것으로 표시
	private void permutation(String[] airportNm, String[] outputNm, boolean[] visited, int depth, int n, int r) {
		if (depth == r) { //depth == 2일때 insert 호출
			insertExecution(outputNm);
			
			return;
		}
		
		for (int i = 0; i < n; i++) {
			if (!visited[i]) {
				
				visited[i] = true; // [i] 사용 check
				outputNm[depth] = airportNm[i]; 
				//outputNm[0] = airportNm[0] => outputNm[1] = airport[1] => depth 2 되면서 insert 호출
				
				permutation(airportNm, outputNm, visited, depth + 1, n, r);
				//재귀 호출, outputNm에 선택된 공항명 저장
				
				visited[i] = false;
				//이후의 순열에서 선택되지 않은 것으로 표시
			}
		}
	}
	
	
	//depth가 2에 도달했을 때 new airportNm [0], [1]을 파라미터로 노선 insert 실행
	private void insertExecution(String[] airportNm) {
			
		airRouteService.registerAirRoute(new AirRouteVO(airportNm[0], airportNm[1], depTime), NUMOFROWS);
	}
}