package com.google.pronect.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.AchiveDao;
import com.google.pronect.dao.GroupDao;
import com.google.pronect.dao.ScheduleDao;
import com.google.pronect.vo.Achive;
import com.google.pronect.vo.Group;
import com.google.pronect.vo.Schedule;

@Service
public class AchiveServiceImpl implements AchiveService {
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private AchiveDao achiveDao;
	@Autowired
	private GroupDao groupDao;
	@Override
	public void insertAchive(Achive achive, int gid) {
		List<Schedule> arrScdId = scheduleDao.getScdIdList(gid);
		List<Group> arrMid = groupDao.getMemberId(gid);
		for(int j=0; j<arrScdId.size(); j++) {
			for(int i=0; i<arrMid.size(); i++) {
				//achive.setScd_id(arrScdId.get(i));
				achiveDao.insertAchive(achive);
			}
		}
	}

	@Override
	public int updateAchive(int scd_id) {
		return achiveDao.updateAchive(scd_id);
	}

}
