package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.junit.runners.Parameterized.Parameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.ProductOrderVo;
import com.gl.master.model.customer.CustomerVo;
import com.gl.master.model.order.OrderDaoImp;
import com.gl.master.model.order.OrderVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/order/")
public class OrderController {
	// 주문 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(OrderController.class);

	@Autowired
	private OrderDaoImp orderDaoImp;

	@RequestMapping(value = "total")
	public String orderToList(Model model) {
		// 상품 리스트 보여주기
		logger.info("order-index");

		List<OrderVo> list = orderDaoImp.selectAll();

		for (OrderVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("olist", list);
		return "order/list";
	}

	@RequestMapping(value = "cancel")
	public String orderCnList(Model model) {
		// 상품 리스트 보여주기
		logger.info("orderCancelList");

		List<OrderVo> list = orderDaoImp.selectCancel();

		for (OrderVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("olist", list);
		return "order/list";
	}

	@RequestMapping(value = "selpo")
	public void selPOList(@RequestParam("bean") String bean, Model model,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// code값 받아와 지역 찾아내기
		logger.info("ajax-비동기 통신");
		String[] beans = bean.split("_");
		ProductOrderVo poBean = new ProductOrderVo(beans[0], beans[1], beans[2]);
		List<ProductOrderVo> list = orderDaoImp.selectOne(poBean);
		String data = "<table class=\"table table-hover\"><tr><th>상품코드</th><th>출발날짜</th><th>주문된 인원수</th><th>최대 인원수</th></tr>";
		if (list.size() > 0) {
			data += "<tr><td>" + list.get(0).getProid() + "</td>"
					+ "<td>"+list.get(0).getStartday()+"</td><td>"
					+ list.get(0).getCnt() + "</td><td>"
					+ list.get(0).getMaxp() + "</td></tr></table>";
		} else {
			data += "<tr><td colspan=\"3\">해당 내역이 없습니다.</td></tr></table>";
		}

		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataEnco = URLEncoder.encode("데이터가 없습니다.", "UTF-8");
		}
		logger.info(data);
		print.print(dataEnco);
	}

	@RequestMapping(value = "del")
	public String orderCancel(@RequestParam("id") String orderid, @RequestParam("userid") String userid,
			@RequestParam("price") int price) {
		//주문 취소 기능
		// 항목 cancel 컬럼 2 수정

		orderDaoImp.deleteOne(orderid);

		CustomerVo bean = new CustomerVo(userid, 0, price);
		orderDaoImp.updateCash(bean, "del", 0, orderid);

		return "redirect:/order/total";
	}
	//update
	@RequestMapping(value = "update")
	public String orderUpdate(@RequestParam("id") String orderid, @RequestParam("userid") String userid,
			@RequestParam("gop") int gop, @RequestParam("price") int price) {
		//주문 수정 기능
		// 항목 인원수, 결제 금액, 결제일 sysdate로 update
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time));
		logger.info(sysdate.toString());
		
		OrderVo obean = new OrderVo(orderid, userid, sysdate, gop);
		orderDaoImp.updateOne(obean);
		
		CustomerVo bean = new CustomerVo(userid, 0, price);
		orderDaoImp.updateCash(bean, "up", gop, orderid);

		return "redirect:/order/total";
	}
	
}
