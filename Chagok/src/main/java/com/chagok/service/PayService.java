package com.chagok.service;

public interface PayService {
	
	// insert pay info into db
	public void insertPay(Integer mno, Integer pay_cash, String pay_mean, String pay_regdate);

}
