package com.google.pronect.service;

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
		System.out.println(arrMid);
		if(arrScdId.size() != 0) {
			for(int j=0; j<arrScdId.size(); j++) {
				for(int i=0; i<arrMid.size(); i++) {
					achive.setScd_id(arrScdId.get(j).getScd_id());
					achive.setMid(arrMid.get(i).getMid());
					if(achiveDao.checkAchive(achive) == 0) {					
						achiveDao.insertAchive(achive);
					}
				}
			}
		}
	}

	@Override
	public int updateAchive(int scd_id, String mid) {
		return achiveDao.updateAchive(scd_id, mid);
	}

}
