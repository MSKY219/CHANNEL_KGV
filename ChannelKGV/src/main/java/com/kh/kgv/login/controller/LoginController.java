package com.kh.kgv.login.controller;


import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.service.LoginService;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"})
public class LoginController {



	@Autowired
	private LoginService service;

	@Autowired
	private JavaMailSender mailSender;



	@GetMapping("/login") 
	public String showLogin(HttpServletRequest req, HttpSession session) { 
		String referer = req.getHeader("Referer"); 
		if(referer != null) { 
			session.setAttribute("prevPage", referer); 
			
			
		} 

		return "login/login"; 
	}



	// 로그인
	@PostMapping("/login")
	public String login(@ModelAttribute User inputUser,
			Model model,
			RedirectAttributes ra,
			HttpServletResponse resp,
			HttpServletRequest req,
			HttpSession session,
			SessionStatus status,
			@RequestParam(value="saveId", required=false) String saveId) throws IOException {

		User loginUser = service.login(inputUser);
		String path = null;

		if(loginUser != null) { // 로그인 성공 시

			String prevPage = (String) session.getAttribute("prevPage");
			String path1 = "http://localhost:8080/movie/signUp/signUp_sns";
			String path2 = "http://localhost:8080/movie/user/login";
			String path3 = "https://kgv.co.kr/movie/signUp/signUp_sns";
			String path4 = "https://kgv.co.kr/movie/user/login";


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



			String blockUser = loginUser.getUserBlock();

			if(blockUser.equals("Y")) {
				ra.addFlashAttribute("message", "차단 당함 ㅅㄱ");
				status.setComplete(); 

				return "redirect:/"; 
			}


			model.addAttribute("loginUser", loginUser);

			// 로그인 성공 시 무조건 쿠키 생성
			// 단, 아이디 저장 체크 여부에 따라서 쿠기의 유지 시간을 조정
			Cookie cookie = new Cookie("saveId", loginUser.getUserEmail());

			if(saveId != null) { // 아이디 저장이 체크 되었을 때
				cookie.setMaxAge(60 * 60 * 24 * 7); // 초 단위로 지정 (일주일)
			} else { // 체크 되지 않았을 때
				cookie.setMaxAge(0); // 0초 -> 생성 되자마자 사라짐 == 쿠키 삭제
			}

			// 쿠키가 적용될 범위(경로) 지정
			cookie.setPath(req.getContextPath());

			// 쿠키를 응답 시 클라이언트에게 전달
			resp.addCookie(cookie);



		} else {


			//model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");

			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			// -> redirect 시 잠깐 Session scope로 이동후
			//    redirect가 완료되면 다시 Request scope로 이동

			// redirect 시에도 request scope로 세팅된 데이터가 유지될 수 있도록 하는 방법을
			// Spring에서 제공해줌
			// -> RedirectAttributes 객체  (컨트롤러 매개변수에 작성하면 사용 가능)

			return "redirect:/user/login"; 
		}

		return path;

	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout( /*HttpSession session,*/
			SessionStatus status) {
		// * @SessionAttributes을 이용해서 session scope에 배치된 데이터는
		//   SessionStatus라는 별도 객체를 이용해야만 없앨 수 있다.

		// session.invalidate(); // 기존 세션 무효화 방식으로는 안된다!
		status.setComplete(); 
		return "redirect:/";
	}

	// 비밀번호 찾기 진입
	@RequestMapping("/findPw")
	public String findPw(@ModelAttribute User inputUser,
			Model model,
			RedirectAttributes ra,
			HttpServletResponse resp,
			HttpServletRequest req,
			HttpSession session) {


		return "login/findPwEmail_2";
	}

	// 아이디 찾기 진입
	@RequestMapping("/findEmail")
	public String findEmail(@ModelAttribute User inputUser,
			Model model,
			RedirectAttributes ra,
			HttpServletResponse resp,
			HttpServletRequest req,
			HttpSession session) {


		return "login/findPwEmail_1";
	}

	// 비밀번호 찾기 checkUser
	@GetMapping("/checkUser")
	@ResponseBody
	public int checkUser(String userName, String userBirth, String userEmail) {

		// 1. User 객체 생성
		User user = new User();


		// 2. User 객체 안에 값을 넣어줌.
		user.setUserName(userName);
		user.setUserBirth(userBirth);
		user.setUserEmail(userEmail);

		// 3. 1과 0 보다는 값의 존재 여부 확인하는게 더 '낳'은거 같아서 boolean으로 넘김
		Boolean checkPw = service.checkUser(user);

		// 9. AJAX에서 result값을 받을때 1과 0으로 구분한다. 그래서 받아온 값이 true이면 1 아니면 0을 반납한다.
		// -> result가 아니어도 값이 넘어갑니다.
		return checkPw ? 1 : 0;
	}

	// 이메일 보내기
	@ResponseBody
	@GetMapping("/sendEmail")
	public int sendEmail( String userEmail ) {


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

		String setForm = "channelkgv1@gmail.com";
		String toMail = userEmail;
		String title = "KGV 아이디/비밀번호 찾기 인증 메일 입니다.";
		String content = 
				"KGV 홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"아이디/비밀번호 찾기에 대한 인증 번호는 " + cNumber + "입니다." + 
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





	// 인증번호 인증하기
	@ResponseBody
	@GetMapping("/checkNumber")
	public int checkNumber(String userEmail,
			String cNumber,
			Model model,
			HttpSession session ) {



		int result =  service.checkNumber(cNumber, userEmail);

		session.setAttribute("userEmail", userEmail);


		return result;
	}

	// 비밀번호 재설정 진입
	@GetMapping("/pwChange")
	public String pwChange(HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");
		return "login/pwChange";
	}

	// 비밀번호 재설정 하기
	@PostMapping("/finshedchangePw")
	public String finshedchangePw(HttpSession session,
			@RequestParam("userPw") String userPw,
			/* User inputUser, */
			RedirectAttributes ra) {

		String userEmail = (String) session.getAttribute("userEmail");


		int result = service.changePw(userEmail,userPw);

		String message = null;
		String path = null;

		if(result > 0 ) {
			message = "비밀번호 재설정이 완료되었습니다";
			session.removeAttribute("userEmail");
			path = "redirect:/";
		} else {
			message = "비밀번호 재설정에 실패하였습니다.";
			path = "login/pwChange";
		}
		ra.addFlashAttribute("message",message);

		return path;

	}




	// 아이디 찾기
	@PostMapping("/findId")
	public String findEmail(String userName,
			String userBirth,
			String userTel,
			RedirectAttributes ra) {

		User user = new User();


		// 2. User 객체 안에 값을 넣어줌.
		user.setUserName(userName);
		user.setUserBirth(userBirth);
		user.setUserTel(userTel);

		String findEmail = service.findEmail(user);


		String message = null;
		String path = null;

		if (findEmail != null) {
			message = "아이디찾기를 통해 찾은 아이디는 " + findEmail + " 입니다";
			path = "redirect:/"; // 리다이렉트 경로로 수정
		} else {
			message = "찾을 수 있는 아이디가 존재하지 않습니다.";
			path = "redirect:/user/findEmail"; // 리다이렉트 경로로 수정
		}
		ra.addFlashAttribute("message", message);

		return path;
	}






}