package org.project.signt.service.myPage;

import java.util.ArrayList;
import java.util.HashMap;

public interface MyPageService {

	ArrayList<HashMap<String, Object>> userBuyList(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> userInfo(HashMap<String, Object> param) throws Exception;

	int userUpdate(HashMap<String, Object> param) throws Exception;

}
