package com.kh.kgv.benefits.controller;

import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.kgv.benefits.model.service.BenefitsService;
import com.kh.kgv.management.model.vo.Benefits;
import com.kh.kgv.management.model.vo.Event;

@Controller
@RequestMapping("/benefitsList")
@SessionAttributes({"loginUser"})
public class BenefitsController {
	
	private Logger logger = LoggerFactory.getLogger(BenefitsController.class);
	
	@Autowired
	private BenefitsService service;
	
	// 진행중인 혜택 페이지 이동
	// 진행중인 혜택 리스트 불러오기
	@GetMapping("benefits_detail_List")
	public String moveBenefitsList(Model model,
								   Benefits bene) {
		
		System.out.println("헤더 혜택 클릭 -> 혜택리스트 페이지로 이동");
		
		Map<String, Object> getBenefitsList = null;
		getBenefitsList = service.getBenefitsList();
		
		System.out.println("*************** 불러오고잇는것 : " + getBenefitsList);
		
		model.addAttribute("getBenefitsList",getBenefitsList);
		
		
		return "benefitsList/benefits_detail_List";
	}
	
	// 진행중인 혜택 상세보기
	@GetMapping("/benefits_detail_List/introduce/{benefitsNo}")
	public String introduceBenfits(Model model,
								   Benefits bene,
								   @PathVariable("benefitsNo") int benefitsNo ) {
		System.out.println("상세페이지 들어가는중...");
		
		
		Benefits benefitsDetail = null;
		
		// 혜택 상세보기 만들고 있는중
		benefitsDetail = service.selectOneBenefits(bene);
		System.out.println("DAO에서 가지고 온 혜택 1개 : " + benefitsDetail);
		
		String unescapedContent = StringEscapeUtils.unescapeHtml4(benefitsDetail.getBenefitsContent());
		benefitsDetail.setBenefitsContent(unescapedContent);
		
		model.addAttribute("benefitsDetail", benefitsDetail);
		
		return "benefitsList/benefits_introduce";
	
	
	}
	
	
		
	// 지난 혜택 페이지 이동
	@GetMapping("benefits_end_List")
	public String moveEndBenefitsList(Model model,
			   						  Benefits bene) {
		
		System.out.println("헤더 혜택 클릭 -> 지난 혜택리스트 페이지로 이동");
		
				
		Map<String, Object> getBenefitsList = null;
		getBenefitsList = service.getBenefitsList();
		
		System.out.println("*************** 불러오고잇는것 : " + getBenefitsList);
		
		model.addAttribute("getBenefitsList",getBenefitsList);
		
		
		
		return "benefitsList/benefits_end_List";
	}
	
	// 지난 혜택 상세보기
	@GetMapping("/benefits_end_List/introduce/{benefitsNo}")
	public String EndBenfits(Model model,
							 Benefits bene,
							 @PathVariable("benefitsNo") int benefitsNo ) {
		System.out.println("상세페이지 들어가는중...");
		
		
		Benefits benefitsDetail = null;
		
		// 혜택 상세보기 만들고 있는중
		benefitsDetail = service.selectOneBenefits(bene);
		System.out.println("DAO에서 가지고 온 혜택 1개 : " + benefitsDetail);
		
		String unescapedContent = StringEscapeUtils.unescapeHtml4(benefitsDetail.getBenefitsContent());
		benefitsDetail.setBenefitsContent(unescapedContent);
		
		model.addAttribute("benefitsDetail", benefitsDetail);
	
		return "benefitsList/benefits_introduce";
		
		
	}
	
	
	
}
