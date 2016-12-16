package com.gl.master.model.customer;

public class CustomerVo {

	private String id;
	private int cash;
	private int tcash;
	
	public CustomerVo() {
		// TODO Auto-generated constructor stub
	}

	

	public int getTcash() {
		return tcash;
	}



	public void setTcash(int tcash) {
		this.tcash = tcash;
	}



	public CustomerVo(String id, int cash, int tcash) {
		super();
		this.id = id;
		this.cash = cash;
		this.tcash = tcash;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}
	
	

}
