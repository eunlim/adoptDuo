package org.project.signt.controller.home;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.project.signt.service.home.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")//초기화면
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
    HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1() throws Exception{
		return "home/Home.jsp";
	}
	
	@RequestMapping(value = "/home2.do", method = RequestMethod.GET)
	public String home2() throws Exception{
		return "home/Home2.jsp";
	}
	
	@RequestMapping(value = "/home3.do", method = RequestMethod.GET)
	public String home3() throws Exception{
		return "home/Home3.jsp";
	}
	
	@RequestMapping(value = "/home4.do", method = RequestMethod.GET)
	public String home4() throws Exception{
		return "home/Home4.jsp";
	}
	
	@RequestMapping(value = "/home5.do", method = RequestMethod.GET)
	public String home5() throws Exception{
		return "home/Home5.jsp";
	}
	
	@RequestMapping(value = "/home6.do", method = RequestMethod.GET)
	public String home6(Model model) throws Exception{
		//빈 객체 넘겨줘야함.
    	model.addAttribute("memberDto", new MemberDto());
		return "home/Home6.jsp";
	}
	
	@RequestMapping("/insert")
    public String memberInsert(@Valid @ModelAttribute MemberDto memberDto, BindingResult result, HttpServletResponse response) throws Exception{
     
    	if(result.hasErrors()) {
    		//form에 에러가 있으면
    		return "home/Home6.jsp";
    	}
    	//에러가 없으면
    	response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인 굿');</script>");
        out.flush();
    	return "redirect:/";
    	
    }
	
	
	@RequestMapping(value = "/home7.do", method = RequestMethod.GET)
	public String home7() throws Exception{
		return "home/Home7.jsp";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax.json", method = RequestMethod.POST)
	public String uploadAjax(Locale locale, Model model, MultipartHttpServletRequest multipartRequest) {
		
		
		 List<MultipartFile> fileList = multipartRequest.getFiles("files");
		 String path = "C:\\Users\\user\\Desktop\\img";
		 FileOutputStream fos;

		 String result = "파일 업로드 성공";
		 try {
			
			 for (MultipartFile mf : fileList) {
				 String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				 long fileSize = mf.getSize(); // 파일 사이즈
				 String safeFile = path + "\\" + System.currentTimeMillis() + originFileName;
	            
				 byte fileData[] = mf.getBytes();
		         fos = new FileOutputStream(safeFile);
		         fos.write(fileData);
		         fos.close();
				 
				 logger.info(safeFile + " - " +fileSize);
			 }
			 
			 
		} catch (IOException e) {
			result = "파일 업로드 실패";
			System.out.println(result + "-->" + e.getMessage());
		}
		 
		 
		return result;
		
	}


	
	  @RequestMapping(value = "/test", method = RequestMethod.GET)
	  public @ResponseBody HashMap<String, Object> testRestAPI() {
		  
			HashMap<String, Object> test = new HashMap<String, Object>();
			test.put("이름", "박수빈");
			test.put("성별", "남");
			test.put("CurrentTime", LocalDateTime.now().toString());
		  
	        return test;
	  }
	
	

}
