package com.gl.master.model.product;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.jboss.logging.FormatWith;
import org.springframework.web.multipart.MultipartFile;

public class ProductVo {
	private String proid;
	private String proname;
	private String cat;
	private String loc;
	
	@Range(min=1000)
	private int price;
	
	@Range(min=1)
	private int minp;
	@Range(min=1)
	private int maxp;
	@Pattern(regexp="[0-9]+박+[1-9]+일")
	private String peris;
	private String trans;
	private String exp;
	private String startd;
	private String img;// 상세이미지명
	private String thumb;// 썸네일 이미지명
	@Range(max=1)
	private double discount;
	@Range(min=0,max=10)
	private double point;
	private int prio;
	private int event;
	private String name;
	private MultipartFile imgFile;
	private MultipartFile thumbFile;
	
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}

	public ProductVo(String proid, String proname, String cat, String loc,
			int price, int minp, int maxp, String peris,
			String trans, String exp, String startd, String img, String thumb,
			double discount, double point, int prio, int event, String name,
			MultipartFile imgFile, MultipartFile thumbFile) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.cat = cat;
		this.loc = loc;
		this.price = price;
		this.minp = minp;
		this.maxp = maxp;
		this.peris = peris;
		this.trans = trans;
		this.exp = exp;
		this.startd = startd;
		this.img = img;
		this.thumb = thumb;
		this.discount = discount;
		this.point = point;
		this.prio = prio;
		this.event = event;
		this.name = name;
		this.imgFile = imgFile;
		this.thumbFile = thumbFile;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMinp() {
		return minp;
	}

	public void setMinp(int minp) {
		this.minp = minp;
	}

	public int getMaxp() {
		return maxp;
	}

	public void setMaxp(int maxp) {
		this.maxp = maxp;
	}

	public String getPeris() {
		return peris;
	}

	public void setPeris(String peris) {
		this.peris = peris;
	}


	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getStartd() {
		return startd;
	}

	public void setStartd(String startd) {
		this.startd = startd;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getPoint() {
		return point;
	}

	public void setPoint(double point) {
		this.point = point;
	}

	public int getPrio() {
		return prio;
	}

	public void setPrio(int prio) {
		this.prio = prio;
	}

	public int getEvent() {
		return event;
	}

	public void setEvent(int event) {
		this.event = event;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public MultipartFile getThumbFile() {
		return thumbFile;
	}

	public void setThumbFile(MultipartFile thumbFile) {
		this.thumbFile = thumbFile;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductVo other = (ProductVo) obj;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductVo [proid=" + proid + ", proname=" + proname + ", cat="
				+ cat + ", loc=" + loc + ", price=" + price + ", minp=" + minp
				+ ", maxp=" + maxp + ", peris=" + peris
				+ ", trans=" + trans + ", exp=" + exp + ", startd=" + startd
				+ ", img=" + img + ", thumb=" + thumb + ", discount="
				+ discount + ", point=" + point + ", prio=" + prio + ", event="
				+ event + ", name=" + name + ", imgFile=" + imgFile
				+ ", thumbFile=" + thumbFile + "]";
	}

	

}
