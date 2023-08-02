package com.kh.kgv.store.contoller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.kgv.common.Util;
import com.kh.kgv.common.Util.SessionUtil;
import com.kh.kgv.customer.model.vo.User;

import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.management.model.vo.NewApiKeys;
import com.kh.kgv.store.model.service.StoreService;

import com.kh.kgv.store.model.vo.StoreCoupon;
import com.kh.kgv.store.model.vo.StoreOrder;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/store")
@SessionAttributes({"loginUser"})
public class StoreController {

	private List<Store> storeList = null;
	private List<StoreOrder> storeOrderList = null;
	private List<StoreCoupon> storeCouponList = null;
	private Map<String, Object> storePaymentMap = null;



	@Autowired
	private StoreService service;






	@RequestMapping("/storeMain")
	public String storeMain(Model model
			) {

		Map<String, Object> storeMap = null;
		storeMap = service.getStoreMap();

//		logger.debug("storeMap : " + storeMap);
		model.addAttribute("storeMap", storeMap);

		return "store/storeMain";
	}


	@RequestMapping("/storeMain/store_detail/{storeNo}")
	public String getStoreDetail(Model model,
			@PathVariable("storeNo") int storeNo
			,Store store

			) {

	

		Store getStoreDetail = service.getStoreDetail(store);

//		logger.debug("getStoreDetail : " + getStoreDetail);

		model.addAttribute("storeDetail", getStoreDetail);



		return "store/store_detail";
	}


	@ResponseBody
	@PostMapping("/storeMain/store_detail/{storeNo}/getStorePayment")
	public String getStorePayment (
			Model model,
			@RequestParam("totalPrice") int totalPrice
			,@RequestParam("totalCount") int totalCount,
			@PathVariable("storeNo") int storeNo,
			Store store,
			HttpSession session
			,HttpServletRequest request)  {

	

		synchronized (session) {
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("totalCount", totalCount);
		}
		 


//		logger.debug(" totalPrice : " + totalPrice);
//		logger.debug(" totalCount : " + totalCount);

		return "store/store_payment";


	}




	@GetMapping("/storeMain/store_detail/store_payment/{storeNo}")
	public String storePayment ( 
			Store store
			,Model model
			,@PathVariable("storeNo") int storeNo
			,HttpServletResponse response
			,HttpServletRequest request
			,HttpSession session) throws Exception{

		User  loginUser = (User) SessionUtil.getSession().getAttribute("loginUser");



		if(loginUser == null ) {
			Util.alertAndMovePage(response, "로그인을 하셔야 합니다.", "/movie/user/login");



			return "store/store_payment";
		}


//		logger.debug(" loginUser************** : " + loginUser);



		int totalPrice = (int) session.getAttribute("totalPrice");
		int totalCount = (int) session.getAttribute("totalCount");

//		logger.debug(" totalPrice************** : " + totalPrice);
//		logger.debug(" totalCount*************** : " + totalCount);
//
//		logger.debug(" store : " + store);
		Store getStore = service.getStoreDetail(store);


		model.addAttribute("storeDetail", getStore);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("loginUser", loginUser);




		return  "store/store_payment";
	}


	private IamportClient api;



	public StoreController() {


		NewApiKeys apikey = new NewApiKeys();
		String key = apikey.getIamportKey();
		String secretKey = apikey.getIamportSecretKey();

//		System.out.println(key + ":: 키값");
//		System.out.println(secretKey + ":: 시크릿키값");


		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient(key,secretKey);

	}

	@ResponseBody
	@RequestMapping(value="/storeMain/store_detail/store_payment/{storeNo}/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{
		return api.paymentByImpUid(imp_uid);
	}

	//결제성공 정보 받아오는 ajax
	@ResponseBody
	@PostMapping("/storeMain/store_detail/store_payment/{storeNo}/successPayment") 	
	public int successPayment(
			@RequestParam("orderPrice") int orderPrice
			,@RequestParam("orderCount") int orderCount,
			@RequestParam("storeName") String storeName
			,@RequestParam("userName") String userName
			,@RequestParam("userEmail") String userEmail
			,@RequestParam("storeNo") int storeNo
			,@RequestParam("orderDetailNo") String orderDetailNo
			,@RequestParam("imp_uid") String imp_uid
			,HttpSession session) {



	

//		logger.debug(" orderPrice################ : " + orderPrice);
//		logger.debug(" totalCount################ : " + orderCount);
//		logger.debug(" storeNo################ : " + storeName);
//		logger.debug(" userNo################ : " + userName);
//		logger.debug(" userEmail################ : " + userEmail);
//		logger.debug(" orderDetailNo################ : " + orderDetailNo);


		StoreOrder storeOrder  = new StoreOrder();

		storeOrder.setOrderDetailNo(orderDetailNo);
		storeOrder.setOrderCount(orderCount);
		storeOrder.setOrderPrice(orderPrice);
		storeOrder.setUserName(userName);
		storeOrder.setStoreName(storeName);
		storeOrder.setUserEmail(userEmail);
		storeOrder.setStoreNo(storeNo);
		storeOrder.setImp_uid(imp_uid);

		int result = service.successPayment(storeOrder);

		//logger.debug(" userNo################ : " + userName);

		return result;
	}


	// 결제 완료페이지로 이동하기
	@GetMapping("/store_Success")
	public String storeSuccess( HttpSession session
			, Model model
			,HttpServletResponse response) throws Exception {
		
		User  loginUser = (User) SessionUtil.getSession().getAttribute("loginUser");



		if(loginUser == null ) {
			Util.alertAndMovePage(response, "로그인을 하셔야 합니다.", "/movie/user/login");



			return "store/store_Success";
		}


		int sorderNo = (int) session.getAttribute("generatedOrderNo");
	//	logger.debug(" SorderNo################************************* : " + sorderNo);
		
		

		storeList = service.getstoreList(sorderNo);
		storeOrderList = service.getstoreOrderList(sorderNo);
		storeCouponList = service.getstoreCouponList(sorderNo);;



//		logger.debug(" storeList################************************* : " + storeList);
//		logger.debug(" storeOrderList################************************* : " + storeOrderList);
//		logger.debug(" storeCouponList################************************* : " + storeCouponList);
		model.addAttribute("storeList", storeList);
		model.addAttribute("storeOrderList", storeOrderList);
		model.addAttribute("storeCouponList", storeCouponList);

	


		return "store/store_Success";
	}

}
