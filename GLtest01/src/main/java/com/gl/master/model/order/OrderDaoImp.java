package com.gl.master.model.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.ProductOrderVo;
import com.gl.master.model.customer.CustomerVo;
import com.gl.master.model.product.ProductVo;

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
		OrderVo order = sqlSession.selectOne("order.selectOne",
				((OrderVo) bean).getOrderid());
		ProductVo product = sqlSession.selectOne("product.selectOne",
				order.getProid());
		int price = ((OrderVo) bean).getGoperson() * product.getPrice();
		((OrderVo) bean).setPaycash(price);
		sqlSession.update("order.updateOne", (OrderVo) bean);
	}

	@Override
	public void deleteOne(String id) {
		// TODO Auto-generated method stub
		sqlSession.delete("order.deleteOne", id);
	}

	public void updateCash(CustomerVo bean, String what, int gop, String orderid) {
		CustomerVo custom = sqlSession.selectOne("customer.selectOne",
				bean.getId());

		int tcash = custom.getTcash() - bean.getTcash();
		int cash = custom.getCash() - (int) (bean.getTcash() * 0.01);
		if (what.equals("del")) {
			bean.setTcash(tcash);
			bean.setCash(cash);
		} else {
			OrderVo order = sqlSession.selectOne("order.selectOne", orderid);
			tcash += order.getPaycash();
			cash += (order.getPaycash() * 0.01);
			bean.setTcash(tcash);
			bean.setCash(cash);
		}
		sqlSession.update("order.updateCash", bean);
	}

	public List<OrderVo> selectCancel() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("order.selectCancel");
	}

}
