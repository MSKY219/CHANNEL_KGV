package com.kh.kgv.management.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.kh.kgv.management.model.service.ManageCinemaService;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;

@Controller
@RequestMapping("/manager/manager_cinema_add")
@SessionAttributes({ "loginUser" })
public class ManageCinemaController {
	
	@Autowired
	private ManageCinemaService service;
	
	// private Logger logger = LoggerFactory.getLogger(ManageCinemaController.class);

	@PostMapping("/enroll")
	public String enrollCinema  (
			@RequestParam("cinemaName") String cinemaName,
			@RequestParam("cinemaAddr") String[] cinemaAddr,
			@RequestParam("screenStyle") String[] screenStyle,
			@RequestParam("screenSeat") String[] screenSeat,
			@RequestParam("screenDetail") String[] screenDetail
			) {
		
		String url = service.enrollCinema(cinemaName, cinemaAddr, screenStyle, screenSeat, screenDetail);
		return url;
		
	}
	
	
	@GetMapping("/cinemaDupCheck")
	@ResponseBody
	public int cinemaDupCheck(String cinemaName) {
		int result = service.cinemaDupCheck(cinemaName);
		System.out.println(result);
		return result;
	} 
	

}
