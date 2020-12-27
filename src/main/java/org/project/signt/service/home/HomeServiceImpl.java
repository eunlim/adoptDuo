package org.project.signt.service.home;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.project.signt.dao.home.HomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("homeService")
public class HomeServiceImpl implements HomeService{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<HashMap<String, Object>> getUserInfo(HashMap<String, Object> param) {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		 return dao.getUserInfo(param);
	}

	
	

}
