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
import com.gl.master.model.coupon.CouponDaoImp;
import com.gl.master.model.customer.CustomerVo;
import com.gl.master.model.order.OrderDaoImp;
import com.gl.master.model.order.OrderVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/coupon/")
public class CouponController {
	// 상품 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(CouponController.class);

	@Autowired
	private CouponDaoImp couponDaoImp;

	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String orderToList(Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("coupon-index");

		return "coupon/addform";
	}
	
	
	@RequestMapping(value = "searchUser", method=RequestMethod.POST)
	public void searchUser(@RequestParam("id") String search ,Model model, HttpServletResponse response) {
		// 유저 검색
		logger.info("usersearch");
		
		List<CustomerVo> list = couponDaoImp.selectUser(search);
		String data = "<div class=\"list-group\">";
		if (list.size() > 0) {
			for (CustomerVo bean : list) {
//				data += "<a href=\"#\" class=\"list-group-item\"" + bean.() + "\">";
			}
			data += "</div>";
		} else {
			data = "";
		}

		
		 /* <a href="#" class="list-group-item">First item</a>
		  <a href="#" class="list-group-item">Second item</a>
		  <a href="#" class="list-group-item">Third item</a>*/
		
		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			dataEnco = URLEncoder.encode("데이터가 없습니다.", "UTF-8");
		}
		logger.info(data);
		print.print(dataEnco);		
	}
	
}
