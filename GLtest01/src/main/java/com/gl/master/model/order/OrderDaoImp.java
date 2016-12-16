package com.gl.master.model.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.ProductOrderVo;
import com.gl.master.model.customer.CustomerVo;

public class OrderDaoImp implements MasterDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<OrderVo> selectAll() {
		// TODO Auto-generated method stub

		return sqlSession.selectList("order.selectAll");
	}

	@Override
	public List<ProductOrderVo> selectOne(String proid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("order.selectPO", proid);
	}

	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.insert("order.insertOne", (OrderVo) bean);
	}

	@Override
	public void updateOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.update("order.updateOne", (OrderVo) bean);
	}

	@Override
	public void deleteOne(String id) {
		// TODO Auto-generated method stub
		sqlSession.delete("order.deleteOne", id);
	}

	public List<OrderVo> selectCancel() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("order.selectCancel");
	}

	public void updateCash(CustomerVo bean, String what) {
		CustomerVo custom = sqlSession.selectOne("customer.selectOne",
				bean.getId());
		if (what.equals("del")) {
			int tcash = custom.getTcash() - bean.getTcash();
			bean.setTcash(tcash);
			int cash = custom.getCash() - bean.getCash();
			bean.setCash(cash);
		} else {
			int tcash = custom.getTcash() - bean.getTcash();
			bean.setTcash(tcash);
			int cash = custom.getCash() - bean.getCash();
			bean.setCash(cash);
		}

		sqlSession.update("order.updateCash", bean);
	}

}
