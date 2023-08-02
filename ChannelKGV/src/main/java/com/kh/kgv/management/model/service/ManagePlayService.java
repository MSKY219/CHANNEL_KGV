package com.kh.kgv.management.model.service;

import java.util.List;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.items.model.vo.TimeCheck;
import com.kh.kgv.items.model.vo.TimeTable;
import com.kh.kgv.management.model.vo.Cinema;

public interface ManagePlayService {

	List<Cinema> getAreaCinemaList(String areaName);

	List<Movie> getPlayingMovieList();

	List<TimeTable> getTimeTableList();

	List<Play> playTimeCheck(String cinemaName, int screenName, int startTime, int endTime, String startDate, String endDate);

	int enrollPlay(String cinemaName, int screenName, int movieNo, int startTime, int endTime, String startDate, String endDate);

	// 일자 중복 시, 해당하는 영화의 상영목록 중에서 가장 빠른 시작일과 가장 늦은 종료일을 가지고 돌아가기.
	List<Play> getDupTime(TimeCheck tc);

	// screenName + cinemaName 으로 screenNo 구해오기
	int screenNo(TimeCheck tc);

	int enrollSuperPlay(String areaName, int screenName, int movieNo, int startTime, int endTime, String startDate, String endDate);

	
	

}
