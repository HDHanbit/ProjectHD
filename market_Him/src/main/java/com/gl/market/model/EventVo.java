package com.gl.market.model;

public class EventVo {

	private String eid;
	private String ename;
	private String eimg;
	private String eexp;
	private String eurl;
	private String eduring;
	private int eprio;
	
	public EventVo() {
	
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEimg() {
		return eimg;
	}

	public void setEimg(String eimg) {
		this.eimg = eimg;
	}

	public String getEexp() {
		return eexp;
	}

	public void setEexp(String eexp) {
		this.eexp = eexp;
	}

	public String getEurl() {
		return eurl;
	}

	public void setEurl(String eurl) {
		this.eurl = eurl;
	}

	public String getEduring() {
		return eduring;
	}

	public void setEduring(String eduring) {
		this.eduring = eduring;
	}

	public int getEprio() {
		return eprio;
	}

	public void setEprio(int eprio) {
		this.eprio = eprio;
	}

	@Override
	public String toString() {
		return "EventVo [eid=" + eid + ", ename=" + ename + ", eimg=" + eimg
				+ ", eexp=" + eexp + ", eurl=" + eurl + ", eduring=" + eduring
				+ ", eprio=" + eprio + "]";
	}

	public EventVo(String eid, String ename, String eimg, String eexp,
			String eurl, String eduring, int eprio) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.eimg = eimg;
		this.eexp = eexp;
		this.eurl = eurl;
		this.eduring = eduring;
		this.eprio = eprio;
	}

	


}
