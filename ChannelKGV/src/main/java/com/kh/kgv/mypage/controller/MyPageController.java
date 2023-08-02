package com.kh.kgv.mypage.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.server.PathParam;

import org.apache.commons.text.StringEscapeUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.service.HelpDeskService;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.management.model.service.ManagerService;
import com.kh.kgv.management.model.vo.Notice;
import com.kh.kgv.mypage.model.service.MyPageService;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({ "loginUser" }) // session scope에서 loginUser를 얻어옴
public class MyPageController {


	@Autowired
	private MyPageService service;

	@Autowired
	private ManagerService managerService;

	@Autowired
	private HelpDeskService helpService;

	// 마이페이지 첫번째 화면
	// 로그인o -> 로그인page, 로그인x -> myPage
	@GetMapping("/myPgMain")
	public String myPgMain(HttpServletRequest req
//						, HttpServletResponse resp
			, RedirectAttributes ra, Model model) throws IOException {

		
		String message = null;
		String path = null;

		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("loginUser") != null) {
			path = "myPage/myPage_home";
		} else {
			message = "서비스 사용을 위해 로그인 하세요.";

//			String referer = req.getHeader("Referer"); // 이전 페이지의 URL을 가져옵니다.
//	        session.setAttribute("prevPage", referer); // 이전 페이지의 URL을 세션에 저장합니다.

			path = "redirect:/user/login";
		}

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		ra.addFlashAttribute("message", message);

		return path;
	}

	// ===========================================================================================
	// ===========================================================================================
	// 사이드바 페이지 이동 영역
	@GetMapping("/myHome")
	public String myHome(Model model) {

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_home";
	}

	// 1대1 문의 리스트 페이지 입장, 불러오기
	@GetMapping("/myMtmList")
	public String myMtm(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> paramMap, Model model) {


		paramMap.put("userNo", loginUser.getUserNo());
		paramMap.put("cp", cp);
//		int userNo = loginUser.getUserNo();

		Map<String, Object> mtmUserList = service.mtmList(paramMap);

		model.addAttribute("mtmUserList", mtmUserList);

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_myMtmList";
	}

	// 1:1 문의사항 세부정보 확인
	@RequestMapping("/myMtmDetail/{mtmNo}")
	public String mtmdetail(Model model, @ModelAttribute("loginUser") User loginUser, @PathVariable("mtmNo") int mtmNo,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

//		User loginUser = (User) session.getAttribute("loginUser");

		// Add password check here
//		String checkResult = services.checkPasswordAccess(mtmNo, loginUser, cp);
//		if (!("redirect:/helpDesk/mtm_detail/" + mtmNo + "?cp=" + cp).equals(checkResult)) {
//			return checkResult;
//		}

//		System.out.println(checkResult);

		Mtm mTmdetail = helpService.selectmTmDetail(mtmNo);

		int userNo = 0;

		if (loginUser != null) {
			userNo = loginUser.getUserNo();
		}

		if (mTmdetail != null) {
			if (mTmdetail.getUserNo() != userNo) {

				Cookie cookie = null;

				Cookie[] cArr = req.getCookies();

				if (cArr != null && cArr.length > 0) {

					for (Cookie c : cArr) {
						if (c.getName().equals("readMtmdNo")) {
							cookie = c;
						}
					}
				}

				int result = 0;

				if (cookie == null) { // 기존에 "readBoardNo" 이름의 쿠키가 없던 경우
					cookie = new Cookie("readMtmdNo", mtmNo + "");
					result = helpService.updateReadCount(mtmNo);

				} else {

					String[] temp = cookie.getValue().split("/");

					List<String> list = Arrays.asList(temp); // 배열 -> List 변환

					if (list.indexOf(mtmNo + "") == -1) { // 기존 값에 같은 글번호가 없다면 추가

						cookie.setValue(cookie.getValue() + "/" + mtmNo);
						result = helpService.updateReadCount(mtmNo); // 조회수 증가 서비스 호출

					}
				}

				// 결과값 이용한 DB 동기화
				if (result > 0) {
					mTmdetail.setMtmCount(mTmdetail.getMtmCount() + 1); // 이미 조회된 데이터 DB 동기화

					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60 * 60 * 1);
					resp.addCookie(cookie);

				}
			}
		}

		String unescapedContent = StringEscapeUtils.unescapeHtml4(mTmdetail.getMtmContent());
		mTmdetail.setMtmContent(unescapedContent);

		model.addAttribute("mTmdetail", mTmdetail);
		mTmdetail.setUserNo(userNo);
		model.addAttribute("cp", cp);

		return "myPage/myPage_myMtmDetail";
	}

	// 1:1문의 게시물 삭제
	@GetMapping("/deleteMtm/{mtmNo}")
	public String mtmDelete(@PathVariable("mtmNo") int mtmNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			RedirectAttributes ra, @RequestHeader("referer") String referer) {

		String path = null;
		String message = null;

		int result = helpService.deleteBoard(mtmNo);

		if (result > 0) {
			path = "myPage/myMtmList" + "?cp=" + cp;
			message = "글 삭제를 완료했습니다.";

		} else {
			path = "referer";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:/" + path;
	}

	// 잃어버린 물건 리스트 입장, 불러오기
	@GetMapping("/myLostList")
	public String myLostItem(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> paramMap, Model model) {


		paramMap.put("userNo", loginUser.getUserNo());
		paramMap.put("cp", cp);
//		int userNo = loginUser.getUserNo();

		Map<String, Object> lostUserList = service.lostList(paramMap);

		model.addAttribute("lostUserList", lostUserList);

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_myLostList";
	}

	// 고객센터 세부사항 진입 문제는 userNo이 없어서 카운트증가가 안되는데 어떻게하지..
	@RequestMapping("/myLostDetail/{lostNo}")
	public String noticedetail(Model model, @ModelAttribute("loginUser") User loginUser,
			@PathVariable("lostNo") int lostNo, HttpSession session, HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

//
//			User loginUser = (User)session.getAttribute("loginUser");
//
		int userNo = 0;
//
//			String checkResult = null;
//			
		if (loginUser != null) {
			userNo = loginUser.getUserNo();
//				
////				checkResult = helpService.checkLostPasswordAccess(lostNo, loginUser, cp);
////				if (("redirect:/helpDesk/lost_detail/" + lostNo + "?cp=" + cp).equals(checkResult)) {
////					return checkResult;
////				} 
		}
//			checkResult = "redirect:/myPage/myLostDetail/" + lostNo;
//			
//			logger.info(checkResult);
//			
		LostPackage lostdetail = helpService.selectLostDetail(lostNo);

		if (lostdetail != null) {
			if (lostdetail.getUserNo() != userNo) {

				Cookie cookie = null;

				Cookie[] cArr = req.getCookies();

				if (cArr != null && cArr.length > 0) {

					for (Cookie c : cArr) {
						if (c.getName().equals("readLostdNo")) {
							cookie = c;
						}
					}
				}

				int result = 0;

				if (cookie == null) {
					cookie = new Cookie("readLostdNo", lostNo + "");
					result = helpService.updateLostReadCount(lostNo);

				} else {

					String[] temp = cookie.getValue().split("/");

					List<String> list = Arrays.asList(temp);

					if (list.indexOf(lostNo + "") == -1) {

						cookie.setValue(cookie.getValue() + "/" + lostNo);
						result = helpService.updateLostReadCount(lostNo);

					}
				}

				if (result > 0) {
					lostdetail.setLostView(lostdetail.getLostView() + 1);

					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60 * 60 * 1);
					resp.addCookie(cookie);

				}
			}
		}
		String unescapedContent = StringEscapeUtils.unescapeHtml4(lostdetail.getLostContent());
		lostdetail.setLostContent(unescapedContent);
		model.addAttribute("lostdetail", lostdetail);
		model.addAttribute("cp", cp);
		return "myPage/myPage_myLostDetail";
	}

	// 잃어버린물건 삭제
	@GetMapping("/deleteLost/{lostNo}")
	public String lostDelete(@PathVariable("lostNo") int lostNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			RedirectAttributes ra, @RequestHeader("referer") String referer) {

		String path = null;
		String message = null;

		int result = helpService.deleteLost(lostNo);

		if (result > 0) {
			path = "myPage/myLostList" + "?cp=" + cp;
			message = "글 삭제에 성공했다.";

		} else {
			path = "referer";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:/" + path;
	}

	@GetMapping("/info")
	public String info(Model model) {

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_info";
	}

	@GetMapping("/myReview")
	public String myReview(Model model
//							, @RequestParam Map<String,Object> paramMap
			, @ModelAttribute("loginUser") User loginUser, RedirectAttributes ra) {


		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_myReview";
	}

	@GetMapping("/myMovie")
	public String myMovie(Model model) {
		
		
		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_myMovie";
	}

	@GetMapping("/changePw")
	public String changePw(Model model) {

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);
		
		return "myPage/myPage_changePw";
	}

	@GetMapping("/secession")
	public String secession(Model model) {

		// 메인 이벤트 목록 가지고 오기 - 7개
		Map<String, Object> getEvnetList = null;
		getEvnetList = managerService.mainEventList();
		model.addAttribute("getEvnetList", getEvnetList);

		return "myPage/myPage_secession";
	}

	// 사이드바 페이지 이동 영역
	// ===========================================================================================
	// ===========================================================================================

	// 회원 정보 수정
	@PostMapping("/info")
	public String updateInfo(@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> paramMap,
			String[] updateAddr, RedirectAttributes ra) {


		// 파라미터를 저장한 paramMap에 회원번호, 주소를 추가
		String userAddr = String.join(",,", updateAddr); // 주소 배열 -> 문자열 변환

		// 주소가 미입력 되었을 때
		if (userAddr.equals(",,,,"))
			userAddr = null;

		paramMap.put("userNo", loginUser.getUserNo());
		paramMap.put("userAddr", userAddr);

		// 회원 정보 수정 서비스 호출
		int result = service.updateInfo(paramMap);

		String message = null;
		if (result > 0) {
			message = "회원 정보가 수정되었습니다.";
			// DB - Session의 회원 정보 동기화
			loginUser.setUserNick((String) paramMap.get("updateNick"));

			loginUser.setUserTel((String) paramMap.get("updateTel"));

			loginUser.setUserAddr((String) paramMap.get("userAddr"));

		} else {
			message = "회원 정보 수정 실패...";
		}
		ra.addFlashAttribute("message", message);

		return "redirect:info";
	}

	// ===========================================================================================
	// ===========================================================================================

	// 회원 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(@RequestParam Map<String, Object> paramMap, @ModelAttribute("loginUser") User loginUser,
			RedirectAttributes ra, SessionStatus status, HttpServletRequest req,
			HttpServletResponse resp) {

		// 로그인된 회원의 번호를 paramMap 추가
		paramMap.put("userNo", loginUser.getUserNo());

		// 비밀번호 변경 서비스 호출
		int result = service.changePw(paramMap);

		String message = null;
		String path = null;

		if (result > 0) {
			// 변경 -> info
			message = "비밀번호가 변경되었습니다.";

			// 세션 없애기
			status.setComplete();

			// 쿠키 없애기
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);
			
		    path = "/";
		} else {
			// 실패 -> changePw
			message = "현재 비밀번호가 일치하지 않습니다.";
			path = "myPage/myPage_changePw";
		}
		ra.addFlashAttribute("message", message);

		return "redirect:" + path;
	}

	// ===========================================================================================
	// ===========================================================================================

	// 회원 탈퇴
	@PostMapping("/secession") // session 의 회원정보 + 입력받은 파라미터(비밀번호)
	public String secession(@ModelAttribute("loginUser") User loginUser, SessionStatus status, HttpServletRequest req,
			HttpServletResponse resp, RedirectAttributes ra) {

		// 회원 탈퇴 서비스 호출
		int result = service.secession(loginUser);

		String message = null;
		String path = null;

		if (result > 0) {
			// 탈퇴 성공 -> 메인페이지
			message = "탈퇴 되었습니다";
			path = "/";

			// 세션 없애기
			status.setComplete();

			// 쿠키 없애기
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);

		} else {
			// 탈퇴 실패 -> secession
			message = "현재 비밀번호가 일치하지 않습니다.";
			path = "secession";

		}

		ra.addFlashAttribute("message", message);

		return "redirect:" + path;
	}
	
	// Java 서버 예시 (Spring Framework)
	// review 카드 불러오기
	@PostMapping("/loadReviewCards")
	@ResponseBody
	public List<Review> loadReviewCards(@RequestParam int startRow, @RequestParam int endRow,
			@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> paramMap, Model model) {

		int userNo = loginUser.getUserNo();
		paramMap.put("userNo", userNo);
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);

		List<Review> myReviewList = service.loadReviewCards(paramMap); // 데이터베이스에서 추가 데이터 조회

		// 각 Review 객체의 내용에서 <br> 제거
//	    for (Review review : myReviewList) {
//	        String modifiedContent = review.getRevContent().replace("<br>", "");
//	        review.setRevContent(modifiedContent);
//	    }
		
		model.addAttribute("myReviewList", myReviewList);
		return myReviewList;
	}

	// 리뷰 카드 삭제
	@GetMapping("/deleteReview/{revNo}")
	public String reviewDelete(@PathVariable("revNo") int revNo, HttpServletRequest req, HttpServletResponse resp,
			RedirectAttributes ra, @RequestHeader("referer") String referer) {

		String path = null;
		String message = null;

		int result = service.reviewDelete(revNo);

		if (result > 0) {
			path = "myPage/myReview";
			message = "리뷰를 삭제했습니다.";
		} else {
			path = "referer";
			message = "삭제 중 오류발생.";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:/" + path;
	}

	// Java 서버 예시 (Spring Framework)
	// movie 카드
	@PostMapping("/loadMovieCards")
	@ResponseBody
	public List<Review> loadMovieCards(@RequestParam int startRow, @RequestParam int endRow,
			@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> paramMap, Model model) {

		int userNo = loginUser.getUserNo();
		paramMap.put("userNo", userNo);
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);

		List<Review> myMovieList = service.loadMovieCards(paramMap); // 데이터베이스에서 추가 데이터 조회

		model.addAttribute("myMovieList", myMovieList);
		return myMovieList;
	}
	
	// 무비 카드 삭제
	@GetMapping("/deleteBook/{bookNo}")
	public String deleteBook(@PathVariable("bookNo") int bookNo, HttpServletRequest req, HttpServletResponse resp,
			RedirectAttributes ra, @RequestHeader("referer") String referer) {
		
		String path = null;
		String message = null;
			int result = service.deleteBook(bookNo);
			if (result > 0) {
			path = "myPage/myMovie";
			message = "영화 삭제를 완료했습니다.";
		} else {
			path = "referer";
			message = "삭제 중 오류발생.";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:/" + path;
	}
}
