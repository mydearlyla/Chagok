package com.chagok.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;

public interface AbookDAO {
	
	// 가계부 목록
    public List<Map<String, AbookVO>> getAbookList(int mno, int mm) throws Exception;
	
	// 카테고리 top
	public List<Map<String, Object>> cateList() throws Exception;
	
	// 카테고리 bottom
	public List<Map<String, Object>> ctbottomList(String ct_top) throws Exception;
	
	// 그리드 수정
	public void setAbookList(AbookVO vo) throws Exception;
	
	// 가계부 추가
	public void insAbookList(AbookVO vo) throws Exception;
	
	// 카테고리 ctno -> ctoop, bottom
	public List<AbookVO> toCate(int ctno) throws Exception;
	
	// 가계부 삭제
	public void delAbookList(int abno) throws Exception;
	
	
	
	
	
	///////////////////MJ/////////////////////
	// ct_top
	public List<String> getctTop() throws Exception;
	
	// 1. 예산 유무
	public int chkBud(Integer mno, String pMonth) throws Exception;
	
	// 2. 예산 조회
	public List<Map<String, Object>> getBud(Integer mno, String pMonth) throws Exception;
	
	// 3. 예산 설정
	public void setBud(Map<String, Object> insertMap) throws Exception;
	
	// 4. 예산 수정
	public void updBud(List<Map<String, Object>> updateList) throws Exception;

	// 5. 예산 삭제
	public void delBud(Integer mno, String pMonth) throws Exception;
	
	// 6. 총예산 조회
	public Integer totalBud(Integer mno, String pMonth) throws Exception;
	
	// 달력
	public List<Map<String, Object>> calInout(Integer mno, Integer mm, Integer inout) throws Exception;


	
	// 가계부 유무
	public int chkAb(Integer mno, Integer mm) throws Exception;
	
}
