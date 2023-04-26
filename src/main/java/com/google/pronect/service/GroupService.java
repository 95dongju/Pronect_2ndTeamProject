package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.google.pronect.vo.Group;

public interface GroupService {
	public List<Group> groupList(String pageNum);
	public int groupTotCnt();
	public int registerGroup(Group group, String[] glanguage);
	public int getRegisteredGid(String mid);
	public int groupLeader(HttpSession session);
	public int insertHistory(int gid, String mid);
	public Group getGroupDetail(int gid);
	public Group getAfterModifyView(int gid);
	public int modifyGroup(Group group, String[] glanguage);
	public int deleteHistory(int gid);
	public int deleteGroup(int gid);
	public int joinCheck(int gid, HttpSession session);
	public int joinGroup(int gid, String mid);
	public int unJoinGroup(int gid, String mid);
	public Group joinList(int gid);
	public int acceptGroup(String mid);
	public int completeGroup(int gid);
	public String startDate(int gid);
	public String endDate(int gid);
}
