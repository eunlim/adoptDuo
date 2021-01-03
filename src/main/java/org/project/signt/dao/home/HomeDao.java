package org.project.signt.dao.home;

import java.util.HashMap;

public interface HomeDao {

	HashMap<String, Object> getUserInfo(HashMap<String, Object> param);

	// ID_CHK
	int getUserIdChk(HashMap<String, Object> param) throws Exception;

	// PW_CHK
	int getUserPwChk(HashMap<String, Object> param) throws Exception;

	// SIGN UP
	int insertUser(HashMap<String, Object> param) throws Exception;

	// SEARCH INFO
	HashMap<String, Object> searchInfo(HashMap<String, Object> param) throws Exception;




}
