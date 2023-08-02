package com.kh.kgv.theater.model.service;

import java.util.List;
import java.util.Map;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.theater.model.vo.Screen;

public interface TheaterService {

	List<Screen> getScreenInfo(String special);

	List<Movie> randomMovie(String special);

}
