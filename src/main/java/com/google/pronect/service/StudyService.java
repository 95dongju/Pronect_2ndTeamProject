package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.google.pronect.vo.Study;

public interface StudyService {
	public List<Study> studyList(String pageNum);
	public int studyTotCnt();
	public int registerGroup(Study study,String[] slanguage);
	public int studyGroupLeader(HttpSession session);
	public int getRegisteredSid(String mid);
	public int insertHistory(int sid, String mid);
	public Study getStudyDetail(int sid);
	public Study getAfterModifyView(int sid);
	public int modifyStudy(Study study,String[] slanguage);
	public int deleteHistory(int sid);
	public int deleteStudy(int sid);
	public Study joinCheck(int sid, HttpSession session);
	public int joinStudy(int sid, String mid);
	public int unJoinStudy(int sid, String mid);
	public Study joinList(int sid);
	public int acceptStudy(String mid);
	public int completeStudy(int sid);
	
}
