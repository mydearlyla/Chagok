package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BusinessAccountVO {
	private int bizno;
	private int biz_inout;
	private int biz_amount;
	private Timestamp biz_date;
	private int mno;
	private String biz_holder_name;
	private int biz_balance;
	private int cno;
	private int biz_status;
	
}
