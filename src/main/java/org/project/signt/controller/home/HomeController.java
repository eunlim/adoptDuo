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

	
	
	@RequestMapping(value = "/login_get", method = RequestMethod.GET)
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
	
	
	@RequestMapping(value = "/login_post", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> login_post(MemberDto param) {
		
		HashMap<String, Object> reponse = new HashMap<String, Object>();
		reponse.put("post 시작, 화면꺼 그대로 넘긴거", param);
		
		System.out.println("아이디 = " + param.userId);
		
//		if (homeService.getUserIdChk(param) == 0) {
//			reponse.put("chk", 1);
//		} else if (homeService.getUserPwChk(param) == 0) {
//			reponse.put("chk", 2);
//		} else {
//			reponse.put("info", homeService.getUserInfo(param));
//		}

		return reponse;
	}
	
	
	
	
	
	
	

}
