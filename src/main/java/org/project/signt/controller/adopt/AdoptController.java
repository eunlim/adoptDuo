package org.project.signt.controller.adopt;

import java.util.ArrayList;
import java.util.HashMap;

import org.project.signt.service.adopt.AdoptService;
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
@RequestMapping(value = "/adopt") // 초기화면
public class AdoptController {

	@Autowired
	AdoptService adoptService;

	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> list(@RequestParam(required = true) HashMap<String, Object> param) {
		HashMap<String, Object> reponse = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> list = adoptService.getAdoptList(param);
		
		for (int i = 0; i < list.size(); i++) {
			HashMap<String, Object> info = list.get(i);
			System.out.println(info);
		}
		
		reponse.put("list", list);
		return reponse;
	}
	
	
	
	
	
	
	

}
