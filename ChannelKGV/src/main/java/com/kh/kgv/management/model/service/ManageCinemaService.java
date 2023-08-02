package com.kh.kgv.management.model.service;

import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;

public interface ManageCinemaService {

	int cinemaDupCheck(String cinemaName);

	String enrollCinema(String cinemaName, String[] cinemaAddr, String[] screenStyle, String[] screenSeat, String[] screenDetail);

}
