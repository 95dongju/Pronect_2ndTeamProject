package com.google.pronect.service;

import java.util.List;

import com.google.pronect.vo.Study;

public interface StudyService {
	public List<Study> studyList(String pageNum);
	public int studyTotCnt();
	public int registerGroup(Study study);
	public int studyGroupLeader(String mid);
	public int getRegisteredSid(String mid);
	public int insertHistory(int sid, String mid);
	public Study getStudyDetail(int sid);
	public Study getAfterModifyView(int sid);
	public int modifyStudy(Study study);
	public int deleteHistory(int sid);
	public int deleteStudy(int sid);
	public int joinStudy(int sid, String mid);
	public int acceptStudy(String mid);
	public int completeStudy(int sid);
	
}
