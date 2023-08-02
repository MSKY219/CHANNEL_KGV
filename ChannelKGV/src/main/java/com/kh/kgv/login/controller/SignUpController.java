package com.kh.kgv.login.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.service.SignUpService;

@Controller
@RequestMapping("/signUp")
public class SignUpController {
	
	@Autowired
	private SignUpService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 회원가입 sns 화면
		@RequestMapping("/signUp_sns")
		public String signUp_sns() {
			return "signUp/signUp_sns";
		}
			
		// 이메일 회원가입 창
		@RequestMapping("/signUp")
		public String signUp() {
			return "signUp/signUp";
		}
	
		// 이메일 중복 검사
		@ResponseBody
		@GetMapping("/emailDupCheck")
		public int emailDupCheck(String userEmail) {
			
			int result = service.emailDupCheck(userEmail);
			
			
			
			return result;
		}
		
		// 닉네임 중복 검사
		@ResponseBody
		@GetMapping("/nicknameDupCheck")
		public int nicknameDupCheck(String userNick) {
			
			int result = service.nicknameDupCheck(userNick);
			
			
			return result;
			
		}
		
		//이름 중복 검사
		@ResponseBody
		@GetMapping("nameDupCheck")
		public int nameDupCheck(String userName ) {
			
			int result = service.nameDupCheck(userName);
			
		
			return result;
		}
		
		//전화번호 중복 검사
		@ResponseBody
		@GetMapping("telDupCheck")
		public int telDupCheck(String userTel) {
			
			int result = service.telDupCheck(userTel);
			
			return result;
			
		}
		
		
		//회원 가입
		@PostMapping("/signUp")
		public String signUp(User inputUser
							,String[] userAddr
							,RedirectAttributes ra	) {
			
		
			
			inputUser.setUserAddr( String.join(",,", userAddr));
			
			if (inputUser.getUserAddr().equals(",,,,")) {
				
				inputUser.setUserAddr(null);
			}
			
			
			int result = service.signUp(inputUser);
			
			
			String message =null;
			String path =null;
		
			
			if(result > 0) {
				message = "회원가입 성공!";
				path = "redirect:/";
			}else {
				message = "회원가입 실패";
				path = "redirect:/signUp";
				
			}
			
			ra.addFlashAttribute("message", message);
			return path;
		}
		
		@ResponseBody
		@GetMapping("/sendEmail")
		public int sendEmail(String userEmail 
				) {
			
		
			
			
			 String cNumber = "";
	         for (int i = 0; i < 6; i++) {

	            int sel1 = (int) (Math.random() * 3); // 0:숫자 / 1,2:영어

	            if (sel1 == 0) {

	               int num = (int) (Math.random() * 10); // 0~9
	               cNumber += num;

	            } else {

	               char ch = (char) (Math.random() * 26 + 65); // A~Z

	               int sel2 = (int) (Math.random() * 2); // 0:소문자 / 1:대문자

	               if (sel2 == 0) {
	                  ch = (char) (ch + ('a' - 'A')); // 대문자로 변경
	               }

	               cNumber += ch;
	            }

	         }
	         
	         String setForm = "dmukservices@gmail.com";
	         String toMail = userEmail;
	         String title = "회원가입 인증 이메일 입니다.";
	         String content = 
	        		 "KGV 홈페이지를 방문해주셔서 감사합니다." +
	        	                "<br><br>" + 
	        	                "인증 번호는 " + cNumber + "입니다." + 
	        	                "<br>" + 
	        	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	         
	     
				
	         
	         try {
	        	 	MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setForm);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		        		 
	         }catch(Exception e) {

	        	 e.printStackTrace();

	             
	         }
	        
	         String cnum = cNumber.toString();

	          int result = service.insertCertification(cnum,userEmail);
	         
	          
			return result;
		}
		
		
		@ResponseBody
		@GetMapping("/checkNumber")
		public int checkNumber(String userEmail ,String cNumber) {
			
			
		
			
			
			int result =  service.checkNumber(cNumber, userEmail);
						
		
			
			return result;
			
		}
}
