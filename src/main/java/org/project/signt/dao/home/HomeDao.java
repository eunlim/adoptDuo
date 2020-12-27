package org.project.signt.dao.home;

import java.util.ArrayList;
import java.util.HashMap;

public interface HomeDao {

	HashMap<String, Object> getUserInfo(HashMap<String, Object> param);

	int getUserIdChk(HashMap<String, Object> param);

	int getUserPwChk(HashMap<String, Object> param);



}
