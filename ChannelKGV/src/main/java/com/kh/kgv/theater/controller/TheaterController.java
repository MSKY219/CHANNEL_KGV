package com.kh.kgv.theater.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.kgv.helpDesk.model.service.HelpDeskService;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.management.model.service.ManagerService;
import com.kh.kgv.theater.model.service.TheaterService;
import com.kh.kgv.theater.model.vo.Screen;


@Controller
@RequestMapping("/theater")
@SessionAttributes({ "loginUser" })
public class TheaterController {

	@Autowired
	private ManagerService service;

	@Autowired
	private TheaterService services;
	
	@Autowired
	private HelpDeskService hdService;

	@GetMapping("/normalTheater")
	public String normarTheater(	Model model
			, @RequestParam(value = "cp", required = false, defaultValue="1" ) int cp) {
		
		Map<String, Object>userNoticeList = null;
		userNoticeList = service.userNoticeList(cp);
		
		Map<String, Object>cinemaList = null;
		cinemaList = hdService.searchcinemaList();
		
		Map<String, Object> getEvnetList = null;
		getEvnetList = service.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		model.addAttribute("getNoticeList", userNoticeList);
		model.addAttribute("cinemaList",cinemaList);

		return "theater/normalTheater";
	}
	
	@ResponseBody
	@GetMapping("/normalTheater/selectArea")
	public Map<String, Object> getCinemaNames(@RequestParam(value="area", required = false) String area,
			Model model
			) {

		Map<String, Object> cinemaNameList = hdService.cinemaNameList(area);
		model.addAttribute("cinemaNameList",cinemaNameList);
		return cinemaNameList;
	} 
	
	
	
	
	@RequestMapping("/specialTheater")
	public String specialTheater() {
		return "theater/specialTheater";
	}

	@RequestMapping("/specialTheater/{theaterID}")
	public String specialTheater(
			Model model,
			@PathVariable("theaterID") int theaterID
			) {
		
		String path = null;

		String special = null;
		if( theaterID ==1 ) {
			special = "KMAX";
			path = "theater/theaterS1";
		}else if(theaterID==2) {
			special = "DOLBY";
			path =  "theater/theaterS2";

		}else if (theaterID==3) {
			special = "PUPPY &amp; ME";
			path =  "theater/theaterS3";

		}else if(theaterID==4) {
			special = "YES KIDS";
			path =  "theater/theaterS4";

		}else {
			special = "CHEF &amp; CINE";
			path =  "theater/theaterS5";

		}
		
		List<Screen> screenInfo =  services.getScreenInfo(special);
		model.addAttribute("screenInfo", screenInfo);
		
		List<Movie> randomMovie = services.randomMovie(special);
		model.addAttribute("randomMovie", randomMovie);


		return path;
		
	}


}
