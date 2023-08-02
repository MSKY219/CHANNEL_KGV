package com.kh.kgv.reserve.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.NewApiKeys;
import com.kh.kgv.reserve.model.service.PayService;
import com.kh.kgv.reserve.model.service.ReserveService;
import com.kh.kgv.store.contoller.StoreController;
import com.kh.kgv.store.model.vo.StoreCoupon;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/pay")
@SessionAttributes({ "loginUser" })
public class PayController {

	@Autowired
	private PayService service;

	private Logger logger = LoggerFactory.getLogger(PayController.class);

	private List<StoreCoupon> storeCouponList = null;


	// 결제페이지로 이동하기
	@GetMapping("/pay")
	public String movePay(HttpServletRequest req,
			Model model) {

		HttpSession session = req.getSession();

		int priceNo = (int) session.getAttribute("priceNo");
		int bookNo = (int) session.getAttribute("bookNo");

		// 예매금액 찾기
		String result = service.serchPrice(bookNo);

		model.addAttribute("reservePrice", result);


		return "pay/pay";
	}

	// 몇명 보러왔나?
	@GetMapping("/loadPay")
	@ResponseBody
	public int checkSeat(HttpServletRequest req) {


		HttpSession session = req.getSession();
		int bookNo = (int) session.getAttribute("bookNo");

		// 좌석 수 확인
		int seatCount = service.checkSeatCount(bookNo);

		return seatCount;
	}


	@PostMapping("/selectTicket")
	@ResponseBody
	public Map<String, Object> selectCoupon(@RequestParam("COUPONNO") String couponNo,
			Model model) {

		System.out.println("쿠폰번호 들어옴?");

		storeCouponList = service.selectCoupon(couponNo);

		System.out.println("couponNo:::: "+couponNo);
		System.out.println("검색한 쿠폰정보 ::::"+storeCouponList);

		//		model.addAttribute("storeCouponList", storeCouponList);

		String category = service.serchCategory(couponNo);
		System.out.println("내가 찾은 상품의 카테고리는 : " + category);
		Map<String, Object> couponMap = new HashMap<>();


		couponMap.put("storeCouponList", storeCouponList);
		couponMap.put("category", category);
		return couponMap;

	}

	// 관람권 상태 변경
	@PostMapping("/updateTicketStatus")
	@ResponseBody
	public int updateTicketStatus(@RequestParam("COUPON_DETAIL_NO") String couponNo,
			HttpServletRequest req) {
		System.out.println("관람권 상태 변경 시작");
		int result = service.updateTicketStatus(couponNo);

		return result;
	}


	// 결제

	private IamportClient api;

	public PayController() {
		
		NewApiKeys apikey = new NewApiKeys();

		String key = apikey.getTicketKey();

		String srckey = apikey.getTicketSecretKey();

		System.out.println(key);
		System.out.println(srckey);
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient(key,srckey);
	}


	// 결제 검증
	@ResponseBody
	@RequestMapping(value="/pay/verifyIamport/{merchant_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			Locale locale,
			HttpSession session,
			@PathVariable(value= "merchant_uid") String merchant_uid) throws IamportResponseException, IOException {

		System.out.println("결제검증 시작");

		return api.paymentByImpUid(merchant_uid);

	}

	// 결제 성공 후 돌아가는 ajax
	@PostMapping("/pay/successPayment")
	@ResponseBody
	public int successPayment(@RequestParam("bookNo") int bookNo,
			@RequestParam("reserveCodeNo") String reserveCodeNo) {

		logger.debug(" bookNo : " + bookNo);
		logger.debug(" reserveCodeNo : " + reserveCodeNo);

		// 예매내역 테이블 정보 저장
		int result = service.successPayment(bookNo,reserveCodeNo);

		return result;
	}





	// 결제완료 페이지 이동
	@GetMapping("/finshed")
	public String movePayFinshed(HttpSession session,
			Model model) {

		int bookNo = (int) session.getAttribute("bookNo");

		Map<String, Object> finalMap = new HashMap<>();

		String payOrder = service.serchPayOrder(bookNo);
	    JoinPlay userPlay = service.getUserPlayByBookNo(bookNo);
	    Book bookAll = service.serchBook(bookNo);
	    
	    int changeSt = service.changeSt(bookNo);
	    
	    
	    
	    
		finalMap.put("userPlay", userPlay);
		finalMap.put("payOrder", payOrder);
		finalMap.put("bookAll", bookAll);
		
		model.addAttribute("finalMap", finalMap);

		return "pay/pay_finshed";
	}
	
	
	@GetMapping("/loadPlay")
	@ResponseBody
	public JoinPlay LoadPlay(HttpServletRequest req) throws Exception {
		JoinPlay userPlay = null;

		try {
			HttpSession session = req.getSession();
			int bookNo = (int) session.getAttribute("bookNo");
			userPlay = service.getUserPlayByBookNo(bookNo);

			System.out.println("유저플레이 : " +  userPlay);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return userPlay;
	}
	
	



}
