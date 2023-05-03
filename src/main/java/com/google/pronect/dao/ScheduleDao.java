package com.google.pronect.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Schedule;

@Mapper
public interface ScheduleDao {
	public int insertGroupSchedule(Schedule schedule);
	public int insertSchedule(Schedule schedule);
	public List<Schedule> totalSchedule(int gid);
	public Schedule detailSchedule(int scd_id);
	public ArrayList<Schedule> getScdIdList(int gid);
}
