package com.google.pronect.service;

import java.util.ArrayList;
import java.util.List;

import com.google.pronect.vo.Schedule;
import com.google.pronect.vo.Group;

public interface ScheduleService {
	public void insertGroupSchedule(Schedule schedule, Group group);
	public void insertSchedule(Schedule schedule, Group group);
	public List<Schedule> totalSchedule(int gid);
	public Schedule detailSchedule(int scd_id);
	public ArrayList<Schedule> getScdIdList(int gid);
}
