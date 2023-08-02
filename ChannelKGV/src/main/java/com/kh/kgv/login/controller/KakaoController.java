package com.kh.kgv.login.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.kgv.login.model.service.SignUpService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@SessionAttributes({ "loginUser" })
@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService service;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/login") 
	public String showLogin(HttpServletRequest req, HttpSession session) { 
		String referer = req.getHeader("Referer"); 
		if(referer != null) { 
			session.setAttribute("prevPage", referer); 
		} 

		return "/login"; 
	}


	@RequestMapping("/sign_Up/sns/kakao")
	public String kakaoLogin(
			@RequestParam(value = "code" , required = false) String code,
			Model model,			HttpServletRequest req
			) throws Exception {
		String access_Token = service.getAccessToken(code);
		
		// 엑세스 토큰값은 정상적으로 받아와진다.
		User loginUser = service.getUserInfo(access_Token);
		session.setAttribute("loginUser", loginUser);
		if(loginUser !=null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("access_Token", access_Token);

			String prevPage = (String) session.getAttribute("prevPage");
			String path1 = "http://localhost:8080/movie/signUp/signUp_sns";
			String path2 = "http://localhost:8080/movie/user/login";
			String path3 = "https://kgv.co.kr/movie/signUp/signUp_sns";
			String path4 = "https://kgv.co.kr/movie/user/login";
			String path = "";

			if(prevPage.equals(path1) || prevPage.equals(path2) || prevPage.equals(path3) || prevPage.equals(path4)) {
				path = "redirect:/";
			} else if(
					prevPage != null && !prevPage.isEmpty()
					) {
				path = "redirect:"+prevPage;;
				session.removeAttribute("prevPage");
			} else {
				path = "redirect:/";
			}
			
			return path;
		} else {
			model.addAttribute("message", "로그인에 실패하였습니다.");
			return "redirect:/signUp/signUp_sns";
		}

	}
	
	
	@GetMapping("/logout")
	   public String logout(SessionStatus status,HttpSession session) {
	       String access_Token = (String)session.getAttribute("access_Token");

	           if(access_Token != null && !"".equals(access_Token)){
	        	   service.kakaoLogout(access_Token);
	               session.removeAttribute("access_Token");
	               session.removeAttribute("loginMember");
	               session.invalidate();
	           }else{
	           }
	      status.setComplete();
	      return "redirect:/";
	   }
	


}

