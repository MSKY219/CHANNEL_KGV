package com.kh.kgv.reserve.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.kgv.common.scheduling.UpdatePlayScheduling;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.Screen;
import com.kh.kgv.reserve.model.service.ReserveService;

@Controller
@RequestMapping("/reserve")
@SessionAttributes({ "loginUser" })
public class ReserveController {
	
	@Autowired
	private ReserveService service;
	
	Logger logger =LoggerFactory.getLogger(ReserveController.class);
	
	private String[] areaArray = {"서울", "경기", "충청", "전라", "경남", "경북", "강원", "제주"};
	private String[] specialArray = {"KMAX", "DOLBY", "CHEF &amp; CINE", "PUPPY &amp; ME", "YES KIDS"};
	private List<Cinema> cinemaList = null;
	private List<Screen> specialScreenList = null;
	private List<Movie> movieList = null;
	private List<Movie> thumbList = null;
	private List<JoinPlay> joinPlayList = null;
	private Map<String, Object> reserveMap = null;
	private Map<String, Object> priceMap = null; 
	
	
	
	// 상영 선택 페이지로 이동

	@GetMapping("/choicePlay")
	public String enterChoicePlay(Model model) {
		reserveMap = new HashMap<>(); 
		movieList = service.getPlayingMovieList();
		thumbList = service.getPlayingThumbList();
		cinemaList = service.getAreaCinemaList("서울");
		specialScreenList = service.getSpecialScreenList(specialArray[0]); 
		
		reserveMap.put("movieList", movieList);
		reserveMap.put("thumbList", thumbList);
		reserveMap.put("cinemaList", cinemaList);
		reserveMap.put("specialScreenList", specialScreenList);
		model.addAttribute("reserveMap", reserveMap);
		
		return "reserve/choicePlay";
	}
	
	
	
	// 상영 선택 페이지에 진입하면 바로 실행하여 필요한 정보를 가져옴
	
	@GetMapping("/initialMap")
	@ResponseBody
	public Map<String, Object> getInitialMap() {
		Map<String, Object> initialMap = null;

		try {
			String areaName = areaArray[0];
			initialMap = service.getInitialMap(areaName);	
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return initialMap;
	}
	
	
	
	// 지역을 클릭하면 해당 지역의 영화관 정보를 가져옴
	
	@GetMapping("/cinemaList")
	@ResponseBody
	public List<Cinema> getCinemaList(String areaIndex) {
		try {
			String areaName = areaArray[Integer.parseInt(areaIndex)];
			cinemaList = service.getAreaCinemaList(areaName);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return cinemaList;
	}
	
	
	
	// 스크린 스타일을 클릭하면 해당 스타일의 상영관 정보를 가져옴
	
	@GetMapping("/specialScreenList")
	@ResponseBody
	public List<Screen> getSpecialScreenList(String typeIndex) {
		try {
			String type = specialArray[Integer.parseInt(typeIndex)];
			specialScreenList = service.getSpecialScreenList(type);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return specialScreenList;
	}
	
	
	
	// 극장과 날짜를 모두 클릭하면 해당 극장의 모든 상영 정보를 가져옴
	
	@GetMapping("/playList")
	@ResponseBody
	public List<JoinPlay> getTotalPlayList(String areaIndex, String cinemaIndex, String dateIndex ) throws Exception {
		
		try {
			String areaName = areaArray[Integer.parseInt(areaIndex)];
			joinPlayList = service.getTotalPlayList(areaName, cinemaIndex, dateIndex);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return joinPlayList;
	}
	
	
	
	// 극장과 날짜만 선택하면 그날 해당 극장의 모든 상영 정보를 가져옴
	
	@GetMapping("/specialPlayList")
	@ResponseBody
	public List<JoinPlay> getSpecialPlayList(String typeIndex, String roomIndex, String dateIndex ) throws Exception {
		
		try {
			String screenStyle = specialArray[Integer.parseInt(typeIndex)];
			specialScreenList = service.getSpecialScreenList(screenStyle);
			
			String cinemaName = specialScreenList.get(Integer.parseInt(roomIndex)).getCinemaName();
			joinPlayList = service.getSpecialPlayList(screenStyle, cinemaName, dateIndex);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return joinPlayList;
	}
	
	
	
	// 극장, 날짜, 영화를 모두 선택하면 그날 해당 극장의 해당 영화 상영 정보를 가져옴
	
	@GetMapping("/moviePlayList")
	@ResponseBody
	public List<JoinPlay> getMoviePlayList(String areaIndex, String cinemaIndex, String dateIndex, 
			                               String movieOptionIndex, String movieIndex ) {
		
		try {
			String areaName = areaArray[Integer.parseInt(areaIndex)];
			joinPlayList = service.getMoviePlayList(areaName, cinemaIndex, dateIndex, movieOptionIndex, movieIndex);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return joinPlayList;
	}
	
	
	
	// 극장, 특별관 유형, 날짜를 모두 선택하면 그날 해당 특별관의 상영 정보를 가져옴
	
	@GetMapping("/roomPlayList")
	@ResponseBody
	public List<JoinPlay> getRoomPlayList(String typeIndex, String roomIndex, String dateIndex, 
			                                        String movieOptionIndex, String movieIndex ) {
		
		try {
			String screenStyle = specialArray[Integer.parseInt(typeIndex)];
			specialScreenList = service.getSpecialScreenList(screenStyle);
			
			String cinemaName = specialScreenList.get(Integer.parseInt(roomIndex)).getCinemaName();
			joinPlayList = service.getRoomPlayList(screenStyle, cinemaName, dateIndex, movieOptionIndex, movieIndex);
		} catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		return joinPlayList;
	}
	
	
	
	// 좌석 선택을 클릭할 때
	
	@GetMapping("/selectPlay")
	@ResponseBody
	public String selectPlay(HttpServletRequest req, String playNo) {
		String result = "fail";
		
		try {
			HttpSession session = req.getSession();
			session.setAttribute("playNo", playNo);
			
			if(session.getAttribute("loginUser") != null) {
				logger.info(playNo + "번 상영 티켓 페이지 접속");
				result = "choiceTicket";
			}	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	// 좌석 선택 페이지에 진입할 때

	@GetMapping("/choiceTicket")
	public String enterChoiceTicket(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		
		try {
			int playNo = Integer.parseInt( (String) session.getAttribute("playNo"));
			JoinPlay userPlay = service.getUserPlay(playNo);
			model.addAttribute("userPlay", userPlay);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(session.getAttribute("loginUser") != null) {
			return "reserve/choiceTicket";
		} else {
			return "redirect:/reserve/choicePlay";
		}
		
	}
	
	
	
	// 티켓 선택 페이지에 진입했을 때 바로 실행하여 상영 정보를 가져옴
	
	@GetMapping("/loadPlay")
	@ResponseBody
	public JoinPlay LoadPlay(HttpServletRequest req) throws Exception {
		JoinPlay userPlay = null;

		try {
			HttpSession session = req.getSession();
			int playNo = Integer.parseInt( (String) session.getAttribute("playNo"));
			userPlay = service.getUserPlay(playNo);
			
			int priceNo = service.getPriceNo(playNo);
			session.setAttribute("priceNo", priceNo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return userPlay;
	}
	
	
	
	// 좌석을 선택할 때마다 총 가격을 계산함
	
	@PostMapping("/updatePrice")
	@ResponseBody
	public Map<String, Object> updatePrice(HttpServletRequest req, String partialCountArray) throws Exception {
		
		try {
			HttpSession session = req.getSession();
			int priceNo = (int) session.getAttribute("priceNo");
			partialCountArray = partialCountArray.replaceAll("[^0-9]", "");
			
			priceMap = service.getPriceMap(priceNo, partialCountArray);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return priceMap;
	}
	
	
	
	// 결제하기 버튼을 클릭했을 때 좌석과 가격이 유효한지 확인함
	
	@PostMapping("/checkTicket")
	@ResponseBody
	public String checkTicket(HttpServletRequest req, String countArray, String seatArray, 
			                      @ModelAttribute("loginUser") User loginUser) throws Exception {
		int condition = 0;
		String url = "fail";
		try {
			// 세션에서 상영 번호와 가격 번호를 가져옴.
			HttpSession session = req.getSession();
			int playNo = Integer.parseInt( (String) session.getAttribute("playNo"));
			int priceNo = (int) session.getAttribute("priceNo");
			int userNo = loginUser.getUserNo();

			
			// 인원별 몇 명 선택했는지 배열[bookAge]로 나타냄
			// 총 가격을 bookPrice에 담음
			countArray = countArray.replaceAll("[^0-9]", "");
			priceMap = service.getPriceMap(priceNo, countArray);
			String bookAge = Arrays.toString( (int[]) priceMap.get("countArray") );
			int bookPrice = (int) priceMap.get("totalPrice");

			
			// 어떤 좌석을 선택했는지 배열[bookSeat]로 나타냄
			seatArray = seatArray.replaceAll("&quot", "");
			Gson gson = new Gson();
	        String[] gsonSeat = gson.fromJson(seatArray, String[].class);
	        List<String> seatList = new ArrayList<>();
	
	        for(String seat: gsonSeat) {
	        	if(seat != null) seatList.add('"' + seat + '"');
	        }
	        
	        String bookSeat = Arrays.deepToString(seatList.toArray());
	        condition = service.checkTicket(playNo, bookAge, bookSeat);
	        
	        if(condition == 1) {
	        	int buyResult = service.buyTicket(playNo, userNo, bookAge, bookSeat, bookPrice);
	        	
	        	if(buyResult > 0) {
	        		service.updatePlaySeat(playNo, bookSeat);
	                int bookNo = service.getBookNo(userNo);
	                session.setAttribute("bookNo", bookNo);
	        		url = "/movie/pay/pay";
	        	}		
			}
	        
	        logger.info(Integer.toString(userNo) + "번 회원이 " + Integer.toString(playNo) + "번 상영의 티켓을 결제합니다." );

		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// 유효성 검사가 통과되면 예매 테이블에 데이터 축적
		
		return url;
	}

	
	
	
}
