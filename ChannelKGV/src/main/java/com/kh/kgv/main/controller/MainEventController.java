package com.kh.kgv.main.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.kgv.management.model.service.ManagerService;
import com.kh.kgv.management.model.vo.Event;
import com.kh.kgv.movieList.model.service.MovieService;

@Controller
@RequestMapping("/eventList")
@SessionAttributes({"loginUser"})
public class MainEventController {
	
	@Autowired
	private ManagerService service;

	// 메인 -> 이벤트 이동 시 이벤트 
	@RequestMapping("/detail_List")
	public String eventList(Model model, Event event) {
		
		
		Map<String, Object>getEvnetList = null;
		getEvnetList=service.selectEventList();
		
		
		
		model.addAttribute("getEvnetList", getEvnetList);
		
		return "eventList/detail_List";
	}

	// 이벤트 상세 보기
	@GetMapping("/detail_List/introduce/{eventNo}")
	public String editEvent(
	        Model model,
	        Event event,
	        @PathVariable("eventNo") int eventNo
			) {
		
		Event eventDetail = null;
		
		eventDetail = service.getEventList(event);
		
		String unescapedContent = StringEscapeUtils.unescapeHtml4(eventDetail.getEventContent());
		eventDetail.setEventContent(unescapedContent);
		
		model.addAttribute("eventDetail", eventDetail);
		
		return "eventList/event_introduce";
	
	
	}
	
	// 메인 -> 이벤트 이동 시 종료된 이벤트 
		@RequestMapping("/end_List")
		public String endEventList(Model model, Event event) {
			
			
			Map<String, Object>getEvnetList = null;
			getEvnetList=service.selectEventList();
			
			
			
			model.addAttribute("getEvnetList", getEvnetList);
			
			return "eventList/end_List";
		}
		
		// 완료된 이벤트 상세 보기
		@GetMapping("/end_List/introduce/{eventNo}")
		public String EndedEvent(
		        Model model,
		        Event event,
		        @PathVariable("eventNo") int eventNo
				) {
			
			Event eventDetail = null;
			
			eventDetail = service.getEventList(event);
			
			String unescapedContent = StringEscapeUtils.unescapeHtml4(eventDetail.getEventContent());
			eventDetail.setEventContent(unescapedContent);
			
			model.addAttribute("eventDetail", eventDetail);
			
			return "eventList/event_introduce";
		
		
		}
	
	
}
