package com.kh.kgv.management.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.kgv.common.Util;
import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.management.model.service.ManageStoreService;
import com.kh.kgv.management.model.vo.Event;



@Controller
@RequestMapping("/manager/store_add")
@SessionAttributes({ "loginUser" })
public class ManageStoreController {
	
	@Autowired
	private ManageStoreService service;
	
	private Logger logger = LoggerFactory.getLogger(ManageStoreController.class);
	
	
	
	// 이름 중복 검사
	@ResponseBody
	@GetMapping("/NameDupCheck")
	public int NameDupCheck(String storeName) {
		System.out.println(storeName);
		int result = service.NameDupCheck(storeName);
				
		System.out.println(result);
		return result;
				
	}
	
	
	@ResponseBody
	@PostMapping("/addStore")
	public int addStore(@RequestParam("storeCategory") String storeCategory,
			@RequestParam("storeName") String storeName,
			@RequestParam("storeDesc") String storeDesc,
			@RequestParam("storePrice") int storePrice,
			@RequestParam("storeStock") int storeStock,
			@RequestParam("storeImage") String storeImage,
			@RequestParam("storeImageBig") String storeImageBig) {
		
		logger.debug("storeCategory : " + storeCategory);
		logger.debug("storeCategory : " + storeName);
		logger.debug("storeCategory : " + storeDesc);
		logger.debug("storeCategory : " + storePrice);
		logger.debug("storeCategory : " + storeStock);
		logger.debug("storeCategory : " + storeImage);
		logger.debug("storeCategory : " + storeImageBig);
		
		Store store  = new Store();
		store.setStoreCategory(storeCategory);
		store.setStoreName(storeName);
		store.setStoreDesc(storeDesc);
		store.setStorePrice(storePrice);
		store.setStoreStock(storeStock);
		store.setStoreImage(storeImage);
		store.setStoreImageBig(storeImageBig);
		
		int result = service.addStore(store);
		
		
		
		
		return  result;
		
		
		
		
	}
	
	
	
	@PostMapping("/uploadImageFile")
	@ResponseBody
	public String storeUploadImageFile(@RequestParam("file") MultipartFile[] multipartFiles, HttpServletRequest request) {
	    JsonArray jsonArray = new JsonArray(); 

	    String webPath = "/resources/images/storeimg/";
	    String fileRoot = request.getServletContext().getRealPath(webPath);

	    for (MultipartFile multipartFile : multipartFiles) {
	        JsonObject jsonObject = new JsonObject();

	        String originalFileName = multipartFile.getOriginalFilename();
	        String savedFileName = Util.fileRename(originalFileName);

	        File targetFile = new File(fileRoot + savedFileName);
	        try {
	            InputStream fileStream = multipartFile.getInputStream();
	            FileUtils.copyInputStreamToFile(fileStream, targetFile);
	            jsonObject.addProperty("", request.getContextPath() + webPath + savedFileName);

	        } catch (IOException e) {
	            FileUtils.deleteQuietly(targetFile);
	            jsonObject.addProperty("responseCode", "error");
	            e.printStackTrace();
	        }

	        jsonArray.add(jsonObject);
	    }

	    String jsonResult = jsonArray.toString();
	    System.out.println("이미지: " + jsonResult);
	    return jsonResult;
	}
	
	
	
	
	

}
