package com.kh.kgv.theater.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.theater.model.dao.TheaterDAO;
import com.kh.kgv.theater.model.vo.Screen;

@Service
public class TheaterServiceImple implements TheaterService {

	@Autowired
	TheaterDAO dao = new TheaterDAO();

	@Override
	public List<Screen> getScreenInfo(String special) {
		return dao.getScreenInfo(special);
	}

	@Override
	public List<Movie> randomMovie(String special) {
		return dao.randomMovie(special);
	}










}
