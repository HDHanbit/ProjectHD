package com.gl.market.model;

import java.sql.Date;

public class QnaVo {

	private int num;
	private String list;
	private String content;
	private Date nalja;
	public QnaVo() {
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	@Override
	public String toString() {
		return "QnaVo [num=" + num + ", list=" + list + ", content=" + content
				+ ", nalja=" + nalja + "]";
	}
	public QnaVo(int num, String list, String content, Date nalja) {
		super();
		this.num = num;
		this.list = list;
		this.content = content;
		this.nalja = nalja;
	}

	
	
	
	
}
