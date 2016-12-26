package com.gl.market.model;

public class BuyVo {

	private String proid;
	private String proname;
	private String cat;
	private String loc;
	private int price;
	private int minp;
	private int maxp;
	private String peris;
	private String exp;
	private String img;
	private String thumb;
	private Double discount;
	private int point;
	private int prio;
	private int event;
	
	public BuyVo() {
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
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
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
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
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
	public String toString() {
		return "BuyVo [proid=" + proid + ", proname=" + proname + ", cat="
				+ cat + ", loc=" + loc + ", price=" + price + ", minp=" + minp
				+ ", maxp=" + maxp + ", peris=" + peris + ", exp=" + exp
				+ ", img=" + img + ", thumb=" + thumb + ", discount="
				+ discount + ", point=" + point + ", prio=" + prio + ", event="
				+ event + "]";
	}
	public BuyVo(String proid, String proname, String cat, String loc,
			int price, int minp, int maxp, String peris, String exp,
			String img, String thumb, Double discount, int point, int prio,
			int event) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.cat = cat;
		this.loc = loc;
		this.price = price;
		this.minp = minp;
		this.maxp = maxp;
		this.peris = peris;
		this.exp = exp;
		this.img = img;
		this.thumb = thumb;
		this.discount = discount;
		this.point = point;
		this.prio = prio;
		this.event = event;
	}
	
	
	
}
