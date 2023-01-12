package com.chagok.domain;

import lombok.Data;

@Data
public class PayVO {
	
	private int payno;
	private int mno;
	private int pay_cash;
	private String pay_mean;
	private String pay_regdate;
}
