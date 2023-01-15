package com.chagok.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;
import com.chagok.persistence.AbookDAO;

@Service
public class AbookServiceImpl implements AbookService{
	
	private static final Logger mylog = LoggerFactory.getLogger(AbookServiceImpl.class);
	
	@Autowired
	private AbookDAO dao;
	
	@Override
	public List<Map<String, AbookVO>> getAbookList(int mno, int mm) throws Exception {
		return dao.getAbookList(mno, mm);
	}

	@Override
	public void setAbookList(AbookVO vo) throws Exception {
		dao.setAbookList(vo);
	}
	

	@Override
	public List<Map<String, Object>> cateList() throws Exception {
		
		return dao.cateList();
	}

	@Override
	public List<Map<String, Object>> ctbottomList(String ct_top) throws Exception {
		return dao.ctbottomList(ct_top);
	}
	
	@Override
	public void insAbookList(AbookVO vo) throws Exception {

		dao.insAbookList(vo);

	}

	@Override
	public List<AbookVO> toCate(int ctno) throws Exception {
		return dao.toCate(ctno);

	}
	
	@Override
	public void delAbookList(int abno) throws Exception {
		dao.delAbookList(abno);
	}
	
	
	
	///////////////////MJ/////////////////////
	



	@Override
	public String getPMonth(int mm) throws Exception {
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMM");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -mm);
        String yyyy = fmt.format(cal.getTime()).substring(0,4);
        String MM = fmt.format(cal.getTime()).substring(4,6);
        String pMonth = yyyy+MM;
        return pMonth;
	}

	@Override
	public List<String> getctTop() throws Exception {
		return dao.getctTop();
	}

	@Override
	public int chkBud(Integer mno, String pMonth) throws Exception {
		return dao.chkBud(mno, pMonth);
	}

	@Override
	public List<Map<String, Object>> getBud(Integer mno, String pMonth) throws Exception {
		return dao.getBud(mno, pMonth);
	}

	@Override
	public void setBud(Map<String, Object> insertMap) throws Exception {
		dao.setBud(insertMap);
	}

	@Override
	public void updBud(List<Map<String, Object>> updateList) throws Exception {
		dao.updBud(updateList);
	}

	@Override
	public void delBud(Integer mno, String pMonth) throws Exception {
		dao.delBud(mno, pMonth);
	}

	@Override
	public Integer totalBud(Integer mno, String pMonth) throws Exception {
		return dao.totalBud(mno, pMonth);
	}

	@Override
	public List<Map<String, Object>> calInout(Integer mno, Integer mm, Integer inout) throws Exception {
		return dao.calInout(mno, mm, inout);
	}

	@Override
	public int chkAb(Integer mno, Integer mm) throws Exception {
		return dao.chkAb(mno, mm);
	}
	
	
	
}
