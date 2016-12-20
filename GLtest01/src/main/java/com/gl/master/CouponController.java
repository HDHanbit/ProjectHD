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
import com.gl.master.model.coupon.CouponVo;
import com.gl.master.model.customer.CustomerVo;
import com.gl.master.model.order.OrderDaoImp;
import com.gl.master.model.order.OrderVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/coupon/")
public class CouponController {
	// 쿠폰 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(CouponController.class);

	@Autowired
	private CouponDaoImp couponDaoImp;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String cupFormView(Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("coupon-index");
		
		String cupid =(char)((Math.random() * 26)+65)+""+(char)((Math.random() * 26)+65)+"-"+(int)(Math.random()*100)+"-"+(char)((Math.random() * 26)+65);
		model.addAttribute("cupid",cupid );
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time));
		model.addAttribute("sysdate", sysdate);

		return "coupon/addform";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String insertCup(@Valid CouponVo bean, BindingResult result, Model model) {
		// 쿠폰 등록
		logger.info("coupon-insert");
		if (result.hasErrors()) {
			logger.info("vaildation check");
			Map errMsgs = new HashMap<String, String>();
			List<FieldError> errs = result.getFieldErrors();
			for (FieldError err : errs) {
				logger.info(err.getField() + ":" + err.getDefaultMessage());
				errMsgs.put(err.getField(), "has-error");
			}
			model.addAttribute("errs", errMsgs);
			String cupid =(char)((Math.random() * 26)+65)+""+(char)((Math.random() * 26)+65)+"-"+(int)(Math.random()*100)+"-"+(char)((Math.random() * 26)+65);
			model.addAttribute("cupid",cupid );
			long time = System.currentTimeMillis(); 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
			String sysdate = dayTime.format(new Date(time));
			model.addAttribute("sysdate", sysdate);			
			return "coupon/addform";

		}// end if(validation)

		couponDaoImp.insertOne(bean);
		
		model.addAttribute("success","입력완료");
		model.addAttribute("successMSG","쿠폰이 성공적으로 등록 되었습니다.");
		String cupid =(char)((Math.random() * 26)+65)+""+(char)((Math.random() * 26)+65)+"-"+(int)(Math.random()*100)+"-"+(char)((Math.random() * 26)+65);
		model.addAttribute("cupid",cupid );
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time));
		model.addAttribute("sysdate", sysdate);
		
		return "coupon/addform";
	}

	@RequestMapping(value = "searchUser")
	public void searchUser(@RequestParam("id") String search, Model model,
			HttpServletResponse response) {
		// 유저 검색
		logger.info("usersearch");

		List<CustomerVo> list = couponDaoImp.selectUser(search);
		String data = "<table class=\"table table-hover\"><tr><th rowspan=\"2\">아이디</th><th>성명</th><th>전화번호</th><th></th></tr>"
				+ "<tr><th>등급</th><th>누적금액</th><th>적립금</th></tr>";
		if (list.size() > 0) {
			for (CustomerVo bean : list) {
				data += "<tr><td rowspan=\"2\">" + bean.getId() + "</td>"
						+"<td>"+bean.getName()+"</td>"
						+ "<td><a href=\"tel:0"+bean.getPhone()+"\">0"+bean.getPhone() + "</a></td>"
								+ "<td><button class=\" btn btn-success useridBtn\" id=\""+bean.getId()+"\">선택</button></td></tr>"
						+ "<tr><td>" + bean.getGrade()+ "</td>" 
						+ "<td>" + bean.getTcash()+ "</td>"
						+ "<td>" + bean.getCash()+ "</td></tr>";
			}
		} else {
			data = "<tr><td colspan=\"5\">검색 결과가 없습니다.</td></tr>";
		}
		data += "</table>";

		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				dataEnco = URLEncoder.encode("데이터가 없습니다.", "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		logger.info(data);
		print.print(dataEnco);
	}

}
