package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlertVO {
	private int ano;
	private int cno;
	private	int a_receive;
	private int a_isCheck;
	private String a_content;
	private Timestamp a_date;
}
