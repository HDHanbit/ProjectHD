package com.gl.master.model.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.MasterDao;
import com.gl.master.model.customer.CustomerVo;

public class CouponDaoImp{
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CustomerVo> selectUser(String search) {
		// TODO Auto-generated method stub
		
		search = "%"+search+"%";
		return sqlSession.selectList("customer.selectUser", search);
	}

	public void insertOne(CouponVo bean) {
		// TODO Auto-generated method stub
		sqlSession.insert("coupon.insertOne", bean);		
	}

	

}
