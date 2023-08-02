package com.kh.kgv.management.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.management.model.dao.ManageCinemaDAO;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;

@Service
public class ManageCinemaServiceImpl implements ManageCinemaService {

	@Autowired
	private ManageCinemaDAO dao;

	@Override
	public int cinemaDupCheck(String cinemaName) {
		return dao.cinemaDupCheck(cinemaName);
	}

	@Override
	public String enrollCinema(String cinemaName, String[] cinemaAddr, String[] screenStyle, String[] screenSeat, String[] screenDetail) {
		Cinema cinema = new Cinema();
		Screen screen;

		cinema.setCinemaName(cinemaName);
		cinema.setCinemaArea(getCinemaArea(cinemaAddr[1].substring(0, 2)));
		cinema.setCinemaRegion(String.join(",,", cinemaAddr));
		cinema.setCinemaScreen(screenDetail.length - 1);
		
		int cinemaResult = dao.enrollCinema(cinema);
		int screenResult = 0;

		for(int i=0; i<screenDetail.length; i++) {
			// 추가용 원본 제외
			if(i==0) continue;
			
			screen = new Screen();
			screen.setCinemaName(cinemaName);
			screen.setScreenName(i);
			screen.setScreenStyle(screenStyle[i]);
			screen.setScreenSeat(Integer.parseInt(screenSeat[i]));
			
			// 따옴표를 없애지 않고 '-'로 바꾼 이유
			// screenSpace 속성은 key-value 형식의 객체인데
			// key의 따옴표가 없으면 JS에서 파싱이 안 됨.
			System.out.println(screenDetail[i]);
			
			screenDetail[i] = screenDetail[i].replace("&quot;", "-");
			System.out.println(screenDetail[i]);
			
			String row = screenDetail[i].split(",-maxColumn-:")[0].replace("{-maxRow-:", "").replace("-", "");
			System.out.println(row);
			screen.setScreenRow(Integer.parseInt(row));
			screenDetail[i] = screenDetail[i].split(",-maxColumn-:")[1];
			
			String col = screenDetail[i].split(",-aisle-:")[0].replace("-", "");;
			System.out.println(col);
			screen.setScreenCol(Integer.parseInt(col));
			screenDetail[i] = screenDetail[i].split(",-aisle-:")[1];
			
			String aisle = screenDetail[i].split(",-space-:")[0];
			System.out.println(aisle);
			screen.setScreenAisle(aisle);
			screenDetail[i] = screenDetail[i].split(",-space-:")[1];
			
			String space = screenDetail[i].split(",-sweet-:")[0].replace("-", "\"");
			System.out.println(space);
			screen.setScreenSpace(space);
			screenDetail[i] = screenDetail[i].split(",-sweet-:")[1];
			
			String sweet = screenDetail[i].split(",-impaired-:")[0].replace("-", "\"");
			System.out.println(sweet);
			screen.setScreenSweet(sweet);
			screenDetail[i] = screenDetail[i].split(",-impaired-:")[1];
			
			screen.setScreenImpaired(screenDetail[i].replace("}", "").replace("-", "\""));

			screenResult += dao.enrollScreen(screen);
		}
		
		if(cinemaResult == 1 && screenResult == (screenDetail.length-1)) {
			System.out.println("등록 성공");
			return "redirect:/manager/manager_cinema_list";
		} else {
			System.out.println("등록 실패");
			return "redirect:/manager/main";
		}
		
	}
	
	
	public String getCinemaArea(String area) {
		String cinemaArea;
		
		switch(area) {
		case "서울":
			cinemaArea = "서울";
			break;
		case "경기": case "인천":
			cinemaArea = "경기";
			break;
		case "충남": case "충북": case "대전": case "세종":
			cinemaArea = "충청";
			break;
		case "전남": case "전북": case "광주":
			cinemaArea = "전라";
			break;
		case "경남": case "부산": case "울산":
			cinemaArea = "경남";
			break;
		case "경북": case "대구":
			cinemaArea = "경북";
			break;
		case "강원":
			cinemaArea = "강원";
			break;
		case "제주":
			cinemaArea = "제주";
			break;
		default:
			cinemaArea = "없음";
	    }
		
		return cinemaArea;
		
	}


}
