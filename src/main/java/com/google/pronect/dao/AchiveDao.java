package com.google.pronect.dao;

import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Achive;

public interface AchiveDao {
	public int checkAchive(Achive achive);
	public void insertAchive(Achive achive);
	public int updateAchive(@Param("scd_id") int scd_id, @Param("mid") String mid);
}
