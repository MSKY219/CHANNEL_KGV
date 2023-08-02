package com.kh.kgv.login.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.service.KakaoService;
import com.kh.kgv.login.model.service.NaverService;
import com.kh.kgv.login.model.service.SignUpService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@SessionAttributes({ "loginUser" })
@Controller
public class NaverController {

	@Autowired
	private NaverService service;
	@Autowired
	private HttpSession session;
	
	//네아로 컨트롤러
	@RequestMapping("/sign_Up/sns/naver")
	public String naverLogin(
			@RequestParam(value = "code" , required = false) String code,
			Model model
			) throws Exception {
		String access_Token = service.getAccessToken(code);
		
		User loginUser = service.getUserInfo(access_Token);
		session.setAttribute("loginUser", loginUser);
		
		if(loginUser !=null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("access_Token", access_Token);
			return "redirect:/";
		} else {
			model.addAttribute("message", "로그인에 실패하였습니다.");
			return "redirect:/signUp/signUp_sns";
		}

	}
	


}
