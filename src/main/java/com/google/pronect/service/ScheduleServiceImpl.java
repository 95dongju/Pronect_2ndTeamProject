package com.google.pronect.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.ScheduleDao;
import com.google.pronect.vo.Schedule;
import com.google.pronect.vo.Group;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao scheduleDao;
	@Override
	public void insertGroupSchedule(Schedule schedule, Group group) {
		int selected_date = schedule.getSelected_date();
		String startDateStr = group.getGsdate();
		String endDateStr = group.getGfdate();
		Date startDate, endDate = null;
		startDate = Date.valueOf(startDateStr); 
		endDate = Date.valueOf(endDateStr);
		Calendar cal1 = Calendar.getInstance();
		java.util.Date utilSDate = new java.util.Date(startDate.getTime());
		java.util.Date utilEDate = new java.util.Date(endDate.getTime());
		cal1.setTime(utilSDate);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(utilEDate);
		while(cal1.compareTo(cal2)!=1) {
			int dayOfWeekNum = cal1.get(Calendar.DAY_OF_WEEK);
			if(dayOfWeekNum == selected_date) {
				java.util.Date calDate = cal1.getTime();
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
				String date = fm.format(calDate);
				schedule.setScd_start(date);
				schedule.setScd_end(date);
				scheduleDao.insertGroupSchedule(schedule);
				cal1.add(Calendar.DATE, 1);
			}else {
				cal1.add(Calendar.DATE, 1);				
			}
		}
	}
	@Override
	public List<Schedule> totalSchedule(int gid) {
		return scheduleDao.totalSchedule(gid);
	}
	@Override
	public Schedule detailSchedule(int scd_id) {
		return scheduleDao.detailSchedule(scd_id);
	}
	@Override
	public void insertSchedule(Schedule schedule, Group group) {
		String startDateStr = schedule.getScd_start();
		System.out.println(schedule.getScd_start());
		String endDateStr = schedule.getScd_end();
		System.out.println(schedule.getScd_end());
		Date startDate, endDate = null;
		startDate = Date.valueOf(startDateStr); 
		endDate = Date.valueOf(endDateStr);
		System.out.println(startDate+"/ "+endDate);
		Calendar cal1 = Calendar.getInstance();
		java.util.Date utilSDate = new java.util.Date(startDate.getTime());
		java.util.Date utilEDate = new java.util.Date(endDate.getTime());
		cal1.setTime(utilSDate);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(utilEDate);
		int dayOfWeekNum = cal1.get(Calendar.DAY_OF_WEEK);
		java.util.Date calDate = cal1.getTime();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String date = fm.format(calDate);
		schedule.setScd_start(date);
		schedule.setScd_end(date);
		scheduleDao.insertSchedule(schedule);
	}
	@Override
	public ArrayList<Schedule> getScdIdList(int gid) {
		return scheduleDao.getScdIdList(gid);
	}
}
