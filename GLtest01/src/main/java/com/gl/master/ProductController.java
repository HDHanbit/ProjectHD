package com.gl.master;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.junit.runners.Parameterized.Parameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/product/")
public class ProductController {
	// ��ǰ ��Ʈ�ѷ�

	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	@Autowired
	private ProductDaoImp proDaoImp;

	@RequestMapping(value = "list")
	public String productList(Model model) {
		logger.info("productList index");

		List<ProductVo> list = proDaoImp.selectAll();

		for (ProductVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("plist", list);
		return "product/list";
	}

	@RequestMapping(value = "cat")
	public void catList(@RequestParam("catName") String catName, Model model,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// code�� �޾ƿ� ���� ã�Ƴ���
		logger.info("ajax-�񵿱� ���");
		List<LocVo> list = proDaoImp.selectLoc(catName);
		String data = "";
		for (LocVo bean : list) {
			data += "<option value=\"" + bean.getLocname() + "\">"
					+ bean.getLocname() + "</option>";
		}
		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataEnco = URLEncoder.encode("�����Ͱ� �����ϴ�.", "UTF-8");
		}
		logger.info(dataEnco);
		print.print(dataEnco);
	}

	@RequestMapping(value = "detail")
	public String productDetail(@RequestParam("id") String proid, Model model) {
		// add:�׳� �Է����� �� �����ֱ�
		// proid:���� ���� �Է� ������ ���������ϰ� �����ֱ�

		List<CatVo> cat = proDaoImp.selectCat();
		for (CatVo bean : cat) {
			logger.info("code : " + bean.getCode() + " name : "
					+ bean.getName());
		}

		if (proid.equals("add")) {

			logger.info("product-detail/add form");
			model.addAttribute("title", "�Է�");
			model.addAttribute("catList", cat);
		} else {
			logger.info("product-detail/parameter ok");
			ProductVo bean = proDaoImp.selectOne(proid);
			logger.info(bean.toString());

			model.addAttribute("title", "����");
			model.addAttribute("bean", bean);
			model.addAttribute("catList", cat);
		}
		return "product/detail";
	}

}
