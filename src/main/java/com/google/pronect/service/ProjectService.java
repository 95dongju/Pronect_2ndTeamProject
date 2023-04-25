package com.google.pronect.service;

import java.util.List;

import com.google.pronect.vo.Project;

public interface ProjectService {
	public List<Project> projectList(String pageNum);
	public int projectTotCnt();
	public int registerGroup(Project project);
	public int projectGroupLeader(String mid);
	public int getRegisteredPid(String mid);
	public int insertHistory(int pid, String mid);
	public Project getProjectDetail(int pid);
	public Project getAfterModifyView(int pid);
	public int modifyProject(Project project);
	public int deleteHistory(int pid);
	public int deleteProject(int pid);
	public int joinProject(int pid, String mid);
	public int acceptProject(String mid);
	public int completeProject(int pid);
	
}
