package org.project.signt.service.home;


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
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> param) {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		 return dao.getUserInfo(param);
	}

	@Override
	public int getUserIdChk(HashMap<String, Object> param) throws Exception {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		 return dao.getUserIdChk(param);
	}

	@Override
	public int getUserPwChk(HashMap<String, Object> param) throws Exception {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		 return dao.getUserPwChk(param);
	}

	@Override
	public int insertUser(HashMap<String, Object> param) throws Exception {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		return dao.insertUser(param);
	}

	@Override
	public HashMap<String, Object> searchInfo(HashMap<String, Object> param) throws Exception {
		 HomeDao dao = sqlSession.getMapper(HomeDao.class);
		return dao.searchInfo(param);
	}


	
	

}
