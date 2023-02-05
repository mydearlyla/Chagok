package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	private int cm_cbno; // 댓글 번호
	private int bno; // 댓글이 쓰이는 글번호
	private Timestamp cm_regdate; // 댓글 작성 시간
	private String cm_nick; // 작성한 닉네임
	private int cm_upcbno; // 대댓글 번호
	private String cm_content; // 댓글 내용
	
}
