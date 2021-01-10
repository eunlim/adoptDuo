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
@RequestMapping(value = "/myPage") // 초기화면
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	//	마이페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> myPage_Info(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		response = myPageService.userInfo(param);

		return response;
	}
	//	구매내역
	@RequestMapping(value = "/userBuyList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> userBuy_list(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {

		ArrayList<HashMap<String, Object>> list = myPageService.userBuyList(param);
		
		return list;
	}
	
	//	회원정보 수정 화면
	@RequestMapping(value = "/UserInfoChange", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> userInfo_chage(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		response =  myPageService.userInfo(param);

		return response;
	}
	
	// 회원정보 수정 데이터
	@RequestMapping(value = "/UserInfoUpdate", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> userInfo_update(@RequestParam(required = true) HashMap<String, Object> param)  throws Exception {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		if(myPageService.userUpdate(param) == 1) {	//	 회원정보수정 성공
			response.put("chk", 0);
		}else {										//	회원정보수정 실패
			response.put("chk", 1);							
			}
		
		return response;
	}
	
	
	

}
