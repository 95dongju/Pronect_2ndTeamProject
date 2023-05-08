package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Achive;
import com.google.pronect.vo.Group;

public interface GroupService {
	//////////////////List 공용//////////////////////////////////////
	public String 	startDate(int gid);
	public String 	endDate(int gid);
	//////////////////goupList.do//////////////////////////////////////
	public List<Group> groupList(String pageNum);
	public int 		groupTotCnt();
	//////////////////studyList.do//////////////////////////////////////
	public List<Group> studyList(String pageNum);
	public int 		studyTotCnt();
	//////////////////projectList.do//////////////////////////////////////
	public List<Group> projectList(String pageNum);
	public int 		projectTotCnt();
	//////////////////register.do///////////////////////////////////////////
	public int 		registerGroup(Group group, String[] glanguage, HttpSession session);
	//////////////////detail.do///////////////////////////////////////////
	public int 		joinCheckCnt(int gid, String mid);
	public int 		joinCheck(int gid, String mid);
	public List<Group> 	joinList(int gid);
	public List<Group>	groupMember(int gid);
	public Group 	getGroupDetail(int gid);
	public List<Group> hitGroup();
//	public int 		groupLeader(HttpSession session);
	//////////////////modify.do///////////////////////////////////////////
	public Group 	getAfterModifyView(int gid);
	public int	 	modifyGroup(Group group, String[] glanguage);
	//////////////////delete.do///////////////////////////////////////////
	public int 		deleteHistory(int gid);
	public int 		deleteGroup(int gid);
	//////////////////join.do///////////////////////////////////////////
	public int 		joinGroup(int gid, String mid);
	//////////////////join.do///////////////////////////////////////////
	public int 		unJoinGroup(int gid, String mid);
	//////////////////accept.do///////////////////////////////////////////
	public String	acceptGroup(int gid, String mid, Achive achive);
	public int		memberPlus(int gid);
	public Group	memberFullCheck(int gid);
	public int		peopleFull(int gid);
	//////////////////memberOut.do///////////////////////////////////////////
	public int		memberOut(int gid, String mid);
	public int		memberMinus(int gid);
	public int 		peopleUnFull(int gid);
	//////////////////complete.do///////////////////////////////////////////
	public int 		completeGroup(int gid);
	//////////////////달성도 insert용///////////////////////////////////////////
	public List<Group> getMemberId(int gid);
	public List<Group>	myStudyList(String pageNum, String mid);
	public int 			totCntMyStudy(String mid);
	public List<Group>	myProjectList(String pageNum, String mid);
	public int 			totCntMyProject(String mid);
	public List<Group>	myHistory(String pageNum,  String mid);
	public int 			totCntMyHistory(String mid);
}
