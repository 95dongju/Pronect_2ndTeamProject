package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Study;

@Mapper
public interface StudyDao {
	public List<Study> studyList(Study study);
	public int studyTotCnt();
	public int registerGroup(Study study);
	public int getRegisteredSid(String mid);
	public int insertHistory(int sid, String mid);
	public Study getStudyDetail(int sid);
	public int modifyStudy(Study study);
	public int deleteHistory(int sid);
	public int deleteStudy(int sid);
	public int joinStudy(int sid, String mid);
	public int acceptStudy(String mid);
	public int completeStudy(int sid);
	
}
