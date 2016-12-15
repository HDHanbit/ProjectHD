package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

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
		// ��ǰ ����Ʈ �����ֱ�
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
		String data = "<select name=\"loc\" class=\"form-control input-default loc\">";
		if (list.size() > 0) {
			for (LocVo bean : list) {
				data += "<option value=\"" + bean.getLocname() + "\">"
						+ bean.getLocname() + "</option>";
			}
			data += "</select>";
		} else {
			data = "<input type=\"text\" class=\"form-control\" id=\"loc\" name=\"loc\""
					+ "placeholder=\"������ �Է��ϼ���.\">";
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
		logger.info(data);
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
			model.addAttribute("url", "insert");
		} else {
			logger.info("product-detail/parameter ok");
			ProductVo bean = proDaoImp.selectOne(proid);
			logger.info(bean.toString());

			model.addAttribute("title", "����");
			model.addAttribute("bean", bean);
			model.addAttribute("catList", cat);
			model.addAttribute("url", "update");
		}
		return "product/detail";
	}

	@RequestMapping(value = "del")
	public String productDelete(@RequestParam("id") String proid) {
		// �׸����

		proDaoImp.deleteOne(proid);

		return "redirect:/product/list";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	//bean=>getter, setter��!
	public String insertProduct(ProductVo bean, Model model,
			HttpServletRequest request) {
		logger.info("file upload BE : " + bean.toString());

		MultipartFile thumbFile = bean.getThumbFile();
		MultipartFile detailFile = bean.getImgFile();

		if (thumbFile != null && detailFile != null) {
			String tbFileName = thumbFile.getOriginalFilename();
			String deFileName = detailFile.getOriginalFilename();
			try {
				tbFileName = URLDecoder.decode(tbFileName, "UTF-8");
				deFileName = URLDecoder.decode(deFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			bean.setThumb(tbFileName);
			bean.setImg(deFileName);
			String url = request.getRealPath("file") + "/";
			try {
				File fileTb = new File(url + tbFileName);
				thumbFile.transferTo(fileTb);
				File fileIm = new File(url + deFileName);
				detailFile.transferTo(fileIm);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		String proid = bean.getCat()
				+ bean.getLoc().substring(0, 2)
				+ bean.getTrans().substring(0, 2)
				+ bean.getStartd().toString().substring(8, 10);
		bean.setProid(proid);
		logger.info(bean.getProid());
		logger.info("file upload AF : " + bean.toString());

		proDaoImp.insertOne(bean);

		return "redirect:/product/list";
	}

}
