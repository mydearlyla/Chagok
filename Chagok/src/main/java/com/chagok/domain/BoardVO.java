package com.chagok.domain;

import java.awt.List;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private int cno;
	private String b_title;
	private String b_writer;
	private Timestamp b_date;
	private String b_content;
	private int b_like;
	private int b_dlike;
	private int b_cnt;
	private String b_file;
	private int b_sort;
	
	private String c_title;
	private String c_file;
	private int c_pcnt;
	private int c_period;
	private String c_start;
	private int c_deposit;
	private String c_content;
	private int mno;
	private int c_status;
	private int c_freq;
	private int c_sort;
	private int c_total;
	private int c_amount;
	private int c_min;
	private String c_person;
	private int ctno;
	private String ct_top;
	private String c_thumbFile;
	private int c_cnt;
	
	private String id;
	private String pw;
	private String nick;
	private String tel;
	private int year;
	private String gender;
	private String profile;
	private Timestamp regdate;
	private String rname;
	private String rbank;
	private String raccount;
	private int buypoint;
	private int getpoint;
	private int success_cnt;
	private String isCheck;
	private String isSub;
	private String isBen;
	private String user_seq_no;
}
