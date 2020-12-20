package org.project.signt.service.common;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.project.signt.dao.common.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("commonService")
public class CommonServiceImpl implements CommonService{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<HashMap<String, Object>> getLocation(HashMap<String, Object> param) throws Exception {
		 CommonDao dao = sqlSession.getMapper(CommonDao.class);
		 return dao.getLocation(param);
	}

	

	

	

}
