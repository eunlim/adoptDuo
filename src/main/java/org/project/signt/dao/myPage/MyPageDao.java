package org.project.signt.dao.myPage;

import java.util.ArrayList;
import java.util.HashMap;

public interface MyPageDao {

	ArrayList<HashMap<String, Object>> userBuyList(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> userInfo(HashMap<String, Object> param) throws Exception;

	int userUpdate(HashMap<String, Object> param) throws Exception;



}
