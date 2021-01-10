package org.project.signt.controller.home;

import java.util.HashMap;

import org.project.signt.service.home.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/") // 초기화면
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1() throws Exception {
		return "home/Home.jsp";
	}

	
	
	/*@RequestMapping(value = "/login_get", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> login_get(@RequestParam(required = true) HashMap<String, Object> param) {

		HashMap<String, Object> reponse = new HashMap<String, Object>();
		reponse.put("get 시작, 화면꺼 그대로 넘긴거", param);
		
		if (homeService.getUserIdChk(param) == 0) {
			reponse.put("chk", 1);
		} else if (homeService.getUserPwChk(param) == 0) {
			reponse.put("chk", 2);
		} else {
			reponse.put("info", homeService.getUserInfo(param));
		}

		return reponse;
	}
	*/
	
	// LOGIN  
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> login_post(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();

		// login
		if (homeService.getUserIdChk(param) == 0) {
			response.put("chk", 1);				// ID 틀림 
		} else if (homeService.getUserPwChk(param) == 0) {
			response.put("chk", 2); 			// PW 틀림
		} else {
			response.put("info", homeService.getUserInfo(param));
		}

		return response;
	}
	
	// SIGN UP
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> sign_up(@RequestParam(required = true) HashMap<String, Object> param) throws Exception{
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		if(homeService.insertUser(param) == 1) {	//	 회원가입 성공
			response.put("chk", 0);
		}else {										//	회원가입 실패
			response.put("chk", 1);							
			}
		
	/*	try {
			
		}catch() {
			
		}*/
		
		return response;
	}
	
	// ID CHK
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> id_chk(@RequestParam(required = true) HashMap<String, Object> param) throws Exception{
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		if (homeService.getUserIdChk(param) == 0) {
			response.put("chk", 0);		// 중복 없음 성공 !
			
		}else {
			response.put("chk", 1);		// 중복 있음
		}
		return response;
	}
	
	// SEARCH INFO
	@RequestMapping(value = "/searchInfo", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> search_info(@RequestParam(required = true) HashMap<String, Object> param) throws Exception{
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		response.put("info", homeService.searchInfo(param));
		
		return response;
	}
	
	
	

}
