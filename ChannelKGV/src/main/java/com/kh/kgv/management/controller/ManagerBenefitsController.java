package com.kh.kgv.management.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.kgv.common.Util;
import com.kh.kgv.management.model.service.ManagerBenefitsService;
import com.kh.kgv.management.model.vo.Benefits;

@Controller
@RequestMapping("/manager/benefits_add")
@SessionAttributes({ "loginUser" })
public class ManagerBenefitsController {
	
	@Autowired
	private ManagerBenefitsService service;
	
	// 혜택 등록
	@PostMapping("write_Event")
	@ResponseBody
	public int addBenefits(@RequestParam("title") String title,
						   @RequestParam("start") String start,
						   @RequestParam("end") String end,
						   @RequestParam("content") String content,
						   @RequestParam("movieImg1") String movieImg) {
		
		Benefits bene = new Benefits();
		bene.setBenefitsTitle(title);
		bene.setBenefitsStart(start);
		bene.setBenefitsEnd(end);
		bene.setBenefitsContent(content);
		bene.setBenefitsImg(movieImg);
		
		int result = service.addBenefits(bene);
		
		return result;
	}
	
	// 혜택 등록용 이미지 업로드
	@PostMapping("uploadImageFile")
	@ResponseBody
	public String uploadImageFile(@RequestParam("file") MultipartFile multipartFile,
								HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		
		// 내부경로로 저장
		String webPath = "/resources/images/benefits_img/";
		
		String fileRoot = request.getServletContext().getRealPath(webPath);
		
		String originalFileName = multipartFile.getOriginalFilename();
		String saveFileName = Util.fileRename(originalFileName);
		
		File targetFile = new File(fileRoot + saveFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", request.getContextPath() + webPath + saveFileName);
			
			jsonObject.addProperty("responseCode", "success");
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
				
		String a = jsonObject.toString();
		System.out.println("****************** 이미지 a : " + a);		
		return a;
	}
	
	// 혜택 보조 이미지 업로드
	@PostMapping("uploadImage")
	@ResponseBody
	public String benefitsUploadImageFile(@RequestParam("file") MultipartFile[] multipartFiles,
										HttpServletRequest req) {
		
		JsonArray jsonArray = new JsonArray();
		
		String webPath = "/resources/images/benefits_img/";
		String fileRoot = req.getServletContext().getRealPath(webPath);
		
		for (MultipartFile multipartFile : multipartFiles) {
			
			JsonObject jsonObject = new JsonObject();
			
			String originalFileName = multipartFile.getOriginalFilename();
			String saveFileName = Util.fileRename(originalFileName);
			
			File targetFile = new File(fileRoot + saveFileName);
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);
				jsonObject.addProperty("", req.getContextPath() + webPath + saveFileName);
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			
			jsonArray.add(jsonObject);
			
		}
		
		String jsonResult = jsonArray.toString();
		System.out.println("****************** 이미지 jsonResult : " + jsonResult);
		return jsonResult;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
