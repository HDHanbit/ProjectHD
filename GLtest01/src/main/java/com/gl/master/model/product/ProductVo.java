package com.gl.master.model.product;

import java.util.Date;

public class ProductVo {
	private String proid;
	private String proname;
	private String cat;
	private String loc;
	private int price;
	private int minp;
	private int maxp;
	private String peris;
	private int perin;
	private String trans;
	private String exp;
	private Date startd;
	private String img;
	private String thumb;
	private int discount;
	private int point;
	private int prio;
	private int event;
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}
	public ProductVo(String proid, String proname, String cat, String loc,
			int price, int minp, int maxp, String peris, int perin,
			String trans, String exp, Date startd, String img, String thumb,
			int discount, int point, int prio, int event) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.cat = cat;
		this.loc = loc;
		this.price = price;
		this.minp = minp;
		this.maxp = maxp;
		this.peris = peris;
		this.perin = perin;
		this.trans = trans;
		this.exp = exp;
		this.startd = startd;
		this.img = img;
		this.thumb = thumb;
		this.discount = discount;
		this.point = point;
		this.prio = prio;
		this.event = event;
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
	public int getPerin() {
		return perin;
	}
	public void setPerin(int perin) {
		this.perin = perin;
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
	public Date getStartd() {
		return startd;
	}
	public void setStartd(Date startd) {
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
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
				+ ", maxp=" + maxp + ", peris=" + peris + ", perin=" + perin
				+ ", trans=" + trans + ", exp=" + exp + ", startd=" + startd
				+ ", img=" + img + ", thumb=" + thumb + ", discount="
				+ discount + ", point=" + point + ", prio=" + prio + ", event="
				+ event + "]";
	}
	

}
