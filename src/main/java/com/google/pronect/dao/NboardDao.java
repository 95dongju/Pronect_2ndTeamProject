package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Nboard;
import com.google.pronect.vo.Qboard;

@Mapper
public interface NboardDao {
	public List<Nboard> nboardList(Nboard nboard);
	public int totCntNboard(Nboard nboard);
	public int writeNboard(Nboard nboard);
	public Nboard contentNboard(int nid);
	public int modifyNboard(Nboard nboard);
	public int deleteNboard(int nid);
}
