package com.chagok.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.persistence.AlertDAO;
import com.chagok.persistence.PayDAO;

@Service
public class PayServiceImpl implements PayService {
	private static final Logger mylog = LoggerFactory.getLogger(PayServiceImpl.class);

	@Inject
	private PayDAO dao;
	// insert pay info into db
	@Override
	public void insertPay(Integer mno, Integer pay_cash, String pay_mean, String pay_regdate) {

		mylog.debug(" insertPay 호출 ");
		dao.insertPay(mno, pay_cash, pay_mean, pay_regdate);
	}

	
	
	

}
