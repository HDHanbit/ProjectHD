package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
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
import com.gl.master.model.coupon.CouponVo;
import com.gl.master.model.customer.CustomerDaoImp;
import com.gl.master.model.customer.CustomerVo;

@Controller
@RequestMapping("/customer/")
public class CustomerController {
	// 고객 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(CustomerController.class);

	@Autowired
	private CustomerDaoImp cusDaoImp;

	@RequestMapping(value = "list")
	public String customerList(Model model) {
		//  고객 리스트 보여주기
		logger.info("customerList index");

		List<CustomerVo> list = cusDaoImp.selectAll();

		for (CustomerVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("clist", list);
		return "customer/list";
	}


	@RequestMapping(value = "detail")
	public String customerDetail(@RequestParam("id") String id, Model model,
			HttpServletRequest request) {
		
		// cusid:값을 가진 입력 폼으로 수정가능하게 보여주기

		
			logger.info("customer-detail/parameter ok");
			CustomerVo bean = cusDaoImp.selectOne(id);
			List<CouponVo> list = cusDaoImp.selectCoupon(id);
			logger.info(bean.toString());

			model.addAttribute("title", "수정");
			model.addAttribute("bean", bean);
			model.addAttribute("list", list);
			model.addAttribute("url", "update");
	
		return "customer/detail";
	}

	@RequestMapping(value = "del")
	public String customerDelete(@RequestParam("id") String id) {
		// 항목삭제

		cusDaoImp.deleteOne(id);

		return "redirect:/customer/list";
	}
	@RequestMapping(value = "delete")
	public String couponDelete(@RequestParam("customid") String customid,
			@RequestParam("cupid") String cupid) {
		// 항목삭제

		cusDaoImp.deleteCoupon(cupid);

		return "redirect:/customer/detail?id="+customid;
	}


	// bean=>getter, setter로!
		@RequestMapping(value = "update", method = RequestMethod.POST)
		public String updateCustomer(@Valid CustomerVo bean, BindingResult result,
				Model model, HttpServletRequest request) {
			logger.info("vaildation check");
			
			if (result.hasErrors()) {
				logger.info("vaildation check");
				Map errMsgs = new HashMap<String, String>();
				List<FieldError> errs = result.getFieldErrors();
				for (FieldError err : errs) {
					logger.info(err.getField() + ":" + err.getDefaultMessage());
					errMsgs.put(err.getField(), "has-error");
				}
				model.addAttribute("errs", errMsgs);
				model.addAttribute("bean", bean);
				model.addAttribute("title", "수정");
				model.addAttribute("url", "update");
				return "customer/detail";
			}
			cusDaoImp.updateOne(bean);
			return "redirect:/customer/list";
		}

	
}
