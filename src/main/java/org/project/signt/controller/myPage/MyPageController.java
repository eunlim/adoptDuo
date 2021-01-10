package org.project.signt.controller.myPage;

import java.util.ArrayList;
import java.util.HashMap;

import org.project.signt.service.myPage.MyPageService;
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
@RequestMapping(value = "/MyPage") // 초기화면
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	// LOGIN  
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> myPage_Info(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();

		// login
	

		return response;
	}
	//	구매내역
	@RequestMapping(value = "/userBuyList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> userBuy_list(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		ArrayList<HashMap<String, Object>> list = myPageService.userBuyList(param);

		// login
	

		return list;
	}
	
	//	회원정보 수정 
	@RequestMapping(value = "/UserInfoChange", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> user_buy(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();

		// login
	

		return response;
	}
	

	
	
	

}
