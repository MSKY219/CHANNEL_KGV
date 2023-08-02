package com.kh.kgv.management.model.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.items.model.vo.TimeCheck;
import com.kh.kgv.items.model.vo.TimeTable;
import com.kh.kgv.management.model.dao.ManagePlayDAO;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;


@Service
public class ManagePlayServiceImpl implements ManagePlayService {
	
	@Autowired
	private ManagePlayDAO dao;
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	@Override
	public List<Cinema> getAreaCinemaList(String areaName) {
		List<Cinema> areaCinemaList = dao.getAreaCinemaList(areaName);
		return areaCinemaList;
	}

	@Override
	public List<Movie> getPlayingMovieList() {
		List<Movie> movieList = dao.getPlayingMovieList();
		return movieList;
	}

	@Override
	public List<TimeTable> getTimeTableList() {
		List<TimeTable> timeTableList = dao.getTimeTableList();
		return timeTableList;
	}

	@Override
	public List<Play> playTimeCheck(String cinemaName, int screenName, int startTime, int endTime, 
			                        String startDate, String endDate) {
		
		List<Play> playList = new ArrayList<>();
		
		// 다중 파라미터를 넘기기 위해 vo를 이용했습니다.
		Screen screen = new Screen();
		screen.setCinemaName(cinemaName);
		screen.setScreenName(screenName);
		int screenNo = dao.getScreenNo(screen);
		
		List<String> dateTimeList = getDateTimeList(startTime, endTime, startDate, endDate);
		System.out.println(dateTimeList);
		Play play;
		List<Play> timeCheck;
		
		for(int i=0; i < dateTimeList.size()/2; i++) {
			play = new Play();
			play.setScreenNo(screenNo);
			play.setPlayStart(dateTimeList.get(2*i));
			play.setPlayEnd(dateTimeList.get(2*i +1));
			
			timeCheck = dao.playTimeCheck(play);
			
			if(timeCheck.size() > 0) {
			    playList.add(play);
			}
			
		}
		
		return playList;
	}
	
	
	
	// 상영 등록
	
	@Override
	public int enrollPlay(String cinemaName, int screenName, int movieNo, int startTime, int endTime, String startDate, String endDate) {
		Screen screen = new Screen();
		screen.setCinemaName(cinemaName);
		screen.setScreenName(screenName);
		int screenNo = dao.getScreenNo(screen);
		
		List<String> dateTimeList = getDateTimeList(startTime, endTime, startDate, endDate);
		System.out.println(dateTimeList.size());
		System.out.println(dateTimeList.size()/2);
		Play play;
		int enrollCount = 0;
		
		for(int i=0; i < dateTimeList.size()/2; i++) {
			play = new Play();
			play.setScreenNo(screenNo);
			play.setPlayStart(startDate);
			play.setMovieNo(movieNo);
			play.setPlayStart(dateTimeList.get(2*i));
			play.setPlayEnd(dateTimeList.get(2*i +1));
			
			enrollCount += dao.enrollPlay(play);
			
			
 			// 상영 등록 성공 시, 영화 테이블 누적 상영횟수 추가
 			int PlayCountAdd = dao.addPlayCount(movieNo); 
			
		}
		
		
		return enrollCount;
	} 
	

	public static List<LocalDate> getDatesBetweenTwoDates(LocalDate startDate, LocalDate endDate) {
		return startDate.datesUntil(endDate).collect(Collectors.toList());
	}

	
	// 상영 일자 리스트
	
	public List<String> getDateTimeList(int startTime, int endTime, String startDate, String endDate) {
		
		LocalDate start = LocalDate.parse(startDate, formatter);
		LocalDate end = LocalDate.parse(endDate, formatter).plusDays(1);
		
		List<LocalDate> dateList = getDatesBetweenTwoDates(start, end);
		ListIterator<LocalDate> iterator = dateList.listIterator();
		List<String> dateTimeList = new ArrayList<>();
		
		// LocalDate 객체는 날짜만 취급하므로 시간 계산을 위해 LocalDateTime 객체로 변환합니다. 
		
		while(iterator.hasNext()){
			LocalDateTime localDateTime = iterator.next().atStartOfDay(); 
			LocalDateTime startDateTime = localDateTime.plusMinutes(startTime);
			LocalDateTime endDateTime = localDateTime.plusMinutes(endTime);
            dateTimeList.add(startDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            dateTimeList.add(endDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        }
		
		return dateTimeList;
	}
	
	// 일자 중복 시, 해당하는 영화의 상영목록 중에서 가장 빠른 시작일과 가장 늦은 종료일을 가지고 돌아가기.
	@Override
	public List<Play> getDupTime(TimeCheck tc) {
		
		return dao.getDupTime(tc);
	}

	// screenName + cinemaName 으로 screenNo 구해오기
	@Override
	public int screenNo(TimeCheck tc) {
		return dao.screenNo(tc);
	}

	@Override
	public int enrollSuperPlay(String areaName, int screenName, int movieNo, int startTime, int endTime,
			String startDate, String endDate) {
		List<Cinema> areaCinemaList = dao.getAreaCinemaList(areaName);
		int enrollCount = 0;
		int PlayCountAdd = 0;
		
		for(Cinema cinema : areaCinemaList) {
			String cinemaName = cinema.getCinemaName();
			if(screenName <= cinema.getCinemaScreen()) {
				
				Screen screen = new Screen();
				screen.setCinemaName(cinemaName);
				screen.setScreenName(screenName);
				int screenNo = dao.getScreenNo(screen);
				
				List<String> dateTimeList = getDateTimeList(startTime, endTime, startDate, endDate);
				System.out.println(dateTimeList.size());
				System.out.println(dateTimeList.size()/2);
				Play play;
				
				
				for(int i=0; i < dateTimeList.size()/2; i++) {
					play = new Play();
					play.setScreenNo(screenNo);
					play.setPlayStart(startDate);
					play.setMovieNo(movieNo);
					play.setPlayStart(dateTimeList.get(2*i));
					play.setPlayEnd(dateTimeList.get(2*i +1));
					
					enrollCount += dao.enrollPlay(play);
					
					
		 			// 상영 등록 성공 시, 영화 테이블 누적 상영횟수 추가
		 			PlayCountAdd += dao.addPlayCount(movieNo); 
				}
				
			}
		}
		
		return enrollCount;
	}


	
	
	

}
