package org.project.signt.service.adopt;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.project.signt.dao.adopt.AdoptDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adoptService")
public class AdoptServiceImpl implements AdoptService{

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<HashMap<String, Object>> getAdoptList(HashMap<String, Object> param) {
		AdoptDao dao = sqlSession.getMapper(AdoptDao.class);
		return dao.getAdoptList(param);
	}
	


	
	

}
