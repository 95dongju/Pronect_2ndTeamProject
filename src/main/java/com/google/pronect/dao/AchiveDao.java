package com.google.pronect.dao;

import com.google.pronect.vo.Achive;

public interface AchiveDao {
	public int checkAchive(Achive achive);
	public void insertAchive(Achive achive);
	public int updateAchive(int scd_id, String mid);
}
