package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {

	private int mno;
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
	private String rname;
	private int success_cnt;
}
