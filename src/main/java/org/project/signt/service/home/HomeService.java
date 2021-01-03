package org.project.signt.service.home;

import java.util.HashMap;

public interface HomeService {

	HashMap<String, Object> getUserInfo(HashMap<String, Object> param);

	int getUserIdChk(HashMap<String, Object> param) throws Exception;

	int getUserPwChk(HashMap<String, Object> param) throws Exception;

	int insertUser(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> searchInfo(HashMap<String, Object> param) throws Exception;


	


}
