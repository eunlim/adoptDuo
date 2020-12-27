package org.project.signt.service.home;

import java.util.ArrayList;
import java.util.HashMap;

public interface HomeService {

	HashMap<String, Object> getUserInfo(HashMap<String, Object> param);

	int getUserIdChk(HashMap<String, Object> param);

	int getUserPwChk(HashMap<String, Object> param);

	


}
