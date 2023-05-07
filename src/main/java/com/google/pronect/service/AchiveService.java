package com.google.pronect.service;

import com.google.pronect.vo.Achive;

public interface AchiveService {
	public void insertAchive(Achive achive, int gid);
	public int updateAchive(int scd_id, String mid);
}
