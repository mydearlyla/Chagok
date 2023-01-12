package com.chagok.persistence;

import org.springframework.stereotype.Repository;

@Repository
public interface PayDAO {

	// insert pay info into db
	public void insertPay(Integer mno, Integer pay_cash, String pay_mean, String pay_regdate);
}
