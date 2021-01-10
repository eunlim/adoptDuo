package org.project.signt.service.myPage;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.project.signt.dao.home.HomeDao;
import org.project.signt.dao.myPage.MyPageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService{

	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public HashMap<String, Object> userInfo(HashMap<String, Object> param) throws Exception {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.userInfo(param);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> userBuyList(HashMap<String, Object> param) throws Exception {
		 MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		 return dao.userBuyList(param);
	}

	@Override
	public int userUpdate(HashMap<String, Object> param) throws Exception {
		 MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.userUpdate(param);
	}



	
	

}
